# Neurofeedback-tutorial-OpenBCI-cyton

I got a BioAmp EXG recently on my first visit to India that I mean to use for neurofeedback. This repo began as a fork of the code from a simple neurofeedback guide[1] which uses the open source Neuromore Studio [2], which is "block programmed" (think Labview, Scratch, Simulink etc.).  In the (substantial) exploration phase, I discovered, firstly, there was too much to that tutorial (controlling a car with your brain is cool, but it's not what I'm looking for and you don't really get that fine grained control anyway) and secondly, there is a lot in there that is more explained in the video, but still leaves a beginner (like I was) scratching their heads. I might wind up rewriting the tutorial for my own learning as well as to  make it easier for others. That, and it'd help anyone looking to use their Bioamp EXG for neurofeedback

Findings
1. As far as I can tell, you can't copy "nodes" (that's Neuromore speak for their blocks) between - or even within classifiers. Classifiers are the backend programs that define the devices the signal is acquired from, the processing done on those signals, and the behaviour of the game/experience. So the "pipelines" described in the tutorial shouldn't be built in the order they're described!
2. The "Remap" node used in Neuromore v 1.7.3 looks different to that described in the neuromore documentation
3.  The Bioamp EXG gives you two eeg sites (look up the) single signal merged into one e.g. you'd see FP1 [3] and FP2




OpenBCI also have a

"""
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




References 

1. The tutorial is here https://openbci.com/community/build-your-own-neurofeedback-game-with-openbci/
2. OpenBCI have a  guide on using neuromore which might be useful, too. See https://docs.openbci.com/Software/CompatibleThirdPartySoftware/Neuromore/
3.  I like this explainer for the 10/20 system https://faculty.washington.edu/chudler/1020.html


