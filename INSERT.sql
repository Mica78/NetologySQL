INSERT INTO GENRE  
	VALUES (1, 'havy metal');

INSERT INTO GENRE 
	VALUES (2, 'trash metal');
	
INSERT INTO GENRE 
	VALUES (3, 'glam metal');
	
INSERT INTO  SINGERS 
	VALUES (1, 'Black Sabbath');
	
INSERT INTO SINGERS 
	VALUES (2, 'Metallica');
	
INSERT INTO SINGERS 
	VALUES (3, 'Kiss');

INSERT INTO SINGERS 
	VALUES (4, 'Twisted Sisters');

INSERT INTO SINGERS 
	VALUES (5, 'Iron Maiden');

INSERT INTO GENRESINGER 
	VALUES (1, 1);

INSERT INTO GENRESINGER 
	VALUES (2, 2);

INSERT INTO GENRESINGER 
	VALUES (3, 3);

INSERT INTO GENRESINGER 
	VALUES (3, 4);

INSERT INTO GENRESINGER 
	VALUES (1, 5);

INSERT INTO GENRESINGER 
	VALUES (1, 2);
	
INSERT INTO ALBUMS 
	VALUES (1, 'Paranoid', 1970);
	
INSERT INTO ALBUMS 
	VALUES (2, 'Fear of the Dark', 1992);

INSERT INTO ALBUMS 
	VALUES (3, 'Iron Maiden', 1980);

INSERT INTO ALBUMS 
	VALUES (4, 'Master of Puppets', 1986);

INSERT INTO ALBUMS 
	VALUES (5,'St. Anger', 2003);

INSERT INTO ALBUMS 
	VALUES (6, 'S&M2', 2020);

INSERT INTO SINGERSALBUMS 
	VALUES (1, 1);

INSERT INTO SINGERSALBUMS 
	VALUES (5, 2);

INSERT INTO SINGERSALBUMS 
	VALUES (5, 3);

INSERT INTO SINGERSALBUMS 
	VALUES (2, 4);

INSERT INTO SINGERSALBUMS 
	VALUES (2, 5);

INSERT INTO SINGERSALBUMS 
	VALUES (2, 6);

INSERT INTO TRACKS 
	VALUES (1, 'Paranoid', 172, 1);

INSERT INTO TRACKS 
	VALUES (2, 'War Pigs', 478, 1);

INSERT INTO TRACKS 
	VALUES (3, 'Iron Man', 358, 1);

INSERT INTO TRACKS
	VALUES (4, 'Be Quick or Be Dead', 204, 2);

INSERT INTO TRACKS 
	VALUES (5, 'Fear of the Dark', 436, 2)

INSERT INTO TRACKS 
	VALUES (6, 'Prowler', 235, 3);

INSERT INTO TRACKS 
	VALUES (7, 'Transylvania', 245, 3);

INSERT INTO TRACKS 
	VALUES (8, 'Phantom of the Opera', 440, 3);

INSERT INTO TRACKS 
	VALUES (9, 'Master of Puppets', 516, 4);

INSERT INTO TRACKS 
	VALUES (10, 'Battery', 313, 4);

INSERT INTO TRACKS 
	VALUES (11, 'My World', 345, 5);

INSERT INTO TRACKS 
	VALUES (12, 'The call of Ktulu', 641, 6);

INSERT INTO SONGBOOKS (songbook_name, SONGBOOK_YEAR)
	VALUES ('Best metal songs', 2018);

INSERT INTO SONGBOOKS (songbook_name, SONGBOOK_YEAR)
	VALUES ('Best of Iron Maden', 2000);

INSERT INTO SONGBOOKS (songbook_name, SONGBOOK_YEAR)
	VALUES ('Best of Black Sabbath', 2020);

DELETE FROM TRACKSSONGBOOKS ;

INSERT INTO TRACKSSONGBOOKS 
	VALUES (1, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (2, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (3, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (4, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (5, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (6, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (7, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (8, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (9, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (10, 1);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (4, 2);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (5, 2);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (6, 2);

INSERT INTO TRACKSSONGBOOKS 
	VALUES (1, 3);