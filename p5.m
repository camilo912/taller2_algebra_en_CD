% 5.f. Explique con detalle c�mo se relaciona la descomposici�n de valores
% singulares de A con la descomposici�n espectral de A�. C�lcule ambas 
% para el fichero portfolio100.mat y comente resultados.
% C�lcule tambi�n la norma dos de portfolio100 y analice con qu� puede 
% relacionar este valor.

% Para limpiar la pantalla y la memoria en matlab
clear 
clc

% Para cargar el portafolio
load('portfolio100.mat');
A = Portfolio100;

[n, ~] = size(A);

A_c = A - (1/n)*ones(n,1)*ones(1,n)*A;

[~, valor] = svd(A);
[vector_c, valor_c] = svd(A_c);

disp(max(max(valor)))
disp(max(max(valor_c)))
disp(norm(A, 2))

% 5.g. Explique c�mo se relacionan los autovalores de A� con las de A� + I.
% Siendo I la identidad de p�p. Explique ahora la relaci�n con A�+kI,
% siendo k > 0 y relacione con el resultado de Ledoit and Wolf.

clear
clc

% Generaci�n de la matriz
A = rand(4,4);
[n, p] = size(A);

A_c = A - (1/n)*ones(n,1)*ones(1,n)*A;
I = eye(n)*10;

[vector, valor] = eig(A_c'*A_c);
[vector_I, valor_I] = eig((A_c+I)'*(A_c+I));

disp(diag(valor))
disp(diag(valor_I))

[sigma, ~] = cov1para(A_c);
[vector_s, valor_s] = eig(sigma);
disp(diag(valor_s))
