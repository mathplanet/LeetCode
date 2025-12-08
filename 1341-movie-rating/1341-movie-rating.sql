# Write your MySQL query statement below
(
  SELECT u.name AS results
  FROM MovieRating mr
    INNER JOIN Users u USING(user_id)
  GROUP BY mr.user_id
  ORDER BY COUNT(mr.movie_id) DESC, u.name ASC
  LIMIT 1
)
UNION ALL
(
  SELECT m.title AS results
  FROM MovieRating mr
    INNER JOIN Movies m USING(movie_id)
  WHERE DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
  GROUP BY mr.movie_id
  ORDER BY AVG(mr.rating) DESC, m.title ASC
  LIMIT 1
);