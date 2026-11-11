$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    flutter build web --release --dart-define=MOCK_DEMO_MODE=true
    if ($LASTEXITCODE -ne 0) { throw 'Flutter web build failed.' }
    $deployPath = Join-Path $PSScriptRoot '.vercel-demo'
    New-Item -ItemType Directory -Force -Path $deployPath | Out-Null
    # Keep generated files separate from source code and backend secrets.
    Copy-Item -Path 'build/web/*' -Destination $deployPath -Recurse -Force
    Copy-Item -LiteralPath 'api' -Destination $deployPath -Recurse -Force
    $vercelConfig = @'
{
  "framework": null,
  "buildCommand": "",
  "installCommand": "",
  "outputDirectory": ".",
  "functions": { "api/recommend/closet.js": { "maxDuration": 60 } },
  "rewrites": [
    { "source": "/((?!api(?:/|$)).*)", "destination": "/index.html" }
  ],
  "headers": [
    {
      "source": "/(.*)",
      "headers": [{ "key": "Cache-Control", "value": "no-cache" }]
    }
  ]
}
'@
    [System.IO.File]::WriteAllText((Join-Path $deployPath 'vercel.json'), $vercelConfig, (New-Object System.Text.UTF8Encoding($false)))
    Write-Host "Ready: $deployPath"
    Write-Host 'Deploy: npx --yes vercel@latest .vercel-demo --prod'
} finally {
    Pop-Location
}
