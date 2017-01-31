% nuevo programa
clear
clc
l=2; % Distancia de eje
p=1; % Resolución (Determinar en qué parte del código se introducirá ésta variable)
n=20; % Número de partículas
d=2; % Dimensión

k=(2*l/p)+1; % Posiciones permitidas

m=round(unifrnd(1,k,n,d)); % Matriz aleatoria de n partículas con d dimensiones redondeada

for i=1:n
  for j=1:d
  dist1(i,j)=(m(i,j)-1)*p+(-l);
  end 
end

dist1;

for i=1:n
  md=dist1(i,:);
  md2=md.^2;
  s=sum(md2);
  dist(i)=sqrt(s)
 
end
  
hist(dist)



  