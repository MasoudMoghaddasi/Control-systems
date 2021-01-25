clc;clear;close all;
sim('chap2_7sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('ideal signal','practical signal');
figure(2);
plot(t,u,'k','linewidth',2);
xlabel('time(s)');ylabel('initial control input');
figure(3);
plot(t,tol,'k','linewidth',2);
xlabel('time(s)');ylabel('practical control input');