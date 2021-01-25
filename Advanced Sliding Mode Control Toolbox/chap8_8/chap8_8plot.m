close all;close all;clc
%% 
sim('chap8_8sim.slx')
figure(1);
plot(t,p(:,3),'r',t,p(:,4),'b');
xlabel('time(s)');ylabel('d and its estimate');
legend('d','Estimated d');