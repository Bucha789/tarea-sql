
# ejercicio 1
# Crea un usuario con un nombre de usuario, por ejemplo, "apellidoNombre", y asigna un tipo de usuario específico a este usuario.
create user 'hernandezJuan'@'localhost' identified by 'hellobro';
grant select on movies to 'hernandezJuan'@'localhost';
# ejercicio 2   
# Crea tres usuarios diferentes (usuario1, usuario2, usuario3)
create user 'usuario1'@'localhost' identified by 'root1';
create user 'usuario2'@'localhost' identified by 'root2';
create user 'usuario3'@'localhost' identified by 'root3';

# ejercicio 3
# Otorga a "usuario1" el privilegio de select y delete en la tabla "peliculas" de "infopelis".
grant select, delete on movies.movies to 'usuario1'@'localhost';

# ejercicio 4
# Otorga a "usuario2" el privilegio de select en la tabla "peliculas" de "infopelis".
grant select on movies.movies to 'usuario2'@'localhost';

# ejercicio 5
# Crea un rol llamado "analista" y otorga el privilegio select a este rol. Luego, asigna el rol "analista" a "usuario3"
create ROLE 'analista';
grant select on movies.movies to analista;
grant 'analista' to 'usuario3'@'localhost';