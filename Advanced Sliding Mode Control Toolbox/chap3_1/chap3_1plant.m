function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag
    case 0
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 1
        sys=mdlDerivatives(t,x,u);
    case 3
        sys=mdlOutputs(t,x,u);
    case {2,4,9}
        sys=[];
    otherwise
        error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
    global InitialStateVector
    sizes = simsizes;
    sizes.NumContStates = 4;
    sizes.NumDiscStates = 0;
    sizes.NumOutputs = 4;
    sizes.NumInputs = 1;
    sizes.DirFeedthrough = 0;
    sizes.NumSampleTimes = 0;
    sys = simsizes(sizes);
    x0 = InitialStateVector;
    str = [];
    ts = [];
function sys=mdlDerivatives(t,x,u)
    global M m L f 
    g=9.8;
    I=1/12*m*L^2;
    l=1/2*L;
    t1=m*(M+m)*g*l/((M+m)*I+M*m*l^2);
    t2=-m^2*g*l^2/((m+M)*I+M*m*l^2);
    t3=-m*l/((M+m)*I+M*m*l^2);
    t4=(I+m*l^2)/((m+M)*I+M*m*l^2);
    A=[ 0,1,0,0;
        t1,0,0,0;
        0,0,0,1;
        t2,0,0,0 ];
    B=[0;t3;0;t4];
    ut=u(1);
    dx=A*x+B*(ut+f(t));
    sys(1)=x(2);
    sys(2)=dx(2);
    sys(3)=x(4);
    sys(4)=dx(4);
function sys=mdlOutputs(t,x,u)
    sys(1)=x(1);
    sys(2)=x(2);
    sys(3)=x(3);
    sys(4)=x(4);