function [param, rmse]=circleFit(circleData, plotOpt)

if nargin<1, selfdemo; return; end
if nargin<2, plotOpt=0; end

x=circleData(1, :)';
y=circleData(2, :)';
n=length(x);

A=[2*x, 2*y, ones(n,1)];
b=x.^2+y.^2;
theta=A\b;
a=theta(1);
b=theta(2);
r=sqrt(theta(3)+a^2+b^2);
param=[a, b, r]';

temp=sqrt((x-a).^2+(y-b).^2)-r;
rmse=sqrt(sum(temp.^2)/n);

if plotOpt
	t=linspace(0, 2*pi);
	x1=a+r*cos(t);
	y1=b+r*sin(t);
	plot(x, y, '.', x1, y1);
	axis image
	fprintf('rmse=%f\n', rmse);
end

return

% a=mean(x);
% b=mean(y);
% r=mean(sqrt((x-a).^2+(y-b).^2));
% temp=sqrt((x-a).^2+(y-b).^2)-r;
% rmse2=sqrt(sum(temp.^2)/n);
% fprintf('rmse2=%f\n', rmse2);

% ====== Further optimization using fminsearch
theta0 = theta;
tic
theta = fminsearch(@circleFitError, theta0, [], circleData);
fprintf('­pºâ®É¶¡ = %g\n', toc);

a=theta(1);
b=theta(2);
r=theta(3);
x=circleData(:,1);
y=circleData(:,2);
temp=sqrt((x-a).^2+(y-b).^2)-r;
rmse=sqrt(sum(temp.^2)/n);
  
%plot(x, y, 'ro', x, y2, 'b-');  
%legend('Sample data', 'Regression curve');
fprintf('rmse = %f\n', rmse);

x2=a+r*cos(t);
y2=b+r*sin(t);
hold on; plot(x2, y2, 'r-'); hold off

% ====== Selfdemo
function selfdemo
n=100;
t=rand(n,1)*2*pi;
x=3+10*cos(t)+randn(n,1);
y=7+10*sin(t)+randn(n,1);
data=[x, y]';
param=circleFit(data, 1);

function rmse=circleFitError(theta, data)
a=theta(1);
b=theta(2);
r=theta(3);
x=data(:,1);
y=data(:,2);
n=length(x);
temp=sqrt((x-a).^2+(y-b).^2)-r;
rmse=sqrt(sum(temp.^2)/n);
