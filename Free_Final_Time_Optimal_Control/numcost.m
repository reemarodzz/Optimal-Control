function y = numcost(p)
assignin('base', 'tfinal', p(end));
tp=[0:0.02:1]';
u=[p(1:end-1)];
[tout,yout]=sim('SRAM2',1,[],[tp u]);
y = p(end);
end