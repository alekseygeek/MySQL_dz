/*Урок 4. SQL – работа с несколькими таблицами
 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
 3. Вывести всех пользователей, которые не отправляли сообщения.
 4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.*/
-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
SELECT
    user_id AS 'id юзера',
    (
        SELECT
            CONCAT (firstname, ' ', lastname)
        FROM
            users
        WHERE
            id = likes.user_id
    ) AS 'имя юзера',
    COUNT(*) AS 'общее количество лайков, которые получили пользователи младше 12 лет'
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

-- 2. Определить кто больше поставил лайков (всего): мужчины или женщины. 
SELECT
    DISTINCT (
        SELECT
            SUM(user_id)
        FROM
            likes
        WHERE
            id IN (
                SELECT
                    user_id
                FROM
                    profiles
                WHERE
                    gender = 'f'
            )
    ) AS 'лайки женщин',
    (
        SELECT
            SUM(user_id)
        FROM
            likes
        WHERE
            id IN (
                SELECT
                    user_id
                FROM
                    profiles
                WHERE
                    gender = 'm'
            )
    ) AS 'лайки мужчин';

-- 3. Вывести всех пользователей, которые не отправляли сообщения.
SELECT
    CONCAT(firstname, ' ', lastname) AS 'пользователи которые не отправляли сообщения'
FROM
    users
WHERE
    id NOT IN (
        SELECT
            from_user_id
        FROM
            messages
        WHERE
            from_user_id > 0
    );