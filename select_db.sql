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


-- «Продвинутая выборка данных»

-- количество исполнителей в каждом жанре
SELECT genre_name, count(*) FROM Genres g
JOIN ArtistsGenres ag ON g.genre_id = ag.genre_id
GROUP BY genre_name
ORDER BY genre_name;

-- количество треков, вошедших в альбомы 2019–2020 годов (объединением таблиц)
SELECT COUNT(track_id) FROM Tracks t
JOIN Albums a ON a.album_id = t.album_id
WHERE release_year_album BETWEEN 2019 AND 2020;

-- общее количество треков, вошедших в альбомы 2019–2020 годов (вложенными запросами)
SELECT COUNT(*) 
FROM Tracks 
WHERE album_id IN (SELECT album_id FROM Albums 
                   WHERE release_year_album BETWEEN 2019 AND 2020);

-- средняя продолжительность треков по каждому альбому без названия альбомов
SELECT AVG(duration_track) FROM Tracks t
GROUP BY album_id
ORDER BY album_id;

-- средняя продолжительность треков по каждому альбому с названиями альбомов (порядок - по средней продолжительности)
SELECT a.album_name_, AVG(duration_track) FROM Tracks t
JOIN albums a ON a.album_id = t.album_id
GROUP BY a.album_id
ORDER BY AVG(duration_track);

-- все исполнители, которые не выпустили альбомы в 2020 году (вложенными запросами)
SELECT artist_name 
FROM Performers p  
WHERE artist_id NOT IN (SELECT artist_id FROM ArtistsAlbums aa
				WHERE album_id IN 
				(SELECT album_id FROM Albums
				WHERE release_year_album = 2020));
						
-- все исполнители, которые не выпустили альбомы в 2020 году (объединеним таблиц)
SELECT artist_name
FROM Performers p
WHERE artist_id NOT IN (
    SELECT artist_id FROM ArtistsAlbums aa
    JOIN Albums a ON a.album_id = aa.album_id
    WHERE release_year_album = 2020);

-- названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT collection_name FROM Collections c
JOIN CollectionsTracks ct ON c.collection_id = ct.collection_id
JOIN Tracks t ON ct.track_id = t.track_id
JOIN Albums a ON t.album_id = a.album_id
JOIN ArtistsAlbums aa ON a.album_id = aa.album_id
JOIN Performers p ON aa.artist_id = p.artist_id
WHERE artist_name = 'Eminem';

-- названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT album_name_
FROM Albums a
JOIN ArtistsAlbums aa ON a.album_id = aa.album_id
JOIN ArtistsGenres ag ON aa.artist_id = ag.artist_id
GROUP BY a.album_id, ag.artist_id
HAVING COUNT(ag.genre_id) > 1;

-- наименования треков, которые не входят в сборники
SELECT DISTINCT track_name FROM Tracks t
WHERE track_name NOT IN (SELECT DISTINCT track_name FROM Tracks t
JOIN CollectionsTracks ct ON t.track_id = ct.track_id);

-- исполнитель или исполнители, написавшие самый короткий по продолжительности трек, 
-- теоретически таких треков может быть несколько
SELECT artist_name, MIN(duration_track) FROM Performers p
JOIN ArtistsAlbums aa ON aa.artist_id = p.artist_id
JOIN Albums a ON a.album_id = aa.album_id
JOIN Tracks t ON t.album_id = a.album_id
WHERE t.duration_track = (SELECT MIN(duration_track) FROM Tracks)
GROUP BY artist_name, duration_track;

-- названия альбомов, содержащих наименьшее количество треков (вложенными запросами)
SELECT DISTINCT album_name_ FROM Albums a
WHERE a.album_id IN (SELECT album_id FROM Tracks
			GROUP BY album_id
			HAVING COUNT(*) = (SELECT MIN(cnt) FROM 
			(SELECT COUNT(*) AS cnt 
			FROM Tracks 
			GROUP BY album_id) AS c));

-- названия альбомов, содержащих наименьшее количество треков (объединением таблиц)															
SELECT album_name_
FROM albums a JOIN Tracks t ON a.album_id = t.album_id
GROUP BY a.album_id
HAVING COUNT(track_id) = (
SELECT COUNT(track_id) FROM Tracks t
GROUP BY t.album_id
ORDER BY 1
LIMIT 1);
