USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  User SignUp Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_user_signup;

DELIMITER $$
CREATE PROCEDURE prc_user_signup (
				IN FirstName 					VARCHAR(50),
				IN MiddleName 				VARCHAR(50),
				IN LastName 					VARCHAR(50),
				IN Password 					VARCHAR(128),
				IN Height 						FLOAT,
				IN AmountPaid 				FLOAT,
				IN WeightAtSignUp 		FLOAT,
				IN DateOfBirth 				DATE,
				IN StreetAddress 			VARCHAR(200),
				IN City 							VARCHAR(50),
				IN State 							VARCHAR(50),
				IN Country 						VARCHAR(50) ,
				IN ZipCode 						INT,
				IN EmailAddress 			VARCHAR(50)
) 
BEGIN

			DECLARE UserType VARCHAR(50);
			DECLARE Tier VARCHAR(50);

			IF AmountPaid = '100'  THEN
					SET UserType = 'SILVER';
					SET Tier = 'Basic Subscription';
			ELSEIF (AmountPaid = '150')  THEN
					SET UserType ='DIAMOND';
					SET Tier = 'Diet Chart';
			ELSEIF (AmountPaid = '200')  THEN
					SET UserType ='PLATINUM';
					SET Tier = 'Diet & Exercise Chart';
			END IF;

			INSERT INTO USER(FirstName ,MiddleName ,LastName ,Password ,Height ,SignUpDate ,AmountPaid ,WeightAtSignUp ,MembershipValidTill ,DateOfBirth ,
			StreetAddress ,City ,State ,Country ,ZipCode ,EmailAddress ,UserType,Tier )
			VALUES
			(FirstName,MiddleName, LastName, MD5(Password), Height, NOW(), AmountPaid, WeightAtSignUp, DATE_ADD(NOW(), INTERVAL 1 YEAR) ,DateOfBirth,
			StreetAddress, City ,State ,Country ,ZipCode ,EmailAddress ,UserType,Tier);
END $$

DELIMITER ;