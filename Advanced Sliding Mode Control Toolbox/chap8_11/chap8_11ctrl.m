function [sys,x0,str,ts]=chap8_11ctrl(t,x,u,flag)
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
ts=[-1 0];
function sys=mdlOutputs(t,x,u)
tol=3;
thd=1*sin(t);
wd=1*cos(t);
ddthd=-sin(t);
k1=10;k2=-1;
nmn=15;
thp=u(2);
wp=u(3);
thp_tol=u(4);
th_tol=u(6);
e1p=thp-thd;
e2p=wp-wd;
sp=e2p+nmn*e1p;
l=3.0;
fai=0.05;
if sp/fai>1
sat=1;
elseif abs(sp/fai)<=1
sat=sp/fai;
elseif sp/fai<-1
    sat=-1;
end
%ut=thp+10*wp-l*sign(sp)+wd-nmn*e2p-(nmn*(k1+k2*tol)+k2)*(th_tol-thp_tol);
ut=thp+10*wp-l*sat+wd-nmn*e2p-(nmn*(k1+k2*tol)+k2)*(th_tol-thp_tol);
sys(1)=ut;