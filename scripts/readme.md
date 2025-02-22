## Requirements

- ffmpeg
- podcast, opening and ending should be in mp3 format. If there is an error with ffmpeg use this https://cloudconvert.com/webm-to-mp3

## Tips

- If podcast has silence (begining/end) use audacity or ffmpeg to cut it and save it as mp3

## steps


### trim

Validate if podcast has a clean start and end. If not cut it with ffmpeg, audacity or another tool

### execute

Syntax

```
bash /home/foo/infinite-devops.github.io/scripts/audio_prepare_v2.sh
```

- enter the required values :
  - opening_file: absolute path of mp3 to be played at the begining
  - ending_file: absolute path of mp3 to be played at the ending
  - middle_file: absolute path of podcast recording
  - target_file: absolute path of mp3 file to be created. If empty, it will be computed  

If no errors, the target_file with **_fixed** will be ready


### Upload

https://vocaroo.com/

Copy the url https://voca.ro/1egZqNgXrTXk

Save the id: 1egZqNgXrTXk

### Thumbnail image

Go to

https://github.com/infinite-devops/infinite-devops.github.io/wiki/CDN-%E2%80%90-Podcasts

- Copy the background template in your favourite editor and customize it
- Generate a new png
- Upload to github wiki and get the new url

## Markdown

- Copy the last markdown (from post folder) and set a new name using the sequence
- Title should not contain spaces. Use underscore
- Customize these fields: thumbnail_image_url, datetime (year/month/day), duration and change the id of vocaroo url

```
thumbnail_image_url: https://github.com/user-attachments/assets/6e2af6b6-bfcd-4b7d-a214-60522ce1ffae
datetime : "2024-09-08"
duration: 00:28:12
sound:
    type : vocaroo_url
    value : https://vocaroo.com/embed/1egZqNgXrTXk?autoplay=0
    language: es
```

## Test

Start as developer

```
podcastjs --start
```

## Push

- Go to the workspace
- Build


```
podcastjs --publish --output=docs
```

- Create a CNAME file in the docs folder with content

```
nano docs/CNAME
www.infinite-devops.com
```
- Git push

## Roadmap

- add param debug=true to keep the generated files
- self conversion to mp3 : opening and ending

## Tips

## webm to mp3

```
ffmpeg -i input.webm output.mp3
```

## cut with mp3

### from second 6 to the end

```
ffmpeg -ss 55 -i ini.mp3 -acodec copy input_trim.mp4
```