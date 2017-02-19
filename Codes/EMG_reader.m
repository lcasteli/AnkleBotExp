%% Read RMS Values of EMG Signals
% @author Mo Rastgaar, Chen Jia, Houman Dallali
%         Department of MEEM, Michigan Technological University

% Subject Name: SubjectName
% Replace "SubjectName" with the subject name of the data you will use

function [ ] = EMG_reader( SubjectName )

% SubjectName='LES', 'HN', etc...

for testNumber=1:15
    

disp(['Reading ' SubjectName ' EMG data for test number ' num2str(testNumber)])

OOpen1=csvread(['../data/' SubjectName '/EMG/emg' num2str(testNumber) '.csv']);

% the raw values of RMS
if strcmp(SubjectName,'LES')
    signal1=OOpen1(:,2); % TA sensor 6
    signal2=OOpen1(:,12); % PL sensor 2
    signal3=OOpen1(:,22); % GA sensor 3
    signal4=OOpen1(:,32); % SOL sensor 4
else
    signal1=OOpen1(:,32); % TA sensor 6
    signal2=OOpen1(:,2);   % PL sensor 2
    signal3=OOpen1(:,12); % GA sensor 3
    signal4=OOpen1(:,22); % SOL sensor 4
end

testEMG=[signal1 signal2 signal3 signal4];

destination = ['intermediate data files\' SubjectName ];

if ~exist(destination)
    mkdir(destination)
end

save([destination '\test' num2str(testNumber) '_EMG'],'testEMG');
disp(['Saved the EMG data for test number ' num2str(testNumber)])

end

disp(['Saved all the ' num2str(testNumber) ' EMG data sets for Subject ' SubjectName ' in ' destination])

end
