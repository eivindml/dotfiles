function converttocsv() {
    jq -r '.transactions | 
           ["Memo", "Date", "Amount"], 
           (.[] | [
              .OriginalText, 
              "\(.Date.Year)/\(.Date.Month)/\(.Date.Day)", 
              .Amount.Value
           ]) | @csv' "$1" > "$2"
}

function dnbtoynab() {
  awk -F';' 'BEGIN {OFS=","; RS="\r\n"; ORS="\n"} NR==1 {print "\"Date\",\"Memo\",\"Outflow\",\"Inflow\""; next} {print $1, $2, $4, $5}' $1 > $2
}

function dnbcompanytoynab() {
  awk -F';' 'BEGIN {OFS=","; RS="\r\n"; ORS="\n"} NR==5 {print "\"Date\",\"Memo\",\"Inflow\",\"Inflow\""} NR > 5 {print $5, $2, $6, $7}' $1 > $2
}

function convertfavicon() {
  convert $1 -define icon:auto-resize=256,64,48,32,16 $2
}

# Prints out all the functions in this file.
# Some extra precaution is taken so that it doesn't grep the grep command itself.
function listfuncs() {
  grep -o 'function [a-zA-Z0-9_-]*' ~/.zsh/functions.zsh | cut -d' ' -f2 | grep -v '^$'
}

function initswiftscript() {
  if [ ! $1 ]; then
    echo "Usage: init-script ProjectName"
    return
  fi
  mkdir $1 
  cd $1 
  swift package init --type executable --name $1 
  swift package generate-xcodeproj 
  xed .
}

function metatags() {
  curl --compressed -s $1 | xml2 | grep meta | awk -F/ '{print $NF}'
}

function linktags() {
  curl --compressed -s $1 | xml2 | grep link | awk -F/ '{print $NF}'
}

# Pretty print of code
function prettyjson() {
    python3 -m json.tool "$1" | /opt/homebrew/bin/bat --theme="GitHub" -p
}

function whitebg() {
  convert "$1" -background white -alpha remove -alpha off "$1"
}

#### capture-website https://kalit.no --output=kalit-desktop.png --full-page --overwrite --delay=7 --launch-options='{"headless": false}' --emulate-device="iPhone X"
#### ffmpeg -ss 00:00:00 -i output.mp4 -to 00:00:44.68 -c:v copy -c:a copy output10.mp4
#### ffmpeg -i test.mp4 -vf blackdetect=d=0:pix_th=0.4 -f rawvideo -y /dev/null
#### ffmpeg -f lavfi -i color=s=1920x1080 -loop 1 -t 10 -i "kalit-desktop.png" -filter_complex "[0:v]overlay=y=-'t*h*0.02'" output.mp4

# This will convert a regular json file into a .ndjson file.
# .ndjson is a newline delimited json format.
function jsontondjson() {
    output_file=$(basename -s .json "$1").ndjson
    cat "$1" | jq -c '.[]' > "$output_file"
}
