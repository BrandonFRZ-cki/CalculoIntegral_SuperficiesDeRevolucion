# UNIVERSIDAD POLITÉCNICA SALESIANA 
## Relizado por
- Mathias Añazco
- Mateo Miller
- Brandon Rivera

# 🧊 Torres de Enfriamiento como Superficies de Revolución

Este proyecto presenta el modelado de una **torre de enfriamiento nuclear** como una **superficie de revolución hiperboloide**, integrando conceptos de cálculo integral, modelado computacional y construcción a escala.

---

## 📘 Descripción General

Las torres de enfriamiento son estructuras utilizadas en plantas nucleares e industriales para disipar el calor sobrante. Su diseño tipo **hiperboloide de revolución** no es solo estético, sino altamente funcional: permite una ventilación natural eficiente, estabilidad estructural y menor consumo de materiales.

En este proyecto se analiza una torre con **medidas reales**, se realiza su simulación en MATLAB, se calcula su **área superficial exacta**, y se construye una **maqueta a escala** con una altura de 20 cm.

---
## 🧊 Medidas reales de una torre de enfriamiento nuclear
Estas dimensiones corresponden a torres de enfriamiento de tipo hiperboloide de tiro natural, usadas en centrales nucleares como la de Niederaussem (Alemania) o la de Kalisindh (India). Son estructuras de referencia internacional.
| Elemento                             | Valor típico (real)                 |
| ------------------------------------ | ----------------------------------- |
| **Altura total**                     | 142.5 m                             |
| **Radio mínimo (cintura)**           | 33.23 m                             |
| **Radio máximo (base o boca)**       | \~50 m                              |
| **Diámetro mínimo (cintura)**        | \~66.46 m                           |
| **Diámetro máximo (boca/base)**      | \~100 m                             |
| **Altura de cintura (mínimo radio)** | \~60–70 m desde la base             |
| **Espesor promedio de pared**        | 0.25–0.5 m (superior), 1.5 m (base) |
| **Área superficial externa**         | \~38,000 m²                         |
| **Volumen interno de aire**          | \~200,000 m³                        |


---
## 🧮 Modelo Matemático

### 🔹 Paso 0: Origen de la curva generatriz

La función de la curva generatriz que usamos para modelar la torre de enfriamiento proviene de una **sección del hiperboloide de una hoja**, una superficie clásica de revolución utilizada en estructuras reales.

La ecuación general tridimensional del hiperboloide es:

$$
\frac{y^2}{a^2} + \frac{z^2}{b^2} - \frac{x^2}{c^2} = 1
$$

Asumiendo simetría circular \( a = b \), y cortando el sólido en el plano \( z = 0 \), obtenemos una curva en dos dimensiones:

$$
\frac{y^2}{a^2} = 1 + \frac{x^2}{c^2}
$$

Despejando \( y \), se obtiene la función:

$$
y = a \cdot \sqrt{1 + \frac{x^2}{c^2}}
$$

Esta expresión representa la **distancia radial** desde el eje. Por lo tanto, se define:

$$
r(x) = a \cdot \sqrt{1 + \frac{x^2}{c^2}}
$$

---

### 🔹 Paso 1: Definir la curva generatriz
La torre se genera al rotar la siguiente curva en torno al eje **x**:

$$r(x) = a \cdot \sqrt{1 + \frac{x^2}{c^2}}$$


Donde:
- Radio mínimo (en la cintura de la grafica completa)
$$ a = 33.23$$ 
- Factor de estiramiento vertical
$$ c = 97.2 m $$  
Intervalo real de la torre
$$ x -5, 137.5m$$ 

### 🔹 Paso 2: Definir el intervalo de integración

$$x_{\text{min}} = -5, \quad x_{\text{max}} = 137.5
$$

$$h = x_{\text{max}} - x_{\text{min}} = 142.5
$$

### 🔹 Paso 3: Calcular la derivada de 𝑟(𝑥)
$$r'(x) = \frac{a \cdot x}{c^2 \cdot \sqrt{1 + \frac{x^2}{c^2}}}
$$

