BASEFILENAME=$(echo $1 | rev | cut -f 2- -d '.' | rev)
CONVERTEDFILENAME=$BASEFILENAME.1.wav

echo "Converting to $CONVERTEDFILENAME"

ffmpeg -loglevel -0 -y -i $1 -ar 16000 -ac 1 -c:a pcm_s16le $CONVERTEDFILENAME

podman run -it --rm -v ./models:/models:Z  -v ./:/audios:Z  whisper.cpp:main "./main -m /models/ggml-tiny.en-q5_1.bin -f /audios/$CONVERTEDFILENAME -oj"

