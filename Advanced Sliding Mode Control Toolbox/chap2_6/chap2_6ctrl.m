function [sys,x0,str,ts]=obser(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 1,
sys=mdlDerivatives(t,x,u);
case 3,
sys=mdlOutputs(t,x,u);
case {1, 2, 4, 9 }
sys = [];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 1;
sizes.NumInputs = 9;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[];
function sys=mdlOutputs(t,x,u)
global c etta
yd=u(1);
dyd=u(2);
SamplingTime = u(4) ;
if SamplingTime == 0
    SamplingTime = 0.01;
end
if t < 4* SamplingTime
    ddyd=eps;
else
    ddyd=(u(2)-u(3))/SamplingTime;
end


e=u(5);
de=u(6);
x1=u(7);
x2=u(8);
x3=u(9);
f=(x1^5+x3)*(x3+cos(x2))+(x2+1)*x1^2;
c=10;
s=de+c*e;
v=ddyd+c*de;
xite=etta;
ut=1.0/(x2+1)*(v-f+xite*sign(s));
sys(1)=ut;