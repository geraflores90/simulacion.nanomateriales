% Fase 1: Simular movimiento de agitador en un molino "bidimensional".

clc, clear

rm = 4;
rasp = 3;

theta_m = linspace(0, 2 * pi, 1000); 
radio_m = linspace(rm, rm, 1000); 
polar(theta_m, radio_m)
hold on

theta_aspa1 = linspace(0, 0, 1000);
aspa1 = linspace(-rasp, rasp, 1000);
polar(theta_aspa1, aspa1)
hold on 

theta_aspa2 = linspace(pi/2, pi/2, 1000);
aspa2 = linspace(-rasp, rasp, 1000);
polar(theta_aspa2, aspa2)
hold on



