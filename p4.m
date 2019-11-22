% Compruebe computacionalmente que la norma de un vector es invariante 
% ante transformaciones ortonormales. Qu� significa esto?. 
% C�mo podr�a ser �til en anal�tica de datos este resultado?

% Se define un numero de veces
n = 2;
% presici�n del redondeo
d = 4;

%--------------------------------------------------------------------------

% Se toma un vector cualquiera
x=rand(2,1);
xNorm = round(norm(x),d);

% vector de respuestas
checks = zeros(n);

% generaci�n de �ngulos.
theta=2*pi*rand(n,1);

for i=1:n
    E = [cos(theta(i)) -sin(theta(i));sin(theta(i)) cos(theta(i))];    
    % Se aplica la transformaci�n
    Tx = E*x;
    TxNorm = round(norm(Tx),d);
    
    % se valida si ambas normas son iguales pos transformaci�n.
    checks(i) = (xNorm == TxNorm);
end

% para validad los resultados.
s = sum(sum(checks));
if(s == n)
    fprintf("La norma es invariante ante la transformaci�n aplicada.\n");
else
    fprintf("La norma vari� ante la transformaci�n aplicada.\n");
end

% Como la transformaci�n es orthogonal, no se cambian los datos, s�lo se
% giran, por lo cual su norma es invariate.