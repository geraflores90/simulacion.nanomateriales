% Se intetar� introducir movimiento a la part�cula mediante la introducci�n de 
% la variable de t (tiempo)
clear
clc
l=2; % Distancia de eje
p=1; % Resoluci�n (Determinar en qu�� parte del c�digo se introducir� �sta 
     % variable)
n=2; % N�mero de part�culas
d=3; % Dimensi�n
nm=3; % N�mero de movimientos que realizar� la part�cula.

k=(2*l/p)+1; % Posiciones permitidas

m=round(unifrnd(1,k,n,d)); % Matriz aleatoria de n part�culas con d dimensiones 
                          % redondeada

for i=1:n
  for j=1:d
  dist1(i,j)=(m(i,j)-1)*p+(-l); %Asigna la posici�n en funci�n de p
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
   
 %se logr� crear arreglos de d=3, es necesario concatenarlos de manera
 %vertical para crear una sola matriz de n x d.


% for i=1:nm
% for j=1:d
  
  
 
% end
  




  