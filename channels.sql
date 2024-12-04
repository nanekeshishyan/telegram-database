USE telegram;

DROP TABLE IF EXISTS channels;

CREATE TABLE channels(
id SERIAL,
title varchar(45),
icon varchar(45),
invite_link varchar(100),
settings json,
owner_user_id bigint UNSIGNED NOT NULL,
is_private bit,
created_at datetime DEFAULT now(),

FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS subscribers;

CREATE TABLE subscribers(
channel_id bigint UNSIGNED NOT NULL,
user_id bigint UNSIGNED NOT NULL,
status enum('requested', 'joined', 'left'),
created_at datetime DEFAULT now(),
updated_at datetime ON UPDATE now(),

FOREIGN KEY (channel_id) REFERENCES channels(id),
FOREIGN KEY (user_id) REFERENCES users(id),
PRIMARY KEY (user_id, channel_id)
);

DROP TABLE IF EXISTS channel_messages;

CREATE TABLE channel_messages(
id SERIAL,
channel_id BIGINT UNSIGNED NOT NULL,
sender_id BIGINT UNSIGNED NOT NULL,
media_type ENUM('text', 'image', 'audio', 'video'),
body TEXT,
filename VARCHAR(100) NULL,
created_at DATETIME DEFAULT NOW(),

FOREIGN KEY (channel_id) REFERENCES channels(id),
FOREIGN KEY (sender_id) REFERENCES users(id)
);