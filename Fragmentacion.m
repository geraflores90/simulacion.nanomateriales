% Fragmentacion. Simular una interaccion cuando dos o mas particulas de la 
% matriz ocupan la misma posicion.
% Se introduce la variable tam (tamaño de particula).

clear
clc
l = 4;
umbral = 0.1;
n = 30; % Numero de particulas.
d = 2; % Numero de dimensiones.
t = 30; % Numero de pasos.
vel = 0.5; % Valor maximo de paso dimensional permitido.
pos = unifrnd(0, l, n, d);
tam = 20 * ones(1, n); % Vector de tamaño para n particulas.
nmax = 100; % Maximo numero de particulas que pueden existir.

for paso = 1:t 
  pos += unifrnd(-vel, vel, n, d);
  for i = 1 : n 
    for j = 1 : d 
      if pos(i, j) < 0
        pos(i, j) = abs(pos(i, j));
      elseif pos(i, j) > l
        pos(i, j) = 2 * l - pos(i, j);
      endif
    endfor
  endfor    
  plot(pos(:, 1), pos(:, 2), 'o', 'markersize', 6); 
  axis([0 l 0 l]);
  pause(0.2);
  choque = [];
  contador = 0;
  sig = n + 1;
  for i = 1 : n-1
    for j = (i + 1) : n
      de = sqrt((pos(i, :) - pos(j, :)).^2);
      if de < umbral
        dif = umbral - de;
        if rand() < dif / umbral
          ti = tam(i);
          if ti > 2
            tam(i) = 1 + randi(ti - 2);
            fi = ti - tam(i);
            tam(sig) = fi; 
            pos(sig, :) = pos(i, :);
            sig++;
          endif
          tj = tam(j);
          if tj > 2
            tam(j) = 1 + randi(tj - 2);
            fj = tj - tam(j);
            tam(sig) = fj; 
            pos(sig, :) = pos(j, :);
            sig++;
          endif
          contador++;
          choque(contador, :) = pos(i,:); 
        endif 
      endif  
    endfor
  endfor
  if contador > 0
    hold on;
    plot(choque(:, 1), choque(:, 2), 'x', 'markersize', 12)
    axis([0 l 0 l]);
    pause(0.1);
    hold off;
  endif
  n = sig - 1
  avg = mean(tam)
  total = sum(tam)
  menor = min(tam)
  mayor = max(tam)
  if n >= nmax
    n
    paso
    break;
  endif
endfor
   