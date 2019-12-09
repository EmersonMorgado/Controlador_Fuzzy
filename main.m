
clear all;
close all;
clc;
#A = [1 2 3 4 5 6];
#B = [2 5 8 9 4 8];
#x = [ 15 30 45 60 75 90];


function [Z] = conj_uniao_max (X,A,B)

  #Operação de União, utilizando o operador Max:
  # N: inteiro {Quantidade de elementos de discretização}
  # X: vetor[1..N] de reais {Valores dos elementos do universo de discurso X}
  # A: Vetor[1..N] de reais {Valores dos graus de pertinência de A}
  # B: Vetor[1..N] de reais {Valores dos graus de pertinência de B}
  # Z: Vetor[1..N] de reais {Valores dos graus de pertinência de A∪B}

  l = columns(A);
  for i=1:l
    Z(1,i)=A(i); 
    Z(2,i)=B(i);
    Z(3,i)=X(i);
    Z(4,i)=max(A(i),B(i));
  endfor
endfunction

function [Z] = conj_uniao_max_conj_fuzzy (Conj_Fuzzy)

  #Operação de União, utilizando o operador Max:
  # Conj_Fuzzy: Matriz n x m onde cada linha equivale a u(x) de um conjunto fuzzy,
  # a última linha da matriz representa o vetor x
  # Z: Matriz [2 x n] onde 1 linha é o u(x) max e linha 2 é o valor de x.

  Z(2,:)=Conj_Fuzzy(end,:);
  Conj_Fuzzy(end,:) = [];
  c = columns(Conj_Fuzzy);
  l = rows(Conj_Fuzzy);
  for j=1:c
    a=0;
    for i=1:l
      if rem(i,2)!=0
        if (Conj_Fuzzy(i+1,j)==1)
#          a = a*Conj_Fuzzy(i,j);
          a = max(Conj_Fuzzy(i,j), a);
        endif      
      endif
    endfor
    Z(1,j) = a;
  endfor
endfunction

function [Z] = conj_uniao_Soma_Algebrica_conj_fuzzy_1 (Conj_Fuzzy)

  #Operação de União, utilizando o operador Max:
  # Conj_Fuzzy: Matriz n x m onde cada linha equivale a u(x) de um conjunto fuzzy,
  # a última linha da matriz representa o vetor x
  # Z: Matriz [2 x n] onde 1 linha é o u(x) max e linha 2 é o valor de x.

  Z(2,:)=Conj_Fuzzy(end,:);
  Conj_Fuzzy(end,:) = [];
  c = columns(Conj_Fuzzy);
  l = rows(Conj_Fuzzy);
  for j=1:c
#    a=0;
#    for i=1:l
#      if rem(i,2)!=0
#        if (Conj_Fuzzy(i+1,j)==1)
     a = Conj_Fuzzy(1,j)+Conj_Fuzzy(3,j)-(Conj_Fuzzy(1,j)*Conj_Fuzzy(3,j));
          #a = max(Conj_Fuzzy(i,j), a);
#        endif      
#      endif
#    endfor
    Z(1,j) = a;
  endfor
endfunction



function [Z] = conj_intersecao_min (X,A,B)

  #Operação de interseção, utilizando o operador Min:
  # N: inteiro {Quantidade de elementos de discretização}
  # X: vetor[1..N] de reais {Valores dos elementos do universo de discurso X}
  # A: Vetor[1..N] de reais {Valores dos graus de pertinência de A}
  # B: Vetor[1..N] de reais {Valores dos graus de pertinência de B}
  # Z: Vetor[1..N] de reais {Valores dos graus de pertinência de A∪B}

  l = columns(A);
  for i=1:l
    Z(1,i)=A(i); 
    Z(2,i)=B(i);
    Z(3,i)=X(i);
    Z(4,i)=min(A(i),B(i));
  endfor
endfunction


function [Z] = conj_intersecao_min_conj_fuzzy (Conj_Fuzzy)

  #Operação de União, utilizando o operador Max:
  # Conj_Fuzzy: Matriz n x m onde cada linha equivale a u(x) de um conjunto fuzzy,
  # a última linha da matriz representa o vetor x
  # Z: Matriz [2 x n] onde 1 linha é o u(x) max e linha 2 é o valor de x.

  Z(2,:)=Conj_Fuzzy(end,:);
  Conj_Fuzzy(end,:) = [];
  c = columns(Conj_Fuzzy);
  l = rows(Conj_Fuzzy);
  for j=1:c
    a=1;
    for i=1:l
      if rem(i,2)!=0
        if (Conj_Fuzzy(i+1,j)==1)
