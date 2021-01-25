clc;close all
%%
sim('chap9_4sim.slx')
figure(1);
subplot(211);
plot(t,yd1(:,1),'k',t,y(:,1),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking of link1');
legend('Ideal position signal','tracking signal');
subplot(212);
plot(t,yd2(:,1),'k',t,y(:,3),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking of link2');
legend('Ideal position signal','tracking signal');
figure(2);
subplot(211);
plot(t,y(:,5),'k',t,u(:,3),'r:','linewidth',2);
xlabel('time(s)');ylabel('F and Fc of link1');
legend('Practical F','Estimation of F');
subplot(212);
plot(t,y(:,6),'k',t,u(:,4),'r:','linewidth',2);
xlabel('time(s)');ylabel('F and Fc of link2');
legend('Practical F','Estimation of F');
figure(3);
subplot(211);
plot(t,u(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Control input of Link1');
subplot(212);
plot(t,u(:,2),'r','linewidth',2);
xlabel('time(s)');ylabel('Control input of Link2');