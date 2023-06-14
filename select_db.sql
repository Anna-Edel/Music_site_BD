-- Название и год выхода альбомов, вышедших в 2018 году
SELECT album_name_ , release_year_album FROM Albums
WHERE release_year_album = 2018;

-- Название и продолжительность самого длительного трека
SELECT track_name, duration_track FROM Tracks
WHERE duration_track = (SELECT MAX(duration_track) FROM Tracks);

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT track_name FROM Tracks
WHERE duration_track >= 230;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT collection_name FROM Collections
WHERE year_collection BETWEEN 2018 AND 2020;

-- Исполнители, чьё имя состоит из одного слова
SELECT artist_name FROM Performers
WHERE split_part(artist_name, ' ', 1) = artist_name;

-- Название треков, которые содержат слово «мой» или «my».
SELECT track_name FROM Tracks
WHERE track_name LIKE '%мой%' OR track_name LIKE '%my%';