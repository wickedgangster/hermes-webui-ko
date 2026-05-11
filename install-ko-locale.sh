#!/usr/bin/env sh
set -eu

URL="https://raw.githubusercontent.com/wickedgangster/hermes-webui-ko/main/ko/i18n.js"
TARGET="${1:-./static/i18n.js}"

if [ ! -f "$TARGET" ]; then
  echo "오류: $TARGET 파일을 찾을 수 없습니다."
  echo "hermes-webui 폴더 안에서 실행하세요."
  exit 1
fi

BACKUP="${TARGET}.bak.$(date +%Y%m%d_%H%M%S)"

echo "기존 파일 백업 중: $BACKUP"
cp "$TARGET" "$BACKUP"

echo "한국어 i18n.js 다운로드 중..."
curl -fsSL "$URL" -o "$TARGET"

echo "완료: $TARGET 파일이 교체되었습니다."
echo "브라우저를 새로고침하세요."