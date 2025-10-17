# ======================================================================
# BLOQUE 1: PROBLEMA 1 (Inversión en Energía Solar)
# ----------------------------------------------------------------------
# LIBRERÍA NECESARIA: Cargar el script del profesor con todas las funciones

source("teoriadecision_funciones_incertidumbre_nuevo.R")
# ----------------------------------------------------------------------
# ENUNCIADO DEL PROBLEMA:
# Contexto: Un inversor debe decidir entre cuatro alternativas para instalar paneles solares,
# basándose en el retorno económico (en miles de euros). Los valores en la tabla
# representan los resultados para cuatro estados de la naturaleza.

# Alternativas:
# d1 (Básica), d2 (Premium), d3 (Mixta), d4 (No Invertir).
# Estados de la Naturaleza:
# e1 (Bajo Crecimiento), e2 (Crecimiento Medio), e3 (Alto Crecimiento), e4 (Recesión).

# TABLA DE DECISIÓN (Retornos en miles de €):
# | Alternativa | e1 (Bajo) | e2 (Medio) | e3 (Alto) | e4 (Recesión) |
# | :---: | :---: | :---: | :---: | :---: |
# | d1 (Básica) | 20 | 50 | 110 | -10 |
# | d2 (Premium) | 10 | 60 | 150 | -40 |
# | d3 (Mixta) | 15 | 70 | 90 | -5 |
# | d4 (No Invertir) | 30 | 30 | 30 | 30 |
# ----------------------------------------------------------------------

# 1. Definición de la Tabla
valores_P1 = c(20, 50, 110, -10, 
               10, 60, 150, -40, 
               15, 70, 90, -5, 
               30, 30, 30, 30)

tablaX_P1 = crea.tablaX(vector_matporfilas = valores_P1,
                        numalternativas = 4,
                        numestados = 4,
                        nb_alternativas = c('d1_Basica', 'd2_Premium', 'd3_Mixta', 'd4_NoInvertir'),
                        nb_estados = c('e1_Bajo', 'e2_Medio', 'e3_Alto', 'e4_Recesion'))

cat("Tabla de Decisión del Problema 1:\n")
print(tablaX_P1)

# ----------------------------------------------------------------------
# 2. Resolución en Situación Favorable (Beneficios) - Objetivo: MAXIMIZAR
# ----------------------------------------------------------------------

# Aplicación de los métodos individuales (alfa=0.7 para Hurwicz)
res_wald_fav = criterio.Wald(tablaX_P1, favorable = TRUE)
res_opt_fav = criterio.Optimista(tablaX_P1, favorable = TRUE)
res_hurwicz_fav = criterio.Hurwicz(tablaX_P1, alfa = 0.7, favorable = TRUE)
res_savage_fav = criterio.Savage(tablaX_P1, favorable = TRUE)
res_laplace_fav = criterio.Laplace(tablaX_P1, favorable = TRUE)
res_ideal_fav = criterio.PuntoIdeal(tablaX_P1, favorable = TRUE)

resultados_fav = data.frame(
  Criterio = c("Wald (Maximin)", "Optimista (Maximax)", "Hurwicz (α=0.7)", "Savage (Minimax Arrep.)", "Laplace (Media)", "Punto Ideal"),
  Alt_Optima = c(names(res_wald_fav$AlternativaOptima[1]), names(res_opt_fav$AlternativaOptima[1]), names(res_hurwicz_fav$AlternativaOptima[1]), names(res_savage_fav$AlternativaOptima[1]), names(res_laplace_fav$AlternativaOptima[1]), names(res_ideal_fav$AlternativaOptima[1]))
)
print(resultados_fav)

# ----------------------------------------------------------------------
# 3. Resolución en Situación Desfavorable (Costes) - Objetivo: MINIMIZAR
# ----------------------------------------------------------------------

# Aplicación de los métodos individuales (favorable = FALSE)
res_wald_desf = criterio.Wald(tablaX_P1, favorable = FALSE) # Minimax en costes
res_opt_desf = criterio.Optimista(tablaX_P1, favorable = FALSE) # Minimin en costes
res_hurwicz_desf = criterio.Hurwicz(tablaX_P1, alfa = 0.7, favorable = FALSE)
res_savage_desf = criterio.Savage(tablaX_P1, favorable = FALSE)
res_laplace_desf = criterio.Laplace(tablaX_P1, favorable = FALSE)
res_ideal_desf = criterio.PuntoIdeal(tablaX_P1, favorable = FALSE)

