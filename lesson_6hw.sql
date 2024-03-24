-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS times;
DELIMITER $$
CREATE FUNCTION times (seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE result VARCHAR(255);
    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds - (days * 86400);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds - (hours * 3600);
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds - (minutes * 60);
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
    RETURN result;
END$$
DELIMITER ;

SELECT times(123456);



-- 2.	Выведите только четные числа от 1 до 10 включительно.
-- Пример: 2,4,6,8,10 

DROP PROCEDURE IF EXISTS evenNum;
DELIMITER $$
CREATE PROCEDURE evenNum (n INT)
BEGIN
	DECLARE x VARCHAR(20);
    DECLARE i VARCHAR(20) DEFAULT 0;
    SET x = ' ';
	WHILE (i < n) DO
        SET i = i + 2;
        SET x = CONCAT(x, ' ', i);
	END WHILE;
    SELECT x;
END$$
DELIMITER ;

CALL evenNum(10);