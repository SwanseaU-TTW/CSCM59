
MKVS := $(shell ls *.mkv)
MP4S := $(MKVS:%.mkv=%.mp4)

all: $(MP4S)

%.mp4: %.mkv
	ffmpeg -hwaccel vaapi -hwaccel_output_format vaapi -hwaccel_device /dev/dri/renderD128 -i $< -c:v h264_vaapi -af afftdn $@

