-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/nao3gW
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Parents] (
    [Name] string  NOT NULL ,
    [ChildName] string  NOT NULL ,
    [Address] varchar(50)  NOT NULL ,
    [CoParent] string  NOT NULL ,
    [DriverLicenseNumber] varchar(17)  NOT NULL ,
    CONSTRAINT [PK_Parents] PRIMARY KEY CLUSTERED (
        [DriverLicenseNumber] ASC
    )
)

CREATE TABLE [Children] (
    [Name] string  NOT NULL ,
    [Age] int  NOT NULL ,
    [BirthDate] int  NOT NULL ,
    [Allergies] string  NOT NULL ,
    [SpecialInstructions] string  NOT NULL ,
    [ParentName] string  NOT NULL ,
    [DropOff-PickUpTime] time  NOT NULL ,
    CONSTRAINT [PK_Children] PRIMARY KEY CLUSTERED (
        [ParentName] ASC
    )
)

CREATE TABLE [Staff] (
    [Name] string  NOT NULL ,
    [Address] varchar(50)  NOT NULL ,
    [ChildrenResponsibleFor] string  NOT NULL ,
    [PayRate] money  NOT NULL ,
    CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED (
        [Name] ASC
    )
)

CREATE TABLE [Vehicles] (
    [LicensePlateNumber] varchar(8)  NOT NULL ,
    [Make] varchar(50)  NOT NULL ,
    [Model] varchar(50)  NOT NULL ,
    [Color] string  NOT NULL ,
    [DriverLicenseNumber] varchar(17)  NOT NULL 
)

CREATE TABLE [SchoolSupplies] (
    [ChildAssignedTo] string  NOT NULL ,
    [Books] varchar(50)  NOT NULL ,
    [Tech] varchar(25)  NOT NULL ,
    [Pens] int  NOT NULL ,
    [Pencils] int  NOT NULL ,
    [Crayons] int  NOT NULL ,
    CONSTRAINT [PK_SchoolSupplies] PRIMARY KEY CLUSTERED (
        [ChildAssignedTo] ASC
    )
)

ALTER TABLE [Parents] WITH CHECK ADD CONSTRAINT [FK_Parents_DriverLicenseNumber] FOREIGN KEY([DriverLicenseNumber])
REFERENCES [Vehicles] ([DriverLicenseNumber])

ALTER TABLE [Parents] CHECK CONSTRAINT [FK_Parents_DriverLicenseNumber]

ALTER TABLE [Children] WITH CHECK ADD CONSTRAINT [FK_Children_ParentName] FOREIGN KEY([ParentName])
REFERENCES [Parents] ([Name])

ALTER TABLE [Children] CHECK CONSTRAINT [FK_Children_ParentName]

ALTER TABLE [Staff] WITH CHECK ADD CONSTRAINT [FK_Staff_ChildrenResponsibleFor] FOREIGN KEY([ChildrenResponsibleFor])
REFERENCES [Children] ([Name])

ALTER TABLE [Staff] CHECK CONSTRAINT [FK_Staff_ChildrenResponsibleFor]

ALTER TABLE [SchoolSupplies] WITH CHECK ADD CONSTRAINT [FK_SchoolSupplies_ChildAssignedTo] FOREIGN KEY([ChildAssignedTo])
REFERENCES [Children] ([Name])

ALTER TABLE [SchoolSupplies] CHECK CONSTRAINT [FK_SchoolSupplies_ChildAssignedTo]

COMMIT TRANSACTION QUICKDBD