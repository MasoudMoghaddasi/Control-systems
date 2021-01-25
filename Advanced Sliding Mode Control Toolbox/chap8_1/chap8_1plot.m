close all;clear all;clc
%%
sim('chap8_1sim.slx')
figure(1);
subplot(211);
plot(t,x(:,1),'k',t,x(:,3),'r:','linewidth',2);
xlabel('time(s)');ylabel('x1 and its estimate');
legend('ideal x1','estimate x1');
subplot(212);
plot(t,x(:,2),'k',t,x(:,4),'r:','linewidth',2);
xlabel('time(s)');ylabel('x2 and its estimate');
legend('ideal x2','estimate x2');