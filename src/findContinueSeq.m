function [ conSeq ] = findContinueSeq( seq, minCon )

if ~exist('minCon','var'), minCon = 1; end
if isempty(seq), return; end

conSeq = [1; seq(1)];
for i = 2 : length(seq)
    if seq(i) ~= conSeq(2,end)
        conSeq = [conSeq [1;seq(i)]];
    else
        conSeq(1,end) = conSeq(1,end)+1;
    end
end

while 1
    [minVal, tooSmallIdx] = min(conSeq(1,:));
    if minVal>=minCon, break; end
    for i = length(tooSmallIdx) : -1 : 1
        if size(conSeq,2)==1, break; end
        if tooSmallIdx(i)+1>size(conSeq,2) && tooSmallIdx(i)-1>1
            conSeq(1,tooSmallIdx(i)-1) = conSeq(1,tooSmallIdx(i)-1)+conSeq(1,tooSmallIdx(i));
        elseif tooSmallIdx(i)+1<size(conSeq,2) && tooSmallIdx(i)-1<1
            conSeq(1,tooSmallIdx(i)+1) = conSeq(1,tooSmallIdx(i)+1)+conSeq(1,tooSmallIdx(i));
        else
            if abs(conSeq(2,tooSmallIdx(i))-conSeq(2,tooSmallIdx(i)-1)) > abs(conSeq(2,tooSmallIdx(i))-conSeq(2,tooSmallIdx(i)+1))
                conSeq(1,tooSmallIdx(i)+1) = conSeq(1,tooSmallIdx(i)+1)+conSeq(1,tooSmallIdx(i));
            else
                conSeq(1,tooSmallIdx(i)-1) = conSeq(1,tooSmallIdx(i)-1)+conSeq(1,tooSmallIdx(i));
            end
        end
        conSeq(:,tooSmallIdx(i)) = [];
    end
end

end

