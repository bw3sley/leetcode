/* Write your T-SQL query statement below */
WITH UserRatings AS (
    SELECT User.name, COUNT(MovieRating.movie_id) AS num_ratings
    FROM MovieRating MovieRating
    INNER JOIN Users Users 
        ON MovieRating.user_id = Users.user_id
    GROUP BY Users.name 
),

TopUser AS (
    SELECT TOP 1 name FROM UserRatings ORDER BY num_ratings DESC, name ASC
),

MovieAverageRatings AS (
    SELECT Movies.title, AVG(MovieRating.rating) AS average_rating
    FROM MovieRating MovieRating
    INNER JOIN Movies Movies
        ON MovieRating.movie_id = Movies.movie_id
    WHERE MovieRating.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY Movies.title
),

TopMovie AS (
    SELECT TOP 1 title FROM MovieAverageRatings ORDER BY average_rating DESC, title ASC
)

SELECT name AS results FROM TopUser
UNION ALL
SELECT title AS results FROM TopMovie