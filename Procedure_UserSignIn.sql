USE FitnessFreak;

-- =============================================
-- Author:      Aastha Kumar
-- Create date:  Nov, 27, 2017
-- Description:  User SignIn Procedure
-- Version: 0.1
-- =============================================

DROP PROCEDURE IF EXISTS prc_user_signin;

DELIMITER $$
CREATE PROCEDURE prc_user_signin (
				IN EmailAddress 			VARCHAR(50),
				IN Pswd 					VARCHAR(128)
) 
BEGIN

			Select * from USER WHERE EmailAddress = EmailAddress
             AND Password = MD5(Pswd);
END $$

DELIMITER ;