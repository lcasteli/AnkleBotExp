%% Reading impedance data for further computation
% @author Mo Rastgaar, Chen Jia, Houman Dallali
%         Department of MEEM, Michigan Technological University
function [ ] = Impedance_reader( SubjectName )
% Anklebot and Human

% set Calibration to 1 if the 16th set of data exists in the root folder.
Calibration = 0;

for index=1:15
    root= '..\data\' ;

    [ rawImpedance ] = loadImpedance(SubjectName, index, root, Calibration );
    if ~exist(['opendata\' SubjectName ])
        mkdir(['opendata\' SubjectName ])
    end
    save(['opendata\' SubjectName '\Imp' num2str(index)], 'rawImpedance')
end


disp(['loaded data from : ' root SubjectName '\Impedance\'])

disp(['saved data in '  'opendata\' SubjectName])

end

function [ rawImpedance ] = loadImpedance(SubjectName, index, root, Calibration )

fullRoot=[root SubjectName '\Impedance\'];

if ~exist([fullRoot 'stoch.' num2str(index) '.asc'])
    error([[fullRoot 'stoch.' num2str(index) '.asc'] ' file does not exist']);
end

fidr = fopen([fullRoot 'stoch.' num2str(index) '.asc'], 'r'); 
if fidr==-1
    error('Could not open the file')
end

nstart=1;
fseek(fidr, nstart, 'bof');

counter=0;
while 1
    counter=counter+1;
    tline = fgetl(fidr);
    if tline == -1, break, end
    x = str2num(tline);
    xx= size(x);
    if xx(1,1)~=0
        for j=1:xx(2)
            OOpen(counter,j)=x(1,j);
        end
    else 
        break
    end
end
fclose(fidr);

line_s=1000; % deletes 5 x 200 first samples

m=size(OOpen);
rawImpedance=OOpen(line_s:m(1,1),1:38); 

end
