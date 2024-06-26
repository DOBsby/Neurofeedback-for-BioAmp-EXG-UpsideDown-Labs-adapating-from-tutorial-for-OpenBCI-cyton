# Neurofeedback-tutorial-OpenBCI-cyton
"""
This repository contains the code that is mentioned in this neurofeedback tutorial guide:

https://openbci.com/community/build-your-own-neurofeedback-game-with-openbci/


OpenBCI also have a guide on using neuromore which might be useful
https://docs.openbci.com/Software/CompatibleThirdPartySoftware/Neuromore/

openbci_neuromore.py - This script sends the EEG data from OpenBCI GUI to neuromore studio.

threshold_calculate.py - This script collects the user EEG data for 30 seconds and then calculates the beta_min, beta_max and beta_avg. We will use the beta_avg as our feedback threshold

Create neurofeedback_rasp.py - This needs to be run on the raspberry pi. This script moves the car in clockwise direction whenever there is activation of the neurofeedback threshold.
"""

Daire: above in quotes is directly from the repo I'm basing this on. What I'm really trying to do here is to port the project over to using the bioamp EXG pill from UpsideDownLabs. Steps to completion

1. Read the tutorial & break it down further
2. Port my existing workflow, which sends  Bioamp EXG readings into via OSC messages into Neuromore (NM) Studio, from Processing to Python. The Python OSC libraries have been updated more recently and anyone else wanting to use this project would be more likely to use Python.
   1.  Commit my friend's Python script that reads serial data (output by an Arduino)
   2. Committed my own Processing sketch  here.
   3. Look at the tutorial's OSC Python scripts to understand how to replicate the Processing sketch's functionality 
4. Verify the ported code will show the same signs of Life in NM (a basic EEG spectrum)
5. Copy in the pipelines from the tutorial into my NM studio profile and replace the OpenBCI device with an OSC device (it would take messages from my Python EEGreader/translator)
6. Test how the pipelines work. Note discrepancies between how it behaves and how it should, and debug.
