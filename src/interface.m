function interface( fileName, scale )

au = cell(1,length(fileName));
maxLength = 0;
disp('Processing ...')
noInclude = [];
for i = 1 : length(fileName)
    disp([num2str(i) ' / ' num2str(length(fileName))])
    wObj = waveFile2obj(['../media/' fileName{i}]);
    wObj.signal = mean(wObj.signal,2);
    if strcmp(scale{i},'none')
        au{i} = wObj.signal;
    elseif strcmp(scale{i},'mute')
        noInclude = [noInclude i];
    else
        wObj2 = major2scale(wObj,scale{i});
        au{i} = wObj2.signal;
    end
    maxLength = max(maxLength,length(au{i}));
end
au(noInclude) = [];

music = zeros(maxLength,1);
disp('Combine ...')
for i = 1 : length(au)
    au{i} = [au{i}; zeros(maxLength-length(au{i}),1)];
    music = music+au{i};
end
music = music/length(au);
% wavwrite(music,wObj.fs,['result/' datestr(now,'mmmm_dd_yyyy_HH_MM_SS_FFF_AM') '.wav'])
if length(fileName)==1
    wavwrite(music,wObj.fs,['result/' fileName{1}(1:end-4) '_' scale{1} '.wav'])
else
    wavwrite(music,wObj.fs,['result/' fileName{1}(1:end-4) '.wav'])
end
disp('Done')
% sound(music,wObj.fs)

end

