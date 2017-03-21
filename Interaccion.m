% Interacción. Simular una interaccion cuando dos o mas particulas de la 
% matriz se encuentran cercanas entre si y ocurre una interaccion.
% Se introduce la variable C (carga aleatoria de particulas).

clear
clc
l = 4;
umbral = 0.5;
n = 10; % Numero de particulas.
d = 2; % Numero de dimensiones.
t = 30; % Numero de pasos.
vel = 0.5; % Valor maximo de paso dimensional permitido.
pos = unifrnd(0, l, n, d);
tam = 20 * ones(1, n); % Vector de tamaño para n particulas.
nmax = 100; % Maximo numero de particulas que pueden existir.
charges = unifrnd(-1,1,n,1)

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
  pos
  plot(pos(:, 1), pos(:, 2), 'o', 'markersize', 6); 
  axis([0 l 0 l]);
  pause(0.8);
  choque = [];
  contador = 0;
  sig = n + 1;
  for i = 1 : n-1
    for j = (i + 1) : n
      da = (pos(i, :) - pos(j, :)).^2;
      de = sqrt(sum(da))
      distance = sqrt(da);
      theta = atand( distance(2) / distance(1));
      if de < umbral
        fi = (charges(i) - charges(j))^2 / de^2
        fx = fi * cosd(theta);
        fy = fi * sind(theta);
        disx = sqrt((charges(i) - charges(j))^2 / fx);
        disy = sqrt((charges(i) - charges(j))^2 / fy);
        dis = [disx , disy]
          if charges(i) > 0 
            ci = 1;
          elseif
            ci = 0;
          endif
          if charges(j) > 0
            cj = 1;
          elseif
            cj = 0;
          endif
          if ci = cj
            choque(j,:) = pos(j,:) + dis
          elseif
            choque(j,:) = pos(j,:) - dis
          endif  
          contador++
      endif  
    endfor
  endfor
  if contador > 0
    hold on;
    plot(choque(:, 1), choque(:, 2), 'x', 'markersize', 12)
    axis([0 l 0 l]);
    pause(0.5);
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
   
   