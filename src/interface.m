function interface( fileName, scale )

au = cell(1,length(fileName));
maxLength = 0;
for i = 1 : length(fileName)
    wObj = waveFile2obj(fileName{i});
    wObj.signal = mean(wObj.signal,2);
    if strcmp(scale{i},'none')
        au{i} = wObj.signal;
    else
        wObj2 = major2scale(wObj,scale{i});
        au{i} = wObj2.signal;
    end
    maxLength = max(maxLength,length(au{i}));
end
music = zeros(maxLength,length(fileName));
for i = 1 : length(fileName)
    au{i} = [au{i}; zeros(maxLength-length(au{i}),1)];
    music(:,i) = au{i};
end
music = mean(music,2);
sound(music,wObj2.fs)

end

