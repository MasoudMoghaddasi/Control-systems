function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 1,
sys=mdlDerivatives(t,x,u);
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
sizes.NumOutputs = 1;
sizes.NumInputs = 9;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [];
function sys=mdlOutputs(t,x,u)
global k1 k2
r=u(1);
dr=u(2);
SamplingTime = u(4) ;
if SamplingTime == 0
    SamplingTime = 0.01;
end
if t < 4* SamplingTime
    ddr=eps;
else
    ddr=(u(2)-u(3))/SamplingTime;
end

e=u(5);
de=u(6);
fx=u(8);
gx=u(9);
v=ddr+k1*e+k2*de;
ut=(v-fx)/(gx+0.002);
sys(1)=ut;