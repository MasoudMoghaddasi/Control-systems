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
    global x2dot c Lambda D D_0
    r=u(1);
    dr=u(2);
    x1=u(6);
    dx1=u(7);
    ut=u(9);
    SamplingTime = u(5) ;
    if SamplingTime == 0
        SamplingTime = 0.01;
    end
    if t <= 2*SamplingTime
        ddx1=eps;
        ddr=eps;
        dddr=eps;
    else
        ddx1=(u(7)-u(8))/SamplingTime;
        ddr=(u(2)-u(3))/SamplingTime;
        ddr_prev=(u(3)-u(4))/SamplingTime;
        dddr=(ddr-ddr_prev)/SamplingTime;
    end
    e=x1-r;
    de=dx1-dr;
    dde=ddx1-ddr;
    s=c*e+de;
    fx=x2dot(0,dx1,0);
    df=x2dot(0,ddx1,0);
    gx=x2dot(0,0,1);
    etta=D+(c+Lambda)*D_0+0.50;
    ds=c*de+dde;
    rou=ds+Lambda*s;
    du=1/gx*(-df+(c+Lambda)*ddr+dddr-(c+Lambda)*gx*ut-(c+Lambda)*fx-Lambda*c*de-etta*sign(rou));
    sys(1)=du;