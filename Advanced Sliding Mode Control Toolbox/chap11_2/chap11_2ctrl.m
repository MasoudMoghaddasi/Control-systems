function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 3,
sys=mdlOutputs(t,x,u);
case {2,4,9}
sys=[];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
global nmn
nmn=25*eye(2);
sizes = simsizes;
sizes.NumContStates = 0;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 2;
sizes.NumInputs = 6;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [0 0];
function sys=mdlOutputs(t,x,u)
global nmn
qd1=u(1);
dqd1=cos(t);
ddqd1=-sin(t);
qd2=u(2);
dqd2=cos(t);
ddqd2=-sin(t);
ddqd=[ddqd1;ddqd2];
dqd=[dqd1;dqd2];
ddqd=[ddqd1;ddqd2];
q1=u(3);dq1=u(4);
q2=u(5);dq2=u(6);
dq=[dq1;dq2];
e1=qd1-q1;
e2=qd2-q2;
e=[e1;e2];
de1=dqd1-dq1;
de2=dqd2-dq2;
de=[de1;de2];
alfa=6.7;beta=3.4;
epc=3.0;eta=0;
m1=1;l1=1;
lc1=1/2;I1=1/12;
g=9.8;
e1=m1*l1*lc1-I1-m1*l1^2;
e2=g/l1;
H=[alfa+2*epc*cos(q2)+2*eta*sin(q2),beta+epc*cos(q2)+eta*sin(q2);
beta+epc*cos(q2)+eta*sin(q2),beta];
C=[(-2*epc*sin(q2)+2*eta*cos(q2))*dq2,(-epc*sin(q2)+eta*cos(q2))*dq2;
(epc*sin(q2)-eta*cos(q2))*dq1,0];
G=[epc*e2*cos(q1+q2)+eta*e2*sin(q1+q2)+(alfa-beta+e1)*e2*cos(q1);
epc*e2*cos(q1+q2)+eta*e2*sin(q1+q2)];
H0=0.6*H;
C0=0.6*C;
G0=0.6*G;
s=de+nmn*e;
d_up=30;
xite=0.10;
M=2;
if M==1
d=(d_up+xite)*sign(s);
elseif M==2 %Saturated function
delta=0.05;
kk=1/delta;
if abs(s)>delta
sats=sign(s);
else
sats=kk*s;
end
end
d=(d_up+xite)*sats;
v=ddqd+nmn*de+d;
tol=H0*v+C0*dq+G0;
sys(1)=tol(1);
sys(2)=tol(2);