function [ results_int, results_ext ] = load_saved_ANN( SubjectName )
% load and simulate the saved ANN models
% eg: SubjectName='Evandro'

load(['./' SubjectName '/' SubjectName '.mat']);

results_int=eval([SubjectName '_Int']);
results_ext=eval([SubjectName '_Ext']);
%
% net=eval(['results.net']);
% info=eval(['results.info']);
% output=eval(['results.output']);
% error=eval(['results.error']);
% input=eval(['results.input']);
% target=eval(['results.target']);

end