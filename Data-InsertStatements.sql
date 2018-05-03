-- created by Aastha Date : 03-dec-2017

USE FitnessFreak;

SET SQL_SAFE_UPDATES = 0;
/*Delete from FoodLogDetails;
Delete from UserDietChart;
Delete from UserExerciseChart;
Delete from ExerciseDailyActivity;
Delete from DietChart;
Delete from Dietician;
Delete from Food;
Delete from Exercise;
Delete from Trainer;
Delete from OffersApplicableTo;
Delete from Offers;
Delete from Progress;
Delete from User;
SET SQL_SAFE_UPDATES = 0;
*/
-- USER TABLE INSERT

CALL `FITNESSFREAK`.`prc_user_signup`('James','', 'Watson', 'Fitness123', '178', 100, 160, '1992-06-19',
     'San Antonio', 'San Jose' ,'CA' ,'USA' ,'95137' ,'james.Watson@gmail.com','165','50',@out);

UPDATE USER  SET userrole ='Admin' ;

CALL `FITNESSFREAK`.`prc_user_signup`('Sophia','', 'Smith', 'Fitness123', '158', 150, 120, '1995-06-30',
     'Casa Verde', 'San Jose' ,'CA' ,'USA' ,'95139' ,'Sophia.Smith@gmail.com','115','45',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Isabella','', 'John', 'Fitness123', '165', 200, 140, '1990-05-10',
     'First Street', 'San Jose' ,'CA' ,'USA' ,'95127' ,'Isabella.John@gmail.com','130','60',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Emma','', 'Johnson', 'Fitness123', '170', 100, 105, '1996-04-19',
     'Second Street', 'San Jose' ,'CA' ,'USA' ,'95137' ,'Emma.Johnson@gmail.com','120','50',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Olivia','', 'Brown', 'Fitness123', '145', 150, 160, '1989-08-31',
     'Tenth Street', 'Palo Alto' ,'CA' ,'USA' ,'95128' ,'Olivia.Brown@gmail.com','150','70',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Abbot','William', 'Hopkins', 'Fitness123', '168', 200, 180, '1990-06-19',
     'Second Street', 'Santa Clara' ,'CA' ,'USA' ,'95130' ,'Abbot.Hopkins@gmail.com','155','40',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Adda','', 'William', 'Fitness123', '153', 100, 158, '1993-01-20',
     'Third Street', 'Santa Clara' ,'CA' ,'USA' ,'95131' ,'Adda.William@gmail.com','140','55',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Adny','', 'Watson', 'Fitness123', '168', 150, 128, '1994-02-19',
     'Third Street', 'San Jose' ,'CA' ,'USA' ,'95137' ,'Adny.Watson@gmail.com','110','50',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Alex','', 'Brown', 'Fitness123', '155', 100, 135, '1996-01-19',
     'First Street', 'Santa Clara' ,'CA' ,'USA' ,'95125' ,'Alex.Brown@gmail.com','120','52',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Alice','', 'Hopkins', 'Fitness123', '180', 200, 160, '1991-06-25',
     'San Antonio', 'San Jose' ,'CA' ,'USA' ,'95137' ,'Alice.Hopkins@gmail.com','168','50',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Alison','', 'Hopkins', 'Fitness123', '180', 200, 160, '1991-06-25',
     'San Antonio', 'San Jose' ,'CA' ,'USA' ,'95137' ,'Alison.Hopkins@yahoo.com','168','50',@out);

CALL `FITNESSFREAK`.`prc_user_signup`('Robert','', 'Brown', 'Fitness123', '180', 200, 160, '1991-06-25',
     'San Antonio', 'San Jose' ,'CA' ,'USA' ,'95137' ,'r.brown@yahoo.com','168','50',@out);

-- Add trainer
-- script to test add trainer, only admin can add it
set @id = (select userid  from user where userrole ='Admin');

CALL `FitnessFreak`.`prc_add_trainer`(@id, 'Andrew','','Brown','Andrew.Brown@gmail.com',@out);

CALL `FitnessFreak`.`prc_add_trainer`(@id, 'Amey','','William','Amey.William@gmail.com',@out);

CALL `FitnessFreak`.`prc_add_trainer`(@id, 'Ralph','','John','Ralph.John@gmail.com',@out);

CALL `FitnessFreak`.`prc_add_trainer`(@id, 'Ross','','Bing','Ross.Bing@gmail.com',@out);

CALL `Fitnes4sFreak`.`prc_add_trainer`(@id, 'Jason','','Cockell','j.cockell@gmail.com',@out);


-- Add Dietician
CALL `FitnessFreak`.`prc_add_dietician`(@id, 'Rachel','','Green','FDA','Rachel.Green@email.com',@out);
select @out;
CALL `FitnessFreak`.`prc_add_dietician`(@id, 'Monica','','Bing','FDA','Monica.Bing@email.com',@out);

