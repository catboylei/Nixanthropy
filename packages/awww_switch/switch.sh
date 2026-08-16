set -euo pipefail

files=()
while IFS= read -r -d '' f; do
  files+=("$f")
done < <(find "$dir" -maxdepth 1 -type f -print0)

pick="${files[RANDOM % ${#files[@]}]}"

awww img "$pick"