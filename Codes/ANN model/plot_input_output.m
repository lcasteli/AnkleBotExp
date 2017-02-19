function [] = plot_input_output(SubjectName)

load(['.\' SubjectName '\' SubjectName '.mat'])
results_ei=eval([SubjectName '_ei']);

% Standard Plot settings
LW=4;
FN='Helvetica';
FS=24;

% Plot input matrix
plot(results_ei.input','LineWidth',LW)
set(gca,'FontSize', FS);
title(['Input for ' SubjectName])
legend('TA','PL','GA','SOL','Freq')

% Plot output matrix
% EI direction
figure, 
subplot(211),plot([results_ei.output(1,:)' results_ei.target(1,:)'],'LineWidth',LW), 
title(['Output for ' SubjectName ' for EI'])
ylabel('Mag')
set(gca,'FontSize', FS);
subplot(212), plot([results_ei.output(2,:)' results_ei.target(2,:)'],'LineWidth',LW),
title(['Output for ' SubjectName ' for EI'])
ylabel('Phase')
set(gca,'FontSize', FS);
end