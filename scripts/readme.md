## Requirements

- ffmpeg
- audacity

## steps

- ceate a folder. Sample:  /tmp/sandbox/
- In case the podcast has several seconds of silence at the begining or ending, trim it using audacity and save it into the folder. Result: podcast.wav
- download the selected opening and ending into the folder
- execute

Syntax

```
bash join_v1.sh <opening_file> <podcast_file> <ending_file> <target_file>
```

```
bash /home/computer/Github/infinite-devops.github.io/scripts/join_v1.sh /tmp/sandbox/opening.mp3 /tmp/sandbox/podcast.wav /tmp/sandbox/ending.mp3 /tmp/sandbox/podcast_01.mp3
```

## All in the same folder

To keep simple, download all the files in the same foder, then execute:

```
bash /home/computer/Github/infinite-devops.github.io/scripts/join_v1.sh opening.mp3 podcast.mp3 ending.mp3 name_of_new_podcast.mp3
```

## Roadmap

- add param debug=true to keep the generated files