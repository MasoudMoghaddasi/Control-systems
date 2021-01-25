function [sys,x0,str,ts] = chap8_7ctrl(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 3,
sys=mdlOutputs(t,x,u);
case {1,2,4,9}
sys=[];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 0;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 2;
sizes.NumInputs = 4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];
function sys=mdlOutputs(t,x,u)
yd=0.1*sin(t);
dyd=0.1*cos(t);
ddyd=-0.1*sin(t);
x1p=u(2);
x2p=u(3);
fxp=u(4);
e1p=x1p-yd;
e2p=x2p-dyd;
c=30;
sp=e2p+c*e1p;
delta=0.05;
k=1/delta;
if abs(sp)>=delta
sat=sign(sp);
else
sat=k*sp;
end
g=9.8;mc=1.0;m=0.1;l=0.5;
S=l*(4/3-m*(cos(x1p))^2/(mc+m));
fx=g*sin(x1p)-m*l*x2p^2*cos(x1p)*sin(x1p)/(mc+m);
fxp=fx/S;
gx=cos(x1p)/(mc+m);
gxp=gx/S;
%ut=1/gxp*(-fxp+ddyd-c*e2p-l*sign(sp));
l=0.20;
ut=1/gxp*(-fxp+ddyd-c*e2p-l*sat);
sys(1)=ut;
sys(2)=gxp*ut;