function output=tickAdd(wObj, tickPosition, outputFile, plotOpt)
%tickAdd: Add tick sound to an audio signal
%
%	Usage:
%		output=tickAdd(wObj, tickPosition);
%
%	Description:
%		output=tickAdd(wObj, tickPosition) returns the combined sound of the original signal and a train of tick sounds.
%			wObj: wave object
%			tickPosition: Time positions (in sec) of the tick sounds
%			output: Output signal
%	Example:
%		wObj=waveFile2obj('yesterday.wav');
%		beatPosition=asciiRead('yesterday.beat');
%		tickAdd(wObj, beatPosition, 'yesterday_tickAdded.wav');
%		dos('start yesterday_tickAdded.wav');

if nargin<1, selfdemo; return; end
if ischar(wObj), wObj=waveFile2obj(wObj); end
if nargin<3, outputFile=''; end
if nargin<4, plotOpt=0; end

tick=[0;-0.19;-0.28;-0.27;-0.18;-0.1;-0.049;-0.013;0.0075;-0.0036;-0.044;-0.081;-0.083;-0.044;0.023;0.11;0.2;0.3;0.39;0.47;0.51;0.53;0.51;0.48;0.44;0.37;0.28;0.19;0.11;0.04;-0.035;-0.1;-0.15;-0.16;-0.16;-0.15;-0.15;-0.17;-0.2;-0.24;-0.29;-0.33;-0.35;-0.33;-0.28;-0.2;-0.12;-0.032;0.058;0.14;0.21;0.25;0.27;0.27;0.26;0.22;0.16;0.079;-0.0014;-0.079;-0.15;-0.21;-0.25;-0.25;-0.23;-0.2;-0.19;-0.21;-0.25;-0.3;-0.35;-0.39;-0.42;-0.42;-0.38;-0.32;-0.25;-0.18;-0.086;0.023;0.13;0.2;0.26;0.3;0.33;0.32;0.26;0.18;0.086;-0.0075;-0.1;-0.19;-0.25;-0.27;-0.26;-0.24;-0.24;-0.27;-0.3;-0.33;-0.37;-0.41;-0.44;-0.44;-0.41;-0.37;-0.32;-0.26;-0.18;-0.07;0.042;0.14;0.22;0.3;0.36;0.4;0.39;0.35;0.29;0.23;0.17;0.12;0.083;0.078;0.089;0.094;0.075;0.031;-0.031;-0.1;-0.17;-0.24;-0.31;-0.37;-0.42;-0.44;-0.44;-0.42;-0.38;-0.3;-0.19;-0.078;0.032;0.14;0.24;0.32;0.35;0.34;0.31;0.27;0.22;0.19;0.16;0.15;0.15;0.16;0.14;0.094;0.035;-0.024;-0.081;-0.15;-0.23;-0.33;-0.42;-0.5;-0.56;-0.61;-0.62;-0.58;-0.48;-0.35;-0.21;-0.07;0.07;0.2;0.28;0.32;0.32;0.3;0.29;0.28;0.28;0.27;0.27;0.27;0.25;0.21;0.16;0.11;0.058;-0.00012;-0.077;-0.17;-0.27;-0.36;-0.44;-0.5;-0.54;-0.53;-0.48;-0.4;-0.3;-0.19;-0.077;0.016;0.076;0.1;0.1;0.094;0.087;0.086;0.087;0.086;0.085;0.086;0.088;0.086;0.076;0.062;0.05;0.031;-0.013;-0.094;-0.2;-0.31;-0.42;-0.52;-0.59;-0.63;-0.62;-0.56;-0.48;-0.38;-0.28;-0.19;-0.11;-0.07;-0.047;-0.031;-0.011;0.016;0.045;0.07;0.087;0.1;0.12;0.15;0.18;0.2;0.23;0.24;0.23;0.16;0.067;-0.047;-0.16;-0.28;-0.39;-0.46;-0.49;-0.47;-0.42;-0.36;-0.29;-0.23;-0.18;-0.15;-0.13;-0.11;-0.092;-0.07;-0.052;-0.047;-0.051;-0.047;-0.02;0.031;0.099;0.17;0.24;0.3;0.34;0.33;0.27;0.17;0.056;-0.063;-0.18;-0.27;-0.34;-0.37;-0.36;-0.34;-0.32;-0.29;-0.25;-0.22;-0.19;-0.16;-0.13;-0.1;-0.079;-0.07;-0.07;-0.062;-0.033;0.023;0.1;0.19;0.28;0.36;0.42;0.43;0.4;0.33;0.24;0.15;0.043;-0.063;-0.15;-0.2;-0.22;-0.24;-0.26;-0.27;-0.25;-0.23;-0.2;-0.17;-0.15;-0.13;-0.12;-0.12;-0.14;-0.16;-0.14;-0.086;0.0032;0.11;0.22;0.31;0.4;0.45;0.47;0.45;0.39;0.33;0.25;0.16;0.077;0.0078;-0.042;-0.086;-0.13;-0.17;-0.19;-0.18;-0.16;-0.14;-0.13;-0.14;-0.16;-0.2;-0.25;-0.29;-0.3;-0.27;-0.19;-0.1;0.0017;0.11;0.21;0.3;0.36;0.39;0.39;0.38;0.34;0.3;0.24;0.18;0.12;0.062;0.011;-0.031;-0.057;-0.063;-0.051;-0.039;-0.045;-0.078;-0.13;-0.2;-0.26;-0.32;-0.36;-0.35;-0.3;-0.22;-0.13;-0.023;0.087;0.2;0.28;0.33;0.35;0.37;0.37;0.34;0.28;0.21;0.14;0.078;0.011;-0.047;-0.078;-0.078;-0.06;-0.047;-0.059;-0.1;-0.17;-0.25;-0.34;-0.42;-0.5;-0.54;-0.54;-0.51;-0.46;-0.39;-0.3;-0.2;-0.1;-0.016;0.058;0.13;0.18;0.21;0.21;0.19;0.15;0.1;0.064;0.047;0.053;0.078;0.11;0.15;0.16;0.14;0.081;3.1e-005;-0.087;-0.17;-0.26;-0.33;-0.38;-0.39;-0.38;-0.36;-0.32;-0.25;-0.16;-0.07;0.011;0.086;0.16;0.22;0.24;0.23;0.19;0.15;0.12;0.12;0.13;0.16;0.2;0.23;0.25;0.23;0.17;0.094;0.0099;-0.078;-0.17;-0.27;-0.36;-0.42;-0.46;-0.48;-0.49;-0.46;-0.4;-0.31;-0.22;-0.14;-0.06;0.0078;0.048;0.055;0.039;0.023;0.024;0.047;0.087;0.14;0.2;0.27;0.32;0.34;0.34;0.32;0.29;0.24;0.17;0.086;-0.011;-0.1;-0.18;-0.25;-0.3;-0.33;-0.31;-0.26;-0.19;-0.12;-0.051;3.1e-005;0.024;0.016;-0.013;-0.039;-0.044;-0.023;0.019;0.078;0.15;0.22;0.28;0.34;0.37;0.37;0.37;0.34;0.3;0.22;0.12;0.0078;-0.094;-0.19;-0.27;-0.33;-0.34;-0.32;-0.27;-0.22;-0.17;-0.13;-0.12;-0.12;-0.15;-0.17;-0.18;-0.16;-0.12;-0.07;-0.017;0.039;0.11;0.19;0.26;0.31;0.35;0.37;0.38;0.34;0.26;0.16;0.067;-0.031;-0.13;-0.2;-0.24;-0.23;-0.21;-0.17;-0.15;-0.13;-0.14;-0.16;-0.18;-0.2;-0.22;-0.22;-0.2;-0.18;-0.15;-0.1;-0.039;0.039;0.12;0.2;0.28;0.34;0.38;0.38;0.34;0.27;0.18;0.086;-0.0066;-0.086;-0.14;-0.16;-0.15;-0.13;-0.12;-0.13;-0.15;-0.18;-0.2;-0.23;-0.25;-0.27;-0.28;-0.27;-0.27;-0.26;-0.22;-0.15;-0.055;0.039;0.13;0.21;0.28;0.32;0.31;0.27;0.2;0.13;0.056;-3.1e-005;-0.035;-0.047;-0.042;-0.031;-0.025;-0.031;-0.051;-0.078;-0.11;-0.14;-0.17;-0.21;-0.25;-0.28;-0.31;-0.33;-0.32;-0.27;-0.18;-0.078;0.026;0.13;0.22;0.29;0.33;0.33;0.3;0.26;0.22;0.19;0.16;0.14;0.13;0.13;0.12;0.1;0.077;0.055;0.034;0.0078;-0.033;-0.094;-0.17;-0.25;-0.32;-0.38;-0.41;-0.41;-0.36;-0.28;-0.18;-0.078;0.019;0.1;0.15;0.16;0.15;0.13;0.11;0.094;0.08;0.07;0.068;0.07;0.071;0.07;0.072;0.078;0.083;0.078;0.053;-3.1e-005;-0.079;-0.17;-0.27;-0.35;-0.42;-0.45;-0.43;-0.38;-0.31;-0.23;-0.14;-0.055;0.0092;0.047;0.065;0.078;0.093;0.11;0.12;0.12;0.12;0.13;0.13;0.15;0.17;0.2;0.22;0.24;0.23;0.19;0.11;0.0078;-0.094;-0.2;-0.29;-0.36;-0.39;-0.38;-0.35;-0.31;-0.27;-0.21;-0.16;-0.12;-0.089;-0.063;-0.032;3.1e-005;0.023;0.031;0.032;0.039;0.061;0.1;0.15;0.21;0.27;0.31;0.34;0.32;0.26;0.18;0.084;-0.016;-0.12;-0.2;-0.26;-0.28;-0.28;-0.27;-0.25;-0.23;-0.2;-0.16;-0.14;-0.11;-0.084;-0.063;-0.052;-0.055;-0.066;-0.07;-0.053;-0.0078;0.057;0.13;0.21;0.29;0.35;0.37;0.35;0.3;0.23;0.15;0.063;-0.023;-0.1;-0.16;-0.19;-0.21;-0.23;-0.23;-0.23;-0.21;-0.18;-0.16;-0.14;-0.13;-0.12;-0.13;-0.16;-0.18;-0.17;-0.13;-0.049;0.039;0.13;0.22;0.3;0.36;0.38;0.37;0.33;0.29;0.23;0.16;0.075;0.0078;-0.042;-0.086;-0.13;-0.17;-0.19;-0.18;-0.16;-0.14;-0.13;-0.14;-0.17;-0.21;-0.26;-0.3;-0.31;-0.3;-0.24;-0.16;-0.075;0.016;0.11;0.19;0.25;0.28;0.29;0.28;0.26;0.23;0.19;0.14;0.089;0.039;-0.0075;-0.047;-0.07;-0.07;-0.054;-0.039;-0.043;-0.07;-0.12;-0.17;-0.23;-0.29;-0.33;-0.33;-0.29;-0.23;-0.16;-0.086;0.0015;0.094;0.18;0.23;0.27;0.3;0.31;0.31;0.29;0.24;0.19;0.14;0.09;0.047;0.024;0.023;0.035;0.039;0.024;-0.016;-0.079;-0.16;-0.24;-0.31;-0.38;-0.42;-0.44;-0.42;-0.39;-0.34;-0.27;-0.19;-0.093;-0.0078;0.062;0.13;0.18;0.23;0.24;0.21;0.17;0.13;0.09;0.07;0.069;0.086;0.11;0.13;0.14;0.11;0.056;-0.016;-0.093;-0.17;-0.25;-0.32;-0.37;-0.39;-0.4;-0.39;-0.36;-0.3;-0.23;-0.14;-0.058;0.023;0.099;0.16;0.18;0.18;0.16;0.13;0.11;0.11;0.12;0.15;0.18;0.21;0.23;0.21;0.17;0.11;0.05;-0.016;-0.097;-0.19;-0.27;-0.33;-0.37;-0.41;-0.42;-0.4;-0.35;-0.27;-0.19;-0.11;-0.024;0.047;0.09;0.1;0.095;0.086;0.089;0.11;0.14;0.19;0.23;0.28;0.32;0.34;0.33;0.3;0.27;0.23;0.16;0.078;-0.018;-0.11;-0.19;-0.26;-0.31;-0.34;-0.34;-0.3;-0.25;-0.19;-0.13;-0.078;-0.044;-0.031;-0.035;-0.039;-0.028;0;0.04;0.086;0.14;0.19;0.24;0.27;0.3;0.3;0.3;0.28;0.24;0.17;0.081;-0.016;-0.1;-0.19;-0.27;-0.33;-0.35;-0.34;-0.3;-0.26;-0.22;-0.19;-0.17;-0.16;-0.17;-0.18;-0.17;-0.14;-0.098;-0.047;0.0076;0.063;0.12;0.19;0.25;0.3;0.33;0.34;0.34;0.3;0.24;0.15;0.056;-0.039;-0.13;-0.21;-0.26;-0.27;-0.26;-0.24;-0.23;-0.22;-0.22;-0.23;-0.23;-0.24;-0.24;-0.23;-0.2;-0.16;-0.14;-0.1;-0.041;0.039;0.12;0.2;0.28;0.34;0.39;0.4;0.37;0.32;0.25;0.16;0.083;0.0078;-0.052;-0.086;-0.097;-0.1;-0.12;-0.14;-0.16;-0.18;-0.2;-0.22;-0.24;-0.24;-0.24;-0.24;-0.24;-0.22;-0.18;-0.12;-0.028;0.07;0.16;0.24;0.31;0.35;0.36;0.33;0.28;0.22;0.16;0.094;0.041;0.0078;-0.0089;-0.023;-0.046;-0.078;-0.11;-0.14;-0.16;-0.19;-0.22;-0.26;-0.29;-0.31;-0.33;-0.35;-0.34;-0.29;-0.2;-0.11;-0.014;0.086;0.19;0.27;0.31;0.32;0.31;0.29;0.26;0.23;0.21;0.18;0.16;0.14;0.11;0.078;0.038;0.0078;-0.013;-0.039;-0.085;-0.15;-0.22;-0.28;-0.34;-0.39;-0.42;-0.41;-0.36;-0.29;-0.21;-0.12;-0.021;0.07;0.14;0.17;0.18;0.19;0.19;0.2;0.19;0.18;0.17;0.16;0.14;0.13;0.11;0.1;0.1;0.094;0.061;-3.1e-005;-0.08;-0.16;-0.25;-0.33;-0.39;-0.42;-0.41;-0.37;-0.31;-0.23;-0.15;-0.07;0.0057;0.063;0.1;0.13;0.17;0.2;0.21;0.21;0.21;0.2;0.2;0.2;0.21;0.22;0.24;0.24;0.22;0.17;0.093;-3.1e-005;-0.094;-0.19;-0.28;-0.35;-0.39;-0.4;-0.38;-0.35;-0.32;-0.27;-0.2;-0.15;-0.1;-0.062;-0.016;0.031;0.068;0.086;0.093;0.1;0.12;0.15;0.18;0.22;0.26;0.3;0.31;0.29;0.23;0.16;0.08;-3.1e-005;-0.09;-0.18;-0.25;-0.29;-0.31;-0.31;-0.31;-0.3;-0.27;-0.23;-0.18;-0.14;-0.096;-0.055;-0.024;-0.0078;-0.0036;3.1e-005;0.017;0.055;0.11;0.17;0.23;0.28;0.32;0.33;0.31;0.26;0.2;0.13;0.055;-0.031;-0.11;-0.17;-0.21;-0.25;-0.28;-0.3;-0.3;-0.28;-0.26;-0.23;-0.2;-0.17;-0.15;-0.14;-0.14;-0.14;-0.12;-0.07;0.0015;0.078;0.15;0.23;0.3;0.34;0.36;0.35;0.32;0.28;0.23;0.16;0.077;-6.1e-005;-0.067;-0.12;-0.18;-0.23;-0.26;-0.26;-0.24;-0.22;-0.21;-0.2;-0.21;-0.23;-0.25;-0.26;-0.25;-0.22;-0.16;-0.094;-0.016;0.062;0.14;0.21;0.27;0.3;0.3;0.3;0.28;0.24;0.19;0.13;0.063;-6.1e-005;-0.066;-0.12;-0.16;-0.17;-0.17;-0.16;-0.17;-0.18;-0.2;-0.23;-0.27;-0.3;-0.31;-0.3;-0.26;-0.2;-0.15;-0.086;-0.0094;0.078;0.16;0.22;0.26;0.3;0.32;0.32;0.29;0.25;0.2;0.14;0.081;0.023;-0.019;-0.039;-0.043;-0.047;-0.065;-0.1;-0.15;-0.2;-0.26;-0.3;-0.34;-0.36;-0.36;-0.34;-0.31;-0.27;-0.21;-0.12;-0.035;0.047;0.12;0.18;0.24;0.28;0.3;0.28;0.25;0.22;0.19;0.16;0.13;0.12;0.13;0.13;0.11;0.07;0.017;-0.039;-0.093;-0.15;-0.21;-0.26;-0.29;-0.31;-0.32;-0.31;-0.29;-0.23;-0.16;-0.086;-0.012;0.062;0.14;0.2;0.23;0.23;0.21;0.2;0.18;0.16;0.16;0.16;0.18;0.19;0.18;0.15;0.1;0.055;0.0031;-0.055;-0.12;-0.2;-0.26;-0.31;-0.35;-0.38;-0.39;-0.37;-0.33;-0.27;-0.2;-0.12;-0.048;0.023;0.076;0.1;0.11;0.11;0.12;0.14;0.17;0.19;0.21;0.23;0.25;0.25;0.23;0.2;0.18;0.14;0.083;0.0078;-0.073;-0.15;-0.22;-0.28;-0.33;-0.36;-0.36;-0.33;-0.28;-0.23;-0.17;-0.12;-0.07;-0.039;-0.026;-0.016;0.0086;0.047;0.086;0.12;0.14;0.17;0.2;0.23;0.24;0.24;0.24;0.23;0.2;0.14;0.061;-0.023;-0.1;-0.17;-0.24;-0.3;-0.33;-0.32;-0.29;-0.26;-0.22;-0.19;-0.16;-0.13;-0.12;-0.1;-0.076;-0.039;0.0039;0.047;0.087;0.13;0.17;0.21;0.25;0.29;0.31;0.32;0.31;0.28;0.22;0.14;0.058;-0.023;-0.11;-0.19;-0.25;-0.27;-0.28;-0.27;-0.27;-0.27;-0.27;-0.26;-0.25;-0.24;-0.22;-0.2;-0.16;-0.12;-0.094;-0.063;-0.018;0.047;0.12;0.19;0.24;0.29;0.33;0.34;0.31;0.26;0.2;0.13;0.06;-0.016;-0.078;-0.12;-0.14;-0.16;-0.18;-0.2;-0.22;-0.23;-0.24;-0.24;-0.25;-0.24;-0.23;-0.21;-0.2;-0.18;-0.14;-0.078;0.00058;0.078;0.15;0.22;0.28;0.32;0.33;0.31;0.28;0.23;0.18;0.12;0.069;0.023;-0.013;-0.047;-0.085;-0.12;-0.16;-0.18;-0.19;-0.2;-0.22;-0.23;-0.25;-0.27;-0.28;-0.28;-0.26;-0.22;-0.15;-0.07;0.0064;0.086;0.17;0.24;0.29;0.3;0.31;0.3;0.28;0.25;0.22;0.19;0.16;0.13;0.084;0.039;-0.0043;-0.039;-0.064;-0.086;-0.12;-0.16;-0.21;-0.26;-0.29;-0.32;-0.34;-0.33;-0.29;-0.23;-0.17;-0.1;-0.029;0.047;0.11;0.16;0.18;0.2;0.21;0.22;0.22;0.2;0.19;0.17;0.15;0.12;0.089;0.07;0.057;0.039;0.0051;-0.047;-0.11;-0.17;-0.23;-0.27;-0.31;-0.34;-0.33;-0.3;-0.26;-0.21;-0.15;-0.086;-0.018;0.039;0.082;0.12;0.15;0.19;0.21;0.22;0.21;0.2;0.2;0.19;0.18;0.17;0.17;0.16;0.13;0.078;0.0079;-0.063;-0.13;-0.2;-0.27;-0.33;-0.36;-0.37;-0.36;-0.34;-0.3;-0.26;-0.2;-0.15;-0.096;-0.047;0.0036;0.055;0.096;0.12;0.12;0.12;0.14;0.16;0.17;0.19;0.2;0.22;0.22;0.19;0.14;0.078;0.022;-0.039;-0.11;-0.18;-0.24;-0.28;-0.31;-0.33;-0.33;-0.32;-0.29;-0.26;-0.21;-0.16;-0.11;-0.062;-0.018;0.016;0.035;0.047;0.067;0.1;0.14;0.18;0.21;0.24;0.26;0.26;0.23;0.2;0.16;0.11;0.049;-0.023;-0.095;-0.16;-0.21;-0.25;-0.28;-0.3;-0.31;-0.3;-0.27;-0.23;-0.2;-0.16;-0.13;-0.1;-0.081;-0.063;-0.033;0.016;0.076;0.13;0.18;0.23;0.27;0.3;0.31;0.3;0.29;0.26;0.21;0.15;0.081;0.016;-0.044;-0.1;-0.16;-0.2;-0.24;-0.25;-0.25;-0.24;-0.23;-0.23;-0.22;-0.21;-0.21;-0.2;-0.18;-0.14;-0.083;-0.023;0.032;0.086;0.14;0.2;0.25;0.27;0.28;0.28;0.27;0.24;0.19;0.13;0.076;0.023;-0.034;-0.094;-0.14;-0.17;-0.18;-0.19;-0.2;-0.21;-0.23;-0.24;-0.25;-0.26;-0.25;-0.23;-0.19;-0.14;-0.095;-0.047;0.013;0.086;0.16;0.21;0.25;0.28;0.31;0.31;0.29;0.26;0.21;0.16;0.11;0.047;-0.0086;-0.047;-0.068;-0.086;-0.11;-0.16;-0.2;-0.23;-0.26;-0.28;-0.3;-0.3;-0.29;-0.27;-0.25;-0.22;-0.17;-0.1;-0.028;0.039;0.099;0.16;0.21;0.25;0.27;0.27;0.25;0.23;0.2;0.16;0.13;0.1;0.078;0.055;0.022;-0.023;-0.074;-0.12;-0.15;-0.19;-0.23;-0.26;-0.28;-0.28;-0.28;-0.28;-0.26;-0.21;-0.15;-0.086;-0.028;0.031;0.096;0.16;0.2;0.22;0.22;0.23;0.23;0.22;0.2;0.19;0.18;0.16;0.14;0.094;0.044;-6.1e-005;-0.038;-0.078;-0.13;-0.18;-0.23;-0.27;-0.29;-0.31;-0.32;-0.3;-0.27;-0.22;-0.17;-0.11;-0.048;0.016;0.07;0.11;0.14;0.16;0.18;0.2;0.21;0.22;0.22;0.22;0.21;0.19;0.16;0.13;0.096;0.062;0.012;-0.055;-0.12;-0.18;-0.23;-0.28;-0.32;-0.34;-0.34;-0.32;-0.29;-0.25;-0.2;-0.15;-0.095;-0.047;-0.0088;0.023;0.059;0.1;0.14;0.17;0.19;0.2;0.22;0.23;0.22;0.21;0.2;0.18;0.15;0.094;0.027;-0.039;-0.099;-0.16;-0.21;-0.27;-0.3;-0.3;-0.3;-0.29;-0.27;-0.24;-0.2;-0.16;-0.13;-0.1;-0.056;6.1e-005;0.051;0.086;0.11;0.13;0.16;0.2;0.22;0.24;0.25;0.26;0.25;0.22;0.17;0.12;0.061;3.1e-005;-0.067;-0.13;-0.19;-0.23;-0.25;-0.27;-0.29;-0.29;-0.28;-0.27;-0.24;-0.22;-0.18;-0.14;-0.094;-0.055;-0.024;0.0078;0.05;0.1;0.15;0.2;0.23;0.26;0.27;0.27;0.26;0.23;0.19;0.15;0.093;0.031;-0.028;-0.078;-0.12;-0.16;-0.19;-0.22;-0.24;-0.25;-0.25;-0.25;-0.24;-0.22;-0.19;-0.16;-0.14;-0.12;-0.078;-0.023;0.038;0.094;0.14;0.19;0.23;0.26;0.27;0.27;0.25;0.23;0.19;0.15;0.092;0.039;-0.0016;-0.039;-0.087;-0.14;-0.18;-0.2;-0.21;-0.23;-0.24;-0.24;-0.23;-0.23;-0.22;-0.21;-0.18;-0.13;-0.078;-0.023;0.031;0.086;0.14;0.2;0.24;0.27;0.28;0.28;0.28;0.26;0.23;0.19;0.15;0.11;0.058;-3.1e-005;-0.05;-0.086;-0.11;-0.14;-0.17;-0.2;-0.23;-0.25;-0.26;-0.27;-0.27;-0.26;-0.22;-0.18;-0.14;-0.1;-0.046;0.023;0.088;0.13;0.16;0.2;0.22;0.24;0.24;0.23;0.2;0.17;0.14;0.094;0.049;0.0078;-0.025;-0.055;-0.092;-0.14;-0.19;-0.23;-0.25;-0.27;-0.3;-0.3;-0.29;-0.27;-0.25;-0.23;-0.18;-0.13;-0.059;6.1e-005;0.049;0.094;0.14;0.18;0.21;0.23;0.23;0.22;0.21;0.19;0.16;0.13;0.11;0.078;0.038;-0.016;-0.071;-0.12;-0.16;-0.2;-0.24;-0.27;-0.3;-0.3;-0.31;-0.3;-0.29;-0.25;-0.2;-0.15;-0.099;-0.047;0.012;0.07;0.12;0.15;0.17;0.19;0.2;0.21;0.21;0.21;0.2;0.19;0.16;0.12;0.077;0.031;-0.0075;-0.047;-0.098;-0.16;-0.21;-0.24;-0.27;-0.29;-0.3;-0.3;-0.27;-0.24;-0.21;-0.16;-0.11;-0.055;-0.003;0.039;0.072;0.1;0.13;0.16;0.19;0.21;0.22;0.22;0.22;0.2;0.18;0.15;0.12;0.086;0.038;-0.023;-0.083;-0.13;-0.18;-0.22;-0.26;-0.28;-0.29;-0.28;-0.27;-0.25;-0.22;-0.18;-0.14;-0.094;-0.058;-0.023;0.016;0.063;0.11;0.14;0.17;0.19;0.21;0.22;0.22;0.21;0.2;0.19;0.16;0.11;0.053;-3.1e-005;-0.047;-0.094;-0.14;-0.2;-0.24;-0.27;-0.28;-0.28;-0.28;-0.27;-0.24;-0.21;-0.18;-0.15;-0.11;-0.055;-0.0027;0.039;0.071;0.1;0.14;0.17;0.2;0.22;0.23;0.23;0.23;0.21;0.17;0.13;0.095;0.055;0.0018;-0.062;-0.12;-0.16;-0.19;-0.22;-0.25;-0.27;-0.27;-0.27;-0.25;-0.23;-0.21;-0.17;-0.13;-0.086;-0.049;-0.016;0.026;0.078;0.13;0.17;0.2;0.22;0.24;0.25;0.24;0.22;0.19;0.16;0.12;0.062;0.0043;-0.047;-0.087;-0.13;-0.17;-0.21;-0.24;-0.26;-0.26;-0.26;-0.25;-0.24;-0.22;-0.2;-0.17;-0.15;-0.11;-0.062;-0.0042;0.047;0.087;0.13;0.17;0.21;0.24;0.24;0.24;0.23;0.21;0.18;0.13;0.086;0.042;6.1e-005;-0.048;-0.1;-0.15;-0.19;-0.21;-0.23;-0.24;-0.26;-0.26;-0.26;-0.25;-0.24;-0.22;-0.18;-0.13;-0.086;-0.049;-0.0079;0.044;0.1;0.15;0.19;0.21;0.23;0.25;0.24;0.22;0.2;0.16;0.12;0.078;0.023;-0.03;-0.07;-0.099;-0.12;-0.16;-0.2;-0.23;-0.25;-0.26;-0.27;-0.28;-0.27;-0.24;-0.21;-0.18;-0.15;-0.1;-0.039;0.026;0.078;0.12;0.16;0.2;0.23;0.24;0.24;0.23;0.21;0.18;0.14;0.099;0.063;0.032;-9.2e-005;-0.042;-0.094;-0.14;-0.18;-0.2;-0.23;-0.25;-0.27;-0.27;-0.27;-0.26;-0.24;-0.21;-0.16;-0.11;-0.055;-0.0035;0.047;0.099;0.15;0.19;0.21;0.22;0.22;0.22;0.21;0.19;0.17;0.15;0.13;0.089;0.039;-0.013;-0.055;-0.087;-0.12;-0.15;-0.2;-0.23;-0.26;-0.27;-0.27;-0.27;-0.25;-0.21;-0.17;-0.13;-0.086;-0.031;0.031;0.086;0.12;0.15;0.18;0.2;0.22;0.22;0.23;0.22;0.21;0.19;0.16;0.12;0.086;0.052;0.016;-0.03;-0.086;-0.14;-0.19;-0.22;-0.25;-0.28;-0.29;-0.28;-0.26;-0.23;-0.2;-0.15;-0.094;-0.042;9.2e-005;0.035;0.07;0.11;0.14;0.17;0.2;0.21;0.21;0.21;0.2;0.19;0.17;0.15;0.13;0.1;0.047;-0.018;-0.078;-0.13;-0.18;-0.23;-0.27;-0.29;-0.3;-0.29;-0.28;-0.26;-0.22;-0.17;-0.13;-0.099;-0.062;-0.018;0.031;0.076;0.11;0.13;0.15;0.17;0.19;0.2;0.21;0.21;0.21;0.19;0.16;0.11;0.055;0.0089;-0.039;-0.096;-0.16;-0.2;-0.23;-0.25;-0.27;-0.28;-0.27;-0.26;-0.23;-0.2;-0.16;-0.12;-0.078;-0.033;-0.00012;0.023;0.047;0.079;0.12;0.16;0.19;0.21;0.23;0.24;0.23;0.21;0.17;0.13;0.094;0.042;-0.024;-0.089;-0.14;-0.18;-0.2;-0.23;-0.26;-0.27;-0.27;-0.25;-0.23;-0.21;-0.18;-0.15;-0.12;-0.095;-0.07;-0.034;0.016;0.07;0.12;0.16;0.19;0.22;0.24;0.25;0.24;0.22;0.2;0.16;0.11;0.052;-0.00018;-0.043;-0.086;-0.13;-0.18;-0.21;-0.23;-0.23;-0.23;-0.23;-0.23;-0.22;-0.21;-0.21;-0.2;-0.17;-0.13;-0.07;-0.015;0.031;0.078;0.13;0.19;0.23;0.25;0.26;0.26;0.25;0.23;0.19;0.14;0.095;0.047;-0.0072;-0.062;-0.11;-0.14;-0.16;-0.17;-0.19;-0.2;-0.22;-0.23;-0.25;-0.25;-0.24;-0.22;-0.18;-0.14;-0.1;-0.054;0.00012;0.062;0.12;0.17;0.21;0.23;0.26;0.27;0.26;0.23;0.19;0.15;0.11;0.06;0.018;0];

