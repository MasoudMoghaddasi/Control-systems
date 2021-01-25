close all;clear all;clc
%% 
sim('chap8_5sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,3),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('ideal signal','practical signal');
figure(2);
plot(t,y(:,2),'k',t,y(:,4),'r:','linewidth',2);
xlabel('time(s)');ylabel('speed tracking');
legend('angle speed ideal signal','angle speed practical signal');
figure(3);
plot(t,ut(:,1),'k','linewidth',2);
xlabel('time(s)');ylabel('control input');