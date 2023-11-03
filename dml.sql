use movies;
# Seleccionar todos los datos de la tabla empresas_distribuidoras
select * from studios;

# Para cada película, seleccione el título, la calificación IMDb y el año de estreno
select movie_title, imdb_rating, year_released from movies;

# Seleccione las columnas movie_title y box_office de la tabla
# Mostrar sólo las películas con ganancias superiores a 300 millones de dólares
select movie_title, box_office from movies where box_office > 300;

# Seleccione las columnas movie_title, imdb_rating, y year_released de la tabla.
# Mostrar las películas que tienen la palabra 'El Padrino' en el título.
select movie_title, imdb_rating, year_released from movies where movie_title like '%Godfather%';

# Seleccione las columnas movie_title, imdb_rating, y year_released de la tabla. 
# Mostrar las películas que se estrenaron antes de 2001 y tuvieron una calificación superior a 9.
select movie_title, imdb_rating, year_released from movies where year_released < 2001 and imdb_rating > 9;

 # Seleccione las columnas movie_title, imdb_rating, y year_released de la tabla.
 # Muestra las películas estrenadas después de 1991. Ordene la salida por el año de estreno en orden ascendente.
select movie_title, imdb_rating, year_released from movies where year_released > 1991 order by year_released asc;

# Mostrar el recuento de películas por cada categoría de idioma.
select * from movies order by languages asc;

# Mostrar el conteo de películas por año de estreno e idioma. 
# Ordenar los resultados por la fecha de estreno en orden ascendente.
select year_released, languages, COUNT(*) from movies group by year_released, languages order by year_released, languages;

# Mostrar los idiomas hablados y el presupuesto medio de las películas por categoría de idioma 
# Mostrar sólo los idiomas con un presupuesto medio superior a 50 millones de dólares.
select languages, avg(budget) as average_budget from movies group by languages having average_budget > 50 order by average_budget DESC;

# Mostrar títulos de películas de la tabla , cada uno con el nombre de su distribuidora.
select movies.movie_title, studios.name from movies join studios on movies.studio_id = studios.id;