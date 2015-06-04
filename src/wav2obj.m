function [ wObj ] = wav2obj( signal )

wObj.signal = signal;
wObj.fs = 44100;
wObj.nbits = 16;
wObj.file = 'au.vaw';
wObj.amplitudeNormalized = 1;

end

