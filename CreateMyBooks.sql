--Countries table
CREATE TABLE Countries(
Country_ID INT PRIMARY KEY,
Country_Name VARCHAR(100) NOT NULL
);

--Publishers Table
CREATE TABLE Publishers (
Publisher_ID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Country_ID INT,
Foundation_Year INT,
FOREIGN KEY (Country_ID) REFERENCES Countries(Country_ID),
CONSTRAINT CK_foundation_Year_Positive CHECK (Foundation_Year >= 0)
);

--Genres Table
CREATE TABLE Genres(
Genre_ID INT PRIMARY KEY,
NAME VARCHAR(100)NOT NULL,
);

--Authors Table
CREATE TABLE Authors (
Author_ID INT PRIMARY KEY,
NAME VARCHAR(100)NOT NULL,
Nationality_ID INT,
Birth_Year INT,
Death_Year INT,
Awards TEXT,
FOREIGN KEY (nationality_ID) REFERENCES Countries(Country_ID),
CONSTRAINT CK_Birth_Year_Positive CHECK (Birth_Year >= 0),
CONSTRAINT CK_Death_Year_Positive CHECK (Death_Year IS NULL OR Death_Year >= 0)
);

--Books Table

CREATE TABLE Books (
Book_ID INT PRIMARY KEY,
Title VARCHAR(200) NOT NULL,
Author_ID INT,
Genre_ID INT,
Publisher_ID INT,
Publication_Year INT,
ISBN VARCHAR(50),
Synopsis TEXT,
Page_Count INT,
IsRead BIT,
FOREIGN KEY(Author_ID) REFERENCES Authors(Author_ID),
FOREIGN KEY(Genre_ID) REFERENCES Genres(Genre_ID),
FOREIGN KEY(Publisher_ID) REFERENCES Publishers(Publisher_ID),
CONSTRAINT CK_Page_Count_Positive CHECK (Page_Count >= 0)
);

--indexes
CREATE INDEX IX_Books_Title ON Books(Title);
CREATE INDEX IX_Authors_Name ON Authors(Name);

--Books
--Country
INSERT INTO Countries (Country_ID, Country_Name)
VALUES
    (1, 'Palestine'),
	(2, 'United States'),
	(3, 'Spain');

--Author
INSERT INTO Authors (Author_ID, Name, Nationality_ID, Birth_Year, Death_Year, Awards)
VALUES
    (1, 'Daniel Kahneman', 1, 1934, NULL, 'Nobel Prize in Economics'),
	(2, 'Eric Ries', 2, 1978, NULL, NULL),
	(3, 'Seth Godin', 2, 1960, NULL, 'Momentum Award');

--Genre
INSERT INTO Genres (Genre_ID, Name)
VALUES
    (1, 'Essay'),
	(2, 'Business'),
	(3, 'Marketing');

--Publishers
INSERT INTO Publishers (Publisher_ID, Name, Country_ID, Foundation_Year)
VALUES
    (1, 'Penguin Random House', 2, 2013),
	(2, 'Editorial Deusto', 3, 1963),
	(3, 'Editorial Booket', 3, 2001);

--Book
INSERT INTO Books (Book_ID, Title, Author_ID, Genre_ID, Publisher_ID, Publication_Year, ISBN, Synopsis, Page_Count, IsRead)
VALUES
    (1, 'Pensar Rápido, Pensar Despacio', 1, 1, 1, 2012, '978-84-9032-250-5', 
    'Este libro explora los dos sistemas de pensamiento que guían las decisiones: el rápido y el lento. Kahneman expone las capacidades extraordinarias, y también los fallos y sesgos, del pensamiento rápido, y revela la duradera influencia de impresiones intuitivas en nuestras decisiones y juicios.', 
    590, 0),
	(2, 'El Método Lean Startup', 2, 2, 2, 2011, '978-84-234-0949-5', 'The Lean Startup de Eric Ries presenta un enfoque innovador para el desarrollo empresarial, destacando la importancia de la experimentación continua, la iteración rápida y la adaptabilidad. Propone principios y prácticas para ayudar a las startups a validar sus ideas de manera eficiente, minimizando el desperdicio y maximizando el aprendizaje. El libro ha tenido un impacto significativo en el mundo de los negocios y la gestión empresarial.', 319, 0),
	(3, 'La Vaca Púrpura', 3, 3, 3, 2003, '978-84-9875-087-4', 'Explora la idea de que en un mercado saturado, ser común es invisible, y propone la necesidad de destacarse para tener éxito. Utilizando la metáfora de una "vaca púrpura" en un campo de vacas negras y blancas, Godin alienta a las empresas y personas a ser notables, únicas y a desafiar la conformidad para sobresalir en un mundo competitivo.', 173, 0);

--Views
CREATE VIEW ReadBooks AS
SELECT Book_ID, Title, Author_ID, IsRead
FROM Books
WHERE IsRead = 1;

