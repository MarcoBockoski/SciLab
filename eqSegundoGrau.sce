//Script em SciLbab (Eq. do 2° Grau)
clc
//clear console

a = 1; b = 2; c = 1;
delta = sqrt(b^2-4*a*c);
x1 = (-b-delta)/2*a;
x2 = (-b+delta)/2*a;

disp("x1 = ",x1); //disp == diplay,  argumentos dips("x1 =",x1) textos e variáveis
disp("x2 = ",x2);

//plotando o gráfico dessa função com esses coeficientes

//x=-3:0.1:3; //limiteInferior:Passo:limiteSuperior -> De limite a limite, passo a passo.

//y=a*x^2+b*x+c;

//plot(x,y);

t =0:0.0001:0.02;
//pi = 3,1416;

y2 =2*sin(2*%pi*60*t)+0.1*sin(2*%pi*120*t)+0.05*sin(2*%pi*240*t)+0.025*sin(2*%pi*360*t); //funcao seno = coeficiente*seno + componente contínuo, tudo cresce a partir dele
//componente continuo é um sinal dc, obtido da senoido pela media da senoide
//colocando os coeficientes na frente do seno e dividindo por 10, ocorre a filtragem do sinal, redução do efeito do sinal com frequências específicas

//tirando o valor contínuo -> tira a média, a média é o componente contínuo, sinal puro AC = sinal - componente contínua

//Processamento Digital de Dados
plot(t,y2);
