clear,clc

l = 4;
umbral = 0.1;
n = 20; % Numero de particulas.
d = 2; % Numero de dimensiones.
t = 15; % Numero de pasos.
vel = 0.5; % Valor maximo de paso dimensional permitido.
pos = unifrnd(0.2 * l, 0.8 * l, n, d); % 0.2 y 0.8 son valores arbitrarios para que las particulas esten dentro del molino. 
tam = 20 * ones(1, n); % Vector de tamaño para n particulas.
nmax = 100; % Maximo numero de particulas que pueden existir.
vel_stirr = 0.01*pi;

r_mill = 2;
r_st = 1.5;
x = 0: 0.01: 2*r_mill;
yup = sqrt(r_mill^2 - (x - r_mill).^2) + r_mill;
ydown = -1 * sqrt(r_mill^2 - (x - r_mill).^2) + r_mill;
mill = vertcat(horzcat(x',yup'),horzcat(x',ydown'));
plot(mill(:, 1), mill(:, 2));
hold on

plot(pos(:, 1), pos(:, 2), 'o', 'markersize', 6);
hold on

t1 = 0.25*pi;
t2 = 0.75*pi;
for i=1:10
  theta_s1 = (linspace(t1, t1, 100))';
  theta_s2 = (linspace(t2, t2, 100))';
  r_stirr = (linspace(-r_st, r_st, 100))';
  x_s1 = (r_stirr * cos(t1)) + r_mill;
  y_s1 = (r_stirr * sin(t1)) + r_mill;
  x_s2 = (r_stirr * cos(t2)) + r_mill;
  y_s2 = (r_stirr * sin(t2)) + r_mill;
  stirrer = vertcat(horzcat(x_s1,y_s1),horzcat(x_s2,y_s2));
  plot(stirrer(:, 1), stirrer(:, 2), 'o', 'markersize', 1);
  t1 += vel_stirr;
  t2 += vel_stirr;
  pause(0.5)
  
endfor