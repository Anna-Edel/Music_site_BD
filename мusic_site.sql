CREATE TABLE IF NOT EXISTS Genres (
    genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Performers (
    artist_id SERIAL PRIMARY KEY,
    artist_name VARCHAR(80) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS ArtistsGenres (
	genre_id INTEGER REFERENCES Genres(genre_id),
	artist_id INTEGER REFERENCES Performers(artist_id),
	CONSTRAINT GenArt PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Albums (
    album_id SERIAL PRIMARY KEY,
	album_name_ VARCHAR(40) NOT NULL,
    release_year_album INTEGER
);

CREATE TABLE IF NOT EXISTS ArtistsAlbums (
	artist_id INTEGER REFERENCES Performers(artist_id),
	album_id INTEGER REFERENCES Albums(album_id),
	CONSTRAINT PerAlb PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(60) NOT NULL,
    duration_track INTEGER NOT NULL CHECK (duration_track <= 1000),
    album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS Collections (
    collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(60) NOT NULL UNIQUE,
    year_collection INTEGER NOT NULL CHECK (year_collection >= 1800)
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
	collection_id INTEGER REFERENCES Collections(collection_id),
	track_id INTEGER REFERENCES Tracks(track_id),
	CONSTRAINT ColTack PRIMARY KEY (track_id, collection_id)
);