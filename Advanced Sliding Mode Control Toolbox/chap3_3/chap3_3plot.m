clc;clear;close all;
sim('chap3_3sim.slx')
figure(1);
subplot(211);
plot(t,y(:,1),'r',t,y(:,2),'k:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
subplot(212);
plot(t,y(:,1)-y(:,2),'k','linewidth',2);
xlabel('time(s)');ylabel('Position tracking error');
figure(2);
plot(t,ut(:,1),'k','linewidth',2);
xlabel('time(s)');ylabel('Control input');