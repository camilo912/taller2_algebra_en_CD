% 8. Investigue en qu ?e consiste la inversa generalizada de Moore Pen-rose
% de una matrizAnxp. Qu ?e condiciones debe cumplir?. Simule1000 datos de
% variables aleatoria NormalesXi?Normal(i,1)pa-rai= 1,2,3,4,5.
% Defina la variabley= 10 +?1000i=1i2?Xi+e, donde e ? Normal(0,0,1). 
% SeaA= [11000 X1 X2 X3 X4 X5] La matriz de 1000 X 6 donde su primera 
% columna es de unos y las otras sonlas relaciones deX1,X2,X3,X4,X5.
% Calcula la inversa generaliza-da de A y premultiplíquela por el vector y.
% ¿Que observa?. ¿Que utilidad le ve a la inversa generalizada. 
% ¿Calcule un modelo deregresion de y siendo la variable explicada y Xi las
% explicativas. ¿Logra ver alguna relacion con lo anterior?

% Generación de las obvservaciones
obs_1 = 1 + randn(1000,1);
obs_2 = 2 + randn(1000,1);
obs_3 = 3 + randn(1000,1);
obs_4 = 4 + randn(1000,1);
obs_5 = 5 + randn(1000,1);

A = [ones(1000,1), obs_1, obs_2, obs_3, obs_4, obs_5];
epsilon = randn(1)*0.1;

y = zeros(1000, 1)+10;

for i=1:1000
    y(i) = y(i) + i*i*(i+randn(1)) + epsilon;
end

A_inv = pinv(A);

betas = A_inv*y;

M = [50 15 4
    0 0 0
    22 69 3]; % matriz singular -> cuadrada
% det(M)
M_inv = pinv(M);

fitlm(A, y) 
% se concluye que los betas de una regresión lineal se pueden calcular 
% usando la inversa generalizada
