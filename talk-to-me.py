#!/usr/bin/env python

# COPYRIGHT 2017
# ROBERT WOLTERMAN

# MODULE IMPORTS
import pyttsx

# THIS IS RIDICULOUS

# FUNCTIONS
def say(engine, text):
    engine.say(text)
    engine.runAndWait()

def get_data():
    return raw_input("TYPE quit TO EXIT, OTHERWISE ENTER TEXT: ")

# SETUP OUR ENGINE
speaker = pyttsx.init()

# LOOP
dead = False
while not dead:
    # GET TEXT
    dat = get_data().lower()

    if "quit" in dat:
        dead = True
    else:
        say(speaker, dat)

print("FINE, I'LL BE DONE TALKING TO YOU")
