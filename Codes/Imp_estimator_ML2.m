clear
clc
load impedanceMAT
load ev_damp3
n=1;          % figure number 
font=16;     % all fonts of the plots
wrap=1;     % 1 unwrap, 0 do nothing
lim_x=30;   % limit of x axis for view
%% % 
abot=abot10_5;   K_s=10;
human=evandro;  K_a=10;
str3='-r';
%%
KK1=5;
KK2=10;
KK3=15;
KK4=20;
Kabot_TA=[K_s 0; 0 K_s];
Khuman_TA=[K_a 0;0 K_a];
R1=[3.5714 -5.2632;3.5714 5.2632];
Kabot_FD=R1*Kabot_TA*R1';
Khuman_FD=R1*Khuman_TA*R1';

Fs=200;
nfft=2^10;
n1=1;
n2=2;
n3=1;
n4=4;

n_win=n1/n2*nfft;
n_ovrlp=n3/n4*nfft;

for i=1:size(abot,2)
    abot(:,i)=detrend(abot(:,i));
    human(:,i)=detrend(human(:,i));
end

A_10=abot(:,2);    %% ie  
A_11=abot(:,3);    %% dp
A_12=abot(:,12);   %% left disp
A_13=abot(:,26);   %% right disp
A_14=abot(:,6);    %% ie torque
A_15=abot(:,7);    %% dp torque
A_16=abot(:,15);   %% left volt
A_17=abot(:,29);   %% right volt
A_18_0=abot(:,13);   %%left dev torque
A_18_1=(-A_15/.14+A_14/(0.16/2))*(0.025/4/pi);
A_18_2=A_18_0-A_18_1;
A_18=A_18_0*2*pi/0.025; %%left force
A_18_1=A_18_1*2*pi/0.025; %%left force feedback
A_18_2=A_18_2*2*pi/0.025; %%left force perturbation
A_19_0=abot(:,27);    %%rightt dev torque
A_19_1=(-A_15/.14-A_14/(0.16/2))*(0.025/4/pi);
A_19_2=A_19_0-A_19_1;
A_19=A_19_0*2*pi/0.025; %%right force
A_19_1=A_19_1*2*pi/0.025; %%right force feedback
A_19_2=A_19_2*2*pi/0.025; %%right force perturbation
A_11_1=A_15/K_s;
A_11_2=A_11-A_11_1;
A_10_1=A_14/K_s;
A_10_2=A_10-A_10_1;
A_10=detrend(A_10);
A_11=detrend(A_11);
A_12=detrend(A_12);
A_13=detrend(A_13);
A_14=detrend(A_14);
A_15=detrend(A_15);
A_16=detrend(A_16);
A_17=detrend(A_17);
A_18=detrend(A_18);
A_19=detrend(A_19);
A_18_1=detrend(A_18_1);
A_18_2=detrend(A_18_2);
A_19_1=detrend(A_19_1);
A_19_2=detrend(A_19_2);
A_11_1=detrend(A_11_1);
A_11_2=detrend(A_11_2);
A_10_1=detrend(A_10_1);
A_10_2=detrend(A_10_2);
A_10_5 =1/(0.16)*(-A_12+A_13); 
A_11_5 =1/(2*0.14)*(A_12+A_13); 
A_11_6 =atan(A_11_5); 
A_111=(A_18+A_19)*.14;                % DP TORQUE
A_112=(-A_18+A_19)*.19/2;            % IE TORQUE 
A_111_1=(A_18_1+A_19_1)*.14;       % DP TORQUE
A_112_1=(-A_18_1+A_19_1)*.19/2;   % IE TORQUE 
A_111_3=A_15-K_s*A_11;
A_112_3=A_14-K_s*A_10;
A_111_2=A_111+A_15;     % DP TORQUE
A_112_2=A_112+A_14;     % IE TORQUE 
A_19_3=1/2*(A_111_2/.14+A_112_2/(.19/2));   % right force
A_18_3=1/2*(A_111_2/.14-A_112_2/(.19/2));   % left force

