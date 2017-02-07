% Se intetara introducir movimiento a la particula mediante la introduccion de 
% la variable de t (tiempo)
clear
clc
l=2; % Distancia de eje
p=1; % Resolucion (Determinar en que parte del codigo se introducira esta 
     % variable)
n=3; % Numero de particulas
d=3; % Dimension
nm=3; % Numero de movimientos que realizara la particula.

k=(2*l/p)+1; % Posiciones permitidas

m=round(unifrnd(1,k,n,d)); % Matriz aleatoria de n particulas con d dimensiones 
                          % redondeada

for i=1:n
  for j=1:d
  dist(i,j)=(m(i,j)-1)*p+(-l); % Asigna la posicion en funcion de p
  end                              
end

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

dist
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
            comp=comp+2;
            mov(i,j)=nop*comp;
        end
    end
end
mov

% for i=1:nm
% for j=1:d
  
% end
  




  