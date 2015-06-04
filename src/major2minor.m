function [ result ] = major2minor( wObj )

if ~exist('wObj','var')
    if exist('pitchCache.mat','file')
        load('pitchCache.mat');
    else
        wObj = waveFile2obj('../media/voice.wav');
        if size(wObj.signal,2)==2
            wObj.signal = wObj.signal(:,1)+wObj.signal(:,2); 
        end
        ptOpt = ptOptSet(wObj.fs,wObj.nbits);
        ptOpt.frameSize = ptOpt.frameSize+mod(ptOpt.frameSize,2);
        pitch = pitchTrack(wObj,ptOpt);
        save('pitchCache.mat','pitch','ptOpt','wObj');
    end
else
    ptOpt = ptOptSet(wObj.fs,wObj.nbits);
    ptOpt.frameSize = ptOpt.frameSize+mod(ptOpt.frameSize,2);
    if size(wObj.signal,2)==2
        wObj.signal = wObj.signal(:,1)+wObj.signal(:,2); 
    end
    pitch = pitchTrack(wObj,ptOpt);
    save('pitchCache.mat','pitch','ptOpt','wObj');
end

majorTone = toneTrack(pitch);
frames = enframe(wObj.signal,ptOpt.frameSize,ptOpt.overlap);
frameSize = ptOpt.frameSize
pause
pitch = round(pitch);
pitch = mod(pitch,12);
psOpt.pitchShiftAmount = -1;
psOpt.method='wsola';
wObjOpt = rmfield(wObj,'signal');
result = zeros(size(wObj.signal));
for i = 1 : size(frames,1)
    i
    tmp = mod(pitch(i)-majorTone,12);
    if tmp==5 || tmp==9
        twObj = wObjOpt;
        twObj.signal = frames(:,i);
        twObj = pitchShift(twObj,psOpt);
        frames(:,i) = twObj.signal;
    end
    result((i-1)*frameSize+1:i*frameSize,1) = frames(:,i);
end


end

