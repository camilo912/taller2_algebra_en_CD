% Consulte en qué consiste el producto Kronecker y verifique 
% comptacionalmente que si A y B son cuadradas de órdenes n y p los np 
% vectores propios de su producto de Kronecker, AkB, son el producto de 
% Kronecker de los vectores propios de A y B.

% La matriz de kronocker consiste en: 
% El producto Kronecker es una operacion de 2 matrices de tamaño arbitrario
% cuyo resultado es una matrix de bloque, es una generalización del
% producto externo.

% Def2: El el producto tensorial, se hace para reducir el estudio de los
% operadores bilineales al de los operadores lineales. 
% Esto es suficiente para hacer lo mismo con todas las funciones 
% multilineales.
%

% para la definición de órdenes
n = 2;
p = 2;

% Construcción de matrices
A = rand(n,n);
B = rand(p,p);

% Producto Kronecker
K = kron(A,B);

% Para la lista de autovectores y autovalores
[Avec, Aval] = eig(A);
[Bvec, Bval] = eig(B);
[Kvec, Kval] = eig(K);

% Cálculo de los vectores propios de su producto Kronecker.
K2 = kron(Avec, Bvec);

disp(Kvec);
disp(K2);
disp(Kvec == K2);

% para revisar las igualdades entre resultados

R1 = Kvec;
R2 = K2;

R1 = R1(:);
R2 = R2(:);

R1 = abs(R1);
R2 = abs(R2);

R1 = sort(R1);
R2 = sort(R2);

if(R1 == R2)
    fprinf("Son iguales\n");
else
    fprintf("Son diff\n");
end

