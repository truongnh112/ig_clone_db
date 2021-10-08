
--1. Finding 5 oldest users	
SELECT * FROM ig_clone.users
ORDER BY created_at
LIMIT 5;


--2. Most popular registration date
SELECT  
	DAYNAME(created_at) AS 'dayOfWeek',
	COUNT(*) AS 'total'
FROM users
GROUP BY dayOfWeek
ORDER BY total DESC
LIMIT 3;

--3. Find the users who have never posted a photo
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

--4. Identify most popular photo (and user who created it)
SELECT 
	username,
	photos.id,
	photos.image_url,
	COUNT(*) AS total
FROM photos
INNER JOIN likes
	ON likes.photo_id = photos.id
INNER JOIN users
	ON photos.user_id = users.id
GROUP BY photos.id 
ORDER BY total DESC
LIMIT 2;




































