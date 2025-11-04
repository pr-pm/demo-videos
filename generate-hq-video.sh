#!/bin/bash

# High-Quality Video Generator for PRPM Demos
# This script generates VHS videos and re-encodes them for YouTube quality

set -e

if [ -z "$1" ]; then
    echo "Usage: ./generate-hq-video.sh <demo-video.tape>"
    echo "Example: ./generate-hq-video.sh install/demo-video.tape"
    exit 1
fi

TAPE_FILE="$1"
DIR=$(dirname "$TAPE_FILE")
OUTPUT_FILE="$DIR/demo.mp4"
HQ_FILE="$DIR/demo-youtube.mp4"

echo "🎬 Generating video with VHS..."
cd "$DIR" && vhs "$(basename "$TAPE_FILE")" && cd - > /dev/null

echo "🎨 Re-encoding for YouTube quality..."
ffmpeg -i "$OUTPUT_FILE" \
    -c:v libx264 \
    -crf 15 \
    -preset veryslow \
    -tune film \
    -profile:v high \
    -level 4.2 \
    -pix_fmt yuv420p \
    -movflags +faststart \
    -b:v 2500k \
    -maxrate 5000k \
    -bufsize 10000k \
    -y \
    "$HQ_FILE"

echo "✅ High-quality video created: $HQ_FILE"
echo "📊 File sizes:"
ls -lh "$OUTPUT_FILE" "$HQ_FILE"

echo ""
echo "🎥 Video info:"
ffprobe -v error -select_streams v:0 -show_entries stream=bit_rate,width,height,r_frame_rate -of default=noprint_wrappers=1 "$HQ_FILE"
