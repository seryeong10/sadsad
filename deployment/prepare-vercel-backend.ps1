$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$destination = Join-Path $root '.vercel-backend'
New-Item -ItemType Directory -Force -Path $destination | Out-Null
$obsoleteEntry = Join-Path $destination 'app.py'
if (Test-Path -LiteralPath $obsoleteEntry) { Remove-Item -LiteralPath $obsoleteEntry }
Copy-Item -Path (Join-Path $PSScriptRoot 'vercel_backend/*') -Destination $destination -Force
Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'vercel_backend/.python-version') -Destination $destination -Force
$oldRequirements = Join-Path $destination 'requirements.txt'
if (Test-Path -LiteralPath $oldRequirements) { Remove-Item -LiteralPath $oldRequirements }
$backendDestination = Join-Path $destination 'backend'
New-Item -ItemType Directory -Force -Path $backendDestination | Out-Null
Copy-Item -LiteralPath (Join-Path $root 'backend/app') -Destination $backendDestination -Recurse -Force
foreach ($directory in @('models', 'data')) {
    New-Item -ItemType Directory -Force -Path (Join-Path $backendDestination $directory) | Out-Null
}
foreach ($file in @('personal_color_model.joblib', 'personal_color_model_female.joblib', 'personal_color_model_male.joblib')) {
    Copy-Item -LiteralPath (Join-Path $root "backend/models/$file") -Destination (Join-Path $backendDestination 'models') -Force
}
Copy-Item -LiteralPath (Join-Path $root 'backend/data/style_recommendation_ruleset.json') -Destination (Join-Path $backendDestination 'data') -Force
Copy-Item -LiteralPath (Join-Path $root 'backend/structured_clothes_data.csv') -Destination $backendDestination -Force
$auditPath = Join-Path $root 'backend/data/product_image_audit.json'
if (Test-Path -LiteralPath $auditPath) {
    Copy-Item -LiteralPath $auditPath -Destination (Join-Path $backendDestination 'data') -Force
}
$faceMasks = Join-Path $root 'backend/data/avatar_face_masks'
if (Test-Path -LiteralPath $faceMasks) {
    Copy-Item -LiteralPath $faceMasks -Destination (Join-Path $backendDestination 'data') -Recurse -Force
}
# Checkpoints stay byte-identical in model storage, outside source uploads.
# Credentials are set as server environment variables, never copied as files.
Write-Host "Prepared existing FastAPI backend: $destination"
