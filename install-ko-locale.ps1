$ErrorActionPreference = "Stop"

$Url = "https://raw.githubusercontent.com/wickedgangster/hermes-webui-ko/main/ko/i18n.js"
$Target = Join-Path (Get-Location) "static\i18n.js"

if (!(Test-Path $Target)) {
    Write-Host "오류: $Target 파일을 찾을 수 없습니다."
    Write-Host "hermes-webui 폴더 안에서 실행하세요."
    exit 1
}

$Backup = "$Target.bak.$(Get-Date -Format 'yyyyMMdd_HHmmss')"

Write-Host "기존 파일 백업 중: $Backup"
Copy-Item $Target $Backup

Write-Host "한국어 i18n.js 다운로드 중..."
Invoke-WebRequest -Uri $Url -OutFile $Target

Write-Host "완료: $Target 파일이 교체되었습니다."
Write-Host "브라우저를 새로고침하세요."