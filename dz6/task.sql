/*Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, 
с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. 
 (использование транзакции с выбором commit или rollback – обязательно).*/
USE lesson_4;

-- пользователи
DROP TABLE IF EXISTS users_old;

CREATE TABLE users_old (
    id SERIAL PRIMARY KEY,
    -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);
DELIMITER //
CREATE PROCEDURE move_user(user_id INT)
BEGIN
INSERT INTO users_old SELECT * FROM users 
WHERE id = user_id;
DELETE FROM users WHERE id = user_id;
END//
DELIMITER ;
SET AUTOCOMMIT = false;

/* 2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
   С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
   с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/


-- 3. (по желанию)* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, communities и messages в 
-- таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа.