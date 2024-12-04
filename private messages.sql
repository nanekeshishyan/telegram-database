USE telegram;

DROP TABLE IF EXISTS private_messages;

CREATE TABLE private_messages(
id bigint UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
sender_id bigint UNSIGNED NOT NULL,
receiver_id bigint UNSIGNED NOT NULL,
reply_to_id bigint UNSIGNED NULL,
media_type enum('text', 'image', 'audio', 'video'),
body text COMMENT 'текст к сообщению',
filename varchar(200) COMMENT 'attachment',
created_at datetime DEFAULT now(),

FOREIGN KEY (sender_id) REFERENCES users(id),
FOREIGN KEY (receiver_id) REFERENCES users(id),
FOREIGN KEY (reply_to_id) REFERENCES private_messages(id)
);

DROP TABLE IF EXISTS saved_messages;

CREATE TABLE saved_messages(
id SERIAL,
user_id bigint UNSIGNED NOT NULL,
body text,
created_at datetime DEFAULT now(),

FOREIGN KEY (user_id) REFERENCES users(id)
);