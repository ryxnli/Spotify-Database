CREATE DATABASE Spotify26;
Use Spotify26;

CREATE TABLE Label (
LabelID char(4) NOT NULL,
LabelName varchar(20) NOT NULL,
CEO varchar(20) NOT NULL,
PRIMARY KEY (LabelID)
);

CREATE TABLE Genre (
GenreID char(4) NOT NULL,
GenreName varchar(20) NOT NULL,
PRIMARY KEY (GenreID)
);

CREATE TABLE MemberTier (
MemberTierID char(4) NOT NULL,
MemberTierName varchar(20) NOT NULL,
MembershipPrice char(6) NOT NULL,
NumberofAvailablePlaylist DECIMAL (10,2) NOT NULL,
PRIMARY KEY (MemberTierID)
);

CREATE TABLE Artist (
ArtistID char(4) NOT NULL,
ArtistName varchar(20) NOT NULL,
DOB DATE NOT NULL,
LabelID char(4) NOT NULL,
PRIMARY KEY (ArtistID),
FOREIGN KEY (LabelID) REFERENCES Label(LabelID)
);


CREATE TABLE User (
UserID char(4) NOT NULL,
UserName varchar(20) NOT NULL,
Gender char(6) NOT NULL,
MemberTierID char(4) NOT NULL,
MobilePhone varchar(15) NOT NULL,
Email varchar(100) NOT NULL,
PRIMARY KEY (UserID),
FOREIGN KEY (MemberTierID) REFERENCES MemberTier(MemberTierID)
);

CREATE TABLE Album (
AlbumID char(5) NOT NULL,
AlbName varchar(20) NOT NULL,
ReleaseDate DATE NOT NULL,
ArtistID char(4) NOT NULL,
PRIMARY KEY (AlbumID),
FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);

