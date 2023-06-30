/*1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными.
 2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : меньше 100 - Маленький заказ; от 100 до 300 - Средний заказ; больше 300 - Большой заказ.
 3. Создайте таблицу “orders”, заполните ее значениями. Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status: OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
 4. Чем NULL отличается от 0?*/
DROP DATABASE IF EXISTS dz_2;

CREATE DATABASE dz_2;

USE dz_2;

-- создайте табличку “sales”. Заполните ее данными.
CREATE TABLE sales (
    id int AUTO_INCREMENT PRIMARY KEY,
    product VARCHAR(20) NOT NULL,
    count_product int
);

INSERT INTO
    dz_2.sales (product, count_product)
VALUES
    ('product', 99),
    ('product1', 199),
    ('product2', 299),
    ('product3', 399),
    ('product4', 499);

-- Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
SELECT
    id as "id_order" case
        WHEN count_product < 100 THEN "Маленький заказ"
        WHEN count_product BETWEEN 100
        AND 300 THEN "Средний заказ"
        WHEN count_product > 300 THEN "Большой заказ"
        ELSE "не определено"
    end as "order"
FROM
    dz_2.sales;

use dz_2;

-- Создайте таблицу “orders”, заполните ее значениями.
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer VARCHAR(33),
    price DECIMAL (10, 0),
    order_date VARCHAR(11) NOT NULL
);

INSERT INTO
    orders (customer, price, order_date)
VALUES
    ("customer1", 10.00, "OPEN"),
    ("customer2", 10.00, "OPEN"),
    ("customer3", 20.00 "CLOSED"),
    ("customer4", 10.00, "OPEN"),
    ("customer5", 11.50, "CANCELLED");

SELECT
    *,
    CASE
        order_status
        WHEN "OPEN" THEN "Order is in open state"
        WHEN "CLOSED" THEN "Order is closed"
        WHEN "CANCELLED" THEN "Order is cancelled"
    END AS full_order_status
FROM
    dz_2.orders;

-- 0 - это число, а NULL - это значение, которое представляет собой "отсутствие значения"