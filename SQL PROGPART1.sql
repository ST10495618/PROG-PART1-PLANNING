1.	CREATE DATABASE RaceDay 
2.	CREATE TABLE Event( 
EventID INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
EventName VARCHAR(255) NOT NULL, 
EventType VARCHAR(255) NOT NULL, 
EventDate Date NOT NULL, 
EventTime Time NOT NULL 
); 
3.	CREATE TABLE Users( 
UsersID INT IDENTITY(1,1) PRIMARY KEY, 
Name VARCHAR(255) NOT NULL, 
Surname VARCHAR(255) NOT NULL 
); 
4.	CREATE TABLE Roles( 
RoleID INT IDENTITY(1,1) PRIMARY KEY, 
RoleName VARCHAR(255) NOT NULL UNIQUE 
); 
  
5.	CREATE TABLE UserRole( 
User_RoleID INT IDENTITY(1,1) PRIMARY KEY, 
UsersID INT NOT NULL, 
RoleID INT NOT NULL, 
CONSTRAINT FK_UserRole_Users 
FOREIGN KEY (UsersID) REFERENCES Users(UsersID), 
CONSTRAINT FK_UserRole_Roles 
FOREIGN KEY (RoleID) REFERENCES Roles(RoleID), 
CONSTRAINT UQ_UserRole 
UNIQUE (UsersID, RoleID) 
  
); 
  
6.	CREATE TABLE Registration( 
RegistrationID INT IDENTITY(1,1) PRIMARY KEY, 
UsersID INT NOT NULL, 
EventID INT NOT NULL, 
CONSTRAINT FK_Registration_Users 
FOREIGN KEY (UsersID) REFERENCES Users(UsersID), 
CONSTRAINT FK_Registration_Event 
FOREIGN KEY (EventID) REFERENCES Event(EventID), 
CONSTRAINT UQ_Registration 
UNIQUE (UsersID, EventID) 
); 
  
7.	CREATE TABLE Results( 
ResultsID INT IDENTITY(1,1) PRIMARY KEY, 
FinishingPosition INT, 
StartPosition INT, 
Pace INT, 
Status Varchar(20) NOT NULL, 
RegistrationID INT NOT NULL, 
CONSTRAINT FK_Results_Registration 
FOREIGN KEY (RegistrationID) REFERENCES Registration(RegistrationID) 
); 
  
8.	CREATE TABLE Route( 
RouteID INT IDENTITY(1,1) PRIMARY KEY, 
RouteName VARCHAR(255), 
Distance DECIMAL(6,2), 
StartLocation VARCHAR(255), 
FinishLocation VARCHAR(255), 
EventID INT NOT NULL, 
CONSTRAINT FK_Route_Event 
FOREIGN KEY (EventID) REFERENCES Event(EventID) 
); 
  
9.	CREATE TABLE Weather( 
WeatherID INT IDENTITY(1,1) PRIMARY KEY, 
Temperature DECIMAL(5,2), 
Humidity INT, 
WindSpeed DECIMAL(6,2), 
Rainfall INT, 
EventID INT NOT NULL, 
CONSTRAINT FK_Weather_Event 
FOREIGN KEY (EventID) REFERENCES Event(EventID) 
); 
  
10.	CREATE TABLE Category( 
CategoryID INT IDENTITY(1,1) PRIMARY KEY, 
CategoryName VARCHAR(255) NOT NULL UNIQUE 
); 
  
11.	CREATE TABLE EventCategory( 
EventCategoryID INT IDENTITY(1,1) PRIMARY KEY, 
EventID INT NOT NULL, 
CategoryID INT NOT NULL, 
CONSTRAINT FK_EventCategory_Event 
FOREIGN KEY (EventID) REFERENCES Event(EventID), 
CONSTRAINT FK_EventCategory_Category 
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID), 
CONSTRAINT UQ_EventCategory 
UNIQUE (EventID, CategoryID) 
); 
POPULATING THE DATABASE 
INSERT INTO Roles (RoleName)  
VALUES ('Organiser'), ('Participant'); 
SELECT * FROM Roles; 
  
INSERT INTO Users (Name, Surname)  
VALUES ('Thabo', 'Mokoena'),  
('Lerato', 'Dlamini'),  
('Sipho', 'Nkosi'), ('Amahle', 'Zulu'); 
SELECT * FROM Users; 
  
INSERT INTO UserRole (UsersID, RoleID)  
VALUES (1, 1), (2, 1), (3, 2), (4, 2) 
SELECT * FROM UserRole 
  
INSERT INTO Event ( EventName, EventType, EventDate, EventTime )  
VALUES ( 'Johannesburg City Marathon', 'Marathon', '2026-10-18', '07:00:00' ),  
( 'Soweto Fun Run', 'Fun Run', '2026-11-08', '08:00:00' ),  
( 'Pretoria Charity Race', 'Charity Run', '2026-12-06', '07:30:00' ); 
SELECT * FROM Event; 
  
  INSERT INTO Category (CategoryName)  
  VALUES ('Road Running'),  
  ('Marathon'),  
  ('Competitive'),  
  ('Fun Run'),  
  ('Community'),  
  ('Family'),  
  ('Charity'),  
  ('Fitness'),  
  ('Fundraising'); 
  SELECT * FROM Category; 
  
   INSERT INTO EventCategory ( EventID, CategoryID )  
   VALUES (1, 1),  
   (1, 2),  
   (1, 3); 
    INSERT INTO EventCategory ( EventID, CategoryID )  
    VALUES (2, 4),  
    (2, 5),  
    (2, 6); 
    INSERT INTO EventCategory ( EventID, CategoryID )  
    VALUES (3, 7),  
    (3, 8),  
    (3, 9);  
    SELECT * FROM EventCategory; 
  
     INSERT INTO Registration ( UsersID, EventID ) VALUES (3, 1), 
     (4, 1),  
     (3, 2),  
     (4, 2),  
     (3, 3),  
     (4, 3);  
     SELECT * FROM Registration; 
  
     INSERT INTO Results ( FinishingPosition, StartPosition, Pace, Status, RegistrationID )  
     VALUES (1, 1, 5, 'Finished', 1), 
     (2, 2, 6, 'Finished', 2),  
     (1, 1, 4, 'Finished', 3),  
     (2, 2, 5, 'Finished', 4),  
     (3, 1, 6, 'Finished', 5),  
     (4, 2, 7, 'Finished', 6);  
     SELECT * FROM Results; 
  
     INSERT INTO Route ( RouteName, Distance, StartLocation, FinishLocation, EventID )  
     VALUES ( 'Johannesburg Marathon Route', 42.20, 'Sandton', 'Johannesburg Stadium', 1 ), 
     ( 'Soweto Fun Run Route', 10.00, 'Soweto Stadium', 'Vilakazi Street', 2 ),  
     ( 'Pretoria Charity Route', 21.10, 'Pretoria CBD', 'Union Buildings', 3 ); 
     SELECT * FROM Route; 
  
      INSERT INTO Weather ( Temperature, Humidity, WindSpeed, Rainfall, EventID )  
      VALUES ( 19.50, 55, 12.50, 0, 1 ), 
      ( 22.00, 60, 10.20, 0, 2 ),  
      ( 18.00, 50, 8.50, 2, 3 ); 
      SELECT * FROM Weather; 
SELECT * FROM Users; 
SELECT * FROM Roles;
SELECT * FROM Event; 
SELECT * FROM Category; 
SELECT * FROM EventCategory; 
SELECT * FROM Registration; 
SELECT * FROM Results; 
SELECT * FROM Route; 
SELECT * FROM Weather; 
