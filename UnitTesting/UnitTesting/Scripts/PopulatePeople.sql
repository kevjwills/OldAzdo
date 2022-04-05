IF (SELECT COUNT(*) FROM src.People) = 0
INSERT INTO src.People(Id, Name)
VALUES
(1, 'Vaida Neverdauskaite')
,(2, 'Andrejus Svabas')
,(3, 'Tomas Konovalovas')
,(4, 'Kevin Williams')
,(5, 'Ieva Palevciute')

GO