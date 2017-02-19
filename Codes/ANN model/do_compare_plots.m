% SubjectName='Evandro';
% SubjectName='Chen';
% SubjectName='BaifanWu';
% SubjectName='Jayant';
% SubjectName='Taran';
% SubjectName='YangLi';
SubjectName='Chen';

[results, net, info, output, error, input, target ] = load_saved_ANN( SubjectName );
close all;
% Standard Plot settings
LW=4;
FN='Helvetica';
FS=24;
figure, 
subplot(211),plot([model_IE_output(1,:)' target(1,:)'],'LineWidth',LW), 
title(SubjectName)
ylabel('Mag')
set(gca,'FontSize', FS);
subplot(212), plot([model_IE_output(2,:)' target(2,:)'],'LineWidth',LW), 
ylabel('Phase')
set(gca,'FontSize', FS);
legend('reproduced','chen')

figure, 
plot(model_input','LineWidth',LW);
set(gca,'FontSize', FS);
title(SubjectName)
hold
plot(input','LineWidth',LW);
set(gca,'FontSize', FS);