clc;clear;close all;
sim('chap2_2sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('ideal position signal','tracking position signal');
figure(2);
plot(t,u(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Control input');
figure(3);
plot(t,s(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Switch function');