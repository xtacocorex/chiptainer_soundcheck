#!/bin/sh

# SET THE ANTENNA TO BE THE EXTERNAL ONE
set_antenna ufl

# REMOVE ANY PREVIOUS INSTANCE OF THE CONTAINER
docker rm soundcheck

# PULL THE LATEST
docker pull xtacocorex/chiptainer_soundcheck

# REMOVE OLD CONTIANER
docker rmi `docker images | grep chiptainer_soundcheck | grep "<none>" | tr -s " " | cut -d " " -f 3`

# RUN THE CONTAINER
docker run \
         --rm \
         -it \
         --name soundcheck \
         --privileged \
         --device /dev/snd \
         xtacocorex/chiptainer_soundcheck:latest
