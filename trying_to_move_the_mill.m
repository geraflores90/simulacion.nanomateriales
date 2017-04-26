clear,clc

l = 4;
umbral = 0.1;
n = 3; % Numero de particulas.
d = 2; % Numero de dimensiones.
t = 15; % Numero de pasos.
vel = 0.5; % Valor maximo de paso dimensional permitido.
pos = unifrnd(0.2 * l, 0.8 * l, n, d); % 0.2 y 0.8 son valores arbitrarios para que las particulas esten dentro del molino. 
tam = 20 * ones(1, n); % Vector de tamaño para n particulas.
nmax = 100; % Maximo numero de particulas que pueden existir.
vel_stirr = 0.01*pi;
thetacol = (20 * zeros (1,n))';

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
for i=1:30
  theta_s1 = (linspace(t1, t1, 20))';
  theta_s2 = (linspace(t2, t2, 20))';
  r_stirr = (linspace(-r_st, r_st, 20))';
  x_s1 = (r_stirr * cos(t1)) + r_mill;
  y_s1 = (r_stirr * sin(t1)) + r_mill;
  x_s2 = (r_stirr * cos(t2)) + r_mill;
  y_s2 = (r_stirr * sin(t2)) + r_mill;
  stirrer = vertcat(horzcat(x_s1,y_s1),horzcat(x_s2,y_s2));
  plot(stirrer(:, 1), stirrer(:, 2), 'o', 'markersize', 1);
  t1 += vel_stirr;
  t2 += vel_stirr;
  sz = size(stirrer);
  choque = [];
  contador = 0;
  sig = n + 1;
  for i = 1:n % Colisiones contra el stirrer.
    for j = 1:sz(1)
      dis_ns = sqrt(sum((pos(i,:)-stirrer(j,:)).^2));
      dif = umbral - dis_ns;
        if rand() < dif / umbral % Puede o no fragmentarse en funcion de este rand()
          ti = tam(i);
          if ti > 2
            tam(i) = 1 + randi(ti - 2); % en el nuevo codigo, el rompimiento debe estar en funcion de algo, no debe ser aleatorio.
            fi = ti - tam(i);
            tam(sig) = fi;
            pos(sig, :) = pos(i, :) + 0.02;
            chubidubi = pos(i,:);
              if chubidubi(1) > l/2 && chubidubi(2) > l/2
                thetacol(i) = 135;
              endif
              if chubidubi(1) < l/2 && chubidubi(2) > l/2
                thetacol(i) = 225;
              endif
              if chubidubi(1) < l/2 && chubidubi(2) < l/2
                thetacol(i) = 315;
              endif
              if chubidubi(1) > l/2 && chubidubi(2) < l/2
                thetacol(i) = 45;
              endif
            thetacol(sig) = thetacol(i) + 5;
            delta_x = 0.15 * cosd(thetacol(i));
            delta_y = 0.15 * sind(thetacol(i));
            delta = horzcat(delta_x, delta_y);
            pos(i,:) += delta;
            pos(sig,:) += delta;
            plot(pos(:, 1), pos(:, 2), 'o', 'markersize', 6);
            sig++;
          endif    
        endif  
    endfor 
  endfor
  
  pause(0.5)
  
endfor

