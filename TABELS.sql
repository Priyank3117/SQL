

--- Create Admin table
CREATE TABLE IF NOT EXISTS "Admin" (
    "AdminId" SERIAL PRIMARY KEY,
    "AspNetUserId" VARCHAR(128) NOT NULL REFERENCES "AspNetUsers"("AspNetUserId"),
    "FirstName" VARCHAR(100) NOT NULL,
    "LastName" VARCHAR(100),
    "Email" VARCHAR(50) NOT NULL,
    "Mobile" VARCHAR(20),
    "Address1" VARCHAR(500),
    "Address2" VARCHAR(500),
    "City" VARCHAR(100),
    "RegionId" INT,
    "Zip" VARCHAR(10),
    "AltPhone" VARCHAR(20),
    "CreatedBy" VARCHAR(128) NOT NULL REFERENCES "AspNetUsers"("AspNetUserId"),
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedBy" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "ModifiedDate" TIMESTAMP,
    "Status" SMALLINT,
    "IsDeleted" BOOLEAN,
    "RoleId" INT
);



--- Create AdminRegion table
CREATE TABLE IF NOT EXISTS "AdminRegion" (
    "AdminRegionId" SERIAL PRIMARY KEY,
    "AdminId" INT NOT NULL,
    "RegionId" INT NOT NULL,
    CONSTRAINT "FK_AdminRegion_AdminId" FOREIGN KEY ("AdminId") REFERENCES "Admin" ("AdminId"),
    CONSTRAINT "FK_AdminRegion_RegionId" FOREIGN KEY ("RegionId") REFERENCES "Region" ("RegionId")
);




--- Create AspNetRoles table
CREATE TABLE IF NOT EXISTS "AspNetRoles" (
    "AspNetRoleId" VARCHAR(128) PRIMARY KEY NOT NULL,
    "Name" VARCHAR(256) NOT NULL
);



--- Create AspNetUserRoles table
CREATE TABLE IF NOT EXISTS "AspNetUserRoles" (
    "UserId" VARCHAR(128) NOT NULL REFERENCES "AspNetUsers"("AspNetUserId"),
    "RoleId" VARCHAR(128) NOT NULL REFERENCES "AspNetRoles"("AspNetRoleId"),
    PRIMARY KEY ("UserId", "RoleId")
);



--- Create AspNetUsers table
CREATE TABLE IF NOT EXISTS "AspNetUsers" (
    "AspNetUserId" VARCHAR(128) PRIMARY KEY NOT NULL,
    "UserName" VARCHAR(256) NOT NULL,
    "PasswordHash" VARCHAR,
    "Email" VARCHAR(256),
    "PhoneNumber" VARCHAR,
    "IP" VARCHAR(20),
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedDate" TIMESTAMP
);



--- Create BlockRequests table
CREATE TABLE IF NOT EXISTS "BlockRequests" (
    "BlockRequestId" SERIAL PRIMARY KEY NOT NULL,
    "PhoneNumber" VARCHAR(50),
    "Email" VARCHAR(50),
    "IsActive" BIT,
    "Reason" VARCHAR,
    "RequestId" VARCHAR(50) NOT NULL,
    "IP" VARCHAR(20),
    "CreatedDate" TIMESTAMP,
    "ModifiedDate" TIMESTAMP
);


--- Create Business table
CREATE TABLE IF NOT EXISTS "Business" (
    "BusinessId" SERIAL PRIMARY KEY,
    "Name" VARCHAR(100) NOT NULL,
    "Address1" VARCHAR(500),
    "Address2" VARCHAR(500),
    "City" VARCHAR(50),
    "RegionId" INT REFERENCES "Region"("RegionId"),
    "ZipCode" VARCHAR(10),
    "PhoneNumber" VARCHAR(20),
    "FaxNumber" VARCHAR(20),
    "IsRegistered" BIT,
    "CreatedBy" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedBy" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "ModifiedDate" TIMESTAMP,
    "Status" SMALLINT,
    "IsDeleted" BIT,
    "IP" VARCHAR(20)
);





--- Create CaseTag table
CREATE TABLE IF NOT EXISTS "CaseTag" (
    "CaseTagId" SERIAL PRIMARY KEY NOT NULL,
    "Name" VARCHAR(50) NOT NULL
);



