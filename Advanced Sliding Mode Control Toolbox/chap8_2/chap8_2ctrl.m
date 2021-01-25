function [sys,x0,str,ts]=chap8_2ctrl(t,x,u,flag)
switch flag,
case 0,
[sys,x0,str,ts]=mdlInitializeSizes;
case 3,
    sys=mdlOutputs(t,x,u);
case {1,2, 4, 9 }
sys = [];
otherwise
error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
    sizes = simsizes;
    sizes.NumContStates = 0;
    sizes.NumDiscStates = 0;
    sizes.NumOutputs = 1;
    sizes.NumInputs = 3;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 0;
    sys=simsizes(sizes);
    x0=[];
    str=[];
    ts=[];
function sys=mdlOutputs(t,x,u)
    r=u(1);
    x1p=u(2);x2p=u(3);
    dr=cos(t);
    ddr=-sin(t);
    J=10;b=1/J;
    c=50;
    e1p=x1p-r;
    e2p=x2p-dr;
    sp=e2p+c*e1p;
    delta=0.15;
    kk=1/delta;
    if sp>delta
        sat_sp=1;
    elseif abs(sp)<=delta
        sat_sp=kk*sp;
    elseif sp<-delta
        sat_sp=-1;
    end
    M=1;
    l=1.50; %l>=5/10;
    if M==1
        ut=1/b*(ddr-c*e2p-l*sign(sp));
    elseif M==2
        ut=1/b*(ddr-c*e2p-l*sat_sp);
    end
    sys(1)=ut;