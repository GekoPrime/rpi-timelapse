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
NAME=`date +%Y-%m-%d_%H:%M:%S`

mkdir $DIR/DCIM
gphoto2 --no-keep --capture-image-and-download --filename $DIR/DCIM/$NAME.jpg
