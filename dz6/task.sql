/*Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, 
 с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. 
 (использование транзакции с выбором commit или rollback – обязательно).*/
USE lesson_4;

-- пользователи
DROP TABLE IF EXISTS users_old;

CREATE TABLE users_old (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(10),
    lastname VARCHAR(10),
    email VARCHAR(100) UNIQUE
);

DELIMITER / / DROP PROCEDURE IF EXISTS move_user;

CREATE PROCEDURE move_user(IN some_user INT) BEGIN
INSERT INTO
    users_old
SELECT
    *
FROM
    users
WHERE
    id = some_user;

DELETE FROM
    users
WHERE
    id = some_user;

COMMIT;

END / / DELIMITER;

CALL move_user(1);

SELECT
    *
FROM
    users_old;

SELECT
    *
FROM
    users;

/* 2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
 С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
 с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/
USE lesson_4;

DROP FUNCTION IF EXISTS hello;

DELIMITER / / CREATE FUNCTION hello() RETURNS VARCHAR(11) DETERMINISTIC BEGIN RETURN CASE
    WHEN CURRENT_TIME() BETWEEN '06:00:00'
    AND '11:59:59' THEN "Доброе утро"
    WHEN CURRENT_TIME() BETWEEN '12:00:00'
    AND '17:59:59' THEN "Добрый день"
    WHEN CURRENT_TIME() BETWEEN '18:00:00'
    AND '23:59:59' THEN "Добрый вечер"
    WHEN CURRENT_TIME() BETWEEN '00:00:00'
    AND '05:59:59' THEN "Доброй ночи"
END;

END / / DELIMITER;

SELECT
    hello();

-- 3. (по желанию)* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, communities и messages в 
-- таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа.