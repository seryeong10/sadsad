param(
    [Parameter(Mandatory = $true)][string]$BackendOrigin,
    [Parameter(Mandatory = $true)][string]$FirebaseDefinesPath
)
$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    $origin = [Uri]$BackendOrigin
    if ($origin.Scheme -notin @('http', 'https') -or !$origin.Host -or
        $origin.AbsolutePath -ne '/' -or $origin.Query -or $origin.UserInfo) {
        throw 'BackendOrigin must be an HTTP(S) server origin without a path or credentials.'
    }
    $definesPath = (Resolve-Path -LiteralPath $FirebaseDefinesPath).Path
    $defines = Get-Content -LiteralPath $definesPath -Raw | ConvertFrom-Json
    $restAuth = "$($defines.FIREBASE_REST_AUTH)" -eq 'true'
    $requiredSettings = if ($restAuth) { @('FIREBASE_API_KEY') } else {
        @('FIREBASE_API_KEY', 'FIREBASE_APP_ID', 'FIREBASE_MESSAGING_SENDER_ID', 'FIREBASE_PROJECT_ID')
    }
    foreach ($name in $requiredSettings) {
        if (!$defines.$name) { throw "Missing Firebase build setting: $name" }
    }
    if (!$restAuth -and $defines.FIREBASE_APP_ID -notmatch ':web:') {
        throw 'Use the Firebase WEB app configuration, not the Android app ID.'
    }
    foreach ($property in $defines.PSObject.Properties) {
        if ($property.Name -match '^MOCK_' -and "$($property.Value)" -match '^(true|1)$') {
            throw "Live builds cannot enable $($property.Name)."
        }
        if ($property.Name -match '^(OPENAI_API_KEY|FAL_KEY|NAVER_CLIENT_SECRET|OPENWEATHER_API_KEY)$') {
            throw "Server secret must not be included in a Flutter build: $($property.Name)"
        }
    }
    $backend = $BackendOrigin.TrimEnd('/')
    $schema = Invoke-RestMethod -Uri "$backend/openapi.json" -TimeoutSec 15
    foreach ($endpoint in @('/generate-avatar', '/analyze-personal-color', '/api/analyze-closet-item', '/virtual-try-on', '/api/weather')) {
        if (!$schema.paths.$endpoint) { throw "Backend is missing $endpoint" }
    }
    flutter build web --release "--dart-define-from-file=$definesPath" "--dart-define=API_BASE_URL=$backend" --dart-define=MOCK_DEMO_MODE=false
    if ($LASTEXITCODE -ne 0) { throw 'Live web build failed.' }
    $deployPath = Join-Path $PSScriptRoot '.vercel-live'
    New-Item -ItemType Directory -Force -Path $deployPath | Out-Null
    Copy-Item -Path 'build/web/*' -Destination $deployPath -Recurse -Force
    # Live requests use the authenticated FastAPI server exclusively.
    $oldFunction = Join-Path $deployPath 'api/recommend/closet.js'
    if (Test-Path -LiteralPath $oldFunction) {
        Remove-Item -LiteralPath $oldFunction
    }
    $config = @{
        framework = $null; buildCommand = ''; installCommand = ''; outputDirectory = '.'
        rewrites = @(
            @{ source = '/backend/:path*'; destination = "$backend/:path*" },
            @{ source = '/((?!api(?:/|$)|backend(?:/|$)).*)'; destination = '/index.html' }
        )
        headers = @(@{ source = '/(.*)'; headers = @(@{ key = 'Cache-Control'; value = 'no-cache' }) })
    }
    [IO.File]::WriteAllText((Join-Path $deployPath 'vercel.json'), ($config | ConvertTo-Json -Depth 8), [Text.UTF8Encoding]::new($false))
    # Reuse the existing project identity without modifying the current deployment.
    $project = Join-Path $PSScriptRoot '.vercel-demo/.vercel/project.json'
    if (Test-Path -LiteralPath $project) {
        New-Item -ItemType Directory -Force -Path (Join-Path $deployPath '.vercel') | Out-Null
        Copy-Item -LiteralPath $project -Destination (Join-Path $deployPath '.vercel/project.json') -Force
    }
    Write-Host "Live build prepared: $deployPath"
    Write-Host 'Deploy after live API verification: npx vercel .vercel-live --prod'
} finally {
    Pop-Location
}
