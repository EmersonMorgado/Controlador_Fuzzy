## Author: Emerson <emerson@emerson-300E5M-300E5L>

function [Conj_Fuzzy] = DemandaHidrica ()  ## Umidade Relativa do ar

function [r] = equacao_geral_reta (P1,P2)
  # retonra a equação da reta y = ax+b
  # y - y0 = m*(x - x0)
  # m = y1-y0 / x1-x0  
  
  m = (P2(2)-P1(2))/(P2(1)-P1(1));
  b = m*(-P1(1))+P1(2);
  r(1,1) = m;
  r(2,1) = b;
endfunction

aguaUx = 0:0.1:100; ## Universo de discurso
l = columns(aguaUx);

# Demanda Hídrica  mínima
p1=[20 1];
p2=[40 0];
r= equacao_geral_reta (p1,p2);
for i=1:l
  if aguaUx(i)<p1(1);
    aguaMinima(1,i) = 1;
    aguaMinima(2,i) = 1;
  elseif  (p1(1)<= aguaUx(i)) & (aguaUx(i)<= p2(1))
    aguaMinima(1,i) = r(1)*aguaUx(i)+r(2);
    aguaMinima(2,i) = 1;
  else;
    aguaMinima(1,i) = 0;
    aguaMinima(2,i) = 0;
  endif
endfor
%
l0 = 1;
l1 = find(aguaUx==p2(1));
plot(aguaUx(l0:l1),aguaMinima(1,l0:l1),'.');
hold on;

# Demanda Hídrica  Média
p1=[20 0];
p2=[50 1];
p3=[80 0];
r1= equacao_geral_reta (p1,p2);
r2= equacao_geral_reta (p2,p3);
for i=1:l
  if aguaUx(i)<p1(1);
    aguaMedia(1,i) = 0;
    aguaMedia(2,i) = 0;
  elseif  (p1(1)<= aguaUx(i)) & (aguaUx(i)<= p2(1))
    aguaMedia(1,i) = r1(1)*aguaUx(i)+r1(2);
    aguaMedia(2,i) = 1;
  elseif  (p2(1)<= aguaUx(i)) & (aguaUx(i)<= p3(1))
    aguaMedia(1,i) = r2(1)*aguaUx(i)+r2(2);
    aguaMedia(2,i) = 1;
    else;
    aguaMedia(1,i) = 0;
    aguaMedia(2,i) = 0;
  endif
endfor
%
l0 = find(aguaUx==p1(1));
l1 = find(aguaUx==p3(1));
plot(aguaUx(l0:l1),aguaMedia(1,l0:l1),'.');
hold on;

# Demanda Hídrica  Média
p1=[60 0];
p2=[80 1];
r1= equacao_geral_reta (p1,p2);
for i=1:l
  if aguaUx(i)<p1(1);
    aguaMaxima(1,i) = 0;
    aguaMaxima(2,i) = 0;
  elseif  (p1(1)<= aguaUx(i)) & (aguaUx(i)<= p2(1))
    aguaMaxima(1,i) = r1(1)*aguaUx(i)+r1(2);
    aguaMaxima(2,i) = 1;
    else;
    aguaMaxima(1,i) = 1;
    aguaMaxima(2,i) = 1;
  endif
endfor
%
l0 = find(aguaUx==p1(1));
l1 = find(aguaUx==aguaUx(end));
plot(aguaUx(l0:l1),aguaMaxima(1,l0:l1),'.');
hold on;

title ("Demanda Hídrica de irrigação");
xlabel ("Irrigação Minima e Máxima (%)");
ylabel ("u(x)");
legend ("Irrigação Mínima","Irrigação Média","Irrigação Máxima");
xlim ([0 aguaUx(end)]);
ylim ([0 1.5]);
%}
Conj_Fuzzy(1,:)= aguaUx(1,:);
Conj_Fuzzy(2,:)= aguaMinima(1,:);
Conj_Fuzzy(3,:)= aguaMinima(2,:);
Conj_Fuzzy(4,:)= aguaMedia(1,:);
Conj_Fuzzy(5,:)= aguaMedia(2,:);
Conj_Fuzzy(6,:)= aguaMaxima(1,:);
Conj_Fuzzy(7,:)= aguaMaxima(2,:);
endfunction