--- Create Concierge table
CREATE TABLE IF NOT EXISTS "Concierge" (
    "ConciergeId" SERIAL PRIMARY KEY ,
    "ConciergeName" VARCHAR(100) NOT NULL,
    "Address" VARCHAR(150),
    "Street" VARCHAR(50) NOT NULL,
    "City" VARCHAR(50) NOT NULL,
    "State" VARCHAR(50) NOT NULL,
    "ZipCode" VARCHAR(50) NOT NULL,
    "CreatedDate" TIMESTAMP NOT NULL,
    "RegionId" INT REFERENCES "Region"("RegionId") NOT NULL,
    "RoleId" VARCHAR(20)
);



--- Create EmailLog table
CREATE TABLE IF NOT EXISTS "EmailLog" (
    "EmailLogID" DECIMAL(9, 0) PRIMARY KEY NOT NULL,
    "EmailTemplate" VARCHAR NOT NULL,
    "SubjectName" VARCHAR(200) NOT NULL,
    "EmailID" VARCHAR(200) NOT NULL,
    "ConfirmationNumber" VARCHAR(200),
    "FilePath" VARCHAR,
    "RoleId" INT,
    "RequestId" INT,
    "AdminId" INT,
    "PhysicianId" INT,
    "CreateDate" TIMESTAMP NOT NULL,
    "SentDate" TIMESTAMP,
    "IsEmailSent" BIT,
    "SentTries" INT,
    "Action" INT
);



--- Create HealthProfessionals table
CREATE TABLE IF NOT EXISTS "HealthProfessionals" (
    "VendorId" SERIAL PRIMARY KEY,
    "VendorName" VARCHAR(100) NOT NULL,
    "Profession" INT REFERENCES "HealthProfessionalType"("HealthProfessionalId"),
    "FaxNumber" VARCHAR(50) NOT NULL,
    "Address" VARCHAR(150),
    "City" VARCHAR(100),
    "State" VARCHAR(50),
    "Zip" VARCHAR(50),
    "RegionId" INT,
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedDate" TIMESTAMP,
    "PhoneNumber" VARCHAR(100),
    "IsDeleted" BIT,
    "IP" VARCHAR(20),
    "Email" VARCHAR(50),
    "BusinessContact" VARCHAR(100)
);



--- Create HealthProfessionalType table
CREATE TABLE IF NOT EXISTS "HealthProfessionalType" (
    "HealthProfessionalId" SERIAL PRIMARY KEY,
    "ProfessionName" VARCHAR(50) NOT NULL,
    "CreatedDate" TIMESTAMP NOT NULL,
    "IsActive" BIT,
    "IsDeleted" BIT
);



--- Create Menu table
CREATE TABLE IF NOT EXISTS "Menu" (
    "MenuId" SERIAL PRIMARY KEY,
    "Name" VARCHAR(50) NOT NULL,
    "AccountType" SMALLINT NOT NULL CHECK ("AccountType" IN (1, 2)),
    "SortOrder" INT
);



--- Create OrderDetails table
CREATE TABLE IF NOT EXISTS "OrderDetails" (
    "Id" SERIAL PRIMARY KEY,
    "VendorId" INT,
    "RequestId" INT,
    "FaxNumber" VARCHAR(50),
    "Email" VARCHAR(50),
    "BusinessContact" VARCHAR(100),
    "Prescription" TEXT,
    "NoOfRefill" INT,
    "CreatedDate" TIMESTAMP,
    "CreatedBy" VARCHAR(100)
);



--- Create Physician table
CREATE TABLE IF NOT EXISTS "Physician" (
    "PhysicianId" SERIAL PRIMARY KEY,
    "AspNetUserId" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "FirstName" VARCHAR(100) NOT NULL,
    "LastName" VARCHAR(100),
    "Email" VARCHAR(50) NOT NULL,
    "Mobile" VARCHAR(20),
    "MedicalLicense" VARCHAR(500),
    "Photo" VARCHAR(100),
    "AdminNotes" VARCHAR(500),
    "IsAgreementDoc" BIT,
    "IsBackgroundDoc" BIT,
    "IsTrainingDoc" BIT,
    "IsNonDisclosureDoc" BIT,
    "Address1" VARCHAR(500),
    "Address2" VARCHAR(500),
    "City" VARCHAR(100),
    "RegionId" INT,
    "Zip" VARCHAR(10),
    "AltPhone" VARCHAR(20),
    "CreatedBy" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedBy" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "ModifiedDate" TIMESTAMP,
    "Status" SMALLINT,
    "BusinessName" VARCHAR(100) NOT NULL,
    "BusinessWebsite" VARCHAR(200) NOT NULL,
    "IsDeleted" BIT,
    "RoleId" INT,
    "NPINumber" VARCHAR(500),
    "IsLicenseDoc" BIT,
    "Signature" VARCHAR(100),
    "IsCredentialDoc" BIT,
    "IsTokenGenerate" BIT,
    "SyncEmailAddress" VARCHAR(50)
);