#          a = a*Conj_Fuzzy(i,j);
          a = min(Conj_Fuzzy(i,j), a);
        endif      
      endif
    endfor
    Z(1,j) = a;
  endfor
endfunction

function [Z] = conj_intersecao_min_conj_fuzzy_1 (Conj_Fuzzy)

  #Operação de União, utilizando o operador Max:
  # Conj_Fuzzy: Matriz n x m onde cada linha equivale a u(x) de um conjunto fuzzy,
  # a última linha da matriz representa o vetor x
  # Z: Matriz [2 x n] onde 1 linha é o u(x) max e linha 2 é o valor de x.

  Z(2,:)=Conj_Fuzzy(end,:);
  Conj_Fuzzy(end,:) = [];
  c = columns(Conj_Fuzzy);
  l = rows(Conj_Fuzzy);
  for j=1:c
      if ((Conj_Fuzzy(2,j)==1) && (Conj_Fuzzy(4,j)==1))
          a = min(Conj_Fuzzy(1,j), Conj_Fuzzy(3,j));
#      elseif (Conj_Fuzzy(2,j)==1)
#          a=Conj_Fuzzy(1,j);
#      elseif (Conj_Fuzzy(4,j)==1)
#          a=Conj_Fuzzy(3,j);
      else
          a = 0; 
      endif

  
  Z(1,j) = a;
  endfor
endfunction

function [Z] = conj_intersecao_Produto_algebrico_conj_fuzzy_1 (Conj_Fuzzy)

  #Operação de União, utilizando o operador Max:
  # Conj_Fuzzy: Matriz n x m onde cada linha equivale a u(x) de um conjunto fuzzy,
  # a última linha da matriz representa o vetor x
  # Z: Matriz [2 x n] onde 1 linha é o u(x) max e linha 2 é o valor de x.

  Z(2,:)=Conj_Fuzzy(end,:);
  Conj_Fuzzy(end,:) = [];
  c = columns(Conj_Fuzzy);
  l = rows(Conj_Fuzzy);
  for j=1:c
#      if ((Conj_Fuzzy(2,j)==1) && (Conj_Fuzzy(4,j)==1))
         a = Conj_Fuzzy(1,j)* Conj_Fuzzy(3,j);
#      elseif (Conj_Fuzzy(2,j)==1)
#          a=Conj_Fuzzy(1,j);
#      elseif (Conj_Fuzzy(4,j)==1)
#          a=Conj_Fuzzy(3,j);
#      else
#          a = 0; 
 #     endif

  
  Z(1,j) = a;
  endfor
endfunction


function [Z] = conj_complemento (X,A)

  #Operação de complemento:
  # X: vetor[1..N] de reais {Valores dos elementos do universo de discurso X}
  # A: Vetor[1..N] de reais {Valores dos graus de pertinência de A}
  # Z: Vetor[1..N] de reais {Valores dos graus de complemento}

  l = columns(A);
  for i=1:l
    Z(1,i)=1-A(i); 
    Z(2,i)=X(i);
  endfor
endfunction


function [r] = equacao_geral_reta (P1,P2)
  # retonra a equação da reta y = ax+b
  # y - y0 = m*(x - x0)
  # m = y1-y0 / x1-x0  
  
  m = (P2(2)-P1(2))/(P2(1)-P1(1));
  b = m*(-P1(1))+P1(2);
  r(1,1) = m;
  r(2,1) = b;
endfunction

function [] = conjunto_ativo (x,Conj_Fuzzy)
#  l= columns(Conj_Fuzzy);
  l = find(Conj_Fuzzy(end,:) == x);
  if Conj_Fuzzy(1,l)>0 
    printf("Conjunto A Ativo, u(%d) é %d\n", x, Conj_Fuzzy(1,l));
  endif
  if Conj_Fuzzy(3,l)>0
    printf("Conjunto B Ativo, u(%d) é %d\n", x, Conj_Fuzzy(3,l));
  endif
  if Conj_Fuzzy(5,l)>0
    printf("Conjunto C Ativo, u(%d) é %d\n", x, Conj_Fuzzy(5,l));
  endif
  if Conj_Fuzzy(7,l)>0
    printf("Conjunto D Ativo, u(%d) é %d\n", x, Conj_Fuzzy(7,l));
  endif
  if Conj_Fuzzy(9,l)>0
    printf("Conjunto E Ativo, u(%d) é %d\n", x, Conj_Fuzzy(9,l));
  endif
