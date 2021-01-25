clc;close all
%%
sim('chap10_2sim.slx')
figure(1);
subplot(211);
plot(t,y(:,1),'k',t,y(:,7),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking for link 1');
legend('Ideal position signal','Position tracking');
subplot(212);
plot(t,y(:,4),'k',t,y(:,9),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking for link 2');
legend('Ideal position signal','Position tracking');
figure(2);
subplot(211);
plot(t,y(:,2),'k',t,y(:,8),'r:','linewidth',2);
xlabel('time(s)');ylabel('Speed tracking for link 1');
legend('Ideal speed signal','Speed tracking');
subplot(212);
plot(t,y(:,5),'k',t,y(:,10),'r:','linewidth',2);
xlabel('time(s)');ylabel('Speed tracking for link 2');
legend('Ideal speed signal','Speed tracking');
figure(3);
subplot(211);
plot(t,tol1(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('control input of link 1');
subplot(212);
plot(t,tol2(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('control input of link 2');
figure(4);
plot(t,y(:,11),'k',t,y(:,12),'r:','linewidth',2);
xlabel('time(s)');ylabel('f and fn');
legend('Practical f(x)','Estimate f(x)');