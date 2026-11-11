
CREATE TABLE PROMOTION (
                promotionID NUMBER(5) NOT NULL,
                promotionCode VARCHAR2(5) NOT NULL,
                promotionTitle VARCHAR2(25) NOT NULL,
                percentage NUMBER(3) NOT NULL,
                promotionDescription VARCHAR2(100) NOT NULL,
                endDate DATE,
                startDate DATE,
                promotionLimit NUMBER(5) NOT NULL,
                CONSTRAINT PROMOTION_PK PRIMARY KEY (promotionID)
);


CREATE TABLE PASSENGER (
                passengerID NUMBER(5) NOT NULL,
                firstName VARCHAR2(10) NOT NULL,
                lastName VARCHAR2(10) NOT NULL,
                username VARCHAR2(20) NOT NULL,
                CPR VARCHAR2(9) NOT NULL,
                address VARCHAR2(100) NOT NULL,
                nationality VARCHAR2(10) NOT NULL,
                email VARCHAR2(30) NOT NULL,
                dateOfBirth DATE NOT NULL,
                gender VARCHAR2(10) NOT NULL,
                contactNumber NUMBER(8) NOT NULL,
                CONSTRAINT PASSENGER_PK PRIMARY KEY (passengerID)
);


CREATE TABLE CARD (
                passengerID NUMBER(5) NOT NULL,
                cardNo NUMBER(16) NOT NULL,
                CONSTRAINT CARD_PK PRIMARY KEY (passengerID, cardNo)
);


CREATE TABLE PASSENGER_PROMOTION (
                passengerID NUMBER(5) NOT NULL,
                promotionID NUMBER(5) NOT NULL,
                CONSTRAINT PASSENGER_PROMOTION_PK PRIMARY KEY (passengerID, promotionID)
);


CREATE TABLE VEHICLE (
                vehicleID NUMBER(2) NOT NULL,
                manufacturer VARCHAR2(15) NOT NULL,
                vehicleModel VARCHAR2(10) NOT NULL,
                vehicleYear VARCHAR2(4) NOT NULL,
                VIN VARCHAR2(17) NOT NULL,
                registeredDate DATE NOT NULL,
                CONSTRAINT VEHICLE_PK PRIMARY KEY (vehicleID)
);


CREATE TABLE VEHICLE_MAINTENANCE (
                maintenanceID NUMBER(10) NOT NULL,
                vehicleID NUMBER(2) NOT NULL,
                startDate DATE NOT NULL,
                endDate DATE NOT NULL,
                maintenanceStatus VARCHAR2(10) NOT NULL,
                maintenanceAmount VARCHAR2(20) NOT NULL,
                maintenancetime VARCHAR2(20) NOT NULL,
                CONSTRAINT VEHICLE_MAINTENANCE_PK PRIMARY KEY (maintenanceID, vehicleID)
);


CREATE TABLE DRIVER (
                driverID NUMBER(5) NOT NULL,
                firstName VARCHAR2(10) NOT NULL,
                lastName VARCHAR2(10) NOT NULL,
                CPR VARCHAR2(9) NOT NULL,
                address VARCHAR2(100) NOT NULL,
                nationality VARCHAR2(10) NOT NULL,
                email VARCHAR2(30) NOT NULL,
                dateOfBirth DATE NOT NULL,
                gender VARCHAR2(10) NOT NULL,
                contactNumber NUMBER(8) NOT NULL,
                CONSTRAINT DRIVER_PK PRIMARY KEY (driverID)
);


CREATE TABLE PASSENGER_RATING (
                passengerID NUMBER(5) NOT NULL,
                driverID NUMBER(5) NOT NULL,
                ratingDate DATE NOT NULL,
                ratingTime DATE NOT NULL,
                passengerRatingDescription VARCHAR2(100) NOT NULL,
                rating NUMBER(1) NOT NULL,
                CONSTRAINT PASSENGER_RATING_PK PRIMARY KEY (passengerID, driverID)
);


CREATE TABLE VEHICLE_ASSIGNMENT (
                driverID NUMBER(5) NOT NULL,
                vehicleID NUMBER(2) NOT NULL,
                assignmentDate DATE NOT NULL,
                CONSTRAINT VEHICLE_ASSIGNMENT_PK PRIMARY KEY (driverID, vehicleID)
);


CREATE TABLE PAYMENT (
                paymentID NUMBER(9) NOT NULL,
                paymentTime VARCHAR2(8) NOT NULL,
                paymentDate DATE NOT NULL,
                paymentMethod VARCHAR2(20) NOT NULL,
                paymentAmount NUMBER(10) NOT NULL,
                CONSTRAINT PAYMENT_PK PRIMARY KEY (paymentID)
);


CREATE TABLE RIDE (
                rideID NUMBER(8) NOT NULL,
                driverID NUMBER(5) NOT NULL,
                passengerID NUMBER(5) NOT NULL,
                paymentID NUMBER(9),
                status VARCHAR2(20) NOT NULL,
                locationName VARCHAR2(50) NOT NULL,
                rideTime DATE NOT NULL,
                rideDate DATE NOT NULL,
                CONSTRAINT RIDE_PK PRIMARY KEY (rideID, driverID, passengerID)
);


