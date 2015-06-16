function [ wave ] = waveConcat( wav1, wav2 )

if isempty(wav1), wave = wav2; return; end
if isempty(wav2), wave = wav1; return; end
flag = 0;
if size(wav1,1)>size(wav1,2)
    flag = 1; 
    wav1 = wav1';
    wav2 = wav2';
end

range = min(100,length(wav1));
c = linspace(1,0,range);
wav1(end-range+1:end) = wav1(end-range+1:end).*c;
range = min(100,length(wav2));
c = linspace(0,1,range);
wav2(1:range) = wav2(1:range).*c;
wave = [wav1 wav2];

if flag, wave = wave';

end

