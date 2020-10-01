
MKVS := $(shell ls *.mkv)
MP4S := $(MKVS:%.mkv=%.mp4)

all: $(MP4S)

%.mp4: %.mkv
	ffmpeg -i $< -af afftdn $@
	#ffmpeg -i $< -codec copy $@

