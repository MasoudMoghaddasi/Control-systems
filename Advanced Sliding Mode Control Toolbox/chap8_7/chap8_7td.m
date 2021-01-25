function [sys,x0,str,ts] = chap8_7td(t,x,u,flag)
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
sizes.NumContStates = 3;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 3;
sizes.NumInputs = 1;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0 = [0 0 0];
str = [];
ts = [0 0];
function sys=mdlDerivatives(t,x,u)
vt=u(1);
epc=0.01;
alfa1=1;alfa2=3;alfa3=3;
e=x(1)-vt;
sys(1)=x(2);
sys(2)=x(3);
sys(3)=-alfa1/epc^3*e-alfa2/epc^2*x(2)-alfa3/epc*x(3);
function sys=mdlOutputs(t,x,u)
sys = x;