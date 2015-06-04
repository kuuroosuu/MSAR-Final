function rrPlot(student)
%rrPlot: Plot of recognition rates

if nargin<1; selfdemo; return; end

% 畫出辨識率排行榜
rr=[student.rr];
[junk, index]=sort(rr);
student=student(index);		% 依辨識率排序
rr=100*[student.rr];
subplot(2,1,1);
stem(1:length(rr), rr);
line(1:length(rr), rr, 'color', 'k');
ylabel('Recog. rate (%)'); title('Ranking of recog. rates'); grid on
set(gca, 'xticklabel', {});
for i=1:length(rr)
	h=text(i, min(rr)-10, student(i).name, 'horizon', 'right', 'rotation', 90);
end
axis([1 length(student) min(rr)-10 100]);

index=find(strcmp({student.name}, 'exampleProgram'));
if ~isempty(index)
	axisLimit=axis;
	line(axisLimit(1:2), student(index).rr*[1 1]*100, 'color', 'r');
end

% ====== Self demo
function selfdemo
student(1).name='Roger'; student(1).rr=0.9; student(1).time=10;
student(2).name='exampleProgram'; student(2).rr=0.75; student(2).time=5;
student(3).name='Tom'; student(3).rr=0.72; student(3).time=3;
student(4).name='John'; student(4).rr=0.85; student(4).time=6;
rrPlot(student);