clc

s = %s; //j.omega, tipo de variável do scilab 

disp("Circuito RLC")
L = 1e-3;
C = 1e-6;
R = 10;

G1 = syslin('c', 1, L*C*s^2+L/R*s+1);
disp("G1 no formato polinomial")
disp("G1(s)= ", G1);

G2 = syslin('c',1/(L*C), s^2+(1/(R*C))*s+(1/(L*C)));

disp("G2, sendo G1 no formato polinomial canônico")
disp("G2(s)= ", G2);

a = 1; b = (1/(R*C)); c = (1/(L*C));
p1 =(-b+(sqrt(b^2-4*a*c)))/(2*a)
p2 = (-b-(sqrt(b^2-4*a*c)))/(2*a)
G2 = syslin('c',1/(L*C), (s-p1)*(s-p2)); //formato de polos, não printa pois ele já faz o produto

t = 0:0.00001:0.001;

y = csim('imp',t,G1);
plot(t,y)
xgrid()
xtitle('Resposta Impulsiva de G1','tempo (s)', 'Amplitude de y')

