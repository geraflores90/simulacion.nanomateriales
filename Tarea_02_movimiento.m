% Se intetará introducir movimiento a la partícula mediante la introducción de 
% la variable de t (tiempo)
clear
clc
l=2; % Distancia de eje
p=1; % Resolución (Determinar en quÃé parte del código se introducirá ésta 
     % variable)
n=3; % Número de partículas
d=3; % Dimensión
nm=3; % Número de movimientos que realizará la partícula.

k=(2*l/p)+1; % Posiciones permitidas

m=round(unifrnd(1,k,n,d)) % Matriz aleatoria de n partículas con d dimensiones 
                          % redondeada

for i=1:n
  for j=1:d
  dist1(i,j)=(m(i,j)-1)*p+(-l) %Asigna la posición en función de p
  end                              
end

x=randi([-1,1],n,d)

for i=1:n
    for j=1:d
    z=j+1;
  
    if x(i,j)==0
   
            while z<=d 
            x(i,z)=round(randi([0,1],1,1))
                if x(i,z)==0
                    
                end
            end
       
         
    elseif x(i,j)~=0
        x(i,z)=0
    end 
    end
    
end

%Se logra generar una matriz de unos y ceros para dos dimensiones
%falta generalizar para n dimensiones.



% for i=1:nm
% for j=1:d
  
  
 
% end
  




  