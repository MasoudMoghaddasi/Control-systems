function [sys,x0,str,ts]=chap8_5plant(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 1,
sys=mdlDerivatives(t,x,u);
case 3,
sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
sys = [];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 2;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 3;
sizes.NumInputs = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[0.1;0];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
b=0.10;
f=0.3*sin(t);
ut=u(1);
sys(1)=x(2);
sys(2)=b*ut+f;
function sys=mdlOutputs(t,x,u)
b=0.10;
f=0.3*sin(t);
sys(1)=x(1);
sys(2)=x(2);
sys(3)=f;