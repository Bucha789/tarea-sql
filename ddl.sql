use movies;

create table if not exists studios (
	id int auto_increment primary key,
    name varchar(100)
);

insert into studios (name) values ('Columbia Pictures');
insert into studios (name) values ('Paramount Pictures');
insert into studios (name) values ('Warner Bros. Pictures');
insert into studios (name) values ('United Artists');
insert into studios (name) values ('Universal Pictures');
insert into studios (name) values ('New Line Cinema');
insert into studios (name) values ('Miramax Films');
insert into studios (name) values ('Produzioni Europee Associate');
insert into studios (name) values ('Buena Vista');
insert into studios (name) values ('StudioCanal');


select * from studios;


create table if not exists movies (
	id int auto_increment primary key,
    movie_title varchar(100),
    imdb_rating float,
    year_released int,
    budget float,
    box_office float,
    studio_id int,
    foreign key (studio_id) references studios(id)
);

alter table movies add languages varchar(100);

show tables;

insert into movies (movie_title, imdb_rating, year_released, budget, box_office, studio_id, languages) values 
('The Shawshank Redemption', 9.2, 1994, 25, 73.3, 1, 'ingles');

insert into movies (movie_title, imdb_rating, year_released, budget, box_office, studio_id, languages) values
('The Godfather', 9.2, 1972, 7.2, 291, 1, 'ingles'),
('The Dark Knight', 9, 2008, 185, 1006, 3, 'ingles'),
('The Godfather Part II', 9, 1974, 13, 93, 2, 'ingles, Silician'),
('12 Angry Men', 9, 1957, 0.34, 2, 4, 'ingles'),
('Schindler\'s List', 8.9, 1993, 22, 322.2, 5, 'ingles, Aleman, Yiddish'),
('The Lord of Rings: The Return of the king', 8.9, 2003, 94, 1146, 6, 'ingles'),
('Pulp Function', 8.8, 1994, 8.5, 213.9, 7, 'ingles'),
('The Lord of Rings: The Fellowship of the Ring', 8.8, 2001, 93, 898.2, 6, 'ingles'),
('The Good, the Bad and the Ugly', 8.8, 1966, 1.2, 38.9, 8, '');

select * from movies;
