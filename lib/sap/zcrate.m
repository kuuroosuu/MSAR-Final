function out=zcrate(vector)
% zcRate: Zero-crossing rate of a vector

%	Roger Jang, 20050729

%out=sum(abs(diff(vector>0)));			% ���C�e�����R�����L�s�v����
out=sum(vector(1:end-1).*vector(2:end)<0);	% ���s�I�W������I�A����L�s�I
