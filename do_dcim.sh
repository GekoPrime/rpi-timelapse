#!/bin/bash


# https://blogs.oracle.com/paulie/capture-live-webcam-images-and-create-time-lapse-videos-with-linksys-wvc54gca
# https://scidle.com/how-to-make-a-time-lapse-video-with-linux/

# Output DIR
DIR="/home/pi/timelapse-photos"
mkdir $DIR
NAME=`date +%Y-%m-%d_%H:%M:%S`
SHARE="/home/pi/shared"

mkdir $DIR/DCIM
rm $SHARE/DCIM.jpg
gphoto2 --no-keep --capture-image-and-download --filename $SHARE/DCIM.jpg
cp $SHARE/DCIM.jpg $DIR/DCIM/$NAME.jpg
