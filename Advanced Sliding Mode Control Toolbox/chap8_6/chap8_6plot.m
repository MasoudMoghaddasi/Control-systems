close all;clear all;clc
%%
sim('chap8_6sim.slx')
figure(1);
plot(t,x(:,1),'k',t,x(:,3),'k:','linewidth',2);
xlabel('time(s)');ylabel('Position estimated');
legend('Practical Position','Position estimated by TD');
figure(2);
plot(t,x(:,2),'k',t,x(:,4),'k:','linewidth',2);
xlabel('time(s)');ylabel('Speed estimated');
legend('Practical Speed','Speed estimated by TD');
figure(3);
plot(t,x(:,5),'k','linewidth',2);
xlabel('time(s)');ylabel('Acceleration estimated');
legend('Acceleration estimated by TD');