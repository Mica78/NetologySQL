CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Singers (
	id SERIAL PRIMARY KEY ,
	singer_name VARCHAR (80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS GenreSinger (
	genre_id INTEGER REFERENCES Genre (id),
	singer_id INTEGER REFERENCES Singers (id),
	CONSTRAINT pk PRIMARY KEY (genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY ,
	album_name VARCHAR (80) NOT NULL UNIQUE ,
	album_year SMALLINT NOT NULL CHECK(album_year > 1900)
);

CREATE TABLE if not EXISTS SingersAlbums (
	singer_id INTEGER REFERENCES Singers (id),
	album_id INTEGER REFERENCES Albums (id),
	CONSTRAINT pk1 PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE if	NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY ,
	track_name VARCHAR (80),
	track_duration INTEGER CHECK (track_duration > 0 AND track_duration < 48212),
	album_id INTEGER REFERENCES Albums (id)
);

CREATE TABLE if NOT EXISTS Songbooks (
	id SERIAL PRIMARY KEY ,
	songbook_name VARCHAR (80) NOT NULL UNIQUE ,
	songbook_year SMALLINT NOT NULL CHECK (songbook_year > 1900)
);
CREATE TABLE IF NOT EXISTS TracksSongbooks (
	track_id INTEGER REFERENCES Tracks (id),
	songbook_id INTEGER REFERENCES Songbooks (id),
	CONSTRAINT pk3 PRIMARY KEY (track_id, songbook_id)
);
