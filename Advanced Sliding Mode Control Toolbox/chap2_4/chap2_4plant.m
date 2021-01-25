function [sys,x0,str,ts]=s_function(t,x,u,flag)
switch flag,
    case 0,
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 1,
        sys=mdlDerivatives(t,x,u);
    case 3,
        sys=mdlOutputs(t,x,u);
    case {2, 4, 9 }
        sys = [];
        otherwise
        error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
    global InitialStateVector ;
    sizes = simsizes;
    sizes.NumContStates = 2;
    sizes.NumDiscStates = 0;
    sizes.NumOutputs = 3;
    sizes.NumInputs = 1;
    sizes.DirFeedthrough = 0;
    sizes.NumSampleTimes = 0;
    sys=simsizes(sizes);
    x0=InitialStateVector;
    str=[];
    ts=[];
function sys=mdlDerivatives(t,x,u)
    global g m_c m l d_t ;
    S=l*(4/3-m*(cos(x(1)))^2/(m_c+m));
    fx=g*sin(x(1))-m*l*x(2)^2*cos(x(1))*sin(x(1))/(m_c+m);
    fx=fx/S;
    gx=cos(x(1))/(m_c+m);
    gx=gx/S;
    sys(1)=x(2);
    sys(2)=fx+gx*u+d_t(t);  
function sys=mdlOutputs(t,x,u)
    global g m_c m l ;
    S=l*(4/3-m*(cos(x(1)))^2/(m_c+m));
    fx=g*sin(x(1))-m*l*x(2)^2*cos(x(1))*sin(x(1))/(m_c+m);
    fx=fx/S;
    gx=cos(x(1))/(m_c+m);
    gx=gx/S;
    sys(1)=x(1);
    sys(2)=fx;
    sys(3)=gx;