H_10=human(:,2);    %% ie  
H_11=human(:,3);    %% dp
H_12=human(:,12);   %% left disp
H_13=human(:,26);   %% right disp
H_14=human(:,6);    %% ie torque
H_15=human(:,7);    %% dp torque
H_16=human(:,15);   %% left volt
H_17=human(:,29);   %% right 
H_18_0=human(:,13);   %%left dev torque
H_18_1=(-H_15/.14+H_14/(0.16/2))*(0.025/4/pi);
H_18_2=H_18_0-H_18_1;
H_18=H_18_0*2*pi/0.025; %%left force
H_18_1=H_18_1*2*pi/0.025; %%left force feedback
H_18_2=H_18_2*2*pi/0.025; %%left force perturbation
H_19_0=human(:,27);    %%rightt dev torque
H_19_1=(-H_15/.14-H_14/(0.16/2))*(0.025/4/pi);
H_19_2=H_19_0-H_19_1;
H_19=H_19_0*2*pi/0.025; %%right force
H_19_1=H_19_1*2*pi/0.025; %%right force feedback
H_19_2=H_19_2*2*pi/0.025; %%right force perturbation
H_11_1=H_15/K_a;
H_11_2=H_11-H_11_1;
H_10_1=H_14/K_a;
H_10_2=H_10-H_10_1;
H_10=detrend(H_10);
H_11=detrend(H_11);
H_12=detrend(H_12);
H_13=detrend(H_13);
H_14=detrend(H_14);
H_15=detrend(H_15);
H_16=detrend(H_16);
H_17=detrend(H_17);
H_18=detrend(H_18);
H_19=detrend(H_19);
H_18_1=detrend(H_18_1);
H_18_2=detrend(H_18_2);
H_19_1=detrend(H_19_1);
H_19_2=detrend(H_19_2);
H_11_1=detrend(H_11_1);
H_11_2=detrend(H_11_2);
H_10_1=detrend(H_10_1);
H_10_2=detrend(H_10_2);
H_10_5 =1/(0.16)*(-H_12+H_13); 
H_11_5 =1/(2*0.14)*(H_12+H_13); 
H_11_6 =atan(H_11_5); 
H_111=(H_18+H_19)*.14;     % DP TORQUE

H_112=(-H_18+H_19)*.19/2;   % IE TORQUE 
H_111_1=(H_18_1+H_19_1)*.14;     % DP TORQUE% 
H_112_1=(-H_18_1+H_19_1)*.19/2;   % IE TORQUE 
H_111_3=H_15-K_a*H_11;
H_112_3=H_14-K_a*H_10;
H_111_2=H_111+H_15;     % DP TORQUE

H_112_2=H_112+H_14;   % IE TORQUE 
H_19_3=1/2*(H_111_2/.14+H_112_2/(.19/2));   % right perturbation force
H_18_3=1/2*(H_111_2/.14-H_112_2/(.19/2));   % left perturbation force
H_31=(-H_15/.14+H_14/(0.16/2));  % left
H_32=(-H_15/.14-H_14/(0.16/2));  % right

XX1=A_11_5;         %%_5 for linearized atan eqn from disp
YY1=-A_111_2;
X1=H_11_5;          %%_5 for linearized atan eqn from disp
Y1=-H_111_2;
KTA=1;KFD=0;
XX2=A_10_5;         %%_5 for linearized atan eqn from disp
YY2=-A_112_2;
X2=H_10_5;          %%_5 for linearized atan eqn from disp
Y2=-H_112_2;

%% frf
[T_aa_2_1,F_aa_2_1] = tfestimate(X2,Y2,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_2,F_aa_2_2] = cpsd(X2,X1,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_3,F_aa_2_3] = cpsd(X1,Y2,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_4,F_aa_2_4] = cpsd(X1,X1,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_5,F_aa_2_5] = cpsd(X2,Y2,hamming(n_win),n_ovrlp,nfft,Fs);
[C_aa_2_6,F_aa_2_6] = mscohere(X1,X2,hamming(n_win),n_ovrlp,nfft,Fs);
T_aa_22=T_aa_2_1.*(1.-(P_aa_2_2.*P_aa_2_3)./(P_aa_2_4.*P_aa_2_5))./(1.-C_aa_2_6);
F_aa_22=F_aa_2_1;
for i=1:length(F_aa_22)
    Z_aa_22(i)=T_aa_22(i)-(Khuman_TA(2,2)*KTA+Khuman_FD(2,2)*KFD);
