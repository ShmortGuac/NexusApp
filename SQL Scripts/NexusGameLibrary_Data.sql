-- Populate table publisher

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (1, 'Electronic Arts', 'www.ea.com', 'EA$2024*game@pass');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (2, 'Activision Blizzard', 'www.blizzard.com', 'Bl!zzard2024*Power');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (3, 'Ubisoft', 'www.ubisoft.com', 'Ub1$oft@#2024');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (4, 'Square Enix', 'www.square-enix.com', 'SqE#nix2024!Pass');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (5, 'Bandai Namco', 'www.bandainamcoent.com', 'B@nd@iNamc0_2024');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (6, 'Bethesda', 'www.bethesda.net', 'B3th3$da*Soft2024!');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (7, 'Riot Games', 'www.riotgames.com', 'R!0t_G@mes2024#');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (8, 'Sega', 'www.sega.com', 'S3g@_2024Power!');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (9, 'Valve', 'www.valvesoftware.com', 'V@lv3_St3am!#');

INSERT INTO PUBLISHER (PublisherID, PublisherName, PublisherWebsite, PublisherPassword )
VALUES (10, 'Epic Games', 'www.epicgames.com', 'Ep1cG@mes2024!#');


-- Populate table game

INSERT INTO GAME VALUES(1, 'Apex Legends', 'FPS', TO_DATE('04-02-2019', 'DD-MM-YYYY'), 0.00, 9.0, '70 GB', 1);
INSERT INTO GAME VALUES(2, 'Overwatch 2', 'FPS', TO_DATE('04-10-2022', 'DD-MM-YYYY'), 0.00, 8.0, '50 GB', 2);
INSERT INTO GAME VALUES(3, 'FIFA 24', 'Sports', TO_DATE('29-09-2023', 'DD-MM-YYYY'), 79.00, 9.0, '40 GB', 1);
INSERT INTO GAME VALUES(4, 'Diablo IV', 'RPG', TO_DATE('18-10-2023', 'DD-MM-YYYY'), 237.50, 9.0, '90 GB', 2);
INSERT INTO GAME VALUES(5, 'Far Cry 6', 'Adventure', TO_DATE('07-10-2021', 'DD-MM-YYYY'), 189.00, 7.5, '60 GB', 3);
INSERT INTO GAME VALUES(6, 'Tekken 8', 'Fighting', TO_DATE('26-01-2024', 'DD-MM-YYYY'), 239.00, 8.5, '100 GB', 5);
INSERT INTO GAME VALUES(7, 'Dota 2', 'MOBA', TO_DATE('09-07-2013', 'DD-MM-YYYY'), 0.00, 9.0, '15 GB', 9);
INSERT INTO GAME VALUES(8, 'Portal', 'Puzzle', TO_DATE('10-10-2007', 'DD-MM-YYYY'), 26.75, 9.5, '5 GB', 9);
INSERT INTO GAME VALUES(9, 'Portal 2', 'Puzzle', TO_DATE('18-04-2011', 'DD-MM-YYYY'), 26.75, 9.5, '8 GB', 9);
INSERT INTO GAME VALUES(10, 'Elden Ring', 'RPG', TO_DATE('25-02-2022', 'DD-MM-YYYY'), 199.00, 9.5, '60 GB', 5);
INSERT INTO GAME VALUES(11, 'Valorant', 'FPS', TO_DATE('02-06-2020', 'DD-MM-YYYY'), 0.00, 8.5, '29 GB', 7);
INSERT INTO GAME VALUES(12, 'PowerWash Simulator', 'Simulation', TO_DATE('14-06-2022', 'DD-MM-YYYY'), 109.00, 8.0, '6 GB', 4);
INSERT INTO GAME VALUES(13, 'Final Fantasy XVI', 'RPG', TO_DATE('22-06-2023', 'DD-MM-YYYY'), 209.00, 9.0, '170 GB', 4);
INSERT INTO GAME VALUES(14, 'Fallout 76', 'RPG', TO_DATE('14-11-2018', 'DD-MM-YYYY'), 158.00, 6.0, '96 GB', 6);
INSERT INTO GAME VALUES(15, 'DOOM Eternal', 'RPG', TO_DATE('20-03-2020', 'DD-MM-YYYY'), 119.99, 9.0, '80 GB', 6);
INSERT INTO GAME VALUES(16, 'HiFi Rush', 'Rhythm', TO_DATE('25-01-2023', 'DD-MM-YYYY'), 104.90, 6.0, '20 GB', 6);
INSERT INTO GAME VALUES(17, 'Sonic Frontiers', 'Adventure', TO_DATE('08-11-2022', 'DD-MM-YYYY'), 159.00, 7.0, '30 GB', 8);
INSERT INTO GAME VALUES(18, 'Yakuza 0', 'Adventure', TO_DATE('24-01-2017', 'DD-MM-YYYY'), 85.00, 9.0, '25 GB', 8);
INSERT INTO GAME VALUES(19, 'Persona 5 Royal', 'RPG', TO_DATE('31-10-2019', 'DD-MM-YYYY'), 252.00, 9.5, '41 GB', 8);
INSERT INTO GAME VALUES(20, 'Fortnite', '3PS', TO_DATE('25-07-2017', 'DD-MM-YYYY'), 0.00, 8.5, '30 GB', 10);


