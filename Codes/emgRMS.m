function [  ] = emgRMS( SubjectName )

%EMGRMS computes a constant value of RMS over the entier time history and stores it in a mat file.
root=['./intermediate data files/' SubjectName];

for testNumber=1:15
    
    emg=load([root '/test' num2str(testNumber) '_EMG.mat']);
    emg =emg.testEMG;
    m=size(emg,1);
    temp=rms(emg);
    
    testEmgRms= [temp(1)*ones(m,1) temp(2)*ones(m,1) temp(3)*ones(m,1) temp(4)*ones(m,1)];
    save([root '\test' num2str(testNumber) '_EMGRMS'],'testEmgRms');
end


end

