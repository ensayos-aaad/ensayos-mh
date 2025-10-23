% --- FUNCIÓN OBJETIVO ---
% El objetivo es maximizar esta fórmula, que representa el beneficio o valor total.
% Se busca la combinación de F, L, Z y J que dé el resultado más alto posible.
solve maximize 6*F + 10*L + 8*Z + 40*J;

% --- PARÁMETROS Y RESTRICCIONES ---
% Define una constante llamada 'budget' (presupuesto) con un valor de 10000.
int: budget = 10000;

% Esta es la restricción principal del problema.
% La suma ponderada de las variables no puede superar el presupuesto de 10000.
% Es como decir: "el costo total de lo que elijamos no puede exceder nuestro presupuesto".
constraint 13*F + 21*L + 17*Z + 100*J <= budget;

% --- DECLARACIÓN DE VARIABLES ---
% Define la variable 'F' como un número entero que puede ir de 0 a 1000.
var 0..1000: F;

% Define la variable 'L' como un número entero que puede ir de 0 a 400.
var 0..400: L;

% Define la variable 'Z' como un número entero que puede ir de 0 a 500.
var 0..500: Z;

% Define la variable 'J' como un número entero que puede ir de 0 a 150.
var 0..150: J;

% --- FORMATO DE SALIDA ---
% Define cómo se debe mostrar el resultado una vez que se encuentre la solución.
% Imprimirá los valores óptimos para cada una de las variables (F, L, Z, J).
output ["F = \(F), L = \(L), Z = \(Z), J = \(J)"];