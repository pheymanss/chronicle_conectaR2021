library(chronicle)

tictoc::tic()
add_code(code = "install.packages('chronicle')", eval = FALSE) %>%
  add_text(text = 'Este paquete permite crear atractivos archivos R
Markdown html, con widgets interactivos como gráficos de
[plotly](https://plotly.com/r/), series de tiempo de
[dygraphs](https://rstudio.github.io/dygraphs/) y tablas
<<<<<<< HEAD
[DataTables](https://rstudio.github.io/DT/). chronicle está construido en
=======
[DataTables](https://rstudio.github.io/DT/). chronicle está constuido en
>>>>>>> 44800b7863198c8ba812ce0b989c6df56461949c
un paradigma de capas, que le será familiar e intuitivo a cualquier usuario de
{ggplot} o {tensorflow} en R.') %>%
  add_text(text_title = '¿Por qué un paradigma de capas?',
           text = '\n * Un paradigma de capas provee facilidad, potencia y flexibilidad
al flujo de trabajo. Permite a principiantes aprender una funcionalidad a la
vez, y permite a personas más experimentadas trabajar con construcciones
robustas y complejas.

*  Los reportes R markdown ya son modulares! chronicle nace de reconocer un
archivo R Markdown como una sucesión de pequeños módulos de código y texto') %>%
  add_title(title = '¿Cómo usar chronicle?') %>%
  add_code(code_title = 'Crear archivos R Markdown a través de las funciones add_*',
           title_level = 4,
           code = "
library(chronicle)

reporte_nuevo <- add_title(title = 'Así se ve un reporte de chronicle', title_level = 1) %>%
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
           text = 'Para (casi) cada funcion add_*, existe una función make_*. Estas son
  las funciones que realmente crean los gráficos con todas sus especificaciones.
') %>%
  add_code(code = "make_barplot(dt = ggplot2::mpg,
             value = 'cty',
             bars = 'manufacturer',
             break_bars_by = 'model',
             horizontal = TRUE,
             sort_by_value = TRUE)",
           eval = TRUE) %>%
  add_text('Estas funciones se pueden llamar independientemente y agregar a
reportes ya existentes, aplicaciones Shiny o cualquier otro lugar donde se pueda
montar un gráfico html. Actualmente, chronicle tiene make_barplot, make_boxplot,
make_density, make_dygraph, make_histogram, make_lineplot, make_scatterplot y
make_violin.') %>%
  add_text(text_title = 'Compilación del R Markdown',
           text = 'La función render_report() se encarga de construir el
encabezado en yaml y de hacer la compilación del archivo directamente desde el
ambiente global, es decir, con todos los objetos que se hayan cargado en memoria
al momento de llamar la función. Aquí se pueden seleccionar varios formatos
distintos e incluso compilar en varios formatos desde una misma llamada, y el
parámetro keep_rmd permite conservar el (los) archivo(s) R Markdown.') %>%
  add_code(code = "render_report(filename = 'conectaR2021',
  title = 'Demo de chronicle',
  author = 'Philippe Heymans Smith @pheymanss',
  output_format = c('prettydoc', 'ioslides'),
  keep_rmd = TRUE,
  render_html = TRUE,
  table_of_content = FALSE,
  number_sections = FALSE,
  highlight = 'vignette')",
  eval = FALSE) %>%
  add_text(text_title = '¿Qué sigue para chronicle?',
           text = '*  Pulir otros tipos de salida: bookdown, pagedown, flexdashboard, blogdown.
*  Agregar gráficos nuevos y parámetros adicionales para los existentes.
*  Otros motores de gráficos interactivos: ggiraph, e_charts, highcharter*, D3 (!).',
title_level = 3) %>%
  # cat()
  chronicle::render_report(filename = 'index',
                           title = '\\{chronicle\\} Reportería HTML sin fricción',
                           author = 'Philippe Heymans Smith @pheymanss',
                           keep_rmd = FALSE,
                           render_html = TRUE,
                           table_of_content = FALSE,
                           number_sections = FALSE,
                           highlight = 'vignette')

tictoc::toc()