if wObj.fs~=44100
	tick=waveResample(tick, 44100, wObj.fs);
end
tickLen=length(tick);

[sampleNum, channelNum]=size(wObj.signal);
output=zeros(sampleNum, 2);
if channelNum==2
	output(:,1)=sum(wObj.signal, 2);
else
	output(:,1)=wObj.signal;
end

% ====== Put the tick sound to the second channel
for i=1:length(tickPosition)
	beginIndex=round(tickPosition(i)*wObj.fs);
	endIndex=beginIndex+tickLen-1;
	if beginIndex<1; beginIndex=1; end
	if endIndex>sampleNum; endIndex=sampleNum; end
	output(beginIndex:endIndex, 2)=tick(1:endIndex-beginIndex+1);
end

if ~isempty(outputFile)
	fprintf('Saving %s...\n', outputFile);
%	wavwrite(output, wObj.fs, outputFile);
	audiowrite(outputFile, output, wObj.fs, 'BitsPerSample', 16);
end

if plotOpt
	time=(1:sampleNum)/wObj.fs;
	subplot(2,1,1); plot(time, output(:,1));
	subplot(2,1,2); plot(time, output(:,2));
end

% ====== Self demo
function selfdemo
mObj=mFileParse(which(mfilename));
strEval(mObj.example);
