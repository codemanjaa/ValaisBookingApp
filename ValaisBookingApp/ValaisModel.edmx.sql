
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/21/2019 13:47:57
-- Generated from EDMX file: C:\CS\ValaisBookingApp\ValaisBookingApp\ValaisModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ValaisDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_HotelRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Room] DROP CONSTRAINT [FK_HotelRoom];
GO
IF OBJECT_ID(N'[dbo].[FK_PictureRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Room] DROP CONSTRAINT [FK_PictureRoom];
GO
IF OBJECT_ID(N'[dbo].[FK_RoomBookedRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookedRoom] DROP CONSTRAINT [FK_RoomBookedRoom];
GO
IF OBJECT_ID(N'[dbo].[FK_BookingBookedRoom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BookedRoom] DROP CONSTRAINT [FK_BookingBookedRoom];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Hotel]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Hotel];
GO
IF OBJECT_ID(N'[dbo].[Room]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Room];
GO
IF OBJECT_ID(N'[dbo].[Picture]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Picture];
GO
IF OBJECT_ID(N'[dbo].[BookedRoom]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookedRoom];
GO
IF OBJECT_ID(N'[dbo].[Booking]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Booking];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hotel'
CREATE TABLE [dbo].[Hotel] (
    [IdHotel] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [Category] nvarchar(max)  NOT NULL,
    [HasWifi] bit  NOT NULL,
    [HasParking] bit  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Website] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Room'
CREATE TABLE [dbo].[Room] (
    [IdRoom] int IDENTITY(1,1) NOT NULL,
    [Number] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [HasTv] bit  NOT NULL,
    [HasHairDryer] bit  NOT NULL,
    [IdHotel] nvarchar(max)  NOT NULL,
  
);
GO

-- Creating table 'Picture'
CREATE TABLE [dbo].[Picture] (
    [IdPicture] int IDENTITY(1,1) NOT NULL,
    [Url] nvarchar(max)  NOT NULL,
    [IdRoom] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BookedRoom'
CREATE TABLE [dbo].[BookedRoom] (
    [IdBookedRoom] int IDENTITY(1,1) NOT NULL,
    [IdBooking] nvarchar(max)  NOT NULL,
    [IdRoom] nvarchar(max)  NOT NULL,
    [Room_IdRoom] int  NOT NULL,
    [Booking_IdBooking] int  NOT NULL
);
GO

-- Creating table 'Booking'
CREATE TABLE [dbo].[Booking] (
    [IdBooking] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [ArrivalDate] datetime  NOT NULL,
    [DepartureDate] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdHotel] in table 'Hotel'
ALTER TABLE [dbo].[Hotel]
ADD CONSTRAINT [PK_Hotel]
    PRIMARY KEY CLUSTERED ([IdHotel] ASC);
GO

-- Creating primary key on [IdRoom] in table 'Room'
ALTER TABLE [dbo].[Room]
ADD CONSTRAINT [PK_Room]
    PRIMARY KEY CLUSTERED ([IdRoom] ASC);
GO

-- Creating primary key on [IdPicture] in table 'Picture'
ALTER TABLE [dbo].[Picture]
ADD CONSTRAINT [PK_Picture]
    PRIMARY KEY CLUSTERED ([IdPicture] ASC);
GO

-- Creating primary key on [IdBookedRoom] in table 'BookedRoom'
ALTER TABLE [dbo].[BookedRoom]
ADD CONSTRAINT [PK_BookedRoom]
    PRIMARY KEY CLUSTERED ([IdBookedRoom] ASC);
GO

-- Creating primary key on [IdBooking] in table 'Booking'
ALTER TABLE [dbo].[Booking]
ADD CONSTRAINT [PK_Booking]
    PRIMARY KEY CLUSTERED ([IdBooking] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Hotel_IdHotel] in table 'Room'
ALTER TABLE [dbo].[Room]
ADD CONSTRAINT [FK_HotelRoom]
    FOREIGN KEY ([Hotel_IdHotel])
    REFERENCES [dbo].[Hotel]
        ([IdHotel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HotelRoom'
CREATE INDEX [IX_FK_HotelRoom]
ON [dbo].[Room]
    ([Hotel_IdHotel]);
GO

-- Creating foreign key on [Picture_IdPicture] in table 'Room'
ALTER TABLE [dbo].[Room]
ADD CONSTRAINT [FK_PictureRoom]
    FOREIGN KEY ([Picture_IdPicture])
    REFERENCES [dbo].[Picture]
        ([IdPicture])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PictureRoom'
CREATE INDEX [IX_FK_PictureRoom]
ON [dbo].[Room]
    ([Picture_IdPicture]);
GO

-- Creating foreign key on [Room_IdRoom] in table 'BookedRoom'
ALTER TABLE [dbo].[BookedRoom]
ADD CONSTRAINT [FK_RoomBookedRoom]
    FOREIGN KEY ([Room_IdRoom])
    REFERENCES [dbo].[Room]
        ([IdRoom])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomBookedRoom'
CREATE INDEX [IX_FK_RoomBookedRoom]
ON [dbo].[BookedRoom]
    ([Room_IdRoom]);
GO

-- Creating foreign key on [Booking_IdBooking] in table 'BookedRoom'
ALTER TABLE [dbo].[BookedRoom]
ADD CONSTRAINT [FK_BookingBookedRoom]
    FOREIGN KEY ([Booking_IdBooking])
    REFERENCES [dbo].[Booking]
        ([IdBooking])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookingBookedRoom'
CREATE INDEX [IX_FK_BookingBookedRoom]
ON [dbo].[BookedRoom]
    ([Booking_IdBooking]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------