-- Add offers
CALL `FitnessFreak`.`prc_add_offer`(@id,'2018-02-01','Silver','10% off on upgrading your account',@out);
select @out;


set @dieticianid = (select userid  from user where userrole ='Dietician');
-- Add diet chart, trigger will map dietcharts for gold and platinum users

CALL `FitnessFreak`.`prc_add_dietchart`(@dieticianid,'1 cup tea and 1 apple in breakfast','500',@out);

CALL `FitnessFreak`.`prc_add_dietchart`(@dieticianid,'1 egg and 1 cup tea','250',@out);

CALL `FitnessFreak`.`prc_add_dietchart`(@dieticianid,'1 bowl oats and 1 apple in snacks','500',@out);

CALL `FitnessFreak`.`prc_add_dietchart`(@dieticianid,'1 bowl Green Vegetables in lunch','250',@out);

CALL `FitnessFreak`.`prc_add_dietchart`(@dieticianid,'1 bowl vegetable soup in dinner ','200',@out);

-- Add exercise chart, trigger will map exercise charts for  platinum users
set @trainerid = (select userid  from user where userrole ='Trainer' Limit 1);
CALL `FitnessFreak`.`prc_add_exercisechart`(@trainerid,'Cycling','15','200',@out);

CALL `FitnessFreak`.`prc_add_exercisechart`(@trainerid,'Running','30','400',@out);


-- Add food data, only dietician can add this
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Tea','50','1','Cup','Caffeine',@out);
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Pure Green Tea','10','8','oz','Caffeine',@out);
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Bread, egg','81','1','oz','Carbohydrates, Protein',@out);
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Bread, oatmeal','76','1','oz','Carbohydrates, Fiber',@out);
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Banana Bread','200','1','Slice','Sugar, Vitamin C',@out);
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Egg','72','1','Large','Protien',@out);
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Choc Cake','135','1','slice','Wheat, Starch',@out);
CALL `FitnessFreak`.`prc_add_food` (@dieticianid,'Raw Oats','110','.5','cup','Fiber, Antioxidants',@out);

-- Food log details for user
set @silveruser = (select userid  from user where userrole ='User' and UserType ='Silver' Limit 1);

 set @foodid = (select foodid from food limit 1);

CALL `FitnessFreak`.`prc_foodlog_insert`(1,'BreakFast',@silveruser,@foodid,@out);
CALL `FitnessFreak`.`prc_foodlog_insert`(1,'Snacks',@silveruser,@foodid,@out);
CALL `FitnessFreak`.`prc_foodlog_insert`(1,'Lunch',@silveruser,@foodid,@out);
CALL `FitnessFreak`.`prc_foodlog_insert`(1,'Dinner',@silveruser,@foodid,@out);

set @golduser = (select userid  from user where userrole ='User' and UserType ='Gold' Limit 1); 
 set @foodid = (select foodid from food limit 1);

CALL `FitnessFreak`.`prc_foodlog_insert`(1,'BreakFast',@golduser,@foodid,@out);
CALL `FitnessFreak`.`prc_foodlog_insert`(1,'Snacks',@golduser,@foodid,@out);
CALL `FitnessFreak`.`prc_foodlog_insert`(1,'Lunch',@golduser,@foodid,@out);
CALL `FitnessFreak`.`prc_foodlog_insert`(1,'Dinner',@golduser,@foodid,@out);



set @silveruser = (select userid  from user where userrole ='User' and UserType ='Silver' Limit 1);
set @exerciseid = (select exerciseid from exercise limit 1);
select @exerciseid;
CALL `FitnessFreak`.`prc_ExerciseDailyActivity_insert`(20,@silveruser,@exerciseid,@out);
CALL `FitnessFreak`.`prc_ExerciseDailyActivity_insert`(20,@silveruser,@exerciseid,@out);

set @golduser = (select userid  from user where userrole ='User' and UserType ='Gold' Limit 1); 
set @exerciseid = (select exerciseid from exercise limit 1);

CALL `FitnessFreak`.`prc_ExerciseDailyActivity_insert`(20,@golduser,@exerciseid,@out);
CALL `FitnessFreak`.`prc_ExerciseDailyActivity_insert`(20,@golduser,@exerciseid,@out);



-- add weight progress
set @silveruser = (select userid  from user where userrole ='User' and UserType ='Silver' Limit 1);
CALL `FitnessFreak`.`prc_add_progress` (@silveruser,162,@out);
select @out;

set @golduser = (select userid  from user where userrole ='User' and UserType ='Gold' Limit 1); 
CALL `FitnessFreak`.`prc_add_progress` (@golduser ,162,@out);