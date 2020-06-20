clc;                
close all;           
clear all;          
tfinal = 8;     
tp = 0:0.025:1;
initialstate1= 1;    
initialstate2= 0;   
initialstate3= 0;   

CL=ones(length(tp),1)*(0.01);
CL(end+1) = tfinal;
 
lower_limit=ones(length(tp),1)*(-0.75); 
upper_limit=ones(length(tp),1)*(0.75); 
lower_limit(end+1)=1;                
upper_limit(end+1)=10;        
 
options = optimset('Display', 'iter', 'TolCon', 1e-5,'TolFun', 1e-5,'PlotFcns', 'optimplotx', 'MaxFunEvals', 4400,'Algorithm','interior-point');
 
[CL_final, cost] = fmincon('num1_cost', CL,[],[],[],[],lower_limit,upper_limit,'num1_constraint',options);
tfinal=CL_final(end); 
[tout,yout]=sim('num1new',1,[],[tp' CL_final(1:end-1)]); 
figure;
plot3(yout(:,1),yout(:,2),yout(:,3));
grid;
xlabel('Final State1');
ylabel('Final State2');
zlabel('Final State3'); 
figure;
plot(tp*tfinal, CL_final(1:end-1));
xlabel('Time period(in sec)');
ylabel('Final optimal trajectory in (rads)');
grid;

disp('Final time in sec is');
disp(tfinal);

disp('Final Optimal Cost value is:');
disp(cost);