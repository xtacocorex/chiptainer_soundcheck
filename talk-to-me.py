#!/usr/bin/env python

# COPYRIGHT 2017
# ROBERT WOLTERMAN

# MODULE IMPORTS
import pyttsx
import threading

# THIS IS RIDICULOUS

block = threading.Event()

# FUNCTIONS
def say(engine, text):
    block.set()
    engine.say(text)
    engine.runAndWait()
    block.clear()

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
        while block.isSet():
            pass
        say(speaker, dat)

print("FINE, I'LL BE DONE TALKING TO YOU")
