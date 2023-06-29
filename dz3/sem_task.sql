DROP DATABASE IF EXISTS lesson_3;

CREATE DATABASE lesson_3;

USE lesson_3;

-- Персонал
DROP TABLE IF EXISTS staff;

CREATE TABLE staff (
	id INT AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(45),
	lastname VARCHAR(45),
	post VARCHAR(100),
	seniority INT,
	salary INT,
	age INT
);

-- Наполнение данными
INSERT INTO
	staff (
		firstname,
		lastname,
		post,
		seniority,
		salary,
		age
	)
VALUES
	('Вася', 'Петров', 'Начальник', '40', 100000, 60),
	('Петр', 'Власов', 'Начальник', '8', 70000, 30),
	('Катя', 'Катина', 'Инженер', '2', 70000, 19),
	('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
	('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
	('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
	('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
	('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
	('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
	('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
	('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);

-- Работа персонала
DROP TABLE IF EXISTS activity_staff;

CREATE TABLE activity_staff (
	id INT AUTO_INCREMENT PRIMARY KEY,
	staff_id INT NOT NULL,
	date_activity DATE,
	count_pages INT,
	FOREIGN KEY (staff_id) REFERENCES staff (id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Наполнение данными
INSERT INTO
	activity_staff (staff_id, date_activity, count_pages)
VALUES
	(1, '2022-01-01', 250),
	(2, '2022-01-01', 220),
	(3, '2022-01-01', 170),
	(1, '2022-01-02', 100),
	(2, '2022-01-02', 220),
	(3, '2022-01-02', 300),
	(7, '2022-01-02', 350),
	(1, '2022-01-03', 168),
	(2, '2022-01-03', 62),
	(3, '2022-01-03', 84);

--1.Выведите все записи, отсортированные по полю "age" по возрастанию 
SELECT
	*
FROM
	staff
ORDER BY
	age;

--2. Выведите все записи, отсортированные по полю “firstname"
SELECT
	*
FROM
	staff
ORDER BY
	firstname;

--3. Выведите записи полей "firstname ", “lastname", "age", отсортированные по полю "firstname " в алфавитном порядке по убыванию
SELECT
	firstname,
	lastname,
	age
FROM
	staff
ORDER BY
	firstname DECK;

--4. Выполните сортировку по полям " firstname " и "age" по убыванию
SELECT
	firstname,
	age
FROM
	staff
ORDER BY
	firstname DESC,
	age DESC;

--1. Выведите уникальные (неповторяющиеся) значения полей "firstname"
SELECT
	DISTINCT firstname,
FROM
	staff --2. Отсортируйте записи по возрастанию значений поля "id". Выведите первые   две записи данной выборки
SELECT
	firstname,
FROM
	staff
ORDER BY
	firstname DESC,
	age DESC;

--3. Отсортируйте записи по возрастанию значений поля "id". Пропустите первые 4 строки данной выборки и извлеките следующие 3
SELECT
	*
FROM
	staff
LIMIT
	3 offset 4;

SELECT
	*,
FROM
	staff
LIMIT
	4, 3;

--4. Отсортируйте записи по убыванию поля "id". Пропустите две строки данной выборки и извлеките следующие за ними 3 строки
SELECT
	*
FROM
	staff
ORDER BY
	id DESC
LIMIT
	2, 4;

--1. Найдите количество сотрудников с должностью «Рабочий» 
--2. Посчитайте ежемесячную зарплату начальников
--3. Выведите средний возраст сотрудников, у которых заработная плата больше 30000
--4. Выведите максимальную и минимальную заработные платы