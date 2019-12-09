
## Author: Emerson <emerson@emerson-300E5M-300E5L>

function [Conj_Fuzzy] = Temperatura ()  ## demanda evaporativa

function [r] = equacao_geral_reta (P1,P2)
  # retonra a equação da reta y = ax+b
  # y - y0 = m*(x - x0)
  # m = y1-y0 / x1-x0  
  
  m = (P2(2)-P1(2))/(P2(1)-P1(1));
  b = m*(-P1(1))+P1(2);
  r(1,1) = m;
  r(2,1) = b;
endfunction

tempUx = 0:0.1:50; ## Universo de discurso
l = columns(tempUx);

# Temperatura baixa  até 15º C
p1=[10 1];
p2=[25 0];
r= equacao_geral_reta (p1,p2);
for i=1:l
  if tempUx(i)<p1(1);
    tempBaixa(1,i) = 1;
    tempBaixa(2,i) = 1;
  elseif  (p1(1)<= tempUx(i)) & (tempUx(i)<= p2(1))
    tempBaixa(1,i) = r(1)*tempUx(i)+r(2);
    tempBaixa(2,i) = 1;
  else;
    tempBaixa(1,i) = 0;
    tempBaixa(2,i) = 0;
  endif
endfor
%
l0 = 1;
l1 = find(tempUx==p2(1));
plot(tempUx(l0:l1),tempBaixa(1,l0:l1),'.');
hold on;
%}
# Temperatura moderada  até entre 15º e 35º C
p1=[10 0];
p2=[25 1];
p3=[40 0];
r1= equacao_geral_reta (p1,p2);
r2= equacao_geral_reta (p2,p3);
for i=1:l
  if tempUx(i)<p1(1);
    tempModerada(1,i) = 0;
    tempModerada(2,i) = 0;
  elseif  (p1(1)<= tempUx(i)) & (tempUx(i)<= p2(1))
    tempModerada(1,i) = r1(1)*tempUx(i)+r1(2);
    tempModerada(2,i) = 1;
  elseif  (p2(1)<= tempUx(i)) & (tempUx(i)<= p3(1))
    tempModerada(1,i) = r2(1)*tempUx(i)+r2(2);
    tempModerada(2,i) = 1;
  else;
    tempModerada(1,i) = 0;
    tempModerada(2,i) = 0;
  endif
endfor
%
l0 = find(tempUx==p1(1));
l1 = find(tempUx==p3(1));
plot(tempUx(l0:l1),tempModerada(1,l0:l1),'.');
hold on;
%}
# Temperatura Alta maior que e 35º C
p1=[25 0];
p2=[40 1];
r1= equacao_geral_reta (p1,p2);
for i=1:l
  if tempUx(i)<p1(1);
    tempAlta(1,i) = 0;
    tempAlta(2,i) = 0;
  elseif  (p1(1)<= tempUx(i)) & (tempUx(i)<= p2(1))
    tempAlta(1,i) = r1(1)*tempUx(i)+r1(2);
    tempAlta(2,i) = 1;
  else;
    tempAlta(1,i) = 1;
    tempAlta(2,i) = 1;
  endif
endfor
%
l0 = find(tempUx==p1(1));
l1 = l;
plot(tempUx(l0:l1),tempAlta(1,l0:l1),'.');
hold on;
title ("Temperatura ambiente.");
xlabel ("ºC");
ylabel ("u(x)");
legend ("Baixa","Moderada","Alta");
xlim ([0 tempUx(end)]);
ylim ([0 1.5]);
%}
Conj_Fuzzy(1,:)= tempUx;
Conj_Fuzzy(2,:)= tempBaixa(1,:);
Conj_Fuzzy(3,:)= tempBaixa(2,:);
Conj_Fuzzy(4,:)= tempModerada(1,:);
Conj_Fuzzy(5,:)= tempModerada(2,:);
Conj_Fuzzy(6,:)= tempAlta(1,:);
Conj_Fuzzy(7,:)= tempAlta(2,:);

%{
R = tempUx'
l = rows(Conj_Fuzzy);
for i=1:l
  R(:,i) = Conj_Fuzzy(i,:)'
endfor
%}
endfunction
