% 9. Simule 1000 observaciones normales con media nula y matriz de 
% covarianzas igual a la matriz de Hilbert de orden n = 5. 
% Contamine las observaciones anteriores con 100 observaciones normales 
% con la misma matriz de covarianzas pero con media nula, salvo una
% entrada que cuyo valor sería j.
%
% Es decir, el conjunto final tendría 1100 observaciones.
% Para cada j = 0, 1, . . . , k calcule la matriz de autovectores de la 
% matriz de covarianzas. Calcule con una métrica matricial la distancia
% de la matriz de autovectores de la covarianza sin contaminación a la 
% matriz de autovectores de la covarianza de datos contaminados. 
%
% Sea D(j) esa distancia. Pinte en un mismo gr´afico el vector de 
% distancias cuando la matriz de covarianzas es la habitual, la de Ledoit 
% and Wolf, la de m´?nima curtosis (kurmain.m), y las matrices de
% covarianzas cambiando la correlaci´on de Perason por Kendall y Spearman.
%
% En fin de cuentas son 5 curvas. Comente los resultados. 
% Para el cálculo de un PCA, considera apropiado obtenerlos con la matriz 
% de covarianza estimada habitualmente?. Que sería mas conveniente según
% los resultados de este ejercicio?.

n = 1000;
orden = 5;
mu = zeros(orden,1);
sigma = hilb(orden);
rng('default')  % For reproducibility

% Para la generación de los datos multivariates normales.
R = mvnrnd(mu,sigma,n);
mvnrnd(mu,sigma,n);

% para el cálculo de los datos contaminados y la cov
R_Contaminada = mvnrnd(mu,sigma,99);

% Covarianza Habitual con autovalores y autovectores
cov_hab = cov(R);
[vector_hab, ~]=eig(cov_habitual);

% Covarianza Ledoit-Wolf con autovalores y autovectores
cov_shrink = cov1para(R);
[vector_shrink, ~]=eig(cov_shrink);

% Covarianza Kurtmain
[idx,dm,mean,cov_robust,vkur,ndir] = kur_main(R);
[vector_kur, ~]=eig(cov_robust);

% Pre-allocation
m = 100;
distances_hab = zeros(1,m);
distances_shrinkage = zeros(1,m);
distances_kur = zeros(1,m);

for j=1:m
    
    % se generan los datos contaminados.
    j_esima = [j,j,j,j,j];
    R_contaminada = mvnrnd(j_esima,sigma,100);
    
    % se le agregan los datos contaminados
    M = [R; R_contaminada];
    
    % Covarianza Habitual con autovalores y autovectores    
    sigma_M = cov(M);
    [vector_M, ~] = eig(sigma_M);
    
    % Covarianza Ledoit-Wolf con autovalores y autovectores
    [sigma_M_shrinkage, ~] = cov1para(M, 3);
    [vector_M_shrinkage, ~] = eig(sigma_M_shrinkage);
   
    % Covarianza Kurtmain
    [~, ~, ~, sigma_M_kur, ~, ~] = kur_main(M);        
    [vector_M_kur, ~] = eig(sigma_M_kur);
    
    % para el cálculo de las distancias
    distances_hab(j) = norm(vector_hab-vector_M);
    distances_shrinkage(j) = norm(vector_shrink-vector_M_shrinkage);
    distances_kur(j) = norm(vector_kur-vector_M_kur);
end

% Para graficar las curvas
figure
hold on;
plot(distances_hab, 'r')
plot(distances_shrinkage, 'b')
plot(distances_kur, 'g')
hold off;
