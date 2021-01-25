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
    sizes.NumInputs = 6;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 0;
    sys = simsizes(sizes);
    x0 = [];
    str = [];
    ts = [];
function sys=mdlOutputs(t,x,u)
    global c M delta_0 delta_1 etta
    ddr=u(3);
    e=u(1);
    de=u(2);
    fx=u(5);
    gx=u(6);

    s=de+c*e;
    if M==1
        v=ddr-c*de-etta*sign(s);
    elseif M==2
        delta=delta_0+delta_1*abs(e);
        v=ddr-c*de-etta*s/(abs(s)+delta);
    end
    if gx == 0 
        gx = gx+0.002 ;
    end
    ut=(-fx+v)/gx;
    sys(1)=ut;