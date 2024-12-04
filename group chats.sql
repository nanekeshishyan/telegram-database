USE telegram;

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups`(
id serial,
title varchar(45),
icon varchar(45),
invite_link varchar(100),
settings json,
owner_user_id bigint UNSIGNED NOT NULL,
is_private bit,
created_at datetime DEFAULT now(),

FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS group_members;

CREATE TABLE group_members(
id SERIAL,
group_id bigint UNSIGNED NOT NULL,
user_id bigint UNSIGNED NOT NULL,
created_at datetime DEFAULT now(),

FOREIGN KEY (group_id) REFERENCES `groups`(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE group_members ADD PRIMARY KEY(user_id, group_id);

ALTER TABLE group_members DROP COLUMN id;


DROP TABLE IF EXISTS group_messages;

CREATE TABLE group_messages(
    id SERIAL,
    group_id BIGINT UNSIGNED NOT NULL,
    sender_id BIGINT UNSIGNED NOT NULL,
    reply_to_id BIGINT UNSIGNED NULL,
    media_type ENUM('text', 'image', 'audio', 'video'),
    body TEXT,
    filename VARCHAR(100) NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (group_id) REFERENCES `groups`(id),
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (reply_to_id) REFERENCES group_messages(id)
);
