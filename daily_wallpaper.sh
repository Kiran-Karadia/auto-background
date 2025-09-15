#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/DailyWallpapers"
mkdir -p "$WALLPAPER_DIR"

KEYWORDS="nature"
WIDTH="2560"
HEIGHT="1440"
API_KEY="<>"
API_URL="https://api.unsplash.com"
API_VERSION="v1"

IMAGE_URL=$(curl -s -H "Authorization: Client-ID $API_KEY" \
--get "$API_URL/photos/random" \
--data-urlencode "query=$KEYWORDS" \
--data-urlencode "orientation=landscape" \
| jq -r ".urls.raw + \"&w=${WIDTH}&h=${HEIGHT}\"")

echo $IMAGE_URL

curl -L -o "$WALLPAPER_DIR/today.jpg" "$IMAGE_URL"

gsettings set org.cinnamon.desktop.background picture-uri "file:///$WALLPAPER_DIR/today.jpg"
