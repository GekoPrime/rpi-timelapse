# rpi-timelapse

apt-get install gphoto2

## Example crontab

    # every hour
    0 * * * * /home/pi/rpi-timelapse/do_snapshot.sh
    
    # every day at 9:10 AM UTC (1:10 AM pacific)
    10 9 * * * /home/pi/rpi-timelapse/do_encode.sh
