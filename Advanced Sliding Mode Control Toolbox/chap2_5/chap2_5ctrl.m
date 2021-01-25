function [sys,x0,str,ts]=spacemodel(t,x,u,flag)
switch flag
    case 0
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 3
        sys=mdlOutputs(t,x,u);
    case {2, 4, 9}
        sys = [];
    otherwise
        error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
    sizes = simsizes;
    sizes.NumDiscStates = 0;
    sizes.NumOutputs = 1;
    sizes.NumInputs = 10;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 0;
    sys=simsizes(sizes);
    x0=[];
    str=[];
    ts=[];
function sys=mdlOutputs(t,x,u)
    global k1 k2 fx v ut
    yd=u(1);
    dyd=u(2);
    
    SamplingTime = u(4) ;
    if SamplingTime == 0
        SamplingTime = 0.01;
    end
    if t <= SamplingTime
        ddyd=eps;
    else
        ddyd=(u(2)-u(3))/SamplingTime;
    end
    e=u(5);
    de=u(6);
    dde=u(7);
    x1=u(8);
    x2=u(9);
    x3=u(10);
    f=fx(t,x1,x2,x3,0,k1,k2,0,0,e,de,dde,yd,dyd,ddyd);
    V=v(t,x1,x2,x3,0,k1,k2,0,0,e,de,dde,yd,dyd,ddyd);
    sys(1)=ut(t,x1,x2,x3,0,k1,k2,V,f,e,de,dde,yd,dyd,ddyd);