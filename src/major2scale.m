function [ wObj ] = major2scale( wObj, scaleName )

disp('Loading data ...')
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
    if size(wObj.signal,2)==2
        wObj.signal = wObj.signal(:,1)+wObj.signal(:,2); 
    end
    pitch = pitchTrack(wObj,ptOpt);
    save('pitchCache.mat','pitch','ptOpt','wObj');
end
if ~exist('scaleName','var'), scaleName = 'blue'; end

disp(['Start to convert major to ' scaleName])
majorTone = toneTrack(pitch);
frames = enframe(wObj.signal,ptOpt.frameSize,ptOpt.overlap);
frameSize = ptOpt.frameSize;
pitch = round(pitch);
note = findContinueSeq(pitch,5);

% For SAP version using
% psOpt.pitchShiftAmount = -1;
% psOpt.method='wsola';
% wObjOpt = rmfield(wObj,'signal');
offset = 1;
wObj.signal = [];
scale = musicalScale;
scale = scale.(scaleName);
for i = 1 : size(note,2)
    segment = zeros(frameSize*note(1,i),size(scale,1));
    for j = 1 : note(1,i)
        segment(1+(j-1)*frameSize:j*frameSize,1) = frames(:,offset+j-1);
    end
    for j = 2 : size(scale,1)
        segment(:,j) = segment(:,1);
    end
    diff = mod(note(2,i)-majorTone,12);
    if scale(diff+1)
        for j = 1 : size(scale,1)
            tmp = pitchShift2(segment(:,j),512,32,scale(j,diff+1))';
            segment(:,j) = interp1(tmp, 1:size(segment,1), 'spline');
        end
    end
%     size(segment)
%     tmp = mod(note(2,i)-majorTone,12);
%     if tmp==4 || tmp==9
%%%%%% SAP version
%         twObj = wObjOpt;
%         twObj.signal = segment;
%         twObj = pitchShift(twObj,psOpt);
%         segment = twObj.signal;
%%%%%%
%         segment = pitchShift2(segment,512,32,-1)';
%%%%%%
%     end
    offset = offset+note(1,i);
    segment = mean(segment,2);
    wObj.signal = waveConcat(wObj.signal, segment);
end
disp('Done')

end

