function [ results_ei ] = load_saved_ANN( SubjectName )
% load and simulate the saved ANN models
% eg: SubjectName='Evandro'

load(['./' SubjectName '/' SubjectName '.mat']);

results_ei=eval([SubjectName '_ei']);
%
% net=eval(['results.net']);
% info=eval(['results.info']);
% output=eval(['results.output']);
% error=eval(['results.error']);
% input=eval(['results.input']);
% target=eval(['results.target']);

end