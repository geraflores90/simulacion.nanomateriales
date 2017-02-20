% Se detectan colisiones a distintos intervalos.

clear
clc
l=4; % Distancia de eje
p=1; % Resolucion 
n=10; % Numero de particulas
d=2; % Dimension
nm=10; % Numero de movimientos que realizara la particula.

k=(2*l/p)+1; % Posiciones permitidas

m=round(unifrnd(1,k,n,d)); % Matriz aleatoria de n particulas con d dimensiones 
                          % redondeada

for i=1:n
  for j=1:d
  dist(i,j)=(m(i,j)-1)*p+(-l); % Asigna la posicion en funcion de p
  end                              
end

posicion_original=dist

for w=1:nm % Repite el numero de movimientos deseado.

  z=[];
    
  for i=1:n
      x=zeros(1,d);
      b=randi([1,d],1,1); % Selecciona aleatoriamente una dimension a modificar.
      x(1,b)=randi([0,1]); % Subprograma que aleatoriamete elige valor positivo o 
      if x(1,b)>0          % negativo a modificar.
          x(1,b)=1;
      else
          x(1,b)=-1;
      end 
  z=[z;x]; % Matriz aleatoria de unos y ceros.
  end

  dist;
  mov=dist+z;

  for i=1:n % Rebotar la particula que se encuentra en el limite permitido.
      for j=1:d 
          comp=l-abs(mov(i,j));
          if mov(i,j)<0
              nop=-1;
          else
              nop=1;
          end
          if comp<0
              comp=comp+l;
              mov(i,j)=nop*comp;
          end
      end
  end
    
  plot(mov(:,1),mov(:,2),'o','markersize',14); % Intentar generalizar a n dim
  axis([-l l -l l])
  
  saveas(gcf,strcat('figura',num2str(w),'.jpg'))
  
  vh = get(gca);
  pause(.1);
  contador = 0;
  
  choque=[];
  
  if n>1
    for i=1:n-1
      for j=(i+1):n
        if (sum(mov(i,:)==mov(j,:)) == d)
          contador=contador+1;
          crash=mov(i,:); %Choques individuales en la matriz.
          choque=[choque;crash] %Adjunta los choques individuales en una sola matriz.
        end
      end
    end
  end
  
  mov
  contador
  dist=mov;

end






  