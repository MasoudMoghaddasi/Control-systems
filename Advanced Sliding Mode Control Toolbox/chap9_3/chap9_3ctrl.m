function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 1,
sys=mdlDerivatives(t,x,u);
case 3,
sys=mdlOutputs(t,x,u);
case {2,4,9}
sys=[];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates = 25;
sizes.NumDiscStates = 0;
sizes.NumOutputs = 2;
sizes.NumInputs = 2;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0 = [zeros(25,1)];
str = [];
ts = [];
function sys=mdlDerivatives(t,x,u)
gama=0.005;
r=0.1*sin(t);
dr=0.1*cos(t);
ddr=-0.1*sin(t);
e=u(1);
de=u(2);
n=25;
s=n*e+de;
x1=e;
x2=de;
for i=1:1:25
thtaf(i,1)=x(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FS1=0;
for l1=1:1:5
gs1=-[(x1+pi/6-(l1-1)*pi/12)/(pi/24)]^2;
u1(l1)=exp(gs1);
end
for l2=1:1:5
gs2=-[(x2+pi/6-(l2-1)*pi/12)/(pi/24)]^2;
u2(l2)=exp(gs2);
end
for l1=1:1:5
for l2=1:1:5
FS2(5*(l1-1)+l2)=u1(l1)*u2(l2);
FS1=FS1+u1(l1)*u2(l2);
end
end
FS=FS2/FS1;
for i=1:1:25
sys(i)=-1/gama*s*FS(i);
end
function sys=mdlOutputs(t,x,u)
r=0.1*sin(t);
dr=0.1*cos(t);
ddr=-0.1*sin(t);
e=u(1);
de=u(2);
n=25;
s=n*e+de;
x1=e;
x2=de;
for i=1:1:25
thtaf(i,1)=x(i);
end
FS1=0;
for l1=1:1:5
gs1=-[(x1+pi/6-(l1-1)*pi/12)/(pi/24)]^2;
u1(l1)=exp(gs1);
end
for l2=1:1:5
gs2=-[(x2+pi/6-(l2-1)*pi/12)/(pi/24)]^2;
u2(l2)=exp(gs2);
end
for l1=1:1:5
for l2=1:1:5
FS2(5*(l1-1)+l2)=u1(l1)*u2(l2);
FS1=FS1+u1(l1)*u2(l2);
end
end
FS=FS2/FS1;
fxp=thtaf'*FS';
g=9.8;mc=1.0;m=0.1;l=0.5;
S=l*(4/3-m*(cos(x1))^2/(mc+m));
gx=cos(x1)/(mc+m);
gx=gx/S;
if t<=1.0
xite=1.0;
else
xite=0.10;
end
ut=1/gx*(-fxp+ddr+n*de+xite*sign(s));
sys(1)=ut;
sys(2)=fxp;