clc;clear;close all;
sim('chap7_3sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('Ideal position signal','tracking signal');
figure(2);
plot(t,ut,'r','linewidth',2);
xlabel('time(s)');ylabel('control input');
axis([0 10 -15 5])