--- Create PhysicianLocation table
CREATE TABLE IF NOT EXISTS "PhysicianLocation" (
    "LocationId" SERIAL PRIMARY KEY,
    "PhysicianId" INT NOT NULL REFERENCES "Physician"("PhysicianId"),
    "Latitude" DECIMAL(9, 6),
    "Longitude" DECIMAL(9, 6),
    "CreatedDate" TIMESTAMP,
    "PhysicianName" VARCHAR(50),
    "Address" VARCHAR(500)
);




--- Create PhysicianNotification table
CREATE TABLE IF NOT EXISTS "PhysicianNotification" (
    "id" SERIAL PRIMARY KEY,
    "PhysicianId" INT NOT NULL REFERENCES "Physician"("PhysicianId"),
    "IsNotificationStopped" BIT NOT NULL
);



--- Create PhysicianRegion table
CREATE TABLE IF NOT EXISTS "PhysicianRegion" (
    "PhysicianRegionId" SERIAL PRIMARY KEY,
    "PhysicianId" INT NOT NULL REFERENCES "Physician"("PhysicianId"),
    "RegionId" INT  NOT NULL REFERENCES "Region"("RegionId")
);



--- Create Region table
CREATE TABLE IF NOT EXISTS "Region" (
    "RegionId" SERIAL PRIMARY KEY NOT NULL,
    "Name" VARCHAR(50) NOT NULL,
    "Abbreviation" VARCHAR(50)
);



    --- Create Request table
CREATE TABLE IF NOT EXISTS "Request" (
    "RequestId" SERIAL PRIMARY KEY,
    "RequestTypeId" INT NOT NULL CHECK ("RequestTypeId" IN (1, 2, 3, 4)),
    "UserId" INT REFERENCES "User"("UserId"),
    "FirstName" VARCHAR(100),
    "LastName" VARCHAR(100),
    "PhoneNumber" VARCHAR(23),
    "Email" VARCHAR(50),
    "Status" SMALLINT NOT NULL CHECK ("Status" IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)),
    "PhysicianId" INT REFERENCES "Physician"("PhysicianId"),
    "ConfirmationNumber" VARCHAR(20),
    "CreatedDate" TIMESTAMP NOT NULL,
    "IsDeleted" BIT,
    "ModifiedDate" TIMESTAMP,
    "DeclinedBy" VARCHAR(250),
    "IsUrgentEmailSent" BIT,
    "LastWellnessDate" TIMESTAMP,
    "IsMobile" BIT,
    "CallType" SMALLINT,
    "CompletedByPhysician" BIT,
    "LastReservationDate" TIMESTAMP,
    "AcceptedDate" TIMESTAMP,
    "RelationName" VARCHAR(100),
    "CaseNumber" VARCHAR(50),
    "IP" VARCHAR(20),
    "CaseTag" VARCHAR(50),
    "CaseTagPhysician" VARCHAR(50),
    "PatientAccountId" VARCHAR(128),
    "CreatedUserId" INT
);



--- Create RequestBusiness table
CREATE TABLE IF NOT EXISTS "RequestBusiness" (
    "RequestBusinessId" SERIAL PRIMARY KEY,
    "RequestId" INT NOT NULL REFERENCES "Request"("RequestId")
	,
    "BusinessId" INT NOT NULL REFERENCES "Business"("BusinessId")
	,
    "IP" VARCHAR(20)
);



