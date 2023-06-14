INSERT INTO Performers (artist_name)
VALUES
	('Rihanna'),
	('Chaykovskiy'),
	('Nickelback'),
	('Evanescence'),
	('Eminem'),
	('Grace Jones'),
	('Madonna'),
	('Chopin');

INSERT INTO Genres (genre_name)
VALUES
	('hip_hop'),
	('rock'),
	('disco'),
	('pop'),
	('classic');

INSERT INTO ArtistsGenres (artist_id, genre_id) 
VALUES 
	(1, 1),
	(2, 5),
	(3, 2),
	(4, 2),
	(5, 1),
	(6, 4),
	(7, 4),
	(7, 2),
	(8, 5);

INSERT INTO Albums (album_name_, release_year_album)
VALUES 
	('This Is Rihanna', 2005),
	('Curb', 1996),
	('Encore', 2018),
	('Nightclubbing', 1981),
	('Like a Virgin', 1984),
	('Chopin: The Nocturnes', 1978),
	('Anywhere but Home', 2004),
	('Childrens album', 1877);
	

INSERT INTO ArtistsAlbums (artist_id, album_id) 
VALUES 
	(1, 1),
	(2, 8),
	(3, 2),
	(4, 7),
	(5, 3),
	(6, 4),
	(7, 5),
	(8, 6);

INSERT INTO Tracks (track_name, duration_track, album_id) 
VALUES 
	('We Found Love', 215, 1),
	('Umbrella', 278, 1),
	('Disturbia', 240, 1),
	('Fly my', 173, 2),
	('I Dont Have', 245, 2),
	('Spend Some Time', 311, 3),
	('Never Enough', 160, 3),
	('Ricky Ticky Toc', 170, 3),
	('Feel Up', 244, 4),
	('Use Me', 305, 4),
	('Over and Over', 252, 5),
	('Nocturne No. 1 in B-Flat minor', 279, 6),
	('Haunted', 245, 7),
	('Imaginary', 325, 7),
	('Winter Morning', 77, 8),
	('Lark Song', 55, 8);

INSERT INTO Collections (collection_name, year_collection)
VALUES 
	('Rihanna-Boom', 2019),
	('Best_of_Classic', 1998),
	('Best_of_Rock', 2000),
	('Top_20', 2005),
	('Best_of_Chopin', 2003),
	('Best_years', 1999),
	('Best_of_Pop', 2009),
	('The_best_of_all_time', 2020);

INSERT INTO CollectionsTracks (track_id, collection_id) 
VALUES 
	(1, 1),
	(2, 1),
	(3, 6),
	(4, 2),
	(5, 2),
	(6, 3),
	(7, 3),
	(8, 4),
	(9, 4),
	(10, 3),
	(11, 8),
	(12, 5),
	(13, 7),
	(14, 2),
	(15, 2);
