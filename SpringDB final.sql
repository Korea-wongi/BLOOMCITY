drop database kingwogki;
drop database travel;
create database TRAVEL;
use TRAVEL;

select * from customer;
-- 고객(Customer) 테이블 생성
CREATE TABLE Customer (
  customer_id VARCHAR(150) PRIMARY KEY,
  password VARCHAR(30),
  name VARCHAR(100),
  Email VARCHAR(255) UNIQUE,
  Phone_Number VARCHAR(50) UNIQUE,
  Address VARCHAR(255)
);

-- 여행 상품(pack) 테이블 생성
CREATE TABLE Pack (
  Pack_id INT AUTO_INCREMENT PRIMARY KEY,
  Pack_Name VARCHAR(100), -- 패키지 명
  Destination_name VARCHAR(100),
  pack_Type VARCHAR(50), -- 패키지, 허니문 패키지
  Start_Date DATE,
  End_Date DATE,  -- 날짜 범위 유효성 검사
  Price DECIMAL(10, 2),
  destination_alias VARCHAR(100)
);


-- 호텔(Hotels) 테이블 생성
CREATE TABLE Hotels (
  Hotel_ID INT AUTO_INCREMENT PRIMARY KEY,
  Hotel_Name VARCHAR(100),
  Destination_name VARCHAR(255),
  Star_Rating INT,
  Description TEXT
);

-- 호텔 편의 시설(Hotel Amenities) 테이블 생성
CREATE TABLE HotelAmenities (
  Amenity_ID INT AUTO_INCREMENT PRIMARY KEY,
  Hotel_ID INT,
  Amenity VARCHAR(100),
  FOREIGN KEY (Hotel_ID) REFERENCES Hotels(Hotel_ID) ON DELETE CASCADE
);

-- 예약(Reservations) 테이블 생성
CREATE TABLE Reservations (
  Reservation_ID INT AUTO_INCREMENT PRIMARY KEY,
  Customer_ID VARCHAR(150),
  Pack_ID INT,
  Hotel_ID INT,
  Reservation_Date DATE,
  Number_of_People INT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
  FOREIGN KEY (Pack_ID) REFERENCES Pack(Pack_ID) ON DELETE CASCADE,
  FOREIGN KEY (Hotel_ID) REFERENCES Hotels(Hotel_ID) ON DELETE CASCADE
);

-- 후기(Reviews) 테이블 생성
CREATE TABLE Reviews (
  Review_ID INT AUTO_INCREMENT PRIMARY KEY,
  Customer_ID VARCHAR(150),
  Pack_ID INT,
  Rating INT,
  Comments TEXT,
  FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
  FOREIGN KEY (pack_id) REFERENCES pack(pack_id) ON DELETE CASCADE
);

-- 결제(Payments) 테이블 생성
CREATE TABLE Payments (
  Payment_ID VARCHAR(255) PRIMARY KEY,
  Reservation_ID INT,
  Amount DECIMAL(10, 2),
  Payment_Date DATE,
  FOREIGN KEY (Reservation_ID) REFERENCES Reservations(Reservation_ID) ON DELETE CASCADE
);

-- 여행 일정(SCHEDULE) 테이블 생성
CREATE TABLE SCHEDULE (
  Schedule_ID INT AUTO_INCREMENT PRIMARY KEY,
  Pack_ID INT,
  Day_Number INT,
  Schedule_Type VARCHAR(100), -- 호텔, 명소, 식당 등
  event_id INT,				
  Description TEXT,
  FOREIGN KEY (Pack_ID) REFERENCES Pack(Pack_ID) ON DELETE CASCADE
);

-- 여행 목적지(Destinations) 테이블 생성
CREATE TABLE Destinations (
  Destination_ID INT AUTO_INCREMENT PRIMARY KEY,
  destination_name VARCHAR(100),
  Country VARCHAR(100),
  destination_description TEXT,
  destination_alias VARCHAR(100)
);

-- 관광지(Attractions) 테이블 생성
CREATE TABLE Attractions (
  Attraction_ID INT AUTO_INCREMENT PRIMARY KEY,
  Destination_ID INT,
  attraction_Name VARCHAR(100),
  Type VARCHAR(100),
  attraction_Description TEXT,
  FOREIGN KEY (Destination_ID) REFERENCES Destinations(Destination_ID) ON DELETE CASCADE
);

