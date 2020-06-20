clc;                
close all;           
clear all;          
tfinal = 2;     
tp = 0:0.02:1;
mu =2;

CL=ones(length(tp),1)*(0.01);
CL(end+1) = tfinal;
 
lower_limit=ones(length(tp),1)*(-5); 
upper_limit=ones(length(tp),1)*(5); 
lower_limit(end+1)=1;                
upper_limit(end+1)=10;        
 
options = optimset('Display','iter','TolCon',1e-4,'TolFun',1e-4,'PlotFcns','optimplotx', 'MaxFunEvals',5000,'Algorithm','interior-point'); 

[CL_final, cost] = fmincon('num2_cost', CL,[],[],[],[],lower_limit,upper_limit,'num2_constraint',options);
tfinal=CL_final(end); 
[tout,yout]=sim('num2',1,[],[tp' CL_final(1:end-1)]); 

figure;
plot(yout(:,1),yout(:,2));
grid;
xlabel('Final State1');
ylabel('Final State2');

figure;
plot(tp*tfinal, CL_final(1:end-1));
xlabel('Time (in sec)');
ylabel('Final optimal trajectory in (rads)');
grid;

disp('Final time in sec is');
disp(tfinal);

disp('Final Optimal Cost value is:');
disp(cost);