# Neurofeedback-tutorial-OpenBCI-cyton
This repository contains the code that is mentioned in this neurofeedback tutorial guide:

https://openbci.com/community/build-your-own-neurofeedback-game-with-openbci/


OpenBCI also have a guide on using neuromore which might be useful
https://docs.openbci.com/Software/CompatibleThirdPartySoftware/Neuromore/

openbci_neuromore.py - This script sends the EEG data from OpenBCI GUI to neuromore studio.

threshold_calculate.py - This script collects the user EEG data for 30 seconds and then calculates the beta_min, beta_max and beta_avg. We will use the beta_avg as our feedback threshold

Create neurofeedback_rasp.py - This needs to be run on the raspberry pi. This script moves the car in clockwise direction whenever there is activation of the neurofeedback threshold.
