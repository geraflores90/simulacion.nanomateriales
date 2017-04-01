% Fase 1: Simular movimiento de agitador en un molino "bidimensional".

clc, clear

r = 2;
aspa = r - 1.5;
x = 0: 0.01: 2*r;
yup = sqrt(r^2 - (x - r).^2) + r;
ydown = -1 * sqrt(r^2 - (x - r).^2) + r;


plot(x,yup)
hold on
plot(x,ydown)
hold on

aspa1 = x;
aspa2 = -x + 2*r;
stirring1 = plot(x,aspa1);
hold on 
stirring2 = plot(x,aspa2);
hold on

for ang=1:360
  rotate(stirring1,[0 0 1],1);
  rotate(stirring2,[0 0 1],1);
  drawnow;
end






