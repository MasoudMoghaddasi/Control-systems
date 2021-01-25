function [sys,x0,str,ts]=chap8_2obv(t,x,u,flag)
switch flag
    case 0
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 1
        sys=mdlDerivatives(t,x,u);
    case 3
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
    sizes.NumInputs = 3;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 0;
    sys=simsizes(sizes);
    x0=[0 0];
    str=[];
    ts=[];
function sys=mdlDerivatives(t,x,u)
    v=u(1);
    alfa1=9;alfa2=6;
    epc=0.01;
    e=x(1)-v;
    sys(1)=x(2)-alfa1/epc*e;
    sys(2)=-alfa2/epc^2*e;
function sys=mdlOutputs(t,x,u)
    sys(1)=x(1);
    sys(2)=x(2);