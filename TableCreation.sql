USE FitnessFreak;

SET sql_notes = 0;

DROP TABLE IF EXISTS FoodLogDetails;
DROP TABLE IF EXISTS DieticianVerification;
DROP TABLE IF EXISTS TypeOfFood;
DROP TABLE IF EXISTS DietChart;
DROP TABLE IF EXISTS ExerciseChart;
DROP TABLE IF EXISTS ExerciseDailyActivity;
DROP TABLE IF EXISTS Meal;
DROP TABLE IF EXISTS Dietician;
DROP TABLE IF EXISTS FoodType;
DROP TABLE IF EXISTS Food;
DROP TABLE IF EXISTS Exercise;
DROP TABLE IF EXISTS Trainer;
DROP TABLE IF EXISTS OffersApplicableTo;
DROP TABLE IF EXISTS Offers;
DROP TABLE IF EXISTS Progress;
DROP TABLE IF EXISTS User;


CREATE TABLE User
(
  FirstName 					VARCHAR(50) 					NOT NULL,
  MiddleName 					VARCHAR(50) 					NULL,
  LastName 						VARCHAR(50) 					NOT NULL,
  Password 						VARCHAR(128) 					NOT NULL,
  Height 							FLOAT 								NOT NULL,
  SignUpDate 					DateTime							NOT NULL,
  AmountPaid 					FLOAT									NOT NULL,
  WeightAtSignUp 			FLOAT		 							NOT NULL,
  MembershipValidTill 		DateTime							NOT NULL,
  DateOfBirth 					Date									NOT NULL,
  StreetAddress 				VARCHAR(200) 					NOT NULL,
  City 								VARCHAR(50) 					NOT NULL,
  State 								VARCHAR(50) 					NOT NULL,
  Country 						VARCHAR(50) 					NOT NULL,
  ZipCode 						INT 										NOT NULL,
  EmailAddress 				VARCHAR(50) 					NOT NULL,
  UserType 						VARCHAR(50) 					NOT NULL,
  UserID 							INT	AUTO_INCREMENT   NOT NULL ,
  Tier			 					VARCHAR(50) 					NOT NULL,
  PRIMARY KEY (UserID),
  UNIQUE (EmailAddress)
);




CREATE TABLE Progress
(
  ProgressID 					 INT 		AUTO_INCREMENT 	NOT NULL,
  CurrentWeight 				 FLOAT 										NOT NULL,
  EncouragingMessages  VARCHAR(300)							NOT NULL,
  ProgressDate 				 DateTime 									NOT NULL,
  UserID 							 INT 											NOT NULL,
  PRIMARY KEY (ProgressID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);



CREATE TABLE Offers
(
  OfferID 				  		INT 		AUTO_INCREMENT 		NOT NULL,
  ValidTill 				  		DateTime 									NOT NULL,
  ApplicableToTier  		VARCHAR(50)  							NOT NULL,
  RunningOfferDetails  VARCHAR(200)  						NOT NULL,
  IsActive 					 BOOL 										NOT NULL,
  PRIMARY KEY (OfferID)
);



CREATE TABLE OffersApplicableTo
(
  OfferID 						INT 						NOT NULL,
  UserID 						INT 						NOT NULL,
  PRIMARY KEY (OfferID, UserID),
  FOREIGN KEY (OfferID) REFERENCES Offers(OfferID),
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);



CREATE TABLE Trainer
(
  TrainerID 					INT 		AUTO_INCREMENT  		NOT NULL,
  FirstName 				Varchar(50) 								NOT NULL,
  MiddleName 				Varchar(50) 								NULL,
  LastName 					Varchar(50) 								NOT NULL,
  PRIMARY KEY (TrainerID)
);



CREATE TABLE Exercise
(
  ExerciseName 				Varchar(50) 	 					   		NOT NULL,
  ExerciseID 					INT 		AUTO_INCREMENT		NOT NULL,
  DurationInMinutes 		INT												NOT NULL,
  CaloriesBurnFormula 	Float											NOT NULL,
  TrainerID 						INT 												NOT NULL,
  PRIMARY KEY (ExerciseID),
  FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID),
  UNIQUE (ExerciseName)
);




