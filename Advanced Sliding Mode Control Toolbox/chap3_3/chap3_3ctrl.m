function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
    switch flag
        case 0
            [sys,x0,str,ts]=mdlInitializeSizes;
        case 3
            sys=mdlOutputs(t,x,u);
        case {2,4,9}
            sys=[];
        otherwise
            error(['Unhandled flag = ',num2str(flag)]);
    end
function [sys,x0,str,ts]=mdlInitializeSizes
    sizes = simsizes;
    sizes.NumDiscStates = 0;
    sizes.NumOutputs = 1;
    sizes.NumInputs = 6;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes);
    x0=[];
    str = [];
    ts = [0 0];
function sys=mdlOutputs(t,x,u)
    global m_c m l c_1 c_2
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
    x1=u(5);
    x2=u(6);
    g=9.8;
    S=l*(4/3-m*(cos(x1))^2/(m_c+m));
    fx=g*sin(x1)-m*l*x2^2*cos(x1)*sin(x1)/(m_c+m);
    fx=fx/S;
    gx=cos(x1)/(m_c+m);
    gx=gx/S;
    e1=x1-r;
    de1=x2-dr;
    s=x2+c_1*e1-dr;
    xite=0.010;
    ut=(1/gx)*(-fx-c_2*s-e1-c_1*de1+ddr-xite*sign(s));
    sys(1)=ut;