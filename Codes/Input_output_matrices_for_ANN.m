%% Building Input and Output Matrix

% @author Chen Jia, 
%         Department of MEEM, Michigan Technological University

% Subject Name: SubjectName
% Replace "SubjectName" with the subject name of the data you will use

% Data Range: 0.7-8 Hz  You may modify this according to your project

%% Building Intermediate Impedance Output Matrix (for each single situation)
% DP direction

% test 1 passive

function [ ] = Input_output_matrices_for_ANN( SubjectName )
clc;
emgData_rms_passive=zeros(4,1);
% eg. SubjectName='Chen';
model_ei_output=[];

% definitions: 
% build RMS EMG input submatrix ([passive, 10%MVC, 20%MVC] for each test)  114=  38*3
%                                                           1:38  passive, 39:76 10% MVC, 77:114 20% MVC
Testx_input_submatrix=zeros( 5, 4, 114);  % 5 rounds, 4 muscles and 3 activation levels (passive, 10%, 20%)
RMS_input=[];
Freq_Input=zeros(1,570);

for testNumber=1:15
Imp_ei=load(['ImpFreqdata\' SubjectName '\' num2str(testNumber) '.mat']); % load data
mag_ei=abs(Imp_ei.impedance(5:42)); % use absolute values of impedance

phase_ei=angle(Imp_ei.impedance(5:42)); % compute phases of impedance
phase_ei=unwrap(phase_ei);

% EI direction
for kk=1:38   % Those indices are different if you use different data range
while phase_ei(kk) > pi
    phase_ei(kk) = phase_ei(kk)-2*pi;
end
while phase_ei(kk) < -pi
    phase_ei(kk) = phase_ei(kk)+2*pi;
end
end

phase_ei=180/pi*phase_ei;

destination1 = ['intermediate data files\' SubjectName '\EI'];

if ~exist(destination1)
    mkdir(destination1)
end

save(['intermediate data files\' SubjectName '\EI\' num2str(testNumber)],'mag_ei','phase_ei'); % same the intermediate output matrix


% Building final Impedance Output Matrix (combine all situations together)
model_ei_output=[model_ei_output, [mag_ei; phase_ei]];

% the saving part is moved outside the for loop

%% Building input matrix
% 
% Frequency
load(['ImpFreqdata\' SubjectName '\' num2str(1)]); % only loading the frequency from the 1st dataset since it's the same for all other 14 experiments.

% 38= 42-5+1 --> 0.7-8 Hz.    
Freq=x_axis(5:42)'; % devide frequencies into 30 domains (DP and IE)

Freq_Input(1+38*(testNumber-1):38*testNumber)=Freq;


%% RMS values of EMG signals

emgData=load(['intermediate data files\' SubjectName '\test' num2str(testNumber) '_EMG']); % load data

emgData=emgData.testEMG;

emgData_rms1=norm(detrend(emgData(:,1)))/sqrt(size(emgData,1)); % TA (without normalization)
emgData_rms2=norm(detrend(emgData(:,2)))/sqrt(size(emgData,1)); % PL (without normalization)
emgData_rms3=norm(detrend(emgData(:,3)))/sqrt(size(emgData,1)); % SOL (without normalization)
emgData_rms4=norm(detrend(emgData(:,4)))/sqrt(size(emgData,1)); % GA (without normalization)
    
if (mod(testNumber,3)==1)
    % this is the case when the muscle is relaxed
    emgData_rms_passive=[emgData_rms1;  emgData_rms2; emgData_rms3; emgData_rms4  ];
end

emgData_RMS1=emgData_rms1/emgData_rms_passive(1); % TA (with normalization)
emgData_RMS2=emgData_rms2/emgData_rms_passive(2); % PL (with normalization)
emgData_RMS3=emgData_rms3/emgData_rms_passive(3); % SOL (with normalization)
emgData_RMS4=emgData_rms4/emgData_rms_passive(4); % GA (with normalization)
    
if ~exist(['intermediate data files\' SubjectName '\emgs\EMG Normalized\' num2str(testNumber) ])
        mkdir(['intermediate data files\' SubjectName '\emgs\EMG Normalized\' num2str(testNumber)])
end

i=1;
save(['intermediate data files\' SubjectName '\emgs\EMG Normalized\' num2str(testNumber)  '\emgData_RMS.mat'],  ['emgData_RMS' num2str(i)]);
for i=2:4
        save(['intermediate data files\' SubjectName '\emgs\EMG Normalized\' num2str(testNumber)  '\emgData_RMS.mat'],  ['emgData_RMS' num2str(i)], '-append');
end


%% build RMS EMG input submatrix
% build column of RMS EMG of the current testNumber ([TA PL SOL GA]')
RMS_Col=[emgData_RMS1, emgData_RMS2, emgData_RMS3, emgData_RMS4]';

% based on the naming of the data, the following order is assumed regarding
% test number, passive, 10 percent and 20 percent activation levels,
%
% EMG1: Test01_EMG_passive       '15h47m14emg.txt';
% EMG2: Test01_EMG_10percent  '15h48m44emg.txt';
% EMG3: Test01_EMG_20percent   '15h50m18emg.txt';

%  EMG4: Test02 passive                 '15h52m22emg.txt';
%  EMG5: Test02_EMG_10percent '15h53m52emg.txt';
%  EMG6: Test02_EMG_20percent  '15h55m18emg.txt';

%  EMG7: Test03 passive                 '15h56m48emg.txt';
%  EMG8: Test03_EMG_10percent '15h58m14emg.txt';
%  EMG9: Test03_EMG_20percent  '15h59m46emg.txt';

%  EMG10: Test04 passive                '16h08m17emg.txt';
%  EMG11: Test04_EMG_10percent '16h09m55emg.txt';
%  EMG12: Test04_EMG_20percent  '16h11m19emg.txt';

% EMG13: Test05 passive                 '16h12m45emg.txt';
% EMG14: Test05_EMG_10percent '16h14m16emg.txt';
% EMG15: Test05_EMG_20percent '16h15m43emg.txt'

% For each subject, the collected data of 15 independent tests including 5 rounds with the same procedures (passive test, 10% MVC, and 20%MVC)
switch testNumber
  case {1, 4, 7, 10, 13} % passive round 1-5
    for kk=1:38 % passive
        ii = floor(testNumber/3.1)+1; % ans=[ 1     2     3     4     5]
        Testx_input_submatrix(ii, :, kk)=RMS_Col;
    end    
  case  {2, 5, 8, 11, 14} % 10 percent
     for kk=39:76 % 10 percent
        ii = floor(testNumber/3.1)+1; % ans=[ 1     2     3     4     5]
        Testx_input_submatrix(ii, :, kk)=RMS_Col;
    end             
  case  {3, 6, 9, 12, 15} %20 percent
      for kk=77:114  % 10 percent
        ii = floor(testNumber/3.1)+1; % ans=[ 1     2     3     4     5]
        Testx_input_submatrix(ii, :, kk)=RMS_Col;
    end          
  otherwise
    disp(['testNumber unknown' num2str(testNumber)])
end
        
        
end % end of for loop

destination3 = ['final data files\' SubjectName '\model_ei_output'];

if ~exist(destination3)
    mkdir(destination3)
end

save(['final data files\' SubjectName '\model_ei_output\', 'model_ei_output'],'model_ei_output');


if ~exist( ['intermediate data files\' SubjectName '\Frequency'])
    mkdir( ['intermediate data files\' SubjectName '\Frequency']);
end

 save( ['intermediate data files\' SubjectName '\Frequency\Freq_Input.mat'], 'Freq_Input');
disp(['Freq data saved in intermediate data files\' SubjectName '\Frequency\Freq_Input.mat'])  

       % Creating  final RMS EMG input submatrix
        for jj=1:5    
             RMS_input=[RMS_input squeeze(Testx_input_submatrix(jj, :, :))];
        end
        if ~exist(['intermediate data files\' SubjectName '\emgs\EMG Normalized'])
            mkdir(['intermediate data files\' SubjectName '\emgs\EMG Normalized']);
        end
        save(['intermediate data files\' SubjectName '\emgs\EMG Normalized\RMS_input.mat'],  'RMS_input');

      % Now adding the frequency:
      model_input=[RMS_input;Freq_Input]; % build final input matrix of the model ([RMS1 RMS2 RMS3 RMS4 Freq]')
      
         if ~exist(['final data files\' SubjectName '\model_input'])
             mkdir( ['final data files\' SubjectName '\model_input']);
         end
         
     save( ['final data files\' SubjectName '\model_input\model_input.mat'], 'model_input');
     disp(['Final data saved in \final data files\' SubjectName '\model_input\model_input.mat'])  
         
end
