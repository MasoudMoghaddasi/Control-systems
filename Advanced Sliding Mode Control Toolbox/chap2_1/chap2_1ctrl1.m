function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 3,
sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
sys = [];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 0;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 3;
sizes.NumInputs = 6;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys=simsizes(sizes);
x0=[];
str=[];
ts=[];
function sys=mdlOutputs(t,x,u)
global B_n J_n k
thd=u(1); % Desired Input
dthd=u(2);
SamplingTime = u(4) ;
if SamplingTime == 0
    SamplingTime = 0.01;
end
if t < 4* SamplingTime
    ddthd=eps;
else
    ddthd=(u(2)-u(3))/SamplingTime;
end
thn=u(5);
dthn=u(6);
% ( Theta_d(t+SamplingTime) - Theta_d(t) ) / SamplingTime;
% dthd_next=( Theta_d(t+2*SamplingTime) - Theta_d(t+SamplingTime) ) / SamplingTime;
% ddthd=( dthd_next - dthd ) / SamplingTime;
e=thn-thd;
de=dthn-dthd;
Bn=B_n;Jn=J_n;
h1=k^2;
h2=2*k-Bn/Jn;
ut=Jn*(-h1*e-h2*de+Bn/Jn*dthd+ddthd);
sys(1)=ut;
sys(2)=thd;
sys(3)=dthd;