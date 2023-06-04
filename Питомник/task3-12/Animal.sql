	
DROP DATABASE IF EXISTS Human_Freinds;
CREATE DATABASE IF NOT EXISTS Human_Freinds;
USE Human_Freinds;

CREATE TABLE Animal (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

INSERT Animal (name)
VALUES 
("Pets"),
("Pack_animals");

CREATE TABLE Pets (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AnimalId INT,
	name VARCHAR(50) NOT NULL,
	FOREIGN KEY (AnimalId)  REFERENCES Animal (id) ON UPDATE CASCADE
);

INSERT Pets (AnimalId, name)
VALUES 
(1, "Dogs"),
(1, "Cats"),
(1, "Hamsters");

CREATE TABLE Pack_animals(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	AnimalId INT,
	name VARCHAR(50) NOT NULL,
	FOREIGN KEY (AnimalId) REFERENCES Animal (id) ON UPDATE CASCADE
);

INSERT Pack_animals(AnimalId, name)
VALUES 
(2, "Horses"),
(2, "Camels"),
(2, "Donkeys");

CREATE TABLE Dogs(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PetsId INT REFERENCES Pets(id),
	name VARCHAR(50) NOT NULL,
	commands VARCHAR(100),
	date_of_birth DATE,
	FOREIGN KEY (PetsId) REFERENCES Pets(id) ON UPDATE CASCADE
);

INSERT INTO Dogs (PetsId, name, commands, date_of_birth)
VALUES 
(1, "Рекс", "Фас!", "2018-05-30"),
(1, "Белла", "Стоять!" ,"2019-06-11"),
(1, "Шарик", "Апорт!", "2020-11-23"),
(1, "Луна", "Место!", "2018-12-04"),
(1, "Макс", "Голос!", "2017-08-21");

CREATE TABLE Cats(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PetsId INT,
	name VARCHAR(50) NOT NULL,
	commands VARCHAR(100),
	date_of_birth DATE,
	FOREIGN KEY (PetsId) REFERENCES Pets (id) ON UPDATE CASCADE
);

INSERT INTO Cats (PetsId, name, commands, date_of_birth)
VALUES 
(2, 'Мурзик', 'Апорт', '2020-05-30'),
(2, 'Барсик', 'Перепрыгни!', '2020-04-21'),
(2, 'Васька', 'Крути!', '2021-03-03'),
(2, 'Матильда', 'Поймай мышь!', '2020-04-03'),
(2, 'Симба', 'Лежать', '2020-08-20');


CREATE TABLE Hamsters(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	PetsId INT,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE,
	FOREIGN KEY (PetsId) REFERENCES Pets (id) ON UPDATE CASCADE
);

INSERT INTO Hamsters (PetsId, name, date_of_birth)
VALUES 
(3, "Чип", "2020-05-30"),
(3, "Джейл" ,"2021-06-11"),
(3, "Макс", "2022-11-23"),
(3, "Луна", "2022-12-04"),
(3, "Бейли", "2022-08-21");

CREATE TABLE Horses(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Pack_animalsId INT,
	name VARCHAR(50) NOT NULL,
	commands VARCHAR(100),
	date_of_birth DATE,
	FOREIGN KEY (Pack_animalsId) REFERENCES Pack_animals (id) ON UPDATE CASCADE
);

INSERT INTO Horses (Pack_animalsId, name, commands, date_of_birth)
VALUES 
(1, "Бриз", "Пржок!", "2018-05-30"),
(1, "Арго", "Голоп!" ,"2019-06-11"),
(1, "Династия", "Назад!", "2020-11-23"),
(1, "Эклипс", "Шаг!", "2018-12-04"),
(1, "Грация", "Высокий шаг!", "2017-08-21");

CREATE TABLE Camels(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Pack_animalsId INT,
	name VARCHAR(50) NOT NULL,
	commands VARCHAR(100),
	date_of_birth DATE,
	FOREIGN KEY (Pack_animalsId) REFERENCES Pack_animals (id) ON UPDATE CASCADE
);

INSERT INTO Camels (Pack_animalsId, name, commands, date_of_birth)
VALUES 
(2, "Амир", "Поверни!", "2018-05-30"),
(2, "Зара", "Пройдись!" ,"2019-06-11"),
(2, "Саид", "Прыгни!", "2020-11-23"),
(2, "Лейла", "Голоп!", "2018-12-04"),
(2, "Ануша", "Остановись!", "2017-08-21");

CREATE TABLE Donkeys(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	Pack_animalsId INT REFERENCES Pack_animals (id),
	name VARCHAR(50) NOT NULL,
	commands VARCHAR(100),
	date_of_birth DATE,
	FOREIGN KEY (Pack_animalsId) REFERENCES Pack_animals (id) ON UPDATE CASCADE);

INSERT INTO Donkeys (Pack_animalsId, name, commands, date_of_birth)
VALUES 
(3, "Чип","Ход назад", "2020-05-30"),
(3, "Бублик" ,"Прыжок", "2021-06-11"),
(3, "Гром","Лежать", "2022-11-23"),
(3, "Шустрик", "Сидеть", "2022-12-04"),
(3, "Хитрюга","Поклон",  "2022-08-21");

-- Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку.
DROP TABLE Camels;

-- -- Объединить таблицы лошади, и ослы в одну таблицу.

INSERT INTO Horses (name, commands, date_of_birth)
SELECT name, commands, date_of_birth FROM Donkeys;

RENAME TABLE Horses TO Horses_and_Donkey;

-- Создать новую таблицу “молодые животные”

CREATE TABLE Young_animals AS 
SELECT name, commands, date_of_birth FROM Cats c ;

INSERT INTO Young_animals (name, commands, date_of_birth)
SELECT name, commands, date_of_birth FROM Dogs;
INSERT INTO Young_animals (name, date_of_birth)
SELECT name, date_of_birth FROM Hamsters;

-- все животные старше 1 года, но младше 3 лет
-- в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице
SELECT * , CONCAT(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) - IF(DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(date_of_birth, '%m%d'), 1, 0), ' лет ', TIMESTAMPDIFF(MONTH, date_of_birth, CURDATE()) % 12, ' месяцев') AS age
FROM Young_animals
WHERE date_of_birth BETWEEN DATE_SUB(CURDATE(), INTERVAL 3 YEAR) AND DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам
SELECT * FROM Cats c , Dogs d ,Hamsters h ,Horses_and_Donkey had ;


