function [cineq, ceq] = num2_constraint(p)  
cineq = [];
assignin('base', 'tfinal', p(end)); 
tp=[0:0.02:1];                   
u=p(1:end-1);               
[tout,x_state,yout]=sim('num2',1,[],[tp' u]);
ceq(1) = 3-yout(end,1); ; 
ceq(2) = yout(end,2); 
end
