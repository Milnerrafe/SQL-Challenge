CREATE TABLE IF NOT EXISTS Heroes (
	Name VARCHAR(128),
    Abilities VARCHAR(256),
    Status ENUM('Active', 'Retired', 'Deceased'),
    Cost INT,
    PRIMARY KEY(Name)
) COMMENT = 'Stores hero information pertaining to their identification, abilities, and availability.';

CREATE TABLE IF NOT EXISTS Witnesses (
	BriefingID INT,
	Name VARCHAR(128),
    Occupation VARCHAR(128),
    Age INT,
    Gender ENUM('Male', 'Female', 'Other'),
    Statement VARCHAR(1024),
    PRIMARY KEY(BriefingID, Name)
) COMMENT = 'Stores witness testimonies correlating to briefings in the Briefings table.';

CREATE TABLE IF NOT EXISTS Villains (
    TeamName VARCHAR(256),
    RealName VARCHAR(128),
	VillainName VARCHAR(100),
    Abilities VARCHAR(512),
    Status ENUM('Active', 'Retired', 'Incareated', 'Deceased'),
    PRIMARY KEY(RealName , TeamName, VillainName)
) COMMENT = 'Stores villain information pertaining to their identification, abilities, and current active status.';

CREATE TABLE IF NOT EXISTS Briefings (
	BriefingID INT NOT NULL,
    Location VARCHAR(128),
    Description VARCHAR(1024),
    Date DATE,
    PRIMARY KEY(BriefingID)
) COMMENT = 'Stores information regarding criminal incidents that have occurred.';

CREATE TABLE IF NOT EXISTS Locations(
	LocationID INT NOT NULL,
    Sector VARCHAR(24),
    Address VARCHAR(128),
    Description VARCHAR(1024),
    EvilVibeScore INT,
    PRIMARY KEY(LocationID)
) COMMENT = 'Stores information regarding locations on Planet Heroes.';

CREATE TABLE IF NOT EXISTS Solutions(
	Scenario INT,
    Answer VARCHAR(256),
    PRIMARY KEY(Scenario)
) COMMENT = 'Where you will submit your answers! Insert the scenario number into the first column and your answer to it into the second, then run the solution_check() method in mysql-client.py.';

