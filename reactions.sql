USE telegram;

DROP TABLE IF EXISTS reactions_list;

CREATE TABLE reactions_list(
id SERIAL,
code varchar(1))
DEFAULT charset=utf8mb4 COLLATE utf8mb4_unicode_ci;

DROP TABLE IF EXISTS private_messages_reactions;

CREATE TABLE private_messages_reactions(
reaction_id bigint UNSIGNED NOT NULL,
user_id bigint UNSIGNED NOT NULL,
message_id bigint UNSIGNED NOT NULL,
created_at datetime DEFAULT now(),

FOREIGN KEY (reaction_id) REFERENCES reactions_list(id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (message_id) REFERENCES private_messages(id)
);

DROP TABLE IF EXISTS group_messages_reactions;

CREATE TABLE group_messages_reactions(
reaction_id bigint UNSIGNED NOT NULL,
user_id bigint UNSIGNED NOT NULL,
message_id bigint UNSIGNED NOT NULL,
created_at datetime DEFAULT now(),

FOREIGN KEY (reaction_id) REFERENCES reactions_list(id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (message_id) REFERENCES group_messages(id)
);

DROP TABLE IF EXISTS channel_messages_reactions;

CREATE TABLE channel_messages_reactions(
reaction_id bigint UNSIGNED NOT NULL,
user_id bigint UNSIGNED NOT NULL,
message_id bigint UNSIGNED NOT NULL,
created_at datetime DEFAULT now(),

FOREIGN KEY (reaction_id) REFERENCES reactions_list(id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (message_id) REFERENCES channel_messages(id)
);


ALTER TABLE private_messages_reactions ADD PRIMARY KEY(user_id, reaction_id, message_id);

ALTER TABLE group_messages_reactions ADD PRIMARY KEY(user_id, reaction_id, message_id);

ALTER TABLE channel_messages_reactions ADD PRIMARY KEY(user_id, reaction_id, message_id);