endfunction


function [Conj_Fuzzy] = crisp (alfa, Conj_Fuzzy)
  c = columns(Conj_Fuzzy);
  l = rows(Conj_Fuzzy);
  for i=1:l-1   
    for j=1:c
      if rem(i,2)!=0
        if (Conj_Fuzzy(i,j)>alfa)
          Conj_Fuzzy(i,j) = alfa;
        endif;  
      endif
    endfor
  endfor
endfunction

function [RoS] = max_min (R,S)
#R = [0.1 0.6 0.4 0.9; 0.8 1 0.8 0.3; 0.5 0.7 0.2 0]
#S = [0.2 0.8 0.6; 0.4 0.3 0.1; 1.0 0 0.7; 0.9 0.7 0.2]
  x = rows(R);
  y = columns(R);
  z = columns(S)
  for k=1:z
    for i=1:x
      for j=1:y
        vRoS(j) = min(R(i,j),S(j,k));
      endfor 
      RoS(i,k) = max(vRoS);
    endfor 
  endfor  
endfunction

function [RoS] = max_prod (R,S)
  x = rows(R);
  y = columns(R);
  z = columns(S)
 
  for k=1:z
    for i=1:x
      for j=1:y
        vRoS(j) = (R(i,j)*S(j,k));
      endfor 
      RoS(i,k) = max(vRoS);
    endfor 
  endfor  
endfunction

function [RoS] = max_media (R,S)
  x = rows(R);
  y = columns(R);
  z = columns(S)
 
  for k=1:z
    for i=1:x
      for j=1:y
        vRoS(j) = (R(i,j)+S(j,k))/2;
      endfor 
      RoS(i,k) = max(vRoS);
    endfor 
  endfor  
endfunction

#--------------------------------------------------------------------------------------------

#S_Norma = conj_uniao_max (X,A,B)

#T_Norma = conj_intersecao_min (X,A,B)

#complemento = conj_complemento (X,A)

#mapeamento dos conjuntos fuzzy

x = 0:0.05:50;
#x = 0:1:50;
l = columns(x);

# conjunto A
p1=[5 1];
p2=[15 0];
r_a= equacao_geral_reta (p1,p2);
for i=1:l
  if x(i)<5
    A(1,i) = 1;
    A(2,i) = 1;
  elseif  (5<= x(i)) & (x(i)<= 15)
    A(1,i) = r_a(1)*x(i)+r_a(2);
    A(2,i) = 1;
  else
    A(1,i) = 0;
    A(2,i) = 0;
  endif
endfor
a0 = 1;
a1 = find(x==15);
plot(x(a0:a1),A(1,a0:a1),'.');
hold on;

# conjunto B
p1=[5 0];
p2=[15 1];
p3=[25 0];
r_b1= equacao_geral_reta (p1,p2);
r_b2= equacao_geral_reta (p2,p3);
for i=1:l
  if x(i)<5
    B(1,i) = 0;
    B(2,i) = 0;
  elseif  (5<= x(i)) & (x(i)<= 15)
    B(1,i) = r_b1(1)*x(i)+r_b1(2);
    B(2,i) = 1;
  elseif  (15< x(i)) & (x(i)<= 25)
    B(1,i) = r_b2(1)*x(i)+r_b2(2);  
    B(2,i) = 1;
  else
    B(1,i) = 0;
    B(2,i) = 0;
  endif
endfor
b0 = find(x==5);
b1 = find(x==25);
plot(x(b0:b1),B(1,b0:b1),'.');
hold on;

# conjunto c
p1=[15 0];
p2=[25 1];
p3=[35 0];
r_c1= equacao_geral_reta (p1,p2);
r_c2= equacao_geral_reta (p2,p3);
for i=1:l
  if x(i)<15
    C(1,i) = 0;
    C(2,i) = 0;
  elseif  (15<= x(i)) & (x(i)<= 25)
    C(1,i) = r_c1(1)*x(i)+r_c1(2);
    C(2,i) = 1;
  elseif  (25< x(i)) & (x(i)<= 35)
    C(1,i) = r_c2(1)*x(i)+r_c2(2);
    C(2,i) = 1;  
  else
    C(1,i) = 0;
    C(2,i) = 0;
  endif
