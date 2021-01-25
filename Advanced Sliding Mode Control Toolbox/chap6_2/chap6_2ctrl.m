function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 3,
sys=mdlOutputs(t,x,u);
case {1,2, 4, 9 }
sys = [];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 0;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 1;
sizes.NumInputs = 6;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[0 0];
function sys=mdlOutputs(t,x,u)
thd=u(1);
dthd=0.1*cos(t);
ddthd=-0.1*sin(t);
x1=u(2);
x2=u(3);
fai1p=u(4);
fai2p=u(5);
fai3p=u(6);
e=x1-thd;
de=x2-dthd;
c=10;
s=c*e+de;
xite=1.0;
delta=0.05;
kk=1/delta;
if abs(s)>delta
sats=sign(s);
else
sats=kk*s;
end
delta=0.05;
kk=1/delta;
if abs(s)>delta
sats=sign(s);
else
sats=kk*s;
end
% ut=-xite*sign(s)-fai1p*(0.5*s*x2*sec(x1)*tan(x1)+sec(x1)*(c*de-ddthd))-...
%     fai2p*tan(x1)-fai3p*(0.5*s*x2*sin(x1)-x2^2*sin(x1)-cos(x1)*(c*de-ddthd));
ut=-xite*sats-fai1p*(0.5*s*x2*sec(x1)*tan(x1)+sec(x1)*(c*de-ddthd))-fai2p*...
    tan(x1)-fai3p*(0.5*s*x2*sin(x1)-x2^2*sin(x1)-cos(x1)*(c*de-ddthd));
sys(1)=ut;