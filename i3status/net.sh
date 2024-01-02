#!/bin/sh
    # shell script to prepend i3status with more stuff
   
   netspeed=""
   
   update_net_speed() {
       netspeed=`i3netspeed.sh`
   }
   
  i3status | while :
    do
      read line
      update_net_speed
      net_output="[{ \"full_text\": \"${netspeed}\" },"
      echo "${line/[/$net_output}" || exit 1
    done
  