CREATE TABLE SUPPORT_REQUEST (
                supportRequestID NUMBER(10) NOT NULL,
                passengerID NUMBER(5) NOT NULL,
                rideID NUMBER(8) NOT NULL,
                driverID NUMBER(5) NOT NULL,
                resolutionDate DATE NOT NULL,
                requestType VARCHAR2(30) NOT NULL,
                requestDescription VARCHAR2(100) NOT NULL,
                status VARCHAR2(10) NOT NULL,
                requestTime DATE NOT NULL,
                resolutionTime DATE NOT NULL,
                requestDate DATE NOT NULL,
                CONSTRAINT SUPPORT_REQUEST_PK PRIMARY KEY (supportRequestID)
);


CREATE TABLE CAR_ACCESSORY (
                carAccessoryID NUMBER(10) NOT NULL,
                vehicleID NUMBER(2) NOT NULL,
                rideID NUMBER(8) NOT NULL,
                driverID NUMBER(5) NOT NULL,
                passengerID NUMBER(5) NOT NULL,
                accessoryType VARCHAR2(50) NOT NULL,
                CONSTRAINT CAR_ACCESSORY_PK PRIMARY KEY (carAccessoryID)
);


CREATE TABLE REVIEW (
                reviewID NUMBER(9) NOT NULL,
                rideID NUMBER(8) NOT NULL,
                passengerID NUMBER(5) NOT NULL,
                driverID NUMBER(5) NOT NULL,
                reviewDate DATE NOT NULL,
                reviewTime DATE NOT NULL,
                reviewDescription VARCHAR2(500) NOT NULL,
                rating NUMBER(1),
                CONSTRAINT REVIEW_PK PRIMARY KEY (reviewID)
);


ALTER TABLE PASSENGER_PROMOTION ADD CONSTRAINT PROMOTION_PASSENGER_PROMOTI498
FOREIGN KEY (promotionID)
REFERENCES PROMOTION (promotionID)
NOT DEFERRABLE;

ALTER TABLE RIDE ADD CONSTRAINT PASSENGER_RIDE_FK
FOREIGN KEY (passengerID)
REFERENCES PASSENGER (passengerID)
NOT DEFERRABLE;

ALTER TABLE PASSENGER_PROMOTION ADD CONSTRAINT PASSENGER_PASSENGER_PROMOTI523
FOREIGN KEY (passengerID)
REFERENCES PASSENGER (passengerID)
NOT DEFERRABLE;

ALTER TABLE PASSENGER_RATING ADD CONSTRAINT PASSENGER_PASSENGER_RATING_FK
FOREIGN KEY (passengerID)
REFERENCES PASSENGER (passengerID)
NOT DEFERRABLE;

ALTER TABLE CARD ADD CONSTRAINT PASSENGER_CARD_FK
FOREIGN KEY (passengerID)
REFERENCES PASSENGER (passengerID)
NOT DEFERRABLE;

ALTER TABLE SUPPORT_REQUEST ADD CONSTRAINT PASSENGER_SUPPORT_REQUEST_FK
FOREIGN KEY (passengerID)
REFERENCES PASSENGER (passengerID)
NOT DEFERRABLE;

ALTER TABLE VEHICLE_MAINTENANCE ADD CONSTRAINT VEHICLE_VEHICLE_MAINTENANCE_FK
FOREIGN KEY (vehicleID)
REFERENCES VEHICLE (vehicleID)
NOT DEFERRABLE;

ALTER TABLE CAR_ACCESSORY ADD CONSTRAINT VEHICLE_CAR_ACCESSORY_FK
FOREIGN KEY (vehicleID)
REFERENCES VEHICLE (vehicleID)
NOT DEFERRABLE;

ALTER TABLE VEHICLE_ASSIGNMENT ADD CONSTRAINT VEHICLE_VEHICLE_ASSIGNMENT_FK
FOREIGN KEY (vehicleID)
REFERENCES VEHICLE (vehicleID)
NOT DEFERRABLE;

ALTER TABLE VEHICLE_ASSIGNMENT ADD CONSTRAINT DRIVER_VEHICLE_ASSIGNMENT_FK
FOREIGN KEY (driverID)
REFERENCES DRIVER (driverID)
NOT DEFERRABLE;

ALTER TABLE RIDE ADD CONSTRAINT DRIVER_RIDE_FK
FOREIGN KEY (driverID)
REFERENCES DRIVER (driverID)
NOT DEFERRABLE;

ALTER TABLE PASSENGER_RATING ADD CONSTRAINT DRIVER_PASSENGER_RATING_FK
FOREIGN KEY (driverID)
REFERENCES DRIVER (driverID)
NOT DEFERRABLE;

ALTER TABLE RIDE ADD CONSTRAINT PAYMENT_RIDE_FK
FOREIGN KEY (paymentID)
REFERENCES PAYMENT (paymentID)
NOT DEFERRABLE;

ALTER TABLE REVIEW ADD CONSTRAINT RIDE_REVIEW_FK
FOREIGN KEY (driverID, rideID, passengerID)
REFERENCES RIDE (driverID, rideID, passengerID)
NOT DEFERRABLE;

ALTER TABLE CAR_ACCESSORY ADD CONSTRAINT RIDE_CAR_ACCESSORY_FK
FOREIGN KEY (rideID, driverID, passengerID)
REFERENCES RIDE (rideID, driverID, passengerID)
NOT DEFERRABLE;

ALTER TABLE SUPPORT_REQUEST ADD CONSTRAINT RIDE_SUPPORT_REQUEST_FK
FOREIGN KEY (rideID, driverID, passengerID)
REFERENCES RIDE (rideID, driverID, passengerID)
NOT DEFERRABLE;

