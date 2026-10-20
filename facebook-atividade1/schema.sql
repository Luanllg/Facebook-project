-- Script de criação do banco "facebook" (MySQL 8)
CREATE DATABASE IF NOT EXISTS facebook CHARACTER SET utf8mb4;
USE facebook;

CREATE TABLE IF NOT EXISTS users (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    nome     VARCHAR(100) NOT NULL,
    sexo     CHAR(1),
    email    VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS posts (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    content   TEXT NOT NULL,
    post_date DATE NOT NULL,
    user_id   INT NOT NULL,
    CONSTRAINT fk_posts_user FOREIGN KEY (user_id)
        REFERENCES users (id) ON DELETE CASCADE
);

-- Nova entidade: comentários (FK para posts e users)
CREATE TABLE IF NOT EXISTS comments (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    content      TEXT NOT NULL,
    comment_date DATE NOT NULL,
    post_id      INT NOT NULL,
    user_id      INT NOT NULL,
    CONSTRAINT fk_comments_post FOREIGN KEY (post_id)
        REFERENCES posts (id) ON DELETE CASCADE,
    CONSTRAINT fk_comments_user FOREIGN KEY (user_id)
        REFERENCES users (id) ON DELETE CASCADE
);
