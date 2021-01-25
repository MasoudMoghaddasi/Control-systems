function [sys,x0,str,ts]=s_function(t,x,u,flag)
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
global InitialStateVector ;
sizes = simsizes;
sizes.NumContStates = 2;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 2;
sizes.NumInputs = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=InitialStateVector ;
str=[];
ts=[];
function sys=mdlDerivatives(t,x,u)
global B_n J_n ;
Bn=B_n; Jn=J_n;
sys(1)=x(2);
sys(2)=1/Jn*(u-Bn*x(2));
function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);