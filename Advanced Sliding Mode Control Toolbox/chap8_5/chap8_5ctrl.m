function [sys,x0,str,ts]=chap8_5ctrl(t,x,u,flag)
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
sizes.NumInputs = 7;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[];
function sys=mdlOutputs(t,x,u)
r=u(1);
x1p=u(2);x2p=u(3);x3p=u(4);
x1=u(5);x2=u(6);
dr=0.1*cos(t);
ddr=-0.1*sin(t);
b=0.1;c=10;l=0.5;
e1p=x1p-r;
e2p=x2p-dr;
sp=e2p+c*e1p;
ut=1/b*(-x3p+ddr-c*e2p-l*sign(sp)); %With Extended Observer
delta=0.15;
kk=1/delta;
if sp>delta
sat_sp=1;
elseif abs(sp)<=delta
sat_sp=kk*sp;
elseif sp<-delta
sat_sp=-1;
end
ut=1/b*(-x3p+ddr-c*e2p-l*sat_sp); %With Extended Observer
sys(1)=ut;