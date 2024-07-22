## Requirements

- ffmpeg
- podcast, opening and ending should be in mp3 format

## Tips

- If podcast has silence (begining/end) use audacity or ffmpeg to cut it and save it as mp3

## steps


- execute

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

## Roadmap

- add param debug=true to keep the generated files
- self conversion to mp3 : opening and ending