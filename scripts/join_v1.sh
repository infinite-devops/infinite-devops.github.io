#!/bin/bash

opening_file="$1"
middle_file="$2"
ending_file="$3"
target_file="$4"

fade_out_duration=4;
fade_in_duration=6 ;

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
cat "$target_file.txt"

echo "file '$opening_file""_fadeout.mp3'" > "$target_file.txt"
echo "file '$middle_file""_middle.mp3'" >> "$target_file.txt"
echo "file '$ending_file'" >> "$target_file.txt"

ffmpeg -hide_banner -loglevel error -y -f concat -safe 0 -i "$target_file.txt" -c copy "$target_file"

echo "\nDeleting temp files"

rm -rf "$opening_file""_fadeout.mp3"
rm -rf "$middle_file""_middle.mp3"
rm -rf "$target_file.txt"