#!/bin/bash


# https://blogs.oracle.com/paulie/capture-live-webcam-images-and-create-time-lapse-videos-with-linksys-wvc54gca
# https://scidle.com/how-to-make-a-time-lapse-video-with-linux/

# Webcam URL
CAMERAS="205 227 236 119 230 145 109 DCIM"
# Output DIR
DIR="/home/pi/timelapse-photos"
SHARE_DIR="/home/pi/shared"
HOUR="18"
rm -r $SHARE_DIR/timelapse*.avi
for camera in $CAMERAS; do
        ls -d $DIR/$camera/* > frames_$camera.txt
	mencoder -nosound -ovc x264 -o $SHARE_DIR/timelapse_$camera.avi -mf type=jpeg:fps=30 mf://@frames_$camera.txt

	find $DIR/$camera/ -regex [^_]*_$HOUR[^.]*.jpg > frames_$camera-$HOUR.txt 
	mencoder -nosound -ovc x264 -o $SHARE_DIR/timelapse_$camera-$HOUR.avi -mf type=jpeg:fps=30 mf://@frames_$camera-$HOUR.txt

	rm frames*.txt
done

