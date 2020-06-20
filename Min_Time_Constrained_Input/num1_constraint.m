function [cineq, ceq] = num1_constraint(p)  
cineq = [];
assignin('base', 'tfinal', p(end)); 
tp=[0:0.025:1];                   
u=p(1:end-1);               
[tout,x_state,yout]=sim('num1new',1,[],[tp' u]);
ceq(1) = yout(end,1); 
ceq(2) = yout(end,2); 
ceq(3) = yout(end,3);
end
