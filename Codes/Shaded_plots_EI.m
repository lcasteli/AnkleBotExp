% Making plots of ANN Model (EI direction)

% @author Chen Jia, 
%         Department of MEEM, Michigan Technological University

% Subject Name: SubjectName
% Replace "SubjectName" with the subject name of the data you will use

% Data Range: 0.7-8 Hz 
% EI direction
% Standard Settings for the plots
% SubjectName='LES', 'HN', ... ;

function [ ] = Shaded_plots_EI( SubjectName )

LW=4;
FN='Helvetica';
FS=24;

% test 1 passive
clearvars -except SubjectName LW FN FS

load(['ANN models\' SubjectName '\' SubjectName '.mat']); % load ANN model
eval(['net_ei=' SubjectName '_ei.net;']);

eval(['input_ei=' SubjectName '_ei.input(:,1:38);']); % load input data
imp_abs_ei_model=net_ei(input_ei); % compute absolute value of impedance from ANN model
eval(['imp_abs_ei_test=' SubjectName '_ei.target(:,1:38);']); % load absolute value of impedance of original test data

eval(['freq_ei=' SubjectName '_ei.input(5,1:38);']); % load frequency

figure(1);
subplot(2,1,1);
semilogx(freq_ei,imp_abs_ei_model(1,1:38),'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test(1,1:38),'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Magnitude of Impedance','Fontsize',FS);
title('Results of ANN model (Magnitude, Test 1, Passive, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('ANN Model','Test');

subplot(2,1,2);
semilogx(freq_ei,imp_abs_ei_model(2,1:38),'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test(2,1:38),'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Phase of Impedance','Fontsize',FS);
title('Results of ANN model (Phase, Test 1, Passive, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('ANN Model','Test');

% test 1 10% MVC
clearvars -except SubjectName LW FN FS

load(['ANN models\' SubjectName '\' SubjectName '.mat']); % load ANN model
eval(['net_ei=' SubjectName '_ei.net;']);

eval(['input_ei=' SubjectName '_ei.input(:,39:76);']); % load input data
imp_abs_ei_model=net_ei(input_ei); % compute absolute value of impedance from ANN model
eval(['imp_abs_ei_test=' SubjectName '_ei.target(:,39:76);']); % load absolute value of impedance of original test data

eval(['freq_ei=' SubjectName '_ei.input(5,39:76);']); % load frequency

figure(2);
subplot(2,1,1);
semilogx(freq_ei,imp_abs_ei_model(1,1:38),'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test(1,1:38),'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Magnitude of Impedance','Fontsize',FS);
title('Results of ANN model (Magnitude, Test 1, 10% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('ANN Model','Test');

subplot(2,1,2);
semilogx(freq_ei,imp_abs_ei_model(2,1:38),'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test(2,1:38),'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Phase of Impedance','Fontsize',FS);
title('Results of ANN model (Phase, Test 1, 10% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('ANN Model','Test');

% test 1 20% MVC
clearvars -except SubjectName LW FN FS

load(['ANN models\' SubjectName '\' SubjectName '.mat']); % load ANN model
eval(['net_ei=' SubjectName '_ei.net;']);

eval(['input_ei=' SubjectName '_ei.input(:,77:114);']); % load input data
imp_abs_ei_model=net_ei(input_ei); % compute absolute value of impedance from ANN model
eval(['imp_abs_ei_test=' SubjectName '_ei.target(:,77:114);']); % load absolute value of impedance of original test data

eval(['freq_ei=' SubjectName '_ei.input(5,77:114);']); % load frequency

figure(3);
subplot(2,1,1);
semilogx(freq_ei,imp_abs_ei_model(1,1:38),'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test(1,1:38),'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Magnitude of Impedance','Fontsize',FS);
title('Results of ANN model (Magnitude, Test 1, 20% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('ANN Model','Test');

subplot(2,1,2);
semilogx(freq_ei,imp_abs_ei_model(2,1:38),'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test(2,1:38),'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Phase of Impedance','Fontsize',FS);
title('Results of ANN model (Phase, Test 1, 20% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('ANN Model','Test');

% using mean values of all tests
% passive
clearvars -except SubjectName LW FN FS

load(['ANN models\' SubjectName '\' SubjectName '.mat']); % load ANN model
eval(['net_ei=' SubjectName '_ei.net;']);
input_ei=zeros(5,190);
imp_abs_ei_model=zeros(2,190);
imp_abs_ei_test=zeros(2,190);

for kk=1:5
    eval(['input_ei(:,1+38*(kk-1):38*kk)=' SubjectName '_ei.input(:,1+114*(kk-1):38+114*(kk-1));']); % load input data
    imp_abs_ei_model(:,1+38*(kk-1):38*kk)=net_ei(input_ei(:,1+38*(kk-1):38*kk)); % compute absolute value of impedance from ANN model
    eval(['imp_abs_ei_test(:,1+38*(kk-1):38*kk)=' SubjectName '_ei.target(:,1+114*(kk-1):38+114*(kk-1));']); % load absolute value of impedance of original test data
end

imp_abs_ei_model_mean_abs=zeros(1,38);
imp_abs_ei_test_mean_abs=zeros(1,38);
imp_abs_ei_model_mean_phase=zeros(1,38);
imp_abs_ei_test_mean_phase=zeros(1,38);
imp_abs_ei_test_SE_abs=zeros(1,38);
imp_abs_ei_test_SE_phase=zeros(1,38);
imp_abs_ei_test_upperlimit_abs=zeros(1,38);
imp_abs_ei_test_lowerlimit_abs=zeros(1,38);
imp_abs_ei_test_upperlimit_phase=zeros(1,38);
imp_abs_ei_test_lowerlimit_phase=zeros(1,38);

for kk=1:38
    imp_abs_ei_model_mean_abs(kk)=mean(imp_abs_ei_model(1,kk:38:kk+38*4));
    imp_abs_ei_test_mean_abs(kk)=mean(imp_abs_ei_test(1,kk:38:kk+38*4));
    imp_abs_ei_model_mean_phase(kk)=mean(imp_abs_ei_model(2,kk:38:kk+38*4));
    imp_abs_ei_test_mean_phase(kk)=mean(imp_abs_ei_test(2,kk:38:kk+38*4));

    imp_abs_ei_test_SE_abs(kk)=std(imp_abs_ei_test(1,kk:38:kk+38*4),1)/sqrt(5);
    imp_abs_ei_test_SE_phase(kk)=std(imp_abs_ei_test(2,kk:38:kk+38*4),1)/sqrt(5);
    imp_abs_ei_test_upperlimit_abs(kk)=imp_abs_ei_test_mean_abs(kk)+imp_abs_ei_test_SE_abs(kk);
    imp_abs_ei_test_lowerlimit_abs(kk)=imp_abs_ei_test_mean_abs(kk)-imp_abs_ei_test_SE_abs(kk);
    imp_abs_ei_test_upperlimit_phase(kk)=imp_abs_ei_test_mean_phase(kk)+imp_abs_ei_test_SE_phase(kk);
    imp_abs_ei_test_lowerlimit_phase(kk)=imp_abs_ei_test_mean_phase(kk)-imp_abs_ei_test_SE_phase(kk);
end

imp_abs_ei_test_lowerlimit_rev_abs=imp_abs_ei_test_lowerlimit_abs(38:-1:1);
imp_abs_ei_test_lowerlimit_rev_phase=imp_abs_ei_test_lowerlimit_phase(38:-1:1);

eval(['freq_ei=' SubjectName '_ei.input(5,1:38);']); % load frequency
freq_ei_rev=freq_ei(38:-1:1);

figure(4);
subplot(2,1,1);
fill([freq_ei freq_ei_rev],[imp_abs_ei_test_upperlimit_abs imp_abs_ei_test_lowerlimit_rev_abs],'g');
hold on;
semilogx(freq_ei,imp_abs_ei_model_mean_abs,'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test_mean_abs,'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Magnitude of Impedance','Fontsize',FS);
title('Results of ANN model (Magnitude, Mean of All Tests, Passive, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('SE Boundary of Test','ANN Model','Test');

subplot(2,1,2);
fill([freq_ei freq_ei_rev],[imp_abs_ei_test_upperlimit_phase imp_abs_ei_test_lowerlimit_rev_phase],'g');
hold on;
semilogx(freq_ei,imp_abs_ei_model_mean_phase,'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test_mean_phase,'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Phase of Impedance','Fontsize',FS);
title('Results of ANN model (Phase, Mean of All Tests, Passive, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('SE Boundary of Test','ANN Model','Test');


% 10% MVC
clearvars -except SubjectName LW FN FS

load(['ANN models\' SubjectName '\' SubjectName '.mat']); % load ANN model
eval(['net_ei=' SubjectName '_ei.net;']);

input_ei=zeros(5,190);
imp_abs_ei_model=zeros(2,190);
imp_abs_ei_test=zeros(2,190);

for kk=1:5
    eval(['input_ei(:,1+38*(kk-1):38*kk)=' SubjectName '_ei.input(:,39+114*(kk-1):76+114*(kk-1));']) % load input data
    imp_abs_ei_model(:,1+38*(kk-1):38*kk)=net_ei(input_ei(:,1+38*(kk-1):38*kk)); % compute absolute value of impedance from ANN model
    eval(['imp_abs_ei_test(:,1+38*(kk-1):38*kk)=' SubjectName '_ei.target(:,39+114*(kk-1):76+114*(kk-1));']) % load absolute value of impedance of original test data
end

imp_abs_ei_model_mean_abs=zeros(1,38);
imp_abs_ei_test_mean_abs=zeros(1,38);
imp_abs_ei_model_mean_phase=zeros(1,38);
imp_abs_ei_test_mean_phase=zeros(1,38);
imp_abs_ei_test_SE_abs=zeros(1,38);
imp_abs_ei_test_SE_phase=zeros(1,38);
imp_abs_ei_test_upperlimit_abs=zeros(1,38);
imp_abs_ei_test_lowerlimit_abs=zeros(1,38);
imp_abs_ei_test_upperlimit_phase=zeros(1,38);
imp_abs_ei_test_lowerlimit_phase=zeros(1,38);

for kk=1:38
    imp_abs_ei_model_mean_abs(kk)=mean(imp_abs_ei_model(1,kk:38:kk+38*4));
    imp_abs_ei_test_mean_abs(kk)=mean(imp_abs_ei_test(1,kk:38:kk+38*4));
    imp_abs_ei_model_mean_phase(kk)=mean(imp_abs_ei_model(2,kk:38:kk+38*4));
    imp_abs_ei_test_mean_phase(kk)=mean(imp_abs_ei_test(2,kk:38:kk+38*4));

    imp_abs_ei_test_SE_abs(kk)=std(imp_abs_ei_test(1,kk:38:kk+38*4),1)/sqrt(5);
    imp_abs_ei_test_SE_phase(kk)=std(imp_abs_ei_test(2,kk:38:kk+38*4),1)/sqrt(5);
    imp_abs_ei_test_upperlimit_abs(kk)=imp_abs_ei_test_mean_abs(kk)+imp_abs_ei_test_SE_abs(kk);
    imp_abs_ei_test_lowerlimit_abs(kk)=imp_abs_ei_test_mean_abs(kk)-imp_abs_ei_test_SE_abs(kk);
    imp_abs_ei_test_upperlimit_phase(kk)=imp_abs_ei_test_mean_phase(kk)+imp_abs_ei_test_SE_phase(kk);
    imp_abs_ei_test_lowerlimit_phase(kk)=imp_abs_ei_test_mean_phase(kk)-imp_abs_ei_test_SE_phase(kk);
end

imp_abs_ei_test_lowerlimit_rev_abs=imp_abs_ei_test_lowerlimit_abs(38:-1:1);
imp_abs_ei_test_lowerlimit_rev_phase=imp_abs_ei_test_lowerlimit_phase(38:-1:1);

eval(['freq_ei=' SubjectName '_ei.input(5,1:38);']); % load frequency
freq_ei_rev=freq_ei(38:-1:1);

figure(5);
subplot(2,1,1);
fill([freq_ei freq_ei_rev],[imp_abs_ei_test_upperlimit_abs imp_abs_ei_test_lowerlimit_rev_abs],'g');
hold on;
semilogx(freq_ei,imp_abs_ei_model_mean_abs,'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test_mean_abs,'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Magnitude of Impedance','Fontsize',FS);
title('Results of ANN model (Magnitude, Mean of All Tests, 10% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('SE Boundary of Test','ANN Model','Test');

subplot(2,1,2);
fill([freq_ei freq_ei_rev],[imp_abs_ei_test_upperlimit_phase imp_abs_ei_test_lowerlimit_rev_phase],'g');
hold on;
semilogx(freq_ei,imp_abs_ei_model_mean_phase,'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test_mean_phase,'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Phase of Impedance','Fontsize',FS);
title('Results of ANN model (Phase, Mean of All Tests, 10% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('SE Boundary of Test','ANN Model','Test');

% 20% MVC
clc
clearvars -except SubjectName LW FN FS

load(['ANN models\' SubjectName '\' SubjectName '.mat']); % load ANN model
eval(['net_ei=' SubjectName '_ei.net;']);

input_ei=zeros(5,190);
imp_abs_ei_model=zeros(2,190);
imp_abs_ei_test=zeros(2,190);

for kk=1:5
    eval(['input_ei(:,1+38*(kk-1):38*kk)=' SubjectName '_ei.input(:,77+114*(kk-1):114+114*(kk-1));']); % load input data
    imp_abs_ei_model(:,1+38*(kk-1):38*kk)=net_ei(input_ei(:,1+38*(kk-1):38*kk)); % compute absolute value of impedance from ANN model
    eval(['imp_abs_ei_test(:,1+38*(kk-1):38*kk)=' SubjectName '_ei.target(:,77+114*(kk-1):114+114*(kk-1));']); % load absolute value of impedance of original test data
end

imp_abs_ei_model_mean_abs=zeros(1,38);
imp_abs_ei_test_mean_abs=zeros(1,38);
imp_abs_ei_model_mean_phase=zeros(1,38);
imp_abs_ei_test_mean_phase=zeros(1,38);
imp_abs_ei_test_SE_abs=zeros(1,38);
imp_abs_ei_test_SE_phase=zeros(1,38);
imp_abs_ei_test_upperlimit_abs=zeros(1,38);
imp_abs_ei_test_lowerlimit_abs=zeros(1,38);
imp_abs_ei_test_upperlimit_phase=zeros(1,38);
imp_abs_ei_test_lowerlimit_phase=zeros(1,38);

for kk=1:38
    imp_abs_ei_model_mean_abs(kk)=mean(imp_abs_ei_model(1,kk:38:kk+38*4));
    imp_abs_ei_test_mean_abs(kk)=mean(imp_abs_ei_test(1,kk:38:kk+38*4));
    imp_abs_ei_model_mean_phase(kk)=mean(imp_abs_ei_model(2,kk:38:kk+38*4));
    imp_abs_ei_test_mean_phase(kk)=mean(imp_abs_ei_test(2,kk:38:kk+38*4));

    imp_abs_ei_test_SE_abs(kk)=std(imp_abs_ei_test(1,kk:38:kk+38*4),1)/sqrt(5);
    imp_abs_ei_test_SE_phase(kk)=std(imp_abs_ei_test(2,kk:38:kk+38*4),1)/sqrt(5);
    imp_abs_ei_test_upperlimit_abs(kk)=imp_abs_ei_test_mean_abs(kk)+imp_abs_ei_test_SE_abs(kk);
    imp_abs_ei_test_lowerlimit_abs(kk)=imp_abs_ei_test_mean_abs(kk)-imp_abs_ei_test_SE_abs(kk);
    imp_abs_ei_test_upperlimit_phase(kk)=imp_abs_ei_test_mean_phase(kk)+imp_abs_ei_test_SE_phase(kk);
    imp_abs_ei_test_lowerlimit_phase(kk)=imp_abs_ei_test_mean_phase(kk)-imp_abs_ei_test_SE_phase(kk);
end

imp_abs_ei_test_lowerlimit_rev_abs=imp_abs_ei_test_lowerlimit_abs(38:-1:1);
imp_abs_ei_test_lowerlimit_rev_phase=imp_abs_ei_test_lowerlimit_phase(38:-1:1);

eval(['freq_ei=' SubjectName '_ei.input(5,1:38);']); % load frequency
freq_ei_rev=freq_ei(38:-1:1);

figure(6);
subplot(2,1,1);
fill([freq_ei freq_ei_rev],[imp_abs_ei_test_upperlimit_abs imp_abs_ei_test_lowerlimit_rev_abs],'g');
hold on;
semilogx(freq_ei,imp_abs_ei_model_mean_abs,'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test_mean_abs,'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Magnitude of Impedance','Fontsize',FS);
title('Results of ANN model (Magnitude, Mean of All Tests, 20% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('SE Boundary of Test','ANN Model','Test');

subplot(2,1,2);
fill([freq_ei freq_ei_rev],[imp_abs_ei_test_upperlimit_phase imp_abs_ei_test_lowerlimit_rev_phase],'g');
hold on;
semilogx(freq_ei,imp_abs_ei_model_mean_phase,'b'); % making plots of ANN model and test data
hold on;
semilogx(freq_ei,imp_abs_ei_test_mean_phase,'r');
xlim([0.7,8]);
xlabel('Frequency (Hz)','Fontsize',FS);
ylabel('Phase of Impedance','Fontsize',FS);
title('Results of ANN model (Phase, Mean of All Tests, 20% MVC, EI Direction, Data Ranged from 0.7 to 8 Hz)','Fontsize',FS);
legend('SE Boundary of Test','ANN Model','Test');

