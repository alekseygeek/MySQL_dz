/*Урок 4. SQL – работа с несколькими таблицами
 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
 3. Вывести всех пользователей, которые не отправляли сообщения.
 4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.*/
 
-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
SELECT
    user_id AS 'User id',
    (
        SELECT
            CONCAT (firstname, ' ', lastname)
        FROM
            users
        WHERE
            id = likes.user_id
    ) AS 'Username',
    COUNT(*) AS 'Likes'
FROM
    likes
WHERE
    (
        SELECT
            TIMESTAMPDIFF(YEAR, birthday, NOW())
        FROM
            profiles
        WHERE
            user_id = likes.user_id
            AND (TIMESTAMPDIFF(YEAR, birthday, NOW()) < 12)
    ) IS NOT NULL
GROUP BY
    user_id
ORDER BY
    user_id;