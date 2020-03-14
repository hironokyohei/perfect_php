create table user(
	id INTEGER AUTO_INCREMENT,
	user_name VARCHAR(20) NOT NULL,
	password VARCHAR(40) NOT NULL,
	created_at DATETIME,
	PRIMARY KEY(id),
	UNIQUE KEY user_name_index(user_name)	
) ENGINE = INNODB;

create table following(
	user_id INTEGER,
	following_id INTEGER,
	PRIMARY KEY(user_id, following_id)
) ENGINE = INNODB;

create table status(
	id INTEGER AUTO_INCREMENT,
	user_id INTEGER NOT NULL,
	body VARCHAR(255),
	created_at DATETIME,
	PRIMARY KEY(id),
	INDEX user_id_index(user_id)
) ENGINE = INNODB;

alter table following add foreign key (user_id) references user(id);
alter table following add foreign key (following_id) references user(id);
alter table status add foreign key (user_id) references user(id);