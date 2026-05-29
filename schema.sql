CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pseudo TEXT NOT NULL UNIQUE,
    mail TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);
CREATE TABLE session (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date DATETIME,
    user_id INTEGER NOT NULL,
    session_id TEXT NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES user(id)  
);
CREATE TABLE post (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre TEXT NOT NULL,
    description TEXT,
    user_id INTEGER NOT NULL,
    date DATETIME,
    image TEXT,
    FOREIGN KEY (user_id) REFERENCES user(id)  
);
CREATE TABLE post_likes (
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    type    TEXT NOT NULL CHECK(type IN ('like', 'dislike')),
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (post_id) REFERENCES post(id) 
);
CREATE TABLE category (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);
    INSERT INTO category (name) VALUES ('Sport');
    INSERT INTO category (name) VALUES ('jeux_vidéo');
    INSERT INTO category (name) VALUES ('musique');
    INSERT INTO category (name) VALUES ('cinéma');
    INSERT INTO category (name) VALUES ('technologie');
    INSERT INTO category (name) VALUES ('divertissement');

CREATE TABLE post_category (
    post_id     INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id)     REFERENCES post(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);
CREATE TABLE comment (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    post_id INTEGER NOT NULL,
    content  TEXT NOT NULL,
        date    DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (post_id) REFERENCES post(id) 
);
CREATE TABLE comment_likes (
    user_id    INTEGER NOT NULL,
    comment_id INTEGER NOT NULL,
    type       TEXT    NOT NULL CHECK(type IN ('like', 'dislike')),
    PRIMARY KEY (user_id, comment_id),       
    FOREIGN KEY (user_id)    REFERENCES user(id),
    FOREIGN KEY (comment_id) REFERENCES comment(id)
);