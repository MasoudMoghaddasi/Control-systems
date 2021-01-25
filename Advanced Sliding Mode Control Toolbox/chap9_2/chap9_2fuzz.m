close all;clear all;
a=newfis('fuzz_smc');
a=addvar(a,'input','sds',[-15,15]);
a=addmf(a,'input',1,'NB','zmf',[-15,-5]);
a=addmf(a,'input',1,'NM','trimf',[-15,-10,0]);
a=addmf(a,'input',1,'ZO','trimf',[-10,0,10]);
a=addmf(a,'input',1,'PM','trimf',[0,10,15]);
a=addmf(a,'input',1,'PB','smf',[5,15]);

a=addvar(a,'output','dk',1/10*[-15,15]);
a=addmf(a,'output',1,'NB','zmf',1/10*[-15,-5]);
a=addmf(a,'output',1,'NM','trimf',1/10*[-10,-5,0]);
a=addmf(a,'output',1,'ZO','trimf',1/10*[-5,0,5]);
a=addmf(a,'output',1,'PM','trimf',1/10*[0,5,10]);
a=addmf(a,'output',1,'PB','smf',1/10*[5,15]);
rulelist=[  5 5 1 1;
            4 4 1 1;
            3 3 1 1;
            2 2 1 1;
            1 1 1 1];
a=addrule(a,rulelist);
showrule(a) %Show fuzzy rule base
a1=setfis(a,'DefuzzMethod','centroid'); %Defuzzy
% a1=setfis(a,'DefuzzMethod','lom'); %Defuzzy
% a1=setfis(a,'DefuzzMethod','som');
% a1=setfis(a,'DefuzzMethod','bisector');
writefis(a1,'smc_fuzz'); %Save fuzzy system as "fsmc.fis"
a2=readfis('smc_fuzz');
ruleview(a2);
figure(1);
plotmf(a,'input',1);
figure(2);
plotmf(a,'output',1);