--- Create RequestClient table
CREATE TABLE IF NOT EXISTS "RequestClient" (
    "RequestClientId" SERIAL PRIMARY KEY,
    "RequestId" INT NOT NULL REFERENCES "Request"("RequestId"),
    "FirstName" VARCHAR(100) NOT NULL,
    "LastName" VARCHAR(100),
    "PhoneNumber" VARCHAR(23),
    "Location" VARCHAR(100),
    "Address" VARCHAR(500),
    "RegionId" INT REFERENCES "Region"("RegionId"),
    "NotiMobile" VARCHAR(20),
    "NotiEmail" VARCHAR(50),
    "Notes" VARCHAR(500),
    "Email" VARCHAR(50),
    "strMonth" VARCHAR(20),
    "intYear" INT,
    "intDate" INT,
    "IsMobile" BIT,
    "Street" VARCHAR(100),
    "City" VARCHAR(100),
    "State" VARCHAR(100),
    "ZipCode" VARCHAR(10),
    "CommunicationType" SMALLINT,
    "RemindReservationCount" SMALLINT,
    "RemindHouseCallCount" SMALLINT,
    "IsSetFollowupSent" SMALLINT,
    "IP" VARCHAR(20),
    "IsReservationReminderSent" SMALLINT,
    "Latitude" DECIMAL(9, 6),
    "Longitude" DECIMAL(9, 6)
);



--- Create RequestClosed table
CREATE TABLE IF NOT EXISTS "RequestClosed" (
    "RequestClosedId" SERIAL PRIMARY KEY,
    "RequestId" INT NOT NULL REFERENCES "Request"("RequestId")
	,
    "RequestStatusLogId" INT NOT NULL REFERENCES "RequestStatusLog"("RequestStatusLogId")
	,
    "PhyNotes" VARCHAR(500),
    "ClientNotes" VARCHAR(500),
    "IP" VARCHAR(20)
);



--- Create RequestConcierge table
CREATE TABLE IF NOT EXISTS "RequestConcierge" (
    "Id" SERIAL PRIMARY KEY,
    "RequestId" INT NOT NULL REFERENCES "Request"("RequestId")
	,
    "ConciergeId" INT NOT NULL REFERENCES "Concierge"("ConciergeId")
	,
    "IP" VARCHAR(20)
);



--- Create RequestNotes table
CREATE TABLE IF NOT EXISTS "RequestNotes" (
    "RequestNotesId" SERIAL PRIMARY KEY,
    "RequestId" INT NOT NULL REFERENCES "Request"("RequestId"),
    "strMonth" VARCHAR(20),
    "intYear" INT,
    "intDate" INT,
    "PhysicianNotes" VARCHAR(500),
    "AdminNotes" VARCHAR(500),
    "CreatedBy" VARCHAR(128) NOT NULL ,
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedBy" VARCHAR(128),
    "ModifiedDate" TIMESTAMP,
    "IP" VARCHAR(20),
    "AdministrativeNotes" VARCHAR(500)
);


--- Create RequestStatusLog table
CREATE TABLE IF NOT EXISTS "RequestStatusLog" (
    "RequestStatusLogId" SERIAL PRIMARY KEY,
    "RequestId" INT NOT NULL REFERENCES "Request"("RequestId")
	,
    "Status" SMALLINT NOT NULL,
    "PhysicianId" INT REFERENCES "Physician"("PhysicianId")
	,
    "AdminId" INT REFERENCES "Admin"("AdminId")
	,
    "TransToPhysicianId" INT REFERENCES "Physician"("PhysicianId")
	,
    "Notes" VARCHAR(500),
    "CreatedDate" TIMESTAMP NOT NULL,
    "IP" VARCHAR(20),
    "TransToAdmin" BIT
);



--- Create RequestType table
CREATE TABLE IF NOT EXISTS "RequestType" (
    "RequestTypeId" SERIAL PRIMARY KEY NOT NULL,
    "Name" VARCHAR(50) NOT NULL
);



--- Create RequestWiseFile table
CREATE TABLE IF NOT EXISTS "RequestWiseFile" (
    "RequestWiseFileID" SERIAL PRIMARY KEY NOT NULL,
    "RequestId" INT NOT NULL REFERENCES "Request"("RequestId"),
    "FileName" VARCHAR(500) NOT NULL,
    "CreatedDate" TIMESTAMP NOT NULL,
    "PhysicianId" INT REFERENCES "Physician"("PhysicianId"),
    "AdminId" INT REFERENCES "Admin"("AdminId"),
    "DocType" SMALLINT,
    "IsFrontSide" BIT,
    "IsCompensation" BIT,
    "IP" VARCHAR(20),
    "IsFinalize" BIT,
    "IsDeleted" BIT,
    "IsPatientRecords" BIT
);



