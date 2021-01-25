close all;clear all;clc
%%
sim('chap8_2sim.slx')
figure(1);
subplot(211);
plot(t,y(:,1),'k',t,y(:,3),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('ideal angle signal','practical angle signal');
subplot(212);
plot(t,y(:,2),'k',t,y(:,4),'r:','linewidth',2);
xlabel('time(s)');ylabel('speed tracking');
legend('ideal angle speed signal','practical angle speed signal');
figure(2);
plot(t,ut(:,1),'k','linewidth',2);
xlabel('time(s)');ylabel('control input');