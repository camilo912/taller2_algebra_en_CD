% Compruebe computacionalmente que la norma de un vector es invariante 
% ante transformaciones ortonormales. Qué significa esto?. 
% Cómo podría ser útil en analítica de datos este resultado?

% Se define un numero de veces
n = 2;
% presición del redondeo
d = 4;

%--------------------------------------------------------------------------

% Se toma un vector cualquiera
x=rand(2,1);
xNorm = round(norm(x),d);

% vector de respuestas
checks = zeros(n);

% generación de ángulos.
theta=2*pi*rand(n,1);

for i=1:n
    E = [cos(theta(i)) -sin(theta(i));sin(theta(i)) cos(theta(i))];    
    % Se aplica la transformación
    Tx = E*x;
    TxNorm = round(norm(Tx),d);
    
    % se valida si ambas normas son iguales pos transformación.
    checks(i) = (xNorm == TxNorm);
end

% para validad los resultados.
s = sum(sum(checks));
if(s == n)
    fprintf("La norma es invariante ante la transformación aplicada.\n");
else
    fprintf("La norma varió ante la transformación aplicada.\n");
end

% Como la transformación es orthogonal, no se cambian los datos, sólo se
% giran, por lo cual su norma es invariate.