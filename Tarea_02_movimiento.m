% Se intetar� introducir movimiento a la part�cula mediante la introducci�n de 
% la variable de t (tiempo)
clear
clc
l=2; % Distancia de eje
p=1; % Resoluci�n (Determinar en qu�� parte del c�digo se introducir� �sta 
     % variable)
n=2; % N�mero de part�culas
d=2; % Dimensi�n
nm=3; % N�mero de movimientos que realizar� la part�cula.

k=(2*l/p)+1; % Posiciones permitidas

m=round(unifrnd(1,k,n,d)) % Matriz aleatoria de n part�culas con d dimensiones 
                          % redondeada

for i=1:n
  for j=1:d
  dist1(i,j)=(m(i,j)-1)*p+(-l); %Asigna la posici�n en funci�n de p
  end                              
end

x=randi([-1,1],n,d)

for i=1:n
    
    
    if x(i,1)==0
         x(i,2)=round(randi([0,1],1,1))
            if x(i,2)==0
                x(i,2)=-1
            end
         
    elseif x(i,1)~=0
        x(i,2)=0
    end 
    
end

%Se logra generar una matriz de unos y ceros para dos dimensiones
%falta generalizar para n dimensiones.

%bibubipi

% for i=1:nm
% for j=1:d
  
  
 
% end
  




  