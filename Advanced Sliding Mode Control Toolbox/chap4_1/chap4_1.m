function [ Time , r , x1 , u , e , de ] = chap4_1( A, B, C_T, q, D, InitialStateVector, ts, d_k, x_d, RunTime )
    %VSS controller based on decoupled disturbance compensator
    eq=C_T*B*D+0.10; %eq>abs(Ce*b*m/g);0<eq/fai<q<1
    x_1=InitialStateVector;
    s_1=0;
    u_1=0;
    d_1=0;ed_1=0;
    r_1=0;r_2=0;dr_1=0;
    for k=1:1:ceil(RunTime/ts)
        Time(k)=k*ts;
        d(k)=d_k(k*ts);
        x=A*x_1+B*(u_1+d(k));
        r(k)=x_d(k*ts);
        %Using Waitui method
        dr(k)=(r(k)-r_1)/ts;
        dr_1=(r_1-r_2)/ts;
        r1(k)=2*r(k)-r_1;
        dr1(k)=2*dr(k)-dr_1;
        xd=[r(k);dr(k)];
        xd1=[r1(k);dr1(k)];
        e(k)=x(1)-r(k);
        de(k)=x(2)-dr(k);
        s(k)=C_T(1)*e(k)+de(k);
        u(k)=inv(C_T*B)*(C_T*xd1-C_T*A*x+q*s(k)-eq*sign(s(k))); %0<q<1
        r_2=r_1;r_1=r(k);
        dr_1=dr(k);
        x_1=x;
        s_1=s(k);
        x1(k)=x(1);
        x2(k)=x(2);
        u_1=u(k);
    end
end
% figure(1);
% plot(Time,r,'k',Time,x1,'r:','linewidth',2);
% xlabel('time(s)');ylabel('Position tracking');
% legend('Ideal position signal','tracking signal');
% figure(2);
% plot(Time,u,'k','linewidth',2);
% xlabel('time(s)');ylabel('u');
% figure(3);
% plot(e,de,'k',e,-C_T(1)*e,'r','linewidth',2);
% xlabel('e');ylabel('de');