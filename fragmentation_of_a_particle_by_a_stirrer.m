clear,clc

l = 4;
umbral = 0.1;
n = 1; % Numero de particulas.
d = 2; % Numero de dimensiones.
t = 150; % Numero de pasos.
vel = 0.5; % Valor maximo de paso dimensional permitido. STIRRER
vel_p = zeros(1, n);
pos = unifrnd(0.2 * l, 0.8 * l, n, d); % 0.2 y 0.8 son valores arbitrarios para que las particulas esten dentro del molino. 
tam = 20 * ones(1, n); % Vector de tamaño para n particulas.
nmax = 100; % Maximo numero de particulas que pueden existir.
vel_stirr = 0.01*pi;
theta = zeros(1, n);
st_spacing = 30;
vel_imp = 0.30;

r_mill = 2;
r_st = 1.5;
x = 0: 0.01: 2*r_mill;
yup = sqrt(r_mill^2 - (x - r_mill).^2) + r_mill;
ydown = -1 * sqrt(r_mill^2 - (x - r_mill).^2) + r_mill;
mill = vertcat(horzcat(x',yup'),horzcat(x',ydown'));
sz_mill = size(mill);
%plot(mill(:, 1), mill(:, 2));
%hold on

%plot(pos(:, 1), pos(:, 2), 'o', 'markersize', 6);
%hold on

t1 = 0.25*pi;
t2 = 0.75*pi;
for i = 1:t
  plot(mill(:, 1), mill(:, 2));
  hold on
  for w = 1:n
    deltax = vel_p(w) * cosd(theta(w));
    deltay = vel_p(w) * sind(theta(w));
    delta = horzcat(deltax, deltay);
    pos(w,:) += delta;
  endfor
  theta_s1 = (linspace(t1, t1, st_spacing))';
  theta_s2 = (linspace(t2, t2, st_spacing))';
  r_stirr = (linspace(-r_st, r_st, st_spacing))';
  x_s1 = (r_stirr * cos(t1)) + r_mill;
  y_s1 = (r_stirr * sin(t1)) + r_mill;
  x_s2 = (r_stirr * cos(t2)) + r_mill;
  y_s2 = (r_stirr * sin(t2)) + r_mill;
  stirrer = vertcat(horzcat(x_s1,y_s1),horzcat(x_s2,y_s2));
  plot(stirrer(:, 1), stirrer(:, 2), 'o', 'markersize', 1);
  axis([0 l 0 l]);
  hold on 
  t1 += vel_stirr;
  t2 += vel_stirr;
  sz = size(stirrer);
  choque = [];
  contador = 0;
  sig = n + 1;
  for i = 1:n % Colisiones contra el stirrer. 
    for j = 1:sz(1)
      dis_ns = sqrt(sum((pos(i,:) - stirrer(j,:)).^2));
        if dis_ns <= umbral % Aqui ya existe una colision. 
          pos(i,:);
          stirrer(j,:);
          p = stirrer(j,:)-2;
          rad = sqrt(sum(p.^2));
          th = acosd(abs(p(1))/rad);
          if p(1)>0 && p(2)>0
            th += 0;
          endif
          if p(1)<0 && p(2)>0
            th = 180 - th;
          endif
          if p(1)<0 && p(2)<0
            th += 180;
          endif
          if p(1)>0 && p(2)<0
            th = 360 - th;
          endif
          theta(i) = th + 90;
          vel_p(i) = vel_imp * (rad / r_st);
        endif
      dif = umbral - dis_ns;
        if rand() < dif / umbral % Fragmentacion aleatoria.
          ti = tam(i);
          if ti > 2
            tam(i) = 1 + randi(ti - 2); % El rompimiento deberia estar en funcion de algo, no debe ser aleatorio.
            fi = ti - tam(i);
            tam(sig) = fi;
            pos(sig, :) = pos(i, :);
            theta(sig) = theta(i) + 3;
            vel_p(sig) = vel_imp * (rad / r_st);
            sig++;
          endif
        endif
    endfor 
  endfor
  % Que no escapen las partículas del cilindro!!!
  for i = 1:n
    for j = 1:sz_mill(1)
      dis_nm = sqrt(sum((pos(i,:) - mill(j,:)).^2));
        if dis_nm <= 0.3 % Colision con cilindro.
          theta(i) += 180;
        endif
    endfor
  endfor
  n = sig - 1;
  plot(pos(:, 1), pos(:, 2), 'o', 'markersize', 5);
  pause(0.05)
  hold off
endfor