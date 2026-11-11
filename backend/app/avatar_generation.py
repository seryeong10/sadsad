"""Generate an integrated avatar from two references, without facial pasting."""
from io import BytesIO
from PIL import Image, ImageOps

API_SIZE = (1024, 1536)


def prepare_avatar_generation(base_bytes: bytes) -> bytes:
    avatar = ImageOps.exif_transpose(Image.open(BytesIO(base_bytes))).convert("RGBA")
    # Match the tested transport: room for the whole head and both feet.
    avatar.thumbnail((800, 1228), Image.Resampling.LANCZOS)
    canvas = Image.new("RGBA", API_SIZE, (255, 255, 255, 0))
    canvas.alpha_composite(avatar, ((1024-avatar.width)//2, (1536-avatar.height)//2))
    output = BytesIO()
    canvas.save(output, format="PNG")
    return output.getvalue()


def validate_generated_avatar(data: bytes) -> bytes:
    with Image.open(BytesIO(data)) as image:
        if image.format != "PNG" or image.size != API_SIZE:
            raise ValueError("생성된 아바타 이미지의 형식 또는 크기가 올바르지 않습니다.")
        image.verify()
    # Return the model's complete image. No original face/body pixels are pasted.
    return data
