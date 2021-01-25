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
sizes.NumInputs = 9;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [0 0];
function sys=mdlOutputs(t,x,u)
global J Lambda Lambda_1 Lambda_2 etta

SamplingTime = u(5) ;
if SamplingTime == 0
    SamplingTime = 0.01;
end

thd=u(1);
d_thd=u(2);
if t <= SamplingTime
    dd_thd=eps;
    ddd_thd=eps;
else
    dd_thd=(u(2)-u(3))/SamplingTime;
    dd_thd_prev=(u(3)-u(4))/SamplingTime;
    ddd_thd=(dd_thd-dd_thd_prev)/SamplingTime;
end

th=u(6);
d_th=u(7);
dd_th=u(8);


e=th-thd;
de=d_th-d_thd;
dde=dd_th-dd_thd;
n1=Lambda_1;n2=Lambda_2;
n=Lambda;
s=dde+n1*de+n2*e;
xite=etta; %dot(d)+n*dmax,dmax=3
ut=-1/n*(-n*J*dd_th+J*(-ddd_thd+n1*dde+n2*de)+xite*sign(s));
sys(1)=ut;