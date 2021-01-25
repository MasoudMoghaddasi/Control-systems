clc;clear;close all;
sim('chap7_2sim.slx')
figure(1);
plot(t,x(:,1),'k',t,x(:,2),'k:','linewidth',2);
xlabel('time(s)');ylabel('State response');
legend('x1 response','x2 response');
figure(2);
plot(t,ut(:,1),'r','linewidth',2);
xlabel('time(s)');ylabel('Control input');
figure(3);
M=1;
q=3;p=5;
if M==1 %TSM
plot(x(:,1),x(:,2),'k',x(:,1),-(abs(x(:,1))).^(q/p).*sign(x(:,1)),'r','linewidth',2);
legend('ideal sliding mode','practical trajectory');
elseif M==2 %NTSM
plot(x(:,1),x(:,2),'k',x(:,1),(abs(-x(:,1))).^(q/p).*sign(-x(:,1)),'r','linewidth',2);
legend('ideal sliding mode','practical trajectory');
end
xlabel('x1');ylabel('x2');