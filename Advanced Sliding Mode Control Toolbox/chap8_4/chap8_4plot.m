close all;clear all;clc
%% 
sim('chap8_4sim.slx')
figure(1);
plot(t,x(:,1),'k',t,x(:,4),'k:','linewidth',2);
xlabel('time(s)');ylabel('x1 and x1 estimate');
legend('angle practical value','angle estimated value');
figure(2);
plot(t,x(:,2),'k',t,x(:,5),'k:','linewidth',2);
xlabel('time(s)');ylabel('x2 and x2 estimate');
legend('angle speed practical value','angle speed estimated value');
figure(3);
plot(t,x(:,3),'k',t,x(:,6),'k:','linewidth',2);
xlabel('time(s)');ylabel('x3 and x3 estimate');
legend('fx practical value','fx estimated value');