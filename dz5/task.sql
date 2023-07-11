USE lesson_4;

-- 1. Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет
SELECT
	firstname,
	lastname,
	hometown,
	gender
FROM
	users
	INNER JOIN profiles ON user_id = id
WHERE
	TIMESTAMPDIFF(YEAR, birthday, NOW()) < 20;

/* 2. Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователь,
      указав указать имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге (первое место у 
      пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)*/ 
SELECT
	firstname,
	lastname,
	COUNT(from_user_id) AS 'количество отправленных сообщений',
	DENSE_RANK() OVER (
		order BY
			COUNT(from_user_id) DESC
	) AS 'место в рейтинге'
FROM
	messages,
	users
WHERE
	from_user_id = users.id
GROUP BY
	users.id;

-- 3. Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at) и 
-- найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
SELECT
	created_at,
	LAG(created_at, 0, 0) OVER (
		ORDER BY
			created_at
	) AS 'датa отправления',
	TIMESTAMPDIFF(
		MINUTE,
		LAG(created_at) OVER (
			ORDER BY
				created_at
		),
		created_at
	) AS 'разница между соседними сообщениями'
FROM
	messages;