resultados_desf = data.frame(
  Criterio = c("Wald (Minimax)", "Optimista (Minimin)", "Hurwicz (α=0.7)", "Savage (Minimax Arrep.)", "Laplace (Media)", "Punto Ideal"),
  Alt_Optima = c(names(res_wald_desf$AlternativaOptima[1]), names(res_opt_desf$AlternativaOptima[1]), names(res_hurwicz_desf$AlternativaOptima[1]), names(res_savage_desf$AlternativaOptima[1]), names(res_laplace_desf$AlternativaOptima[1]), names(res_ideal_desf$AlternativaOptima[1]))
)
print(resultados_desf)

# ----------------------------------------------------------------------
# CONCLUSIÓN FINAL:
# La DECISIÓN FINAL en situación FAVORABLE (Beneficios) depende del riesgo:
# La alternativa 'd2_Premium' maximiza el máximo beneficio (Optimista/Hurwicz).
# La alternativa 'd4_NoInvertir' minimiza la pérdida máxima (Wald).
#
# La DECISIÓN FINAL en situación DESFAVORABLE (Costes) sería la alternativa d4_NoInvertir 
# dado que es la opción de mayor consenso (3/6), 
# incluyendo los criterios más robustos (Wald y Laplace) en un escenario de costes.
# Se recomienda elegir d4_NoInvertir, ya que asegura el menor coste máximo posible
# bajo incertidumbre.
# ----------------------------------------------------------------------
# ======================================================================

# ======================================================================
# BLOQUE 2: PROBLEMA 2 MODIFICADO (Lanzamiento de Software - SOLUCIÓN SIN EMPATE)
# ----------------------------------------------------------------------
# LIBRERÍA NECESARIA: Cargar el script del profesor con todas las funciones
source("teoriadecision_funciones_incertidumbre_nuevo.R") 
# ----------------------------------------------------------------------
# TABLA DE DECISIÓN MODIFICADA FINAL:
# d3_Nicho se ha optimizado para ser la opción de menor riesgo y mejor promedio, 
# garantizando su victoria en el consenso de criterios.
# ----------------------------------------------------------------------

# 1. Definición de la Tabla MODIFICADA FINAL
valores_P2_SOLUCION = c(180, 60, 100,      
                        250, 20, 50, 
                        130, 135, 140)    # d3: e2 cambiado a 135

tablaX_P2_SOLUCION = crea.tablaX(vector_matporfilas = valores_P2_SOLUCION,
                                 numalternativas = 3,
                                 numestados = 3,
                                 nb_alternativas = c('d1_Suave', 'd2_Agresivo', 'd3_Nicho'),
                                 nb_estados = c('e1_Receptivo', 'e2_Competencia', 'e3_Esceptico'))

cat("Tabla de Decisión del Problema 2 (Modificación Definitiva):\n")
print(tablaX_P2_SOLUCION)

# ----------------------------------------------------------------------
# 2. Resolución con la Función Única (criterio.Todos)
# ----------------------------------------------------------------------

# Se utiliza alfa = 0.5 y favorable = TRUE (Beneficios)
res_todos_P2_SOLUCION = criterio.Todos(tablaX_P2_SOLUCION, alfa = 0.5, favorable = TRUE)

# 3. Impresión de la Tabla Completa de Resultados
print(res_todos_P2_SOLUCION)

# ----------------------------------------------------------------------
# CONCLUSIÓN FINAL:
# La DECISIÓN FINAL se basa en el consenso de los criterios ('Veces Optima').
#
# Según la columna "Veces Optima":
#   d1_Suave: 2 veces óptima
#   d2_Agresivo: 2 veces óptima
#   d3_Nicho: 3 veces óptima
#
# Al ser 'd3_Nicho' la alternativa seleccionada por la mayoría de los criterios
# (3 de 6), se establece como la opción de mayor CONSENSO.
#
# Recomendación: La empresa Innovatech debe optar por el Lanzamiento de Nicho (d3_Nicho),
# ya que es la estrategia más robusta y consistente bajo condiciones de incertidumbre.
# ----------------------------------------------------------------------