end
[T_a_2_1,F_a_2_1] = tfestimate(XX2,YY2,hamming(n_win),n_ovrlp,nfft,Fs);
[P_a_2_2,F_a_2_2] = cpsd(XX2,XX1,hamming(n_win),n_ovrlp,nfft,Fs);
[P_a_2_3,F_a_2_3] = cpsd(XX1,YY2,hamming(n_win),n_ovrlp,nfft,Fs);
[P_a_2_4,F_a_2_4] = cpsd(XX1,XX1,hamming(n_win),n_ovrlp,nfft,Fs);
[P_a_2_5,F_a_2_5] = cpsd(XX2,YY2,hamming(n_win),n_ovrlp,nfft,Fs);
[C_a_2_6,F_a_2_6] = mscohere(XX1,XX2,hamming(n_win),n_ovrlp,nfft,Fs);
T_a_22=T_a_2_1.*(1.-(P_a_2_2.*P_a_2_3)./(P_a_2_4.*P_a_2_5))./(1.-C_a_2_6);
x_axis=F_a_2_1;
for i=1:length(x_axis)
    Z_a_22(i)=T_a_22(i)-(Kabot_TA(2,2)*KTA+Kabot_FD(2,2)*KFD);
end
impedance=Z_aa_22-Z_a_22;
figure(n+1);subplot(3,1,1,'YTick', [0 10 20 30 40 50 60 70], 'XTick',[1 10 lim_x],'XScale','log','fontsize',font);hold on;
plot(x_axis,20*log10(abs(impedance)),str3,'LineWidth',2);
ylabel('magnitude (dB)');title('Z_2_2(f)');grid on;box on;xlabel('Hz');xlim([.7 lim_x]);ylim([0 70]);legend('co-contraction','passive')
%% 4 phase
phaze=angle(impedance);
if wrap==1 
    phaze=unwrap(phaze);
end
phaze=180/pi*phaze+0/1;
for i=1:size(phaze,2)
if phaze(i) > 300
    phaze(i)=phaze(i)-360;
end
end
figure(n+1);subplot(3,1,2,'YTick',[-200 -90 0 90 200],'XTick',[1 10 lim_x],'XScale','log','fontsize',font);hold on;
plot(x_axis,phaze,str3,'LineWidth',2);
ylabel('phase (degree)');grid on;box on;xlabel('Hz');xlim([.7 lim_x]);ylim([-200 200]);legend('co-contraction','passive')
%% 6 coherance
[P_aa_2_7,F_aa_2_7] = cpsd(X2,Y2,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_8,F_aa_2_8] = cpsd(X1,X1,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_9,F_aa_2_9] = cpsd(X1,Y2,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_10,F_aa_2_10] = cpsd(X2,X1,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_11,F_aa_2_11] = cpsd(X1,X1,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_12,F_aa_2_12] = cpsd(X2,X2,hamming(n_win),n_ovrlp,nfft,Fs);
[P_aa_2_13,F_aa_2_13] = cpsd(Y2,Y2,hamming(n_win),n_ovrlp,nfft,Fs);
[C_aa_2_14,F_aa_2_14] = mscohere(X1,X2,hamming(n_win),n_ovrlp,nfft,Fs);
[C_aa_2_15,F_aa_2_15] = mscohere(X1,Y2,hamming(n_win),n_ovrlp,nfft,Fs);
coherance=real((abs(P_aa_2_7.*P_aa_2_8-P_aa_2_9.*P_aa_2_10).^2)./(P_aa_2_11.*P_aa_2_11.*P_aa_2_12.*P_aa_2_13)./(1.-C_aa_2_14)./(1.-C_aa_2_15));
figure(n+1);subplot(3,1,3,'YTick',[0 0.2 0.4 0.6 0.8 1],'YMinorTick','on','XTick',[1 10 lim_x],'XScale','log','fontsize',font);hold on;
plot(x_axis,coherance,str3,'LineWidth',2);
ylabel('Coherence');xlabel('Hz');grid on;box on;xlim([0.7 lim_x]);ylim([0 1]);legend('co-contraction','passive')