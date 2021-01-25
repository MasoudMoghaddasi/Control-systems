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
    sizes.NumOutputs = 2;
    sizes.NumInputs = 4;
    sizes.DirFeedthrough = 1;
    sizes.NumSampleTimes = 1;
    sys = simsizes(sizes);
    x0 = [];
    str = [];
    ts = [-1 0];
function sys=mdlOutputs(t,x,u)
    global M m L delta_f delta epsilon_0 P
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
        t2,0,0,0];
    B=[0;t3;0;t4];
    x=[u(1) u(2) u(3) u(4)]';
    s=B'*P*x;
    ueq=-inv(B'*P*B)*B'*P*A*x;
    Sel=2;
    if Sel==1
        un=-inv(B'*P*B)*(norm(B'*P*B)*delta_f+epsilon_0)*sign(s);
    elseif Sel==2 %Saturated function
        kk=1/delta;
        if abs(s)>delta
            sats=sign(s);
        else
            sats=kk*s;
        end
        un=-inv(B'*P*B)*(norm(B'*P*B)*delta_f+epsilon_0)*sats;
    end
    ut=un+ueq;
    sys(1)=ut;
    sys(2)=s;