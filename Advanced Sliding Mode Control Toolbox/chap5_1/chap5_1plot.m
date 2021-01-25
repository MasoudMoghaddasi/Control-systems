% clc;clear;close all;
sim('chap5_1sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('ideal signal','tracking signal');
figure(2);
plot(t,du(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Derivative of Control input');
figure(3);
plot(t,u,'r','linewidth',2);
xlabel('time(s)');ylabel('Control input');