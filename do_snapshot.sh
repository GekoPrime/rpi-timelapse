#!/bin/bash


# https://blogs.oracle.com/paulie/capture-live-webcam-images-and-create-time-lapse-videos-with-linksys-wvc54gca
# https://scidle.com/how-to-make-a-time-lapse-video-with-linux/

# Webcam URL
WEBCAM_HOSTS="205 227 236 119 230 145 109"
WEBCAM_SNAPSHOT_PATH="/cgi-bin/snapshot.cgi"
#User
USER="admin"
# Password
PASS="BEHIND85TEXAS"
# Output DIR
DIR="/home/pi/timelapse-photos"
mkdir $DIR
NAME=`date +%d-%m-%Y_%H:%M:%S`
for webcam_host in $WEBCAM_HOSTS; do
	mkdir $DIR/$webcam_host
	wget --no-check-certificate --no-verbose --user $USER --password $PASS 192.168.42.$webcam_host$WEBCAM_SNAPSHOT_PATH -O $DIR/$webcam_host/$NAME.jpg
	jpeginfo -d $DIR/$webcam_host/$NAME.jpg
done

mkdir $DIR/DCIM
gphoto2 --no-keep --capture-image-and-download --filename $DIR/DCIM/%d-%m-%Y_%H:%M:%S.jpg
