clc;close all
%%
sim('chap9_5sim.slx')
figure(1);
plot(t,y(:,1),'k',t,y(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('Position tracking');
legend('ideal position signal','position tracking signal');
figure(2);
plot(t,ut(:,1),'k','linewidth',2);
xlabel('time(s)');ylabel('Control input');
figure(3);
plot(t,h(:,1),'k',t,h(:,2),'r:','linewidth',2);
xlabel('time(s)');ylabel('h and estiamted h');
legend('Switch part','fuzzy estination');