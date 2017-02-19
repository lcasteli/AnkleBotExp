net=results1.net1;

% [Xs,Xi,Ai,Ts] = preparets(net,X,{},T);
X=model_input;
% simulate the results
Ychen = sim(net,X);

% y1=cell2mat(Ychen);

figure, 
subplot(211)
plot(Ychen(1,:),'--'); hold on
subplot(211)
plot(model_DP_output(1,:),'-'); hold off
subplot(212)
plot(Ychen(2,:),'--'); hold on
subplot(212)
plot(model_DP_output(2,:),'-'); hold off

yy1=fft(Ychen(1,:))
yy2=fft(model_DP_output(1,:))

n = length(yy2);
power = abs(yy2(1:floor(n/2))).^2;
nyquist = 1/2;
freq =linspace(0,8, 285) ;
plot(freq,power)

figure,
plot(yy1'); hold on; plot(yy2'); hold off
