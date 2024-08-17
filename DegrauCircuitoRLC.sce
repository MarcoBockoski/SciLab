clc
s = %s;
disp("Circuito RLC")
L = 1e-3; 
C = 1e-6;
R = 15;
G = syslin('c',1/(L*C),s^2+(1/(R*C))*s+(1/(L*C)));
disp ("G no formato polinomial canônico:")
disp ("G(s)=  ",G)
t = 0:0.000001:0.0005; 
y = csim('step',t,G); 
plot(t,y)
xgrid() 
xtitle('Resposta ao Degrau de G','tempo (s)','Saida') 
