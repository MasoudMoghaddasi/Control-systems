close all;clear all;clc
%%
sim('chap8_7sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,2),'k:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('ideal signal','practical signal');
figure(2);
plot(t,fx(:,1),'k',t,fx(:,2),'k:','linewidth',2);
xlabel('time(s)');ylabel('fx and its estimation');
legend('fx','estimated fx');
figure(3);
plot(t,ut(:,1),'k','linewidth',2);
xlabel('time(s)');ylabel('Control input');