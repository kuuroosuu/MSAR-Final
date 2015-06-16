function [ scale ] = musicalScale

% Major to Minor
scale.minor = [0 -1 0 0 -1 0 -1 0 0 -1 1 0];

% Majot to Blue
scale.blue  = [0 -1 1 0 1 1 0 0 -1 1 0 -1];

% Majar to Minor and stack fix 3
scale.minor3 = [0 -1 0 0 -1 0 -1 0 0 -1 1 0; ...
                3  3 3 3  3 3  3 3 3  3 3 3];
            
% Majar to Minor and stack adjusted 3
scale.minor34 = [0 -1 0 0 -1 0 -1 0 0 -1 1 0; ...
                 3  3 3 4  3 3  3 4 4  3 3 3];
            
% Original stack fix 3
scale.major3 = [0 0 0 0 0 0 0 0 0 0 0 0; ...
                3 3 3 3 3 3 3 3 3 3 3 3];
            
% Major stack adjusted 3
scale.major34 = [0 0 0 0 0 0 0 0 0 0 0 0; ...
                 4 3 3 4 3 4 3 4 3 3 3 3];
            
% Minor stack adjusted 3
scale.m34 = [0 0 0 0 0 0 0 0 0 0 0 0; ...
             3 4 3 4 3 3 3 4 4 3 4 3];
             
% Major to Pentatonic
scale.Mj_pentatonic = [0 0 0 0 0 -1 0 0 0 0 0 1];

% Minor to Pentatonic
scale.Mi_pentatonic = [0 0 1 0 0 0 0 0 -1 0 0 1];

% Major to Pentatonic stack adjust 3
scale.Mj_pentatonic3 = [0 0 0 0 0 -1 0 0 0 0 0 1; ...
                        4 3 5 4 3  2 3 5 4 3 4 3];

% Major to SouthenEast
scale.southeneast = [0 0 -1 0 -1 2 1 0 0 -1 -2 1];
                    
end

