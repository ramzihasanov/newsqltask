create database Spotify
use Spotify

create table Musics(
MusicId int  PRIMARY KEY IDENTITY,
MusicName nvarchar(30),
Duration int,
AlbumId int FOREIGN KEY REFERENCES Albums(Id),
ArtistID INT FOREIGN KEY REFERENCES Artists(Id)

)


create table Artists(
Id int  PRIMARY KEY IDENTITY,
Fullname nvarchar(30),
Age int,
)


create table Albums(
Id int  PRIMARY KEY IDENTITY,
AlbumName nvarchar(30),
RelaseDate Date
)

select * from Albums
select * from Artists
select * from Musics



INSERT INTO Albums VALUES
('remzi','2023'),
('vusal','2004'),
('elvin','2024')



INSERT INTO Artists VALUES
('remzi',19),
('elekber',22),
('huseyn',19)

INSERT INTO Musics VALUES
('music1',154,1,1),
('music2',160,1,1),
('music3',90,2,2),
('music4',120,2,2),
('music5',180,2,2),
('music6',175,3,3),
('music7',155,3,3)

create view musicdetals as
select m.MusicId , m.MusicName as 'Music name' , a.AlbumName as 'Album name' 
FROM Musics as m
JOIN Albums as a
ON 
m.AlbumId = a.Id

select * from musicdetals


create procedure USR_InsertArtist @FullName nvarchar(30),@Age int 
AS
INSERT  INTO Artists (Fullname, Age)
VALUES (@FullName, @Age)

 USR_InsertArtist 'yusif',22

select * FROM Artists



create procedure USR_DeleteArtist @Id int
AS
delete from Artists
where @id=Id

USR_DeleteArtist 4
select * from Artists



create procedure USR_UpdateArtist @Id int
AS
update Artists
set Fullname='eli'
where @Id=Id

USR_UpdateArtist 3
select * from Artists


create view AlbumInmusic
AS
select a.AlbumName as 'Album name' ,COUNT(*) as 'count'
from Albums as a
JOIN Musics as m
ON 
m.AlbumId = a.Id
GROUP BY a.AlbumName

select * from AlbumInmusic


create procedure USR_GetMusics @Duration int
AS
select * from Musics
where Duration > @Duration

 USR_GetMusics 150

create procedure USR_GetAlbums @Date date
AS
select * from Albums
where RelaseDate > @Date

USR_GetAlbums '2008' 