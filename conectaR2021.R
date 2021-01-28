library(chronicle)

tictoc::tic()
add_code(code = "install.packages('chronicle')", eval = FALSE) %>%
  add_text(text = 'Este paquete permite crear archivos R Markdown con widgets
interactivos, sin necesidad que conocer el código para crear cada uno
directamente. Está construido en un paradigma de capas, que le será familiar e
intuitivo a cualquier usuario de {ggplot} o {tensorflow} en R.') %>%
  # paradigma de capas -------------------------------------------
add_text(text_title = '¿Por qué un paradigma de capas?',
         text = '\n * Un paradigma de capas provee facilidad, potencia y
flexibilidad al flujo de trabajo. Permite a principiantes aprender y dominar una
funcionalidad a la vez, y a personas más experimentadas trabajar con
construcciones robustas y complejas.

*  Y los reportes R markdown se prestan a este paradigma porque ya son modulares!
chronicle nace de reconocer un archivo R Markdown como una sucesión de pequeños
módulos de código y texto.') %>%
  # add_* -----------------------------------------------------
add_title(title = '¿Cómo usar chronicle?') %>%
  add_code(code_title = 'Crear archivos R Markdown a través de las funciones add_*',
           title_level = 4,
           code = "
library(chronicle)

reporte_nuevo <-
  add_title(title = 'Así se ve un reporte de chronicle', title_level = 1) %>%
  add_density(dt = iris, groups = 'Species', value = 'Sepal.Length', faceted = F) %>%
  add_boxplot(dt = iris, groups = 'Species', value = 'Sepal.Length') %>%
  add_barplot(dt = iris, bars = 'Species', value = 'Sepal.Length') %>%
  add_table(table = head(iris),
          table_title = 'La famosa tabla iris, en una tabla de kable',
          html_table_type = 'kable') %>%
  add_table(table = ggplot2::mpg[],
            table_title = 'Y esta es mpg de ggplot2, en una tabla DataTable',
            html_table_type = 'DT')
cat(reporte_nuevo)",  eval = TRUE) %>%
  add_text(text_title = 'Las llamadas de las funciones make_*', title_level = 3,
           text = 'Cada gráfico que se agregue con una función add_, lo hará a
través de una llamada a una función make_. Estas son las que realmente crean los
gráficos con todas sus especificaciones.') %>%
  add_code(code = "make_barplot(dt = ggplot2::mpg,
             value = 'cty',
             bars = 'manufacturer',
             break_bars_by = 'model',
             horizontal = TRUE,
             sort_by_value = TRUE)",
           eval = TRUE) %>%
  add_code(code = "make_density(dt = iris,
             value = 'Sepal.Length',
             groups = 'Species',
             faceted = FALSE)",
           eval = TRUE) %>%
  add_text('Estas funciones se pueden llamar independientemente y agregar a
reportes ya existentes, o a cualquier otro lugar donde se pueda montar un
gráfico html.') %>%
  add_text(text_title = 'Compilación del R Markdown', title_level = 3,
           text = 'La función render_report() se encarga de construir el
encabezado yaml del R Markdown. Puede construir varios encabezados para varios
formatos de salida en una sola llamada. Así, por ejemplo, se puede preparar una
presentación con diapositivas html, para luego distribuirlo a la audiencia como
un reporte o cuaderno interactivo.

Otra fortaleza de render_report() es que hace la compilación directamente desde
el ambiente global. Es decir, tiene visibilidad de todos los objetos que se
hayan cargado en memoria hasta momento de llamar la función. Así, no hay
necesidad de repetir la carga y procesamiento de datos para cada vez que se
quiere generar el archivo, y se pueden generar distintos reportes para distintas
audiencias con la misma corrida de preparación de datos.') %>%
  add_code(code = "render_report(report = reporte_nuevo,
              filename = 'chronicle-conectaR2021',
              title = 'Demo de chronicle en ConectaR 2021',
              author = '(Aquí va la autora/el autor)',
              output_format = c('prettydoc', 'ioslides'),
              keep_rmd = TRUE,
              render_html = TRUE,
              table_of_content = FALSE,
              number_sections = FALSE,
              highlight = 'vignette')",
           eval = FALSE) %>%
  add_title(title = 'Reportería HTML ¡sin fricción!', title_level = 2) %>%
  add_title(title = 'Anexo', title_level = 3) %>%
  add_title(title = 'Listado de funcionalidades R Markdown que soporta de chronicle en su versión 0.2.1', title_level = 4) %>%
  add_text(text_title = 'Elementos en R Markdown', title_level = 5,
           text = '
* Títulos (add_title)
* Texto libre (add_text)
* Un código libre (add_code(eval = TRUE))
* Gráficos
    + Densidad (add_density)
    + Diagrama de caja (add_boxplot)
    + Diagrama de dispersión (add_scatterplot)
    + Gráfico de barras (add_barplot)
    + Histogramas (add_histogram)
    + Líneas (add_lineplot)
    + Series de tiempo con [dygraphs](https://rstudio.github.io/dygraphs/) (add_dygraph)
* Tablas
    + kable (add_table(html_table_type = "kable")
    + [DataTables](https://rstudio.github.io/DT/) (add_table(html_table_type = "DT"))
          ') %>%
  add_text(text_title = 'Formatos de salida de R Markdown', title_level = 5,
           text = '*  prettydoc (recomendado)
*  ioslides
*  html_document
*  html_notebook
*  Experimental:
    + tufte
    + flexdashboard
    + slidy_presentation
') %>%
  add_text(text_title = '¿Qué sigue para chronicle?',
           text = '*  Pulir otros tipos de salida: bookdown, pagedown, flexdashboard, blogdown.
*  Agregar gráficos nuevos y parámetros adicionales para los existentes.
*  Otros motores de gráficos interactivos: ggiraph, e_charts, highcharter*, D3 (!).',
title_level = 5) %>%
  chronicle::render_report(filename = 'index',
                           title = '\\{chronicle\\} Reportería HTML sin fricción',
                           author = 'Philippe Heymans Smith @pheymanss',
                           keep_rmd = TRUE,
                           render_html = TRUE,
                           table_of_content = FALSE,
                           number_sections = FALSE,
                           highlight = 'vignette')

tictoc::toc()

