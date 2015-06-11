function [ scale ] = musicalScale

scale.minor = [0 -1 0 0 -1 0 -1 0 0 -1 1 0];
scale.blue  = [0 -1 1 0 1 1 0 0 -1 1 0 -1];
scale.minor3 = [0 -1 0 0 -1 0 -1 0 0 -1 1 0; ...
                3  3 3 3  3 3  3 3 3  3 3 3];
scale.minor34 = [0 -1 0 0 -1 0 -1 0 0 -1 1 0; ...
                3  3 3 4  3 3  3 4 3  3 3 3];
scale.major3 = [0 0 0 0 0 0 0 0 0 0 0 0; ...
                3 3 3 3 3 3 3 3 3 3 3 3];
scale.major34 = [0 0 0 0 0 0 0 0 0 0 0 0; ...
                 4 3 3 4 3 4 3 4 3 3 3 3];
            
end

