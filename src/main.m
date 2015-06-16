%% Preliminary step
clear all
close all
clc
addpath ../lib/sap/
addpath ../lib/utility/

%% Read a audio file
wObj = waveFile2obj('../media/voice.wav');

%% Or use synthesized wave as audio
% MajorPitch = [65 67 69 70 72 74 76 77 76 74 72 70 69 67 65];
% MinorPitch = [65 67 68 70 72 73 76 77 76 73 72 70 68 67 65];
% duration = [19 19 19 19 19 19 19 19 19 19 19 19 19 19 19]/64;
% fs = 16000;
% % wavwrite(note2wave01(MajorPitch, duration, fs)',fs,16,'./result/major.wav')
% % wavwrite(note2wave01(MinorPitch, duration, fs)',fs,16,'./result/minor.wav')
% wObj.signal = note2wave01(MajorPitch, duration, fs)';
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