CREATE TABLE Playlist (
PlaylistID char(4) NOT NULL,
UserID char(4) NOT NULL,
PlayListRate INT NOT NULL,
CreatedDate DATE NOT NULL,
PRIMARY KEY (PlaylistID),
FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Payment (
PaymentID char(5) NOT NULL,
UserID char(4) NOT NULL,
PaymentDate DATE NOT NULL,
PaymentAmount DECIMAL(10,2) NOT NULL,
PaymentMethod varchar(20) NOT NULL,
PaymentStatus varchar(20) NOT NULL,
PRIMARY KEY (PaymentID),
FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Song (
SongID char(4) NOT NULL,
SName varchar(20) NOT NULL,
Length INT NOT NULL,
AlbumID char(5) NOT NULL,
PRIMARY KEY (SongID),
FOREIGN KEY (AlbumID) REFERENCES Album(AlbumID)
);

CREATE TABLE SongGenre (
SongID char(4) NOT NULL,
GenreID char(4) NOT NULL,
PRIMARY KEY (SongID, GenreID),
FOREIGN KEY (SongID) REFERENCES Song(SongID),
FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

CREATE TABLE PlaylistSong (
PLSID char(5) NOT NULL,
PlaylistID char(4) NOT NULL,
SongID char(4) NOT NULL,
PlayedLength INT NOT NULL,
PRIMARY KEY (PLSID),
FOREIGN KEY (PlaylistID) REFERENCES Playlist(PlaylistID),
FOREIGN KEY (SongID) REFERENCES Song(SongID)
);

CREATE TABLE StreamingHistory (
StreamingID CHAR(5) NOT NULL,
UserID char(4) NOT NULL,
SongID char(4) NOT NULL,
StreamDate DATE NOT NULL,
StreamDuration INT NOT NULL,
DeviceType varchar(20) NOT NULL,
PRIMARY KEY (StreamingID),
FOREIGN KEY (UserID) REFERENCES User(UserID),
FOREIGN KEY (SongID) REFERENCES Song(SongID)
);

INSERT INTO Label 
VALUES
('L001', 'DreamMusic', 'John Kim'),
('L002', 'StarSound', 'Emily Lee'),
('L003', 'WaveRecords', 'David Park'),
('L004', 'UrbanBeat', 'Sarah Choi'),
('L005', 'IndieWorld', 'Michael Han');

INSERT INTO Genre 
VALUES
('G001', 'Pop'),
('G002', 'Rock'),
('G003', 'HipHop'),
('G004', 'Ballad'),
('G005', 'Jazz');

INSERT INTO MemberTier 
VALUES
('M001', 'Free', 0.00, 3.00),
('M002', 'Student', 4.99, 10.00),
('M003', 'Premium', 9.99, 50.00),
('M004', 'Family', 14.99, 100.00),
('M005', 'Artist', 19.99, 200.00);

INSERT INTO Artist 
VALUES
('A001', 'Luna', '1995-03-15', 'L001'),
('A002', 'NeoBand', '1992-07-22', 'L002'),
('A003', 'Mira', '1998-11-02', 'L003'),
('A004', 'BlueTone', '1990-05-30', 'L004'),
('A005', 'EchoStar', '1996-09-18', 'L005');

INSERT INTO User 
VALUES
('U001', 'Alice', 'Female', 'M003', '617-111-1111', 'alice@email.com'),
('U002', 'Brian', 'Male', 'M001', '617-222-2222', 'brian@email.com'),
('U003', 'Cindy', 'Female', 'M003', '617-333-3333', 'cindy@email.com'),
('U004', 'Daniel', 'Male', 'M002', '617-444-4444', 'daniel@email.com'),
('U005', 'Emma', 'Female', 'M004', '617-555-5555', 'emma@email.com'),
('U006', 'FutureUser', 'Female', 'M001', '617-666-6666', 'future@email.com');

INSERT INTO Album 
VALUES
('AL001', 'Moonlight', '2023-01-10', 'A001'),
('AL002', 'CityLife', '2023-03-15', 'A002'),
('AL003', 'OceanBlue', '2023-05-20', 'A003'),
('AL004', 'NightDrive', '2023-07-25', 'A004'),
('AL005', 'DreamRoad', '2023-09-12', 'A005');

INSERT INTO Playlist 
VALUES
('P001', 'U001', 5, '2024-01-05'),
('P002', 'U002', 3, '2024-01-10'),
('P003', 'U003', 4, '2024-02-15'),
('P004', 'U004', 5, '2024-03-01'),
('P005', 'U005', 4, '2024-03-20');

INSERT INTO Payment 
VALUES
('PM001', 'U001', '2024-04-01', 9.99, 'Credit Card', 'Paid'),
('PM002', 'U003', '2024-04-01', 9.99, 'PayPal', 'Paid'),
('PM003', 'U004', '2024-04-01', 4.99, 'Credit Card', 'Paid'),
('PM004', 'U005', '2024-04-01', 14.99, 'Debit Card', 'Paid'),
('PM005', 'U001', '2024-05-01', 9.99, 'Credit Card', 'Paid'),
('PM006', 'U003', '2024-05-01', 9.99, 'PayPal', 'Paid');

INSERT INTO Song 
VALUES
('S001', 'SilverMoon', 210, 'AL001'),
('S002', 'BrightSky', 185, 'AL001'),
('S003', 'CityWalk', 230, 'AL002'),
('S004', 'NeonLight', 200, 'AL002'),
('S005', 'BlueOcean', 240, 'AL003'),
('S006', 'DeepWave', 215, 'AL003'),
('S007', 'NightRide', 225, 'AL004'),
('S008', 'FastLane', 195, 'AL004'),
('S009', 'DreamHigh', 205, 'AL005'),
('S010', 'RoadTrip', 220, 'AL005');

INSERT INTO SongGenre 
VALUES
('S001', 'G001'),
('S002', 'G001'),
('S004', 'G001'),
('S010', 'G001'),
('S007', 'G002'),
('S008', 'G002'),
('S003', 'G003'),
('S004', 'G003'),
('S001', 'G004'),
('S005', 'G004'),
('S006', 'G004'),
('S009', 'G005'),
('S010', 'G005');

INSERT INTO PlaylistSong 
VALUES
('PS001', 'P001', 'S001', 210),
('PS002', 'P001', 'S003', 220),
('PS003', 'P002', 'S004', 180),
('PS004', 'P002', 'S005', 240),
('PS005', 'P003', 'S006', 200),
('PS006', 'P003', 'S007', 225),
('PS007', 'P004', 'S008', 190),
('PS008', 'P004', 'S009', 205),
('PS009', 'P005', 'S010', 220),
('PS010', 'P005', 'S002', 185);

INSERT INTO StreamingHistory 
VALUES
('ST001', 'U001', 'S001', '2024-04-01', 210, 'Mobile'),
('ST002', 'U001', 'S003', '2024-04-02', 220, 'Laptop'),
('ST003', 'U002', 'S004', '2024-04-03', 180, 'Mobile'),
('ST004', 'U003', 'S005', '2024-04-04', 240, 'Tablet'),
('ST005', 'U003', 'S006', '2024-04-05', 200, 'Mobile'),
('ST006', 'U004', 'S007', '2024-04-06', 225, 'Laptop'),
('ST007', 'U004', 'S008', '2024-04-07', 190, 'Mobile'),
('ST008', 'U005', 'S009', '2024-04-08', 205, 'Tablet'),
('ST009', 'U005', 'S010', '2024-04-09', 220, 'Mobile'),
('ST010', 'U002', 'S002', '2024-04-10', 185, 'Laptop');

ALTER TABLE Label ADD Column LabelEmail varchar(100);

UPDATE Label
SET LabelEmail = 'contact@dreammusic.com'
WHERE LabelID = 'L001';

UPDATE Label
SET LabelEmail = 'info@starsound.com'
WHERE LabelID = 'L002';

UPDATE Label
SET LabelEmail = 'support@waverecords.com'
WHERE LabelID = 'L003';

UPDATE Label
SET LabelEmail = 'hello@urbanbeat.com'
WHERE LabelID = 'L004';

UPDATE Label
SET LabelEmail = 'admin@indieworld.com'
WHERE LabelID = 'L005';

SELECT * FROM Label;

REPLACE INTO PlaylistSong VALUES (
'PS010',
'P005',
'S010',
220
);

SELECT * FROM PlaylistSong;

SELECT * FROM Song 
ORDER BY Length DESC;

SELECT * FROM Payment
WHERE PaymentAmount > 5.00;

SELECT * FROM User, MemberTier
WHERE User.MemberTierID = MemberTier.MemberTierID
AND MemberTier.MemberTierName IN ('Premium', 'Family');

SELECT
Artist.ArtistName,
Album.AlbName,
Song.SName,
Song.Length
FROM Artist, Album, Song
WHERE Artist.ArtistID = Album.ArtistID
AND Album.AlbumID = Song.AlbumID;

SELECT
Song.SName,
Genre.GenreName,
Song.Length
FROM Song, SongGenre, Genre
WHERE Song.SongID = SongGenre.SongID
AND SongGenre.GenreID = Genre.GenreID
AND (Genre.GenreName LIKE '%Pop%' OR Genre.GenreName LIKE '%Jazz%'
);

SELECT
Artist.ArtistID,
Artist.ArtistName,
AVG(Song.Length),
COUNT(Song.SongID)
FROM Artist, Album, Song
WHERE Artist.ArtistID = Album.ArtistID
AND Album.AlbumID = Song.AlbumID
GROUP BY
Artist.ArtistID,
Artist.ArtistName;

SELECT DISTINCT
User.UserName,
Playlist.PlaylistID,
Song.SName,
PlaylistSong.PlayedLength
FROM User, Playlist, PlaylistSong, Song
WHERE User.UserID = Playlist.UserID
AND Playlist.PlaylistID = PlaylistSong.PlaylistID
AND PlaylistSong.SongID = Song.SongID
ORDER BY User.UserName ASC;

SELECT
User.UserID,
User.UserName,
AVG(StreamingHistory.StreamDuration),
COUNT(StreamingHistory.StreamingID)
FROM User, StreamingHistory
WHERE User.UserID = StreamingHistory.UserID
GROUP BY
User.UserID,
User.UserName
HAVING AVG(StreamingHistory.StreamDuration) > 200;

SELECT 
Song.SName,
Song.Length,
AVG(StreamingHistory.StreamDuration)
FROM Song, StreamingHistory
WHERE Song.SongID = StreamingHistory.SongID
AND Song.AlbumID IN (
SELECT Album.AlbumID
FROM Album, Artist, Label
WHERE Album.ArtistID = Artist.ArtistID
AND Artist.LabelID = Label.LabelID
AND (
Label.LabelName LIKE '%Dream%'
OR Label.LabelName LIKE '%Star%'
)
)
GROUP BY 
Song.SName,
Song.Length;

CREATE VIEW summarized_view AS
SELECT 
User.UserID,
User.UserName,
Song.SongID,
Song.SName,
Song.Length,
StreamingHistory.StreamingID,
StreamingHistory.StreamDate,
StreamingHistory.StreamDuration,
StreamingHistory.DeviceType
FROM User, StreamingHistory, Song
WHERE User.UserID = StreamingHistory.UserID
AND StreamingHistory.SongID = Song.SongID;

SELECT 
UserID,
UserName,
SUM(StreamDuration),
COUNT(StreamingID)
FROM summarized_view
GROUP BY 
UserID,
UserName;

INSERT INTO User VALUES
('U007', 'NewUser', 'Male', 'M001', '617-777-7777', 'newuser@email.com');


## LEFT JOIN
SELECT
User.UserID,
User.UserName,
Payment.PaymentID,
Payment.PaymentAmount,
Payment.PaymentMethod,
Payment.PaymentStatus
FROM User
LEFT JOIN Payment
ON User.UserID = Payment.UserID;


## RIGHT JOIN
SELECT
User.UserID,
User.UserName,
Payment.PaymentID,
Payment.PaymentAmount,
Payment.PaymentMethod,
Payment.PaymentStatus
FROM User
RIGHT JOIN Payment
ON User.UserID = Payment.UserID;

CREATE TABLE Date_Dim (
DateID CHAR(8) NOT NULL,
FullDate DATE NOT NULL,
Year INT NOT NULL,
Month INT NOT NULL,
Day INT NOT NULL,
PRIMARY KEY (DateID)
);

CREATE TABLE UserMembership_Dim (
UserMembershipID CHAR(4) NOT NULL,
UserID CHAR(4) NOT NULL,
UserName VARCHAR(20) NOT NULL,
Gender CHAR(6) NOT NULL,
MemberTierID CHAR(4) NOT NULL,
MemberTierName VARCHAR(20) NOT NULL,
MembershipPrice DECIMAL(10,2) NOT NULL,
NumberofAvailablePlaylist DECIMAL(10,2) NOT NULL,
PRIMARY KEY (UserMembershipID)
);

CREATE TABLE SongArtistAlbumLabel_Dim (
SongArtistAlbumLabelID CHAR(4) NOT NULL,
SongID CHAR(4) NOT NULL,
SName VARCHAR(20) NOT NULL,
SongLength INT NOT NULL,
AlbumID CHAR(5) NOT NULL,
AlbName VARCHAR(20) NOT NULL,
ReleaseDate DATE NOT NULL,
ArtistID CHAR(4) NOT NULL,
ArtistName VARCHAR(20) NOT NULL,
DOB DATE NOT NULL,
LabelID CHAR(4) NOT NULL,
LabelName VARCHAR(20) NOT NULL,
CEO VARCHAR(20) NOT NULL,
LabelEmail VARCHAR(100),
PRIMARY KEY (SongArtistAlbumLabelID)
);

CREATE TABLE Genre_Dim (
GenreID CHAR(4) NOT NULL,
GenreName VARCHAR(20) NOT NULL,
PRIMARY KEY (GenreID)
);

CREATE TABLE Streaming_Fact (
StreamingFactID CHAR(5) NOT NULL,
DateID CHAR(8) NOT NULL,
UserMembershipID CHAR(4) NOT NULL,
SongArtistAlbumLabelID CHAR(4) NOT NULL,
GenreID CHAR(4) NOT NULL,
StreamDuration INT NOT NULL,
SongLength INT NOT NULL,
PlayedLength INT NOT NULL,
NumberOfStreams INT NOT NULL,
PRIMARY KEY (StreamingFactID),
FOREIGN KEY (DateID) REFERENCES Date_Dim(DateID),
FOREIGN KEY (UserMembershipID) REFERENCES UserMembership_Dim(UserMembershipID),
FOREIGN KEY (SongArtistAlbumLabelID) REFERENCES SongArtistAlbumLabel_Dim(SongArtistAlbumLabelID),
FOREIGN KEY (GenreID) REFERENCES Genre_Dim(GenreID)
);

CREATE TABLE Payment_Fact (
PaymentFactID CHAR(5) NOT NULL,
DateID CHAR(8) NOT NULL,
UserMembershipID CHAR(4) NOT NULL,
PaymentAmount DECIMAL(10,2) NOT NULL,
NumberOfPayments INT NOT NULL,
PaymentStatus VARCHAR(20) NOT NULL,
PRIMARY KEY (PaymentFactID),
FOREIGN KEY (DateID) REFERENCES Date_Dim(DateID),
FOREIGN KEY (UserMembershipID) REFERENCES UserMembership_Dim(UserMembershipID)
);