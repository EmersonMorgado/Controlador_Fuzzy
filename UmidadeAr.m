## Author: Emerson <emerson@emerson-300E5M-300E5L>

function [Conj_Fuzzy] = UmidadeAr ()  ## Umidade Relativa do ar

function [r] = equacao_geral_reta (P1,P2)
  # retonra a equação da reta y = ax+b
  # y - y0 = m*(x - x0)
  # m = y1-y0 / x1-x0  
  
  m = (P2(2)-P1(2))/(P2(1)-P1(1));
  b = m*(-P1(1))+P1(2);
  r(1,1) = m;
  r(2,1) = b;
endfunction
umidadeUx = 0:0.1:100; ## Universo de discurso
l = columns(umidadeUx);

# Umidade Baixa  U > 40
p1=[5 1];
p2=[50 0];
r= equacao_geral_reta (p1,p2);
for i=1:l
  if umidadeUx(i)<p1(1);
    umidadeBaixa(1,i) = 1;
    umidadeBaixa(2,i) = 1;
  elseif  (p1(1)<= umidadeUx(i)) & (umidadeUx(i)<= p2(1))
    umidadeBaixa(1,i) = r(1)*umidadeUx(i)+r(2);
    umidadeBaixa(2,i) = 1;
  else;
    umidadeBaixa(1,i) = 0;
    umidadeBaixa(2,i) = 0;
  endif
endfor
%
l0 = 1;
l1 = find(umidadeUx==p2(1));
plot(umidadeUx(l0:l1),umidadeBaixa(1,l0:l1),'.');
hold on;
%}

# Umidade Moderada 40< U < 80
p1=[20 0];
p2=[50 1];
p3=[80 0];
r1= equacao_geral_reta (p1,p2);
r2= equacao_geral_reta (p2,p3);
for i=1:l
  if umidadeUx(i)<p1(1);
    umidadeModerada(1,i) = 1;
    umidadeModerada(2,i) = 1;
  elseif  (p1(1)<= umidadeUx(i)) & (umidadeUx(i)<= p2(1))
    umidadeModerada(1,i) = r1(1)*umidadeUx(i)+r1(2);
    umidadeModerada(2,i) = 1;
  elseif  (p2(1)<= umidadeUx(i)) & (umidadeUx(i)<= p3(1))
    umidadeModerada(1,i) = r2(1)*umidadeUx(i)+r2(2);
    umidadeModerada(2,i) = 1;
    else;
    umidadeModerada(1,i) = 0;
    umidadeModerada(2,i) = 0;
  endif
endfor
%
l0 = find(umidadeUx==p1(1));
l1 = find(umidadeUx==p3(1));
plot(umidadeUx(l0:l1),umidadeModerada(1,l0:l1),'.');
hold on;
%}
# Umidade Alta  U > 80
p1=[50 0];
p2=[95 1];
r= equacao_geral_reta (p1,p2);
for i=1:l
  if umidadeUx(i)<p1(1);
    umidadeAlta(1,i) = 0;
    umidadeAlta(2,i) = 0;
  elseif  (p1(1)<= umidadeUx(i)) & (umidadeUx(i)<= p2(1))
    umidadeAlta(1,i) = r(1)*umidadeUx(i)+r(2);
    umidadeAlta(2,i) = 1;
  else;
    umidadeAlta(1,i) = 1;
    umidadeAlta(2,i) = 1;
  endif
endfor
%
l0 = find(umidadeUx==p1(1));
l1 = l;
plot(umidadeUx(l0:l1),umidadeAlta(1,l0:l1),'.');
hold on;
title ("Umidade relativa do Ar média diária");
xlabel ("%");
ylabel ("u(x)");
legend ("Baixa","Média","Alta");
xlim ([0 umidadeUx(end)]);
ylim ([0 1.5]);
%}
Conj_Fuzzy(1,:)= umidadeUx;
Conj_Fuzzy(2,:)= umidadeBaixa(1,:);
Conj_Fuzzy(3,:)= umidadeBaixa(2,:);
Conj_Fuzzy(4,:)= umidadeModerada(1,:);
Conj_Fuzzy(5,:)= umidadeModerada(2,:);
Conj_Fuzzy(6,:)= umidadeAlta(1,:);
Conj_Fuzzy(7,:)= umidadeAlta(2,:);
endfunction
