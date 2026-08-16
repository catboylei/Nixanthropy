# Changes the wallpaper to a randomly chosen image in a given directory
# at a set interval.

INTERVAL=60 # In seconds
RESIZE_TYPE="fit"

export AWWW_TRANSITION_FPS="${AWWW_TRANSITION_FPS:-60}"
export AWWW_TRANSITION_STEP="${AWWW_TRANSITION_STEP:-2}"

while true; do
  find "$dir" -type f \
  | while read -r img; do
    echo "$(</dev/urandom tr -dc a-zA-Z0-9 | head -c 8):$img"
  done \
  | sort -n | cut -d':' -f2- \
  | while read -r img; do
    awww img --resize="$RESIZE_TYPE" "$img"  --transition-type wipe
    sleep $INTERVAL
  done
done