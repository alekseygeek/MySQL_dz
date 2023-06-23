-- Cоздаём таблицу
CREATE TABLE phones (
    idphones int NOT NULL AUTO_INCREMENT,
    models_phones VARCHAR(22) NOT NULL,
    manufacturers_phones VARCHAR(23) NOT NULL,
    prices_phones decimal(10, 0) DEFAULT NULL,
    quantity_phones int NOT NULL,
    PRIMARY KEY (idphones)
);

-- Заполнение базу данных
INSERT INTO
    phones (
        models_phones,
        manufacturers_phones,
        prices_phones,
        quantity_phones
    )
VALUES
    ('Xiaomi', 'China', 111, 1);

INSERT INTO
    phones (
        models_phones,
        manufacturers_phones,
        prices_phones,
        quantity_phones
    )
VALUES
    ('Samsung', 'China', 222, 6);

INSERT INTO
    phones (
        models_phones,
        manufacturers_phones,
        prices_phones,
        quantity_phones
    )
VALUES
    ('Iphone', 'China', 333, 8);

INSERT INTO
    phones (
        models_phones,
        manufacturers_phones,
        prices_phones,
        quantity_phones
    )
VALUES
    ('BQ', 'China', 444, 1);

-- Выводим название, производителя и цену для товаров, количество которых превышает 2
SELECT
    idphones,
    models_phones,
    manufacturers_phones,
    prices_phones,
    quantity_phones
FROM
    phones
WHERE
    quantity_phones > 2;

-- Товары, в которых есть упоминание "Iphone"
SELECT
    idphones,
    models_phones,
    manufacturers_phones,
    prices_phones,
    quantity_phones
FROM
    phones
WHERE
    models_phones = 'Iphone';

-- Товары, в которых есть ЦИФРА "8"
SELECT
    idphones,
    models_phones,
    manufacturers_phones,
    prices_phones,
    quantity_phones
FROM
    phones
WHERE
    quantity_phones LIKE '8';