# BASE OFF THE PYTHON IO CHIPTAINER
FROM nextthingco/chiptainer_alpine

# COPY THE SCRIPT
COPY talk-to-me.py /

# INSTALL THE THINGS
RUN apk update && \
    # SOUNDCHECK SPECIFIC PACKAGES
    apk add espeak && \
    # STUFF REQUIRED FOR PIP
    apk add gcc && \
    apk add g++ && \
    apk add make && \
    apk add py2-pip && \
    pip install --upgrade pip && \
    pip install pyttsx && \
    # Remove unneeded packages once build is complete.
    apk del gcc && \
    apk del g++ && \
    apk del make && \
    apk del py2-pip

# THE ENTRY POINT
ENTRYPOINT echo "I'M LONELY, LET ME TALK TO YOU..." && \
    python talk-to-me.py
