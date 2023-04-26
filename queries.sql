SELECT * FROM Movies WHERE revenue IS NULL;

SELECT id, title, budget FROM Movies WHERE budget IS NOT NULL ORDER BY budget DESC LIMIT 10;

SELECT MIN(popularity) AS popularity_min, MAX(popularity) AS popularity_max, MIN(vote_average) AS vote_average_min, MAX(vote_average) AS vote_average_max FROM Movies;

SELECT title, overview FROM Movies WHERE overview LIKE '%Einstein%';

SELECT DATE_PART('month', release_date) AS month, AVG(rating) FROM Movies JOIN Ratings ON Movies.id = Ratings.movieid WHERE rating IS NOT NULL AND DATE_PART('month', release_date) BETWEEN 1 AND 12 GROUP BY month ORDER BY month ASC;

SELECT * FROM (SELECT DISTINCT ON (genre) genre, title, MAX(release_date) AS release_date FROM Movies NATURAL JOIN Genres WHERE release_date IS NOT NULL GROUP BY genre, title ORDER BY genre, release_date DESC) new_table ORDER BY release_date DESC;

SELECT title, genre, overview FROM Movies NATURAL RIGHT JOIN (SELECT id, COUNT(genre) FROM Genres GROUP BY id HAVING COUNT(genre) = 8) AS new_table NATURAL JOIN Genres;

SELECT * FROM (SELECT DISTINCT ON (genre) genre, AVG(revenue) AS average_revenue FROM Movies NATURAL JOIN Genres WHERE revenue IS NOT NULL GROUP BY genre) new_table ORDER BY average_revenue DESC;

SELECT genre, DATE_PART('year', release_date) AS year, AVG(revenue) AS average_revenue FROM Movies NATURAL JOIN Genres WHERE revenue IS NOT NULL AND DATE_PART('year', release_date) BETWEEN 2015 AND 2020 GROUP BY genre, year ORDER BY genre, year ASC;

SELECT * FROM (SELECT DISTINCT ON (genre) genre, AVG(rating) AS average_rating FROM Movies NATURAL JOIN Genres JOIN Ratings ON Movies.id = Ratings.movieid WHERE rating IS NOT NULL GROUP BY genre) new_table ORDER BY average_rating DESC;