-- 식당(Restaurants) 테이블 생성
CREATE TABLE Restaurants (
  Restaurant_ID INT AUTO_INCREMENT PRIMARY KEY,
  Destination_ID INT,
  restaurant_Name VARCHAR(100),
  Cuisine VARCHAR(50),
  restaurant_Description TEXT,
  FOREIGN KEY (Destination_ID) REFERENCES Destinations(Destination_ID) ON DELETE CASCADE
);
--  hotel 이미지
CREATE TABLE hotels_img(
  hotels_Img_Id INT AUTO_INCREMENT PRIMARY KEY,
  Img_Name VARCHAR(100),
  Hotel_Id INT,
  FOREIGN KEY (Hotel_Id) REFERENCES hotels(Hotel_Id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

-- destinations 목적지 이미지
CREATE TABLE destinations_img (
  destinations_Img_Id INT AUTO_INCREMENT PRIMARY KEY,
  Img_Name VARCHAR(100),
  category VARCHAR(20), -- 명소, 식당
  destination_Id INT,
  FOREIGN KEY (destination_Id) REFERENCES destinations(destination_Id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

-- Trips 테이블에 Date에 대한 유효성 검사 트리거
DELIMITER $$

CREATE TRIGGER CheckDateBeforeInsertTrips
BEFORE INSERT ON pack
FOR EACH ROW
BEGIN
  IF NEW.Start_Date > NEW.End_Date THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EndDate must be greater than or equal to StartDate.';
  END IF;
END$$


CREATE TRIGGER CheckDateBeforeUpdateTrips
BEFORE UPDATE ON pack
FOR EACH ROW
BEGIN
  IF NEW.Start_Date > NEW.End_Date THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'EndDate must be greater than or equal to StartDate.';
  END IF;
END$$

DELIMITER ;


show triggers;

create View view_hotels as 
SELECT 
        H.Hotel_ID,
        H.Hotel_Name,
        H.Destination_name,
        H.Star_Rating,
        H.Description,
        GROUP_CONCAT(DISTINCT A.Amenity ORDER BY A.Amenity_ID ASC SEPARATOR ', ') AS hotel_Amenities,
        GROUP_CONCAT(DISTINCT I.Img_Name ORDER BY I.hotels_Img_Id ASC SEPARATOR ', ') AS hotel_Images
    FROM 
        Hotels H
    INNER JOIN 
        HotelAmenities A ON H.Hotel_ID = A.Hotel_ID
    INNER JOIN 
        hotels_img I ON H.Hotel_ID = I.Hotel_Id
    GROUP BY 
        H.Hotel_ID,
        H.Hotel_Name,
        H.Destination_name,
        H.Star_Rating,
        H.Description;

CREATE VIEW view_attractions AS
SELECT a.*, d.destination_name, d.country
FROM Attractions a
JOIN Destinations d ON a.destination_id = d.destination_id;

CREATE VIEW view_restaurants AS
SELECT a.*, d.destination_name, d.country
FROM restaurants a
JOIN Destinations d ON a.destination_id = d.destination_id;

-- 일차별 
CREATE TABLE attraction_each_day (
  pack_id int,
  day_number int,
  attraction_id int,
  FOREIGN KEY (pack_id) REFERENCES pack(pack_id) ON DELETE CASCADE,
  FOREIGN KEY (attraction_id) REFERENCES attractions(attraction_id) ON DELETE CASCADE
);

CREATE TABLE hotel_each_day (
  pack_id int,
  day_number int,
  hotel_id int,
  FOREIGN KEY (pack_id) REFERENCES pack(pack_id) ON DELETE CASCADE,
  FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
);

CREATE TABLE restaurant_each_day (
  pack_id int,
  day_number int,
  restaurant_id int,
  FOREIGN KEY (pack_id) REFERENCES pack(pack_id) ON DELETE CASCADE,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE
);

-- 
CREATE VIEW view_attractions_dayNum AS
SELECT a.*, d.day_number, d.pack_id
FROM Attractions a
JOIN attraction_each_day d ON a.attraction_id = d.attraction_id;

CREATE VIEW view_hotel_dayNum AS
SELECT a.*, d.day_number, d.pack_id
FROM hotels a
JOIN hotel_each_day d ON a.hotel_id = d.hotel_id;

CREATE VIEW view_restaurants_dayNum AS
SELECT a.*, d.day_number, d.pack_id
FROM restaurants a
JOIN restaurant_each_day d ON a.restaurant_id = d.restaurant_id;

commit;

