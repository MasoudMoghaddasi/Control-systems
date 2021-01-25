function [ Time , xd , x1 , u , d , ed , e , de ] = chap4_2( A, B, C_T, m, g, q, InitialStateVector, ts, d_k, x_d, RunTime )
    %SMC controller based on decoupled disturbance compensator
    %0<q<1
     %m>abs(d(k+1)-d(k))
    etta=C_T*B*m/g+0.0010; %xite>abs(C*B*m/g);0<xite/fai<q<1
    x_1=InitialStateVector;
    s_1=0;
    u_1=0;
    d_1=0;ed_1=0;
    xd_1=0;xd_2=0;dxd_1=0;
    for k=1:1:ceil(RunTime/ts)
        Time(k)=k*ts;
        d(k)=d_k(k*ts);
        d_1=d(k);
        x=A*x_1+B*(u_1+d(k));
        xd(k)=x_d(k*ts);
        dxd(k)=(xd(k)-xd_1)/ts;
        dxd_1=(xd_1-xd_2)/ts;
        xd1(k)=2*xd(k)-xd_1; %Using Waitui method
        dxd1(k)=2*dxd(k)-dxd_1;
        Xd=[xd(k);dxd(k)];
        Xd1=[xd1(k);dxd1(k)];
        e(k)=x(1)-Xd(1);
        de(k)=x(2)-Xd(2);
        s(k)=C_T*(x-Xd);
        ed(k)=ed_1+inv(C_T*B)*g*(s(k)-q*s_1+etta*sign(s_1));
        u(k)=-ed(k)+inv(C_T*B)*(C_T*Xd1-C_T*A*x+q*s(k)-etta*sign(s(k)));
        xd_2=xd_1;xd_1=xd(k);
        dxd_1=dxd(k);
        ed_1=ed(k);
        x_1=x;
        s_1=s(k);
        x1(k)=x(1);
        x2(k)=x(2);
        u_1=u(k);
    end
end
% figure(1);
% plot(Time,xd,'k',Time,x1,'r:','linewidth',2);
% xlabel('time(s)');ylabel('Position tracking');
% legend('Ideal position signal','tracking signal');
% figure(2);
% plot(Time,d,'k',Time,ed,'r:','linewidth',2);
% xlabel('time(s)');ylabel('d,ed');
% legend('Practical d','Estimation d');
% figure(3);
% plot(Time,u,'r','linewidth',2);
% xlabel('time(s)');ylabel('Control input');
% figure(4);
% plot(e,de,'b',e,-C_T(1)*e,'r');
% xlabel('e');ylabel('de');