-- Populate table users

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (1, 'Shmort', 'Shmort!2024*', 'shmort@gmail.com', 'United States', TO_DATE('15/06/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (2, 'Zoom', 'Zoom!@2024', 'zoomer@gmail.com', 'Canada', TO_DATE('21/07/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (3, 'shadowdarking0', 'ShadowD@rk0$2024', 'shadowdarking0@gmail.com', 'Germany', TO_DATE('08/10/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (4, 'rith', 'Rith_#5*2024', 'rith2024@gmail.com', 'Australia', TO_DATE('15/05/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (5, 'FZ0504', 'FZ_05!04$', 'fz0504@gmail.com', 'United Kingdom', TO_DATE('09/01/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (6, 'Zelll', 'Z3ll!l*2024', 'zelll@gmail.com', 'Japan', TO_DATE('26/05/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (7, 'Retro', 'Retro_1980$', 'retro1980@gmail.com', 'Brazil', TO_DATE('10/12/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined) 
VALUES (8, 'Milkman', 'Milk#Man2024!', 'milkman2024@gmail.com', 'New Zealand', TO_DATE('04/11/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (9, 'mrekk', 'Mr3kk@2024!', 'mrekk@gmail.com', 'Sweden', TO_DATE('13/03/2023', 'DD-MM-YYYY'));

INSERT INTO USERS (UserID, Username, UserPassword, UserEmail, UserCountry, DateJoined)
VALUES (10, 'Zoink', 'Zoink_#2024!', 'zoink@gmail.com', 'South Korea', TO_DATE('19/08/2023', 'DD-MM-YYYY'));


-- Populate table purchases

INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (1, 1, 3, '15/07/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (2, 2, 4, '21/08/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (3, 3, 12, '10/09/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (4, 4, 5, '30/06/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (5, 5, 11, '01/10/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (6, 6, 12, '25/07/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (7, 7, 10, '12/11/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (8, 8, 14, '17/05/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (9, 9, 1, '30/04/2023');
INSERT INTO PURCHASES (PurchaseID, UserID, GameID, PurchaseDate) VALUES (10, 10, 2, '18/10/2023');


-- Populate table userlibrary

INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (1, 3, '15/7/2023', 27, '30/7/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (2, 4, '21/8/2023', 10, '5/9/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (3, 12, '10/9/2023', 30, '20/9/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (4, 5, '30/6/2023', 12, '13/7/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (5, 11, '1/10/2023', 120, '18/10/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (6, 12, '25/7/2023', 200, '8/8/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (7, 10, '12/11/2023', 130, '26/11/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (8, 14, '17/5/2023', 76, '5/6/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (9, 1, '30/4/2023', 231, '17/5/2023');
INSERT INTO USERLIBRARY (UserID, GameID, DateAdded, HoursPlayed, LastPlayed) VALUES (10, 2, '18/10/2023', 176, '31/10/2023');

