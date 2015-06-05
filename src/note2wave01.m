function [ wave ] = note2wave01( pitch, duration, fs )

wave = [];
for i = 1 : size(pitch,2)
    f = 440*2^((pitch(i)-69)/12);
    t = (0:duration(i)*fs-1)/fs;
    if(size(wave,1) == 0)
        wave = sin(2*pi*f*t);
    else
        wave = waveConcat(wave, sin(2*pi*f*t));
    end
end

end

