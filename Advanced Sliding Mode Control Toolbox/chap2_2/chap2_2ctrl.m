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
sizes.NumOutputs = 4;
sizes.NumInputs = 6;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0 = [];
str = [];
ts = [0 0];
function sys=mdlOutputs(t,x,u)
global c d D InitialStateVector J_min J_max M Phi
thd=u(1); % Desired Input
dthd=u(2);
SamplingTime = u(4) ;
if SamplingTime == 0
    SamplingTime = 0.01;
end
if t < 2*SamplingTime
    ddthd=eps;
else
    ddthd=(u(2)-u(3))/SamplingTime;
end
th=u(5);
dth=u(6);
e=th-thd;
de=dth-dthd;
dt=d;
e0=InitialStateVector(1);
de0=0-1.0;
s0=de0+c*e0;
ft=s0*exp(-130*t);
df=-130*s0*exp(-130*t);
s=de+c*e-ft;
R=ddthd+c*dthd;
aJ=(J_min+J_max)/2;
dJ=(J_max-J_min)/2;

if M==1
ut=-aJ*(c*dth-df)+aJ*R-[dJ*abs(c*dth-df)+D+dJ*abs(R)]*sign(s);
elseif M==2
fai=Phi;
if s/fai>1
sat=1;
elseif abs(s/fai)<=1
sat=s/fai;
elseif s/fai<-1
sat=-1;
end
ut=-aJ*(c*dth-df)+aJ*R-[dJ*abs(c*dth-df)+D+dJ*abs(R)]*sat;
end
sys(1)=ut;
sys(2)=s;
sys(3)=thd;
sys(4)=dthd;