endfor
c0 = find(x==15);
c1 = find(x==35);
plot(x(c0:c1),C(1,c0:c1),'.');
hold on;

# conjunto d
p1=[25 0];
p2=[35 1];
p3=[45 0];
r_d1= equacao_geral_reta (p1,p2);
r_d2= equacao_geral_reta (p2,p3);
for i=1:l
  if x(i)<25
    D(1,i) = 0;
    D(2,i) = 0;
  elseif  (25<= x(i)) & (x(i)<= 35)
    D(1,i) = r_d1(1)*x(i)+r_d1(2);
    D(2,i) = 1;
  elseif  (35< x(i)) & (x(i)<= 45)
    D(1,i) = r_d2(1)*x(i)+r_d2(2);
    D(2,i) = 1;  
  else
    D(1,i) = 0;
    D(2,i) = 0;
  endif
endfor
d0 = find(x==25);
d1 = find(x==45);
plot(x(d0:d1),D(1,d0:d1),'.');
hold on;

# conjunto e
p1 = [35 0];
p2 = [45 1];
r_e = equacao_geral_reta (p1,p2);
for i=1:l
  if x(i)<35
    E(1,i) = 0;
    E(2,i) = 0;
  elseif  (35<= x(i)) & (x(i)<= 45)
    E(1,i) = r_e(1)*x(i)+r_e(2);
    E(2,i) = 1;
  else
    E(1,i) = 1;
    E(2,i) = 1;
  endif
endfor
e0 = find(x==35);
e1 = find(x==50);
plot(x(e0:e1),E(1,e0:e1),'.');
hold on;
title ("Gráficos de Temperatura");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("A Muito Baixa","B Baixa","C Média", "D Alta", "E Muito Alta");

Conj_Fuzzy(1,:)= A(1,:);
Conj_Fuzzy(2,:)= A(2,:);
Conj_Fuzzy(3,:)= B(1,:);
Conj_Fuzzy(4,:)= B(2,:);
Conj_Fuzzy(5,:)= C(1,:);
Conj_Fuzzy(6,:)= C(2,:);
Conj_Fuzzy(7,:)= D(1,:);
Conj_Fuzzy(8,:)= D(2,:);
Conj_Fuzzy(9,:)= E(1,:);
Conj_Fuzzy(10,:)= E(2,:);
Conj_Fuzzy(11,:)= x;



[Conj_Fuzzy_Crisp] = crisp (0.8, Conj_Fuzzy);

figure(2);
hold on;
xlim ([0 60])
ylim ([0 1])
plot(Conj_Fuzzy_Crisp(end,a0:a1),Conj_Fuzzy_Crisp(1,a0:a1),'.'); hold on;
plot(Conj_Fuzzy_Crisp(end,b0:b1),Conj_Fuzzy_Crisp(3,b0:b1),'.'); hold on;
plot(Conj_Fuzzy_Crisp(end,c0:c1),Conj_Fuzzy_Crisp(5,c0:c1),'.'); hold on;
plot(Conj_Fuzzy_Crisp(end,d0:d1),Conj_Fuzzy_Crisp(7,d0:d1),'.'); hold on;
plot(Conj_Fuzzy_Crisp(end,e0:e1),Conj_Fuzzy_Crisp(9,e0:e1),'.'); hold on;
title ("Gráficos de Temperatura Crisp");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("A Muito Baixa","B Baixa","C Média", "D Alta", "E Muito Alta");


Z_max= conj_uniao_max_conj_fuzzy (Conj_Fuzzy);
Z_min = conj_intersecao_min_conj_fuzzy (Conj_Fuzzy);

figure(3);
hold on;
subplot(1,3,1)
plot(Z_max(2,:),Z_max(1,:),'.');
title ("Gráficos de Temperatura Max");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("S-Norma Max");
xlim ([0 60])
ylim ([0 1.5])

subplot(1,3,2)
plot(Z_min(2,:),Z_min(1,:),'.');
title ("Gráficos de Temperatura Min");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("T-Norma Min");
xlim ([0 60])
ylim ([0 1.5])


Compl_C = conj_complemento (Conj_Fuzzy(11,:),Conj_Fuzzy(5,:));

subplot(1,3,3)
plot(Compl_C(2,c0:c1),Compl_C(1,c0:c1),'.');
title ("Gráficos de Temperatura Min");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj Complemento C");
xlim ([0 60]);
ylim ([0 1.5]);



