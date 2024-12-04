USE telegram;

DROP TABLE IF EXISTS stories;

CREATE TABLE stories(
id SERIAL,
user_id bigint UNSIGNED NOT NULL,
caption varchar(100),
filename varchar(100),
views int UNSIGNED,
created_at datetime DEFAULT now(),

FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS stories_likes;

CREATE TABLE stories_likes(
id SERIAL,
story_id bigint UNSIGNED NOT NULL,
user_id bigint UNSIGNED NOT NULL,
created_at  datetime DEFAULT now(),

FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (story_id) REFERENCES users(id)
);