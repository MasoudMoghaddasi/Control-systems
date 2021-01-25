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
sizes = simsizes;
sizes.NumContStates = 0;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 1;
sizes.NumInputs = 5;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [0 0];
function sys=mdlOutputs(t,x,u)
persistent e0 de0 dde0
T=1.0;
xd=u(1);dxd=cos(t);ddxd=-sin(t);
x1=u(2);x2=u(3);
dx1=u(4);dx2=u(5);
if t==0
e0=x1;
de0=x2-1;
dde0=dx2;
end
e=x1-xd;
de=x2-dxd;
if t<=T
A0=-10/T^3*e0-6/T^2*de0-1.5/T*dde0;
A1=15/T^4*e0+8/T^3*de0+1.5/T^2*dde0;
A2=-6/T^5*e0-3/T^4*de0-0.5/T^3*dde0;
p=e0+de0*t+1/2*dde0*t^2+A0*t^3+A1*t^4+A2*t^5;
dp=de0+dde0*t+A0*3*t^2+A1*4*t^3+A2*5*t^4;
ddp=dde0+A0*3*2*t+A1*4*3*t^2+A2*5*4*t^3;
else
p=0;dp=0;ddp=0;
end
c=15;
rou=(c*e+de)-(c*p+dp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=9.8;mc=1.0;m=0.1;l=0.5;
S=l*(4/3-m*(cos(x1))^2/(mc+m));
fx=g*sin(x1)-m*l*x2^2*cos(x1)*sin(x1)/(mc+m);
fx=fx/S;
gx=cos(x1)/(mc+m);
gx=gx/S;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
delta=0.05;
if abs(rou)>delta
sat=sign(rou);
else
sat=1/delta*rou;
end
xite=3.1;
M=2;
if M==1
ut=-1/gx*(fx-ddxd-ddp+c*(de-dp)+xite*sign(rou));
elseif M==2
ut=-1/gx*(fx-ddxd-ddp+c*(de-dp)+xite*sat);
end
sys(1)=ut;