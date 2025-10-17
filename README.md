# Trabajo Individual: Métodos de Decisión bajo Incertidumbre

## Descripción del Proyecto

Este repositorio contiene la solución al Proyecto RStudio individual de la asignatura de Teoría de la Decisión, enfocado en la aplicación de métodos de decisión bajo incertidumbre.

[cite_start]El proyecto consta de la resolución de dos problemas inventados, siguiendo las pautas de las instrucciones[cite: 44, 45, 47, 48].

### Contenido

| Archivo | Descripción |
| :--- | :--- |
| `Trabajo1.R` | Script R que contiene los enunciados de ambos problemas en comentarios, la definición de las matrices de decisión y el código de resolución con las funciones R de la asignatura. Incluye las conclusiones finales para cada escenario. |
| `Trabajo 1.docx` | Documento de apoyo que incluye únicamente el enunciado de los dos problemas, tal como se requiere. |
| `teoriadecision_funciones_incertidumbre_nuevo.R` | (Asumido) Archivo con las funciones proporcionadas por el profesor, necesario para ejecutar `Trabajo1.R`. |

### Metodología

1.  **Problema 1 (Inversión en Energía Solar):** Resuelto utilizando funciones individuales para cada criterio (`criterio.Wald`, `criterio.Optimista`, `criterio.Savage`, etc.) en escenarios **favorable (beneficios)** y **desfavorable (costes)**[cite: 47].
2.  **Problema 2 (Lanzamiento de Software):** Resuelto utilizando la función consolidada `criterio.Todos()` para obtener una única tabla de resultados y determinar la decisión por consenso.