# 3 a)   BuC
conjunto_ativo (16.75,Conj_Fuzzy);
a_BC = Conj_Fuzzy;
a_BC(1:2,:)=[]; a_BC(5:8,:)=[];
a_BuC = conj_uniao_max_conj_fuzzy(a_BC);

figure(4);
hold on;
subplot(2,2,1)
plot(a_BuC(2,b0:c1),a_BuC(1,b0:c1),'.');
title ("Gráficos de Temperatura a)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União B ,C");
xlim ([0 60]);
ylim ([0 1.5]);


# 3 b)   DuE
conjunto_ativo (37.2,Conj_Fuzzy);

a_DE = Conj_Fuzzy;
a_DE(1:6,:)=[]; 
a_DuE = conj_uniao_max_conj_fuzzy(a_DE);


subplot(2,2,2)
plot(a_DuE(2,d0:e1),a_DuE(1,d0:e1),'.');
title ("Gráficos de Temperatura b)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União D ,E");
xlim ([0 60]);
ylim ([0 1.5]);

# 3 c)   BiC
conjunto_ativo (20,Conj_Fuzzy);
a_BC = Conj_Fuzzy;
a_BC(1:2,:)=[]; a_BC(5:8,:)=[];
a_BiC = conj_intersecao_min_conj_fuzzy_1(a_BC);


subplot(2,2,3)
plot(a_BiC(2,b0:c1),a_BiC(1,b0:c1),'.');
title ("Gráficos de Temperatura c)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União B ,C");
xlim ([0 60]);
ylim ([0 1.5]);


# 3 d)   DiE
conjunto_ativo (40,Conj_Fuzzy);

a_DE = Conj_Fuzzy;
a_DE(1:6,:)=[];
a_DiE = conj_intersecao_min_conj_fuzzy_1(a_DE);


subplot(2,2,4)
plot(a_DiE(2,d0:e1),a_DiE(1,d0:e1),'.');
title ("Gráficos de Temperatura d)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União D ,E");
xlim ([0 60]);
ylim ([0 1.5]);

#---------------Soma Algébrica---------------------------------------------

# 3 a)   BuC
conjunto_ativo (16.75,Conj_Fuzzy);
a_BC = Conj_Fuzzy;
a_BC(1:2,:)=[]; a_BC(5:8,:)=[];
a_BuC = conj_uniao_Soma_Algebrica_conj_fuzzy_1(a_BC);

figure(5);
hold on;
subplot(2,2,1)
plot(a_BuC(2,b0:c1),a_BuC(1,b0:c1),'.');
title ("Gráficos de Temperatura a)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União B ,C");
xlim ([0 60]);
ylim ([0 1.5]);


# 3 b)   DuE
conjunto_ativo (37.2,Conj_Fuzzy);

a_DE = Conj_Fuzzy;
a_DE(1:6,:)=[]; 
a_DuE = conj_uniao_Soma_Algebrica_conj_fuzzy_1(a_DE);


subplot(2,2,2)
plot(a_DuE(2,d0:e1),a_DuE(1,d0:e1),'.');
title ("Gráficos de Temperatura b)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União D ,E");
xlim ([0 60]);
ylim ([0 1.5]);

# 3 c)   BiC
conjunto_ativo (20,Conj_Fuzzy);
a_BC = Conj_Fuzzy;
a_BC(1:2,:)=[]; a_BC(5:8,:)=[];
a_BiC = conj_intersecao_Produto_algebrico_conj_fuzzy_1(a_BC);


subplot(2,2,3)
plot(a_BiC(2,b0:c1),a_BiC(1,b0:c1),'.');
title ("Gráficos de Temperatura c)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União B ,C");
xlim ([0 60]);
ylim ([0 1.5]);


# 3 d)   DiE
conjunto_ativo (40,Conj_Fuzzy);

a_DE = Conj_Fuzzy;
a_DE(1:6,:)=[];
a_DiE = conj_intersecao_Produto_algebrico_conj_fuzzy_1(a_DE);


subplot(2,2,4)
plot(a_DiE(2,d0:e1),a_DiE(1,d0:e1),'.');
title ("Gráficos de Temperatura d)");
xlabel ("temperatura (x)");
ylabel ("u(x)");
legend ("Conj União D ,E");
xlim ([0 60]);
ylim ([0 1.5]);

# ---------------------------------------------------------------------------



R = rand(10,5);
S = rand(5,15);
  
MaxMin = max_min (R,S);
MaxProd = max_prod (R,S);
MaxMedia = max_media (R,S);












