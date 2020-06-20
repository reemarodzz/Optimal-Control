clc
clear all
close all
tfinal = 40 / 100;
tp = 0:0.02:1;
CL=ones(length(tp),1)*(-0.2);
CL(end+1) = tfinal;
lower_limit=ones(length(tp),1)*(-pi);
upper_limit=ones(length(tp),1)*pi;
lower_limit(end+1)=0.01;
upper_limit(end+1)=1;

options = optimset('Display','iter','TolCon',1e-3,'Algorithm','interior-point','PlotFcns','optimplotx','MaxFunEvals',2500);

[CL_final, cost] = fmincon('numcost',CL,[],[],[],[],lower_limit,upper_limit,'constraint',options);

tfinal=CL_final(end);

[tout,yout]=sim('SRAM2',1,[],[tp' CL_final(1:end-1)]);

figure
plot(yout(:,1)/6076,yout(:,2));
grid
xlabel('X (in nm)');
ylabel('h');

figure
plot(tp*CL_final(end)*100,CL_final(1:end-1));
xlabel('Time period(in sec)');
ylabel('Velocity (in ft/sec)');
grid

figure
plot(tp*CL_final(end)*100,yout(1:51,4));
xlabel('Time period(in sec)');
ylabel('Velocity (in ft/sec)');

grid

disp('The final velocity in ft/sec')
velocity=yout(:,4);
disp(velocity(end));

disp('Final time in sec is');
disp(tfinal*100);

disp('Final Optimal Cost value is:');
disp(cost);