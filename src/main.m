%% Preliminary step
clear all
close all
clc
addpath ../lib/sap/
addpath ../lib/utility/

%% Read a audio file
wObj = waveFile2obj('../media/voice.wav');

%% Or use synthesized wave as audio
% pitch =    [60 62 64 65 67 69 71 72 71 69 67 65 64 62 60];
% duration = [23 23 23 23 23 23 23 23 23 23 23 23 23 23 23]/64;
% fs = 16000;
% wObj.signal = note2wave01(pitch, duration, fs)';
% wObj.fs = fs;
% wObj.nbits = 16;
% wObj.amplitudeNormalized = 1;
% wObj.file = 'note2wave.wav';

%% Play the original sound
% sound(wObj.signal)
% pause

%% Computing the minor version of original sound
wObj2 = major2scale(wObj);

%% Play the result sound
% sound(wObj2.signal)

%% Write to wave file
wavwrite(wObj2.signal,wObj2.fs,wObj2.nbits,'result.wav')
