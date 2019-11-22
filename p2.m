%==========================================================================
% 2. Simule cualquier matriz aleatoria A rectangular. C�lcule el 
% determinante y la traza de A'*A y tambi�n de A*A'. Comente los resultados.

A = randn(3,5);

M = A'*A;
M2 = A*A';

% Determinantes.
d = det(M);
d2 = det(M2);

% Rangos
r = rank(M);
r2 = rank(M2);

% Trazas
t = trace(M);
t2 = trace(M2);

% Resultados
% El determinando de d es un cero estad�stico, dado que el rango de la
% matriz es menor que el n de la misma, por lo cual se convierte en una
% matriz singular. A diferenta de d2.

% Ambos tienen la misma traza, dado que ambas tienen la misma medida
% global de tama�o de la matrix.

%==========================================================================