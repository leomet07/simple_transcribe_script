# A quick transcribe script

```bash
docker pull ghcr.io/ggerganov/whisper.cpp:main
```


MOST EFFICIENT MODEL: 
tiny.en-q5_1

DOWNLOAD MODEL:
```bash
mkdir models
docker run -it --rm   -v ./models/:/models   whisper.cpp:main "./models/download-ggml-model.sh tiny.en-q5_1 /models"
```

RUN SCRIPT
```bash
sh transcribe.sh FILENAME
```