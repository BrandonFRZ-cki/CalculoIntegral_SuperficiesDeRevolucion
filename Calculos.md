# Cálculo de la Superficie de Revolución – Paso a Paso con Explicaciones

## Planteamiento del problema

Se quiere calcular el área de la **superficie de revolución** generada al rotar una curva generatriz $r(x)$ alrededor del eje **x**, en el intervalo $x \in [-5, 137.5]$.

La fórmula general para calcular dicha superficie es:

```math
S = 2\pi \int_{a}^{b} r(x) \cdot \sqrt{1 + \left(r'(x)\right)^2} \, dx
```

---

## Datos iniciales

* Curva generatriz:

```math
r(x) = a \cdot \sqrt{1 + \frac{x^2}{c^2}}, \quad \text{con } a = 33.23, \; c = 97.2
```

* Dominio: $x \in [-5, 137.5]$

* Derivada de la función:

```math
r'(x) = \frac{a x}{c^2 \cdot \sqrt{1 + \frac{x^2}{c^2}}}
```

---

## PASO 1: Sustitución en la fórmula de superficie

Se reemplazan $r(x)$ y $r'(x)$ en la fórmula de superficie:

```math
S = 2\pi \int_{-5}^{137.5} a \cdot \sqrt{1 + \frac{x^2}{c^2}} \cdot \sqrt{1 + \left( \frac{a x}{c^2 \cdot \sqrt{1 + \frac{x^2}{c^2}}} \right)^2} \, dx
```

**Proceso aplicado:** Sustitución directa de expresiones algebraicas.

---

## PASO 2: Desarrollo del integrando

Trabajamos con la expresión dentro de la raíz:

```math
1 + \left( \frac{a x}{c^2 \sqrt{1 + \frac{x^2}{c^2}}} \right)^2 = 1 + \frac{a^2 x^2}{c^4 (1 + \frac{x^2}{c^2})}
```

**Procesos aplicados:**

* Potenciación de una fracción: $\left(\frac{A}{B}\right)^2 = \frac{A^2}{B^2}$
* Multiplicación de fracciones

---

## PASO 3: Suma de fracciones racionales

Queremos expresar esta suma como una sola fracción:

```math
1 + \frac{a^2 x^2}{c^4 + c^2 x^2} = \frac{c^4 + x^2 (c^2 + a^2)}{c^4 + c^2 x^2}
```

**Procesos aplicados:**

* Mismo denominador: $1 = \frac{c^4 + c^2 x^2}{c^4 + c^2 x^2}$
* Suma de fracciones con denominador común
* Factor común: $x^2(c^2 + a^2)$

---

## PASO 4: Factorización del denominador

Observamos que:

```math
c^4 + c^2 x^2 = c^2 (c^2 + x^2)
```

**Proceso aplicado:** Factor común: extraemos $c^2$

---

## PASO 5: Propiedades de raíces

Se tiene:

```math
\sqrt{ \frac{c^4 + x^2 (c^2 + a^2)}{c^2 (c^2 + x^2)} } = \frac{ \sqrt{c^4 + x^2 (c^2 + a^2)} }{ c \cdot \sqrt{c^2 + x^2} }
```

**Proceso aplicado:**
```math
\sqrt{\frac{A}{B}} = \frac{\sqrt{A}}{\sqrt{B}}
```

---

## PASO 6: Reescritura de $r(x)$

```math
r(x) = a \cdot \sqrt{1 + \frac{x^2}{c^2}} = a \cdot \frac{ \sqrt{c^2 + x^2} }{ c }
```

**Proceso aplicado:** Multiplicación de raíz racionalizada.

---

## PASO 7: Multiplicación y cancelación

```math
r(x) \cdot \sqrt{1 + (r'(x))^2} = a \cdot \frac{ \sqrt{c^2 + x^2} }{ c } \cdot \frac{ \sqrt{c^4 + x^2(c^2 + a^2)} }{ c \cdot \sqrt{c^2 + x^2} }
```

Cancelamos $\sqrt{c^2 + x^2}$:

```math
= \frac{a}{c^2} \cdot \sqrt{c^4 + x^2 (c^2 + a^2)}
```

**Procesos aplicados:**

* Cancelación de factores comunes
* Multiplicación de fracciones
* Propiedades de radicales

---

## PASO 8: Reescribir la integral

La integral queda:

```math
S = 2\pi \cdot \frac{a}{c^2} \cdot \int_{-5}^{137.5} \sqrt{c^4 + x^2 (c^2 + a^2)} \, dx
```

**Proceso aplicado:** Factor constante fuera de la integral

---

## PASO 9: Sustitución de constantes

Calculamos:

* $c^2 = 97.2^2 = 9447.84$
* $a^2 = 33.23^2 = 1104.23$
* $c^4 = (97.2)^4 \approx 8.926 \times 10^7$
* $B = c^2 + a^2 = 10552.07$

La integral es:

```math
S = 2\pi \cdot \frac{33.23}{9447.84} \int_{-5}^{137.5} \sqrt{8.926 \times 10^7 + 10552.07 x^2} \, dx
```

---

# Resolución detallada de la integral definida

## Integral a resolver

