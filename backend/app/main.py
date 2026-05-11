import os
import base64
from io import BytesIO

from fastapi import FastAPI, UploadFile, File
from fastapi.middleware.cors import CORSMiddleware
from dotenv import load_dotenv
from openai import OpenAI
from PIL import Image

load_dotenv()

app = FastAPI()
client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.post("/generate-avatar")
async def generate_avatar(
    base_avatar: UploadFile = File(...),
    user_face: UploadFile = File(...)
):
    prompt = """
    Edit the first image using the second image as a face reference.

    The first image is the base full-body avatar.
    The second image is the user's face reference.

    Your task is NOT to create a new avatar.
    Your task is to keep the first image almost identical and only replace the face and hairstyle.

    Strictly preserve the first image:
    - same full-body composition
    - same body shape
    - same pose
    - same clothing
    - same arms, hands, legs, and feet
    - same canvas size
    - same framing
    - same background style

    Do not crop the image.
    Do not cut off the feet.
    Do not redraw the body.
    Do not change the outfit.
    Do not make the result look like a different person’s body.

    Only modify:
    - face shape
    - eyes
    - nose
    - lips
    - facial impression
    - hairstyle around the head

    Make the avatar's face naturally resemble the second image.
    Keep the result as a high-quality semi-realistic 3D avatar, not a real photograph.
    The final image must show the full body from head to feet.
    """

    base_bytes = await base_avatar.read()
    user_bytes = await user_face.read()

    base_file = BytesIO(base_bytes)
    base_file.name = "base_avatar.png"

    user_file = BytesIO(user_bytes)
    user_file.name = "user_face.png"

    result = client.images.edit(
        model=os.getenv("OPENAI_IMAGE_MODEL", "gpt-image-1.5"),
        image=[base_file, user_file],
        prompt=prompt,
        size=os.getenv("OPENAI_IMAGE_SIZE", "1024x1536"),
        quality="high",
        input_fidelity="high",
        output_format="png",
        background=os.getenv("OPENAI_IMAGE_BACKGROUND", "transparent"),
    )

    image_base64 = result.data[0].b64_json
    image_base64 = _remove_light_edge_background(image_base64)

    return {
        "image": f"data:image/png;base64,{image_base64}"
    }


def _remove_light_edge_background(image_base64: str) -> str:
    image_bytes = base64.b64decode(image_base64)
    image = Image.open(BytesIO(image_bytes)).convert("RGBA")
    pixels = image.load()
    width, height = image.size
    visited = set()
    stack = []

    for x in range(width):
        stack.append((x, 0))
        stack.append((x, height - 1))
    for y in range(height):
        stack.append((0, y))
        stack.append((width - 1, y))

    def is_background(pixel):
        red, green, blue, alpha = pixel
        if alpha == 0:
            return True
        is_light = red >= 235 and green >= 235 and blue >= 235
        is_neutral = max(red, green, blue) - min(red, green, blue) <= 24
        return is_light and is_neutral

    while stack:
        x, y = stack.pop()
        if (x, y) in visited or x < 0 or y < 0 or x >= width or y >= height:
            continue
        visited.add((x, y))

        if not is_background(pixels[x, y]):
            continue

        red, green, blue, _ = pixels[x, y]
        pixels[x, y] = (red, green, blue, 0)
        stack.extend(((x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)))

    output = BytesIO()
    image.save(output, format="PNG")
    return base64.b64encode(output.getvalue()).decode("utf-8")
