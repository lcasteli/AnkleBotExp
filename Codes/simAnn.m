%% Simulate a neural network.
% 
% @author Houman Dallali
%         Department of MEEM, Michigan Technological University

% Also see Deploy Neural Network Functions (Standalone Deployment)
% 1. load the network that you trained with nftool (neural fitting)
% 2. give the inputs X and run the sim to generate the outputs.
% Y= sim(NET,X)

% if the network is very large, and slow to simulate, you can run it 
% with Parallel Computing

% Note 
%
% These two expressions return the same result
% y = sim(net,x,xi,ai)
% y = net(x,xi,ai)

%% Example:
[X,T] = simplenarx_dataset;
net = narxnet(1:2,1:2,10);
view(net)

% preparets Prepare time series data for network simulation or training.
[Xs,Xi,Ai,Ts] = preparets(net,X,{},T);
% train the NN
net = train(net,Xs,Ts,Xi,Ai);


% simulate the results
Y1 = sim(net,Xs,Xi,Ai);
%
Y2 = net(Xs,Xi,Ai);

y1=cell2mat(Y1);

y2=cell2mat(Y2);

figure, 
plot(y1); hold on
plot(y2,'--'); hold off