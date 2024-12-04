USE telegram;

DROP TABLE IF EXISTS users;

CREATE table users(
id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
#id SERIAL is the same as BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
firstname varchar(100) COMMENT 'name',
lastname varchar(100),
login varchar(100),
email varchar(100) UNIQUE,
user_password varchar(256),
phone bigint UNSIGNED UNIQUE
);

CREATE INDEX idx_username ON users (firstname, lastname) COMMENT "users' names";

DROP TABLE IF EXISTS user_settings;

CREATE TABLE user_settings(
user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
is_premium_account BIT COMMENT 'if premium: 1, else: 0',
is_night_mode_enabled BIT,
color_scheme ENUM('classic', 'day', 'tinted', 'night'),
user_language ENUM('russian', 'english', 'french', 'croatian', 'german', 'dutch', 'ukrainian', 'spanish', 'portuguese'),
status_text VARCHAR(70) COMMENT 'bio',
notifications_and_sounds JSON,
created_at DATETIME DEFAULT NOW()
);

ALTER TABLE user_settings ADD CONSTRAINT fk_user_settings_user_id 
FOREIGN KEY (user_id) REFERENCES users(id)
ON UPDATE CASCADE 
ON DELETE RESTRICT;

# or ALTER TABLE user_settings ADD PRIMARY KEY(user_id);

/* ALTER TABLE user_settings
MODIFY COLUMN user_id bigint UNSIGNED NOT NULL PRIMARY KEY; 

ALTER TABLE users 
ADD COLUMN birthday DATETIME;

ALTER TABLE users 
MODIFY COLUMN birthday DATE;

ALTER TABLE users
RENAME COLUMN birthday TO year_of_birth;

ALTER TABLE users
DROP COLUMN year_of_birth; */ 

