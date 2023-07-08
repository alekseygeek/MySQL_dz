/*Урок 4. SQL – работа с несколькими таблицами
 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
 2. Определить кто больше поставил лайков (всего): мужчины или женщины.
 3. Вывести всех пользователей, которые не отправляли сообщения.
 4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.*/
use lesson_4;

-- 1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет.
SELECT
    COUNT(*)
FROM
    likes l
    JOIN media m ON l.media_id = m.id
    JOIN profiles p ON p.user_id = m.user_id
WHERE
    TIMESTAMPDIFF(YEAR, p.birthday, NOW()) < 12;

-- 2. Определить кто больше поставил лайков (всего): мужчины или женщины. 
SELECT
    COUNT(l.id) AS cnt,
    p.gender
FROM
    likes l
    JOIN profiles p ON l.user_id = p.user_id
GROUP BY
    p.gender
ORDER BY
    cnt DESC;

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

-- 4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.
SELECT
    m.from_user_id,
    CONCAT(firstname, ' ', lastname) AS "от кого написали сообщение",
    COUNT(*) AS cnt
FROM
    messages m
    JOIN users u ON u.id = m.from_user_id
    JOIN friend_requests fr ON (
        fr.initiator_user_id = m.to_user_id
        AND fr.target_user_id = m.from_user_id
    )
    OR (
        fr.initiator_user_id = m.from_user_id
        AND fr.target_user_id = m.to_user_id
    )
WHERE
    fr.status = "approved"
    AND m.to_user_id = 1
GROUP BY
    m.from_user_id
ORDER BY
    cnt DESC
limit
    1;