--- Create Role table
CREATE TABLE IF NOT EXISTS "Role" (
    "RoleId" SERIAL PRIMARY KEY,
    "Name" VARCHAR(50) NOT NULL,
    "AccountType" SMALLINT NOT NULL CHECK ("AccountType" IN (1, 2)),
    "CreatedBy" VARCHAR(128) NOT NULL,
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedBy" VARCHAR(128),
    "ModifiedDate" TIMESTAMP,
    "IsDeleted" BIT NOT NULL,
    "IP" VARCHAR(20)
);



--- Create RoleMenu table
CREATE TABLE IF NOT EXISTS "RoleMenu" (
    "RoleMenuId" SERIAL PRIMARY KEY,
    "RoleId" INT NOT NULL REFERENCES "Role"("RoleId"),
    "MenuId" INT NOT NULL REFERENCES "Menu"("MenuId")
);



--- Create Shift table
CREATE TABLE IF NOT EXISTS "Shift" (
    "ShiftId" SERIAL PRIMARY KEY,
    "PhysicianId" INT NOT NULL REFERENCES "Physician"("PhysicianId"),
    "StartDate" DATE NOT NULL,
    "IsRepeat" BIT NOT NULL,
    "WeekDays" CHAR(7),
    "RepeatUpto" INT,
    "CreatedBy" VARCHAR(128) NOT NULL REFERENCES "AspNetUsers"("AspNetUserId"),
    "CreatedDate" TIMESTAMP NOT NULL,
    "IP" VARCHAR(20)
);



--- Create ShiftDetail table
CREATE TABLE IF NOT EXISTS "ShiftDetail" (
    "ShiftDetailId" SERIAL PRIMARY KEY,
    "ShiftId" INT NOT NULL REFERENCES "Shift"("ShiftId")
	,
    "ShiftDate" TIMESTAMP NOT NULL,
    "RegionId" INT,
    "StartTime" TIME NOT NULL,
    "EndTime" TIME NOT NULL,
    "Status" SMALLINT NOT NULL,
    "IsDeleted" BIT NOT NULL,
    "ModifiedBy" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "ModifiedDate" TIMESTAMP,
    "LastRunningDate" TIMESTAMP,
    "EventId" VARCHAR(100),
    "IsSync" BIT
);



--- Create ShiftDetailRegion table
CREATE TABLE IF NOT EXISTS "ShiftDetailRegion" (
    "ShiftDetailRegionId" SERIAL PRIMARY KEY,
    "ShiftDetailId" INT NOT NULL REFERENCES "ShiftDetail"("ShiftDetailId"),
    "RegionId" INT NOT NULL REFERENCES "Region"("RegionId"),
    "IsDeleted" BIT
);



--- Create SMSLog table
CREATE TABLE IF NOT EXISTS "SMSLog" (
    "SMSLogID" DECIMAL(9) PRIMARY KEY NOT NULL,
    "SMSTemplate" VARCHAR NOT NULL,
    "MobileNumber" VARCHAR(50) NOT NULL,
    "ConfirmationNumber" VARCHAR(200),
    "RoleId" INT,
    "AdminId" INT,
    "RequestId" INT,
    "PhysicianId" INT,
    "CreateDate" TIMESTAMP NOT NULL,
    "SentDate" TIMESTAMP,
    "IsSMSSent" BIT,
    "SentTries" INT NOT NULL,
    "Action" INT
);



--- Create User table
CREATE TABLE IF NOT EXISTS "User" (
    "UserId" INT PRIMARY KEY,
    "AspNetUserId" VARCHAR(128) REFERENCES "AspNetUsers"("AspNetUserId"),
    "FirstName" VARCHAR(100) NOT NULL,
    "LastName" VARCHAR(100),
    "Email" VARCHAR(50) NOT NULL,
    "Mobile" VARCHAR(20),
    "IsMobile" BIT,
    "Street" VARCHAR(100),
    "City" VARCHAR(100),
    "State" VARCHAR(100),
    "RegionId" INT,
    "ZipCode" VARCHAR(10),
    "strMonth" VARCHAR(20),
    "intYear" INT,
    "intDate" INT,
    "CreatedBy" VARCHAR(128) NOT NULL ,
    "CreatedDate" TIMESTAMP NOT NULL,
    "ModifiedBy" VARCHAR(128) ,
    "ModifiedDate" TIMESTAMP,
    "Status" SMALLINT,
    "IsDeleted" BIT,
    "IP" VARCHAR(20),
    "IsRequestWithEmail" BIT
);


