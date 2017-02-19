function []= plotANN( SubjectName )
load(['.\' SubjectName '\' SubjectName '.mat'])
eval(['target_ei=' SubjectName '_ei.target' ]);
eval(['output_ei=' SubjectName '_ei.output']);
% Plot for EI direction
figure, hold
for i=1:14
plot(output_ei(1,[1:38]+i*38)','--'),
end
title('Output for EI')
figure, hold
for i=1:14
plot(target_ei(1,[1:38]+i*38)'),
end
title('Target for EI')
end