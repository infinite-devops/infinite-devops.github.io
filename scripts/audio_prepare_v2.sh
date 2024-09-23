#!/bin/bash

fade_out_duration=4
fade_in_duration=6
# in my tests, only mp3 are well created :/
extension=mp3
fix_midle=
middle_file_initial=

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

if [[ -z "$opening_file" ]]
then
  read -p "Enter opening_file: " opening_file
fi

if [[ -z "$ending_file" ]]
then
  read -p "Enter ending_file: " ending_file
fi

if [[ -z "$middle_file" ]]
then
  read -p "Enter middle_file: " middle_file
fi

middle_file_directory=$(dirname "$middle_file")  
middle_file_filename=$(basename -- "$middle_file")
middle_file_filename_extension="${middle_file##*.}"
middle_file_filename="${middle_file_filename%.*}"
if [[ "$middle_file_filename_extension" != "$extension" ]]
then
    middle_file_initial="$middle_file"
    middle_file="$middle_file_directory/$middle_file_filename"".$extension"
    fix_midle=true
    echo "middle_file_initial: $middle_file_initial"
fi

if [[ -z "$target_file" ]]
then
  read -p "Enter target_file: " target_file

  if [[ ! -z "$target_file" ]]
  then
    echo "foo"
    directory=$(dirname "$target_file")  
    filename=$(basename -- "$target_file")
    _extension="${filename##*.}"
    filename="${filename%.*}"
    target_file="$directory/$filename""_output.$extension"
  fi

fi

echo -e "\nSettings:\n"

echo "opening_file: $opening_file"
echo "middle_file: $middle_file"
echo "ending_file: $ending_file"
echo "target_file: $target_file"
echo "fade_out_duration: $fade_out_duration"
echo "fade_in_duration: $fade_in_duration"
echo "extension: $extension"

fixed_file="$directory/$filename""_fixed.$extension"
echo "fixed_file: $fixed_file"

# fix

if [[ "$fix_midle" == "true" ]]
then
    ffmpeg -i "$middle_file_initial" -hide_banner -loglevel error "$middle_file_directory/$middle_file_filename"".$extension"
fi


## opening

echo -e "\nOpening : procesing"

opening_file_duration=$(ffprobe -i "$opening_file" -show_entries format=duration -v quiet -of csv="p=0")
# get int as var, not decimal
opening_file_duration=$(echo "$opening_file_duration" | cut -d "." -f 1)

echo "opening_file_duration: $opening_file_duration"
fade_out_start_time=$((opening_file_duration-fade_out_duration))
echo "fade_out_start_time: $fade_out_start_time"

ffmpeg -y -i "$opening_file" -hide_banner -loglevel error  -af "afade=t=out:st=$fade_out_start_time:d=$fade_out_duration" "$opening_file""_fadeout.mp3"

## middle

echo -e "\nMiddle : procesing"

middle_file_duration=$(ffprobe -i "$middle_file" -show_entries format=duration -v quiet -of csv="p=0")
# get int as var, not decimal
middle_file_duration=$(echo "$middle_file_duration" | cut -d "." -f 1)
echo "middle_fade_in_start_time: 00"
echo "middle_fade_in_duration: $fade_in_duration"
echo "middle_file_duration: $middle_file_duration"
middle_fade_out_start_time=$((middle_file_duration-fade_out_duration))
echo "middle_fade_out_start_time: $middle_fade_out_start_time"

ffmpeg -y -i "$middle_file" -hide_banner -loglevel error  -af "afade=t=in:ss=0:d=$fade_in_duration,afade=t=out:st=$middle_fade_out_start_time:d=$fade_out_duration" "$middle_file""_middle.mp3"

## ending has already a kind of fade-in and fade-out
echo -e "\nEnding : already processed"

## merge 3 files

echo -e "\nConcat files"

echo "file '$opening_file""_fadeout.mp3'" > "$target_file.txt"
echo "file '$middle_file""_middle.mp3'" >> "$target_file.txt"
echo "file '$ending_file'" >> "$target_file.txt"

cat "$target_file.txt"

ffmpeg -hide_banner -loglevel error -y -f concat -safe 0 -i "$target_file.txt" -acodec copy "$target_file"

echo "Fixing mp3"

ffmpeg -i "$target_file" "$fixed_file"

echo -e "\nDeleting temp files"

rm -rf "$opening_file""_fadeout.mp3"
rm -rf "$middle_file""_middle.mp3"
rm -rf "$target_file.txt"