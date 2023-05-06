-- task 2

SELECT track_name, TRACK_DURATION  FROM TRACKS
WHERE TRACK_DURATION = (SELECT MAX(TRACK_DURATION) FROM TRACKS);

SELECT track_name FROM TRACKS
WHERE TRACK_DURATION >= 210;

SELECT songbook_name FROM SONGBOOKS
WHERE SONGBOOK_YEAR BETWEEN 2018 AND 2020;

SELECT singer_name FROM singers 
WHERE singer_name NOT LIKE '% %';

SELECT track_name FROM tracks 
WHERE track_name SIMILAR TO '(My %|% my %)';

-- task 3

SELECT g.genre_name, COUNT(singer_id) FROM GENRESINGER AS gs
JOIN GENRE g ON gs.genre_id = g.id
GROUP BY g.genre_name;

SELECT COUNT(track_name) FROM tracks t
JOIN albums a ON t.album_id = a.id 
WHERE a.album_year BETWEEN 2019 AND 2020;

SELECT a.album_name, ROUND(AVG(track_duration)) FROM tracks AS t 
JOIN albums a ON t.album_id = a.id 
GROUP BY a.album_name;

-- if singer have any album 
SELECT s.singer_name FROM albums AS a 
JOIN SINGERSALBUMS sa ON  a.id = sa.album_id
JOIN singers s ON sa.singer_id = s.id
EXCEPT SELECT s.singer_name FROM albums AS a 
JOIN SINGERSALBUMS sa ON  a.id = sa.album_id
JOIN singers s ON sa.singer_id = s.id
WHERE a.album_year = 2020;

SELECT DISTINCT sb.songbook_name FROM singers s 
JOIN singersalbums sa ON sa.singer_id = s.id
JOIN albums a ON a.id = sa.album_id 
JOIN tracks t ON t.album_id = a.id
JOIN trackssongbooks ts ON ts.track_id = t.id 
JOIN songbooks sb ON sb.id = ts.songbook_id 
WHERE s.singer_name = 'Iron Maiden';

-- task 4

SELECT gs.genre_id, album_name FROM ALBUMS A 
JOIN singersalbums sa ON sa.album_id  = a.id 
JOIN singers s ON s.id = sa.singer_id 
JOIN genresinger gs ON s.id = gs.singer_id 
WHERE gs.genre_id = 3

SELECT DISTINCT album_name FROM albums a
JOIN singersalbums sa ON sa.album_id = a.id
JOIN genresinger gs ON gs.SINGER_ID = sa.singer_id
GROUP BY a.id, gs.singer_id
HAVING COUNT(gs.genre_id) > 1
ORDER BY album_name;

SELECT track_name FROM tracks 
EXCEPT 
SELECT DISTINCT track_name FROM tracks t 
JOIN trackssongbooks ts ON t.id = ts.track_id;


SELECT singer_name FROM singers s
JOIN singersalbums sa ON sa.singer_id = s.id 
JOIN albums a ON a.id = sa.album_id 
JOIN tracks t ON t.album_id = a.id
GROUP BY s.singer_name, t.TRACK_DURATION  
HAVING t.TRACK_DURATION = (SELECT MIN(TRACK_DURATION) FROM tracks);

SELECT album_name FROM albums a
JOIN tracks t ON a.id = t.album_id 
GROUP BY a.album_name 
HAVING COUNT(t.album_id) = (
	WITH search1(id, m) AS ( 
		SELECT album_id, COUNT(album_id) s FROM tracks
		GROUP BY ALBUM_ID
		ORDER BY s
		LIMIT 1
		)
	SELECT m FROM search1
	)

