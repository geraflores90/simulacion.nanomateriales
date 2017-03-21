% Interacción. Simular una interaccion cuando dos o mas particulas de la 
% matriz se encuentran cercanas entre si y ocurre una interaccion.
% Se introduce la variable C (carga aleatoria de particulas).

clear
clc
l = 4;
n = 80; % Numero de particulas.
d = 2; % Numero de dimensiones.
t = 80; % Numero de pasos.
at = 0.8;
re = 0.2;
vel = 0.0006; 
umbral = 0.005;
def = 0.02;
pos = unifrnd(0, l, n, d);
charges = unifrnd(-1, 1, n, 1);
charges(1) = 1;
charges(n) = -1;

for paso = 1:t 
  poscharges = [];
  negcharges = [];
  for i = 1 : n
    if charges(i) > 0
      poscharges = [poscharges ; pos(i,:)];
    elseif 
      negcharges = [negcharges ; pos(i,:)];
    endif
  endfor
  positives = rows(poscharges);
  negatives = rows(negcharges);
  plot(poscharges(:, 1), poscharges(:, 2), '+', 'markersize', 6); 
  axis([0 l 0 l]);
  hold on;
  plot(negcharges(:, 1), negcharges(:, 2), 'o', 'markersize', 6); 
  pause(0.3);
  hold off;
  f = zeros(n, 2);
  for i = 1 : n-1
    for j = (i + 1) : n
      dist = pos(j, :) - pos(i, :);
      df = [def, def];
      if abs(dist(1)) > umbral
         df(1) = 1 / dist(1);
      endif
      if abs(dist(2)) > umbral
         df(2) = 1 / dist(2);
      endif
      df *= abs(charges(i) - charges(j)); 
      if charges(i) * charges(j) < 0 # opposite signs attract
        f(j,:) -= at * df;
        f(i,:) += at * df;
      elseif # repel if the same sign
        f(j,:) += re * df;
        f(i,:) -= re * df;
      endif  
    endfor
  endfor
  #vel * f 
  for i = 1 : n
    pos(i, :) += vel * min(f(i, :), def);
    for j = 1 : d 
      if pos(i, j) < 0
        pos(i, j) += l;
      elseif pos(i, j) > l
        pos(i, j) -= l;
      endif
    endfor
  endfor    
endfor
   
   