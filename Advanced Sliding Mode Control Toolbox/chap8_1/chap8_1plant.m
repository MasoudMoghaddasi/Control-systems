function [sys,x0,str,ts]=chap8_1plant(t,x,u,flag)
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
sizes.NumOutputs = 2;
sizes.NumInputs = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[0.05;0];
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
a=25;
b=133;
ut=u(1);
dt=1*sign(x(2));
f=-a*x(2)-dt;
sys(1)=x(2);
sys(2)=f+b*ut;
function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);