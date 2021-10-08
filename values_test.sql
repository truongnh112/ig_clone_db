INSERT INTO users (username) VALUES 
('tuilabbi'),
('steele'),
('colt');

INSERT INTO photos (image_url, user_id) VALUES
('/piccat', 1),
('/picdog', 1),
('/picnature', 2);

INSERT INTO comments (comment_text, photo_id, user_id) VALUES
('Meow Meow', 1, 1),
('Amazing shot', 3, 1),
('GOGO',2,3);


SELECT 
	users.username AS 'POST-ER',
	photos.image_url AS 'IMAGE',
	comments.comment_text AS 'COMMENT'
FROM users
INNER JOIN photos
	ON users.id = photos.user_id
INNER JOIN comments
	ON photos.id = comments.photo_id;


ALTER TABLE photos
DROP FOREIGN KEY photos_ibfk_1;

ALTER TABLE comments
DROP FOREIGN KEY comments_ibfk_1, comments_ibfk_2; 

SHOW CREATE TABLE photos;

ALTER TABLE photos
ADD CONSTRAINT FK_photos_users 
FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE comments
ADD CONSTRAINT FK_cmts_users
FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE comments
ADD CONSTRAINT FK_cmts_photos
FOREIGN KEY (photo_id) REFERENCES photos(id);
