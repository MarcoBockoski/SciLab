clc; //separa as execuções anteriores da atual

s = %s; //s é a variável de laplace, o número complexo j.2.(pi).f ;  %s é uma variável complexa, com espaço para parte real e imaginária

disp("Circuito RC") //; oculta o resultado da operação, sem ele, o resultado é mostra

C = 0.1e-6; //C = 0,1uF, exemplos de números com potência de dez
R = 1e3;  //R = 10kOhms

//Definição da função de transferência

G = syslin('c',(1/(R*C)),(s + (1/(R*C))));
//syslin == sistema linear, função do scilab que trata sistemas lineares, tem como argumento vários argumentos
//primeiro argumento: consideração do tempo contínuo, definido para qualquer valor do tempo (poderia ser discreto, diria em quais tempos seria definido), aí oi programa executaria com outro procedimento matemático)
//segundo argumento: numerador da função de transferência
//terceiro argumento: denominador da função de transferência

disp("G no formato polinomial canônico: ") //Quando a variável s de maior grau tem coeficiente 1, tem s com grau zero, que são as constantes, sempre realiza as contas com os graus menores aos maiores grau
disp("G(s) = ", G)

//ajuste de parâmentros de simulação

t = 0:0.00001:0.001 //Começa em 0ms, tem passo de 0,1ms e vai até 100ms.
// obs. quanto menor o passo, mais fidedigna fica a imagem, porém o tempo de execução fica muito elevada (para processar os cálculos)
//se o passo for muito grande, a imagem não fica tão fidedigna, apesar disso, o tempo de execução fica mais breve

y = csim('imp', t, G);
//csim simulador de sinal em tempo contínuo
//t é o domínio
//G já vem convertida para o domínio do tempo

//Utilizando a função impulso (imp) de área 1 (unitário) como input do sistema, é alimentação cc (resposta forçada, colocou energia e manteve)
//resposta natural, colocou energia e dissipou
//a resposta forçada tem duas fases: transitório e regime permanente
//Fase transitória: período de adaptação e resistência da saída
//Regime permanente: período em que a saída se acostuma e não há oscilações de sinais na alimentação cc.

//Uma ED de primeira ordem influencia na função de tranferência, em relação ao grau de s que é 1. ED de segunda ordem gera função de transferência com s de grau 2.

plot(t,y)
xgrid() //coloca quadriculado
xtitle('Resposta ao Impulso Unitário', 'tempo(s)', 'Amplitude')
