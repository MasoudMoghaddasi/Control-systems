close all;clear all;close all
%%
sim('chap9_1sim.slx')
figure(1);
subplot(211);
plot(t,y(:,1),'k',t,y(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('Ideal position signal','tracking signal');
subplot(212);
plot(t,y(:,1)-y(:,2),'linewidth',2);
xlabel('time(s)');ylabel('Position tracking error');
figure(2);
plot(t,ut,'r','linewidth',2);
xlabel('time(s)');ylabel('control input');
figure(3);
plot(t,d(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Disturbance');
figure(4);
plot(t,miu(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Membership function degree');