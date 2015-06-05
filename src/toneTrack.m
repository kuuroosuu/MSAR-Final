function [ majorTone ] = toneTrack( pitch )

pitch(find(pitch==0)) = [];
pitch = round(pitch);
pitch = mod(pitch,12);

pitchCnt = zeros(1,12);
for i = 1 : length(pitch)
    pitchCnt(pitch(i)+1) = pitchCnt(pitch(i)+1)+1;
end

pitchCnt = [pitchCnt pitchCnt];

majorPattern = [1 0 1 0 1 1 0 1 0 1 0 1];
majorTone = zeros(1,12);
for i = 1 : 12
    majorTone(i) = majorTone(i) + sum(pitchCnt(i:i+11).*majorPattern);
end
[~, majorTone] = max(majorTone);
majorTone = majorTone-1;

end