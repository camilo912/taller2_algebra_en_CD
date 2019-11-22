%==========================================================================
% 1. Simule cualquier matriz aleatoria A rectangular. Cálcule los
% eigenvalues de C=A'*A. Luego pruebe que no existe un vector x tal que:
% x'*C*x < 0.

A = randn(4,3);
C = A'*A;

% eigen
[vectors, values] = eig(C);

% La matriz de covarianzas es semidefinida positiva.
% Es decir, si x es cualquier vector x'Sx es mayor que 0.
% Esta condición también implica que los autovalores de esta matriz son
% no negativos.
% Es decir, si Sx=?ix,, entonces?i es mayor que 0.

% además V'*V = norm(V) > 0.

x = vectors(:,1);
n = norm(x);

% n es mayor que cero y la C es semidefinida positiva, por lo tanto,
% no existe un vector x tal que x'*C*x < 0.

%==========================================================================