### 🔹 Paso 4: Plantear la integral de superficie de revolución
- Fromula
$$S = 2 \pi \int_{x_1}^{x_2} r(x) \cdot \sqrt{1 + \left(r'(x)\right)^2} \, dx
$$
- Remplazado
$$S = 2\pi \int_{-5}^{137.5} 
\left(
a \cdot \sqrt{1 + \frac{x^2}{c^2}} \cdot 
\sqrt{1 + \left( \frac{a \cdot x}{c^2 \cdot \sqrt{1 + \frac{x^2}{c^2}}} \right)^2}
\right)
\, dx
$$

### 🔹 Paso 5: Resolver la integral numéricamente
$$S \approx 38307.27\,\text{m}^2
$$

### [ ✍️ Calculo Paso a Paso (clic aquí)](/Calculos.md)

### 🟩 Resultado del cálculo en MATLAB:


Área de la superficie: $$38307.27 m^2$$

```matlab

% ---------------------------------------
% RESOLUCION MEDIANTE CODIGO:

% Funciones
r = @(x) a .* sqrt(1 + (x.^2) / c^2);
rp = @(x) (a .* x) ./ (c^2 .* sqrt(1 + (x.^2)/c^2));
integrando = @(x) 2 * pi .* r(x) .* sqrt(1 + (rp(x)).^2);

% Cálculo numérico
x_min = -5;
x_max = 137.5;
area_superficie = integral(integrando, x_min, x_max);

fprintf('Área de la superficie: %.2f m^2\n', area_superficie);

```

## 💻 Código MATLAB

### Prototipo 1
Este script genera una torre de enfriamiento en 3D:

```matlab
% Parámetros
a = 33.23; b = 33.23; c = 97.2; % radios

% Malla tridimensional (ahora el eje principal es X)
[X, Y, Z] = meshgrid(-137.5:5:137.5, -80:5:80, -80:5:80);

% Función implícita rotada: eje principal en X
V = (Y.^2)/(a^2) + (Z.^2)/(b^2) - (X.^2)/(c^2);

% Extraer superficie
p = patch(isosurface(X, Y, Z, V, 1));
set(p, 'FaceColor', 'w', 'EdgeColor', 'k');

% Estilo
daspect([1 1 1]);
view(3);
camlight;
lighting gouraud;
xlabel('x'); ylabel('y'); zlabel('z');
title('Torre de enfriamiento girando respecto a x');

```
![prototipo](/Imagines/Prototipo.png)

## Simulación Final
### Curva Generatriz

```matlab
% ===== Curva generatriz de la torre de enfriamiento =====
clc; clear; close all;

% === Parámetros reales ===
a = 33.23;      % radio mínimo en m
c = 97.2;       % parámetro vertical

% === Rango según el corte original: desde x = -5 a x = 137.5 m ===
x = linspace(-5, 137.5, 1000);
r = a * sqrt(1 + (x.^2) / c^2);  % fórmula del hiperboloide girado

% === Gráfica estilizada ===
figure('Color','w', 'Name','Curva Generatriz', 'NumberTitle','off');
plot(x, r, 'Color', [0.1 0.3 0.7], 'LineWidth', 2);
hold on;

% Reflejar la curva para mostrar revolución
plot(x, -r, 'Color', [0.7 0.1 0.1], 'LineWidth', 2, 'LineStyle', '--');

xlabel('x (altura en m)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Radio r(x) (m)', 'FontSize', 12, 'FontWeight', 'bold');
title('Curva generatriz del hiperboloide recortado', ...
    'FontSize', 14, 'FontWeight', 'bold');

grid on;
axis equal;
legend('r(x)', '-r(x) (simetría para revolución)', 'Location', 'northeast');

```
![Funcion Original](/Imagines/FuncionOriginal.png)

### Superficie

```matlab
% ===== Torre de enfriamiento (hiperboloide recortado) =====
clc; clear; close all;

% === Parámetros geométricos reales ===
a = 33.23;     % radio mínimo (m)
b = 33.23;
c = 97.2;      % estiramiento vertical

% === Corte asimétrico: desde -5 m hasta 137.5 m (mismo que el original) ===
x_min = -5;
x_max = 137.5;

% === Malla más fina para suavidad ===
step = 1;
[X, Y, Z] = meshgrid(x_min:step:x_max, -80:step:80, -80:step:80);

% === Ecuación implícita del hiperboloide ===
V = (Y.^2)/(a^2) + (Z.^2)/(b^2) - (X.^2)/(c^2);

% === Visualización ===
figure('Color','w', 'Name','Torre de Enfriamiento 3D', 'NumberTitle','off');
p = patch(isosurface(X, Y, Z, V, 1));
isonormals(X, Y, Z, V, p);

% === Estética ===
set(p, ...
    'FaceColor', [0.2 0.5 0.8], ...     % azul acero
    'EdgeColor', 'none', ...
    'FaceAlpha', 0.95);                % casi opaco

% Base transparente (opcional)
hold on;
[xc, yc] = meshgrid(-80:1:80);
z_base = ones(size(xc)) * Z(1,1,1);
r_base = sqrt((xc.^2 + yc.^2));
mask = (r_base <= a * sqrt(1 + (x_min^2)/c^2)); % base circular
surf(z_base, xc, yc, 'FaceAlpha', 0.1, 'EdgeColor', 'none', 'FaceColor', [0 0 0]);

% === Cámara, luz y aspecto ===
daspect([1 1 1]);
view([-45 20]);             % ángulo 3D atractivo
camlight('right');
camlight('left');
lighting gouraud;

% === Ejes y título estilizados ===
xlabel('x (altura en m)', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('y', 'FontSize', 12, 'FontWeight', 'bold');
zlabel('z', 'FontSize', 12, 'FontWeight', 'bold');
title('Simulación 3D: Torre de Enfriamiento Nuclear', ...
    'FontSize', 14, 'FontWeight', 'bold', 'Color', [0.1 0.1 0.5]);

grid on;
axis tight;



```

![Superficie de Revolucion](/Imagines/SuperficieDeREvolucuin_1.png)
![Superficie de Revolucion](/Imagines/SuperficieDeRevolucion_2.png)

## Preguntas

### 🧊 ¿Qué es una torre de enfriamiento nuclear?
Es una estructura utilizada en plantas nucleares e industriales para **liberar el exceso de calor**. Enfría agua caliente mediante su contacto con el aire, **sin usar ventiladores**, gracias a un diseño que favorece la **convección natural**.
### 🔵 ¿Por qué su diseño es un hiperboloide de revolución?
- 🌪️ **Favorece el ascenso del aire caliente (efecto chimenea)**  
  La forma de hiperboloide crea una **cintura estrecha** que acelera el flujo ascendente del aire. A medida que este sube, se comprime en esa zona y se dirige más rápido hacia la salida superior, **mejorando la disipación térmica**.

- 🧱 **Mayor resistencia estructural**  
  Una figura de gran altura como un cilindro tiende a sufrir problemas de carga y flexión. En cambio, el hiperboloide **distribuye las tensiones de manera radial y simétrica**, resiste mejor el viento y el peso propio, y **permite construir torres altas sin columnas internas ni refuerzos masivos**.
### 📐 ¿Por qué se rota respecto al eje x?
En este modelo técnico, se rota la curva generatriz respecto al eje **x** porque **representa la altura real de la torre**, que es su dimensión más relevante. A nivel constructivo, las torres de enfriamiento se diseñan en función de cómo el vapor asciende por su interior: a mayor altura, **más tiempo y eficiencia para disipar el calor por convección natural**. En cada punto de esa altura se **obtiene un radio transversal \( r(x) \)**, que refleja cómo varía la forma. Este enfoque **permite modelar la geometría de forma precisa**, tal como se haría en el diseño estructural real.

### 📌 Conclusiones

1. **Aplicación exitosa del cálculo integral**  
   Se calculó con precisión el área superficial externa de una torre de enfriamiento nuclear mediante una integral definida de superficie de revolución, reforzando el vínculo entre teoría matemática y aplicación ingenieril.

2. **El hiperboloide como figura clave en ingeniería**  
   Esta forma no solo posee propiedades geométricas interesantes, sino también ventajas estructurales reales: resistencia, estabilidad y eficiencia en materiales, aplicables a torres de enfriamiento, chimeneas y estructuras energéticas.

3. **Simulación 3D como herramienta de verificación**  
   El modelo tridimensional generado a partir de la curva generatriz validó visualmente el comportamiento geométrico del sólido de revolución.

4. **Importancia de la homotecia en la maqueta**  
   La construcción a escala, basada en proporciones reales, permitió trasladar el modelo matemático al mundo físico, fortaleciendo el aprendizaje y demostrando cómo mantener geometría y proporción al escalar estructuras.

5. **Interdisciplinariedad del proyecto**  
   Este trabajo integró matemáticas, física, modelado computacional y diseño estructural, mostrando cómo el cálculo se aplica fuera del aula, en contextos reales y profesionales.

6. **Desarrollo de habilidades técnicas y computacionales**  
   Involucró herramientas como MATLAB, programación de funciones, funciones anónimas, derivadas simbólicas y métodos numéricos, fortaleciendo competencias clave en ingeniería.

7. **Sensibilización con estructuras reales**  
   Estudiar una torre de enfriamiento nuclear permite apreciar el impacto ambiental, energético y tecnológico de los diseños estructurales en la industria moderna.

---

### 📊 Resultados y Comparación

| **Elemento**            | **Modelo Computacional** | **Referencia Real**       |
|-------------------------|--------------------------|---------------------------|
| Área superficial        | ≈ 38,307.27 m²           | ~ 38,000 m²               |
| Forma 3D                | Hiperboloide             | Coincide visualmente      |
| Exactitud del modelo    | Alta                     | Validada                  |

---

### 📚 Referencias

- Stewart, J. (2015). *Cálculo de varias variables: Trascendentes tempranas* (7.a ed.). Cengage Learning.  
  [https://www.cengage.com](https://www.cengage.com)

- Ortiz, J. D., & Gómez, R. F. (2015). *Análisis estructural de superficies de revolución en arquitectura e ingeniería*. Universidad Nacional de Colombia.  
  [Repositorio UNAL](https://repositorio.unal.edu.co)

- Universidad Nacional Autónoma de México (UNAM). (2019). *Modelado de superficies en MATLAB*. Facultad de Ingeniería.  
  [ingenieria.unam.mx](https://www.ingenieria.unam.mx)

- Endesa Educa. (s.f.). *¿Qué son las torres de refrigeración?*. Fundación Endesa.  
  [educa.endesa.com](https://educa.endesa.com)

- MateWiki. (2024). *Torres de enfriamiento hiperbólicas*. UPM.  
  [mat.caminos.upm.es](https://mat.caminos.upm.es/wiki/Torres_de_enfriamiento_hiperb%C3%B3licas_%28Grupo_3%29)