CREATE TABLE Food
(
  FoodID 							INT 		AUTO_INCREMENT 		NOT NULL,
  FoodName 					Varchar(50) 								NOT NULL,
  Calories 						Float 											NOT NULL,
  UnitOfMeasurement 		Varchar(50) 								NOT NULL,
  PRIMARY KEY (FoodID),
  UNIQUE (FoodName)
);



CREATE TABLE FoodType
(
  Type 							Varchar(100)									 		NOT NULL,
  FoodTypeID 				INT 						AUTO_INCREMENT 	NOT NULL,
  PRIMARY KEY (FoodTypeID),
  UNIQUE (Type)
);



CREATE TABLE Dietician
(
  DieticianID 			INT  			AUTO_INCREMENT			  NOT NULL,
  FirstName 			Varchar(50) 											  NOT NULL,
  Position 				Varchar(50)   											  NULL,
  MiddleName 			Varchar(50)  											  NULL,
  LastName 				Varchar(50)  											  NOT NULL,
  PRIMARY KEY (DieticianID)
);



CREATE TABLE Meal
(
  Type 						Varchar(50)												 NOT NULL,
  MealTypeID 			INT 			AUTO_INCREMENT				 NOT NULL,
  PRIMARY KEY (MealTypeID),
  UNIQUE (Type)
);



CREATE TABLE ExerciseDailyActivity
(
  ActivityID 										INT 			AUTO_INCREMENT					NOT NULL,
  DateOfActivity 								DateTime 													NOT NULL,
  WorkoutDurationInMinutes 			INT 																NOT NULL,
  UserID 											INT 																NOT NULL,
  ExerciseID 									INT																NOT NULL,
  PRIMARY KEY (ActivityID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);



CREATE TABLE ExerciseChart
(
  IsActive 										Bool 									NOT NULL,
  DateRecommended 						DateTime 							NOT NULL,
  ExerciseChartID 							INT AUTO_INCREMENT	NOT NULL,
  UserID 											INT 										NOT NULL,
  ExerciseID 									INT 										NOT NULL,
  PRIMARY KEY (ExerciseChartID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);



CREATE TABLE DietChart
(
  PortionOfFood 								Float 									NOT NULL,
  DateRecommended 						DateTime 							NOT NULL,
  IsActive 										Bool 									NOT NULL,
  DietChartID 									INT AUTO_INCREMENT	NOT NULL,
  UserID 											INT										NOT NULL,
  FoodID 											INT										NOT NULL,
  PRIMARY KEY (DietChartID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);



CREATE TABLE TypeOfFood
(
  FoodTypeID 				INT 			AUTO_INCREMENT				NOT NULL,
  FoodID 						INT															NOT NULL,
  PRIMARY KEY (FoodTypeID, FoodID),
  FOREIGN KEY (FoodTypeID) REFERENCES FoodType(FoodTypeID),
  FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);


CREATE TABLE DieticianVerification
(
  DieticianID 				INT 			NOT NULL,
  FoodID 						INT 			NOT NULL,
  PRIMARY KEY (DieticianID, FoodID),
  FOREIGN KEY (DieticianID) REFERENCES Dietician(DieticianID),
  FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);



CREATE TABLE FoodLogDetails
(
  FoodLogID 				 INT 		AUTO_INCREMENT	NOT NULL,
  Quantity 					 Float	 										NOT NULL,
  DateOfConsumption  DateTime 									NOT NULL,
  MealTypeID 				 INT 											NOT NULL,
  UserID 						 INT 											NOT NULL,
  FoodID 						 INT 											NOT NULL,
  PRIMARY KEY (FoodLogID),
  FOREIGN KEY (MealTypeID) REFERENCES Meal(MealTypeID),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);

