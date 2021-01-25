close all;clear all;close all
%%
sim('chap9_2sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('Ideal position signal','tracking signal');
figure(2);
plot(t,E(:,1),'k',t,E(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('E and estimated K');
legend('Ideal E','estimated E');
figure(3);
plot(t,ut(:,1),'k','linewidth',2);
xlabel('time(s)');ylabel('Control input');