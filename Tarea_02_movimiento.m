% Se intetará introducir movimiento a la partícula mediante la introducción de 
% la variable de t (tiempo)
clear
clc
l=2; % Distancia de eje
p=1; % Resolución (Determinar en quÃé parte del código se introducirá ésta 
     % variable)
n=2; % Número de partículas
d=3; % Dimensión
nm=3; % Número de movimientos que realizará la partícula.

k=(2*l/p)+1; % Posiciones permitidas

m=round(unifrnd(1,k,n,d)); % Matriz aleatoria de n partículas con d dimensiones 
                          % redondeada

for i=1:n
  for j=1:d
  dist1(i,j)=(m(i,j)-1)*p+(-l); %Asigna la posición en función de p
  end                              
end



for i=1:n
    x=zeros(1,d);
    b=randi([1,d],1,1);
    x(1,b)=randi([0,1]);
    if x(1,b)>0
        x(1,b)=1
    else
        x(1,b)=-1
    end 
   
end
   
 %se logró crear arreglos de d=3, es necesario concatenarlos de manera
 %vertical para crear una sola matriz de n x d.


% for i=1:nm
% for j=1:d
  
  
 
% end
  




  