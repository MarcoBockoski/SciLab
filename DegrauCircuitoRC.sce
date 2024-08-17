clc
s = %s;
disp("Circuito RC")
C = 1e-6;//C = 1uF
R = 100;//R = 100ohms
Tau = R*C;
disp("A contante de tempo é:",Tau)
G = syslin('c',(1/(R*C)),(s + (1/(R*C))));
disp ("G1 no formato polinomial canônico:")
disp ("G1(s)=  ",G) 
t = 0:0.00001:0.0006; 
y1 = csim('step',t,G); 
plot(t,y1) 
xgrid() 
xtitle('Resposta ao Degrau de G','tempo (s)','Saida')
