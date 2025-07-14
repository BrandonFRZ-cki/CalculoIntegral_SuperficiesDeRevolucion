% Parámetros
a = 33.23;     % en metros
c = 97.2;      % en metros
x = linspace(-5, 137.5, 500);  % rango de x

% Función generatriz
r = a * sqrt(1 + (x.^2) / c^2);

% Gráfica
figure;
plot(x, r, 'b', 'LineWidth', 2);
grid on;
xlabel('x (m)');
ylabel('r(x) (m)');
title('Curva generatriz: r(x) = a · √(1 + x² / c²)');