Después de simplificar el integrando, se llega a esta integral:

```math
S = 2\pi \cdot \frac{a}{c^2} \int_{-5}^{137.5} \sqrt{A + Bx^2} \, dx
```

Donde:

```math
A = c^4 \quad\text{y}\quad B = c^2 + a^2
```

Con los valores:

```math
c = 97.2 \Rightarrow c^2 = 9447.84 \Rightarrow c^4 = A = 8.926 \times 10^7 \\
a = 33.23 \Rightarrow a^2 = 1104.23 \Rightarrow B = 10552.07
```

Entonces la integral queda:

```math
\int_{-5}^{137.5} \sqrt{8.926 \times 10^7 + 10552.07 x^2} \, dx
```

---

## Paso 1: Usamos una fórmula estándar

La integral tiene esta forma:

```math
\int \sqrt{A + Bx^2} \, dx
```

La fórmula para resolverla es:

```math
\int \sqrt{A + Bx^2} \, dx = \frac{x}{2} \sqrt{A + Bx^2} + \frac{A}{2\sqrt{B}} \ln\left( \sqrt{B}x + \sqrt{A + Bx^2} \right) + C
```

Esta fórmula se deriva aplicando un cambio trigonométrico o sustitución hiperbólica, pero en este caso, se usa directamente la fórmula por ser estándar.

---

## Paso 2: Aplicar la fórmula en los límites

Vamos a evaluar la fórmula definida, es decir, entre los límites:

```math
x = 137.5 \quad\text{y}\quad x = -5
```

Primero escribimos:

```math
F(x) = \frac{x}{2} \sqrt{A + Bx^2} + \frac{A}{2\sqrt{B}} \ln\left( \sqrt{B}x + \sqrt{A + Bx^2} \right)
```

---

## Paso 3: Evaluación en $x = 137.5$

1. Calculamos $Bx^2 = 10552.07 \cdot (137.5)^2 = 10552.07 \cdot 18906.25 \approx 1.995 \times 10^8$

2. Sumamos con $A$:

```math
A + Bx^2 = 8.926 \times 10^7 + 1.995 \times 10^8 = 2.8876 \times 10^8
```

3. Sacamos raíz cuadrada:

```math
\sqrt{A + Bx^2} \approx \sqrt{2.8876 \times 10^8} \approx 16993
```

4. Calculamos $\sqrt{B} \cdot 137.5 \approx 102.724 \cdot 137.5 = 14124.55$

5. Término logarítmico:

```math
\ln(14124.55 + 16993) = \ln(31117.55) \approx 10.345
```

6. Ahora sustituimos:

```math
F(137.5) = \frac{137.5}{2} \cdot 16993 + \frac{8.926 \times 10^7}{2 \cdot 102.724} \cdot 10.345
```

Primera parte:

```math
\frac{137.5}{2} = 68.75 \quad\Rightarrow 68.75 \cdot 16993 = 1.168 \times 10^6
```

Segunda parte:

```math
\frac{8.926 \times 10^7}{2 \cdot 102.724} = \frac{8.926 \times 10^7}{205.448} \approx 434,400 \\
434,400 \cdot 10.345 \approx 4.494 \times 10^6
```

Total:

```math
F(137.5) \approx 1.168 \times 10^6 + 4.494 \times 10^6 = 5.662 \times 10^6
```

---

## Paso 4: Evaluación en $x = -5$

1. Calculamos $Bx^2 = 10552.07 \cdot 25 = 263801.75$

2. Sumamos con $A$:

```math
A + Bx^2 = 8.926 \times 10^7 + 2.638 \times 10^5 = 8.952 \times 10^7
```

3. Raíz cuadrada:

```math
\sqrt{8.952 \times 10^7} \approx 9461.5
```

4. Calculamos $\sqrt{B} \cdot (-5) = -513.62$

5. Término logarítmico:

```math
\ln(-513.62 + 9461.5) = \ln(8947.88) \approx 9.099
```

6. Ahora sustituimos:

```math
F(-5) = \frac{-5}{2} \cdot 9461.5 + \frac{8.926 \times 10^7}{2 \cdot 102.724} \cdot 9.099
```

Primera parte:

```math
-2.5 \cdot 9461.5 = -23653.75
```

Segunda parte:

```math
434,400 \cdot 9.099 \approx 3.952 \times 10^6
```

Total:

```math
F(-5) = -23653.75 + 3.952 \times 10^6 \approx 3.928 \times 10^6
```

---

## Paso 5: Restar evaluaciones

```math
F(137.5) - F(-5) = 5.662 \times 10^6 - 3.928 \times 10^6 = 1.734 \times 10^6
```

---

## Paso 6: Multiplicar por constante

Recordemos:

```math
S = 2\pi \cdot \frac{a}{c^2} \cdot \left[ F(137.5) - F(-5) \right]
```

Valores:

```math
\frac{33.23}{9447.84} \approx 0.003518
```

Entonces:

```math
S = 2\pi \cdot 0.003518 \cdot 1.734 \times 10^6 \approx 2\pi \cdot 6101.5 \approx 38307.27
```

---

## Resultado final

```math
S = 38307.27\, \text{m}^2
```
