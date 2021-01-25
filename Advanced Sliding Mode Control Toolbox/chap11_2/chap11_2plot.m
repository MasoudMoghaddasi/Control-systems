clc;close all
%%
sim('chap11_2sim.slx')
figure(1);
subplot(211);
plot(t,y1(:,1),'k',t,y1(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking of joint 1');
legend('Ideal position signal','tracking signal');
subplot(212);
plot(t,y2(:,1),'k',t,y2(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking of joint 2');
legend('Ideal position signal','tracking signal');
figure(2);
subplot(211);
plot(t,tol(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Control input 1');
subplot(212);
plot(t,tol(:,2),'r','linewidth',2);
xlabel('time(s)');ylabel('Control input 2');