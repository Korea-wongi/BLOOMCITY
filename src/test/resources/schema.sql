drop table if exists item CASCADE;
create TABLE Customer
(
    customer_id  varchar(100) primary key,
    password     varchar(30),
    name         varchar(100),
    email        varchar(255) UNIQUE,
    phone_number varchar(50) UNIQUE,
    address      varchar(255)
);

CREATE TABLE Destinations
(
    Destination_ID          INT AUTO_INCREMENT PRIMARY KEY,
    destination_name        VARCHAR(100),
    Country                 VARCHAR(100),
    destination_description TEXT
);

CREATE TABLE Attractions (
     Attraction_ID INT AUTO_INCREMENT PRIMARY KEY,
     Destination_ID INT,
     attraction_Name VARCHAR(100),
     Type VARCHAR(100),
     attraction_Description TEXT
);

CREATE TABLE Restaurants (
     Restaurant_ID INT AUTO_INCREMENT PRIMARY KEY,
     Destination_ID INT,
     restaurant_Name VARCHAR(100),
     Cuisine VARCHAR(50),
     restaurant_Description TEXT
);

CREATE TABLE Hotels (
    Hotel_ID INT AUTO_INCREMENT PRIMARY KEY,
    Hotel_Name VARCHAR(100),
    Destination_name VARCHAR(255),
    Star_Rating INT,
    Description TEXT
);

CREATE TABLE Pack (
      Pack_id INT AUTO_INCREMENT PRIMARY KEY,
      Pack_Name VARCHAR(100), -- 패키지 명
      Destination_name VARCHAR(100),
      pack_Type VARCHAR(50), -- 패키지, 허니문 패키지
      Start_Date DATE,
      End_Date DATE,  -- 날짜 범위 유효성 검사
      Price DECIMAL(10, 2)
);

CREATE TABLE SCHEDULE (
      Schedule_ID INT AUTO_INCREMENT PRIMARY KEY,
      Pack_ID INT,
      Day_Number INT,
      Schedule_Type VARCHAR(100), -- 호텔, 명소, 식당 등
      event_id INT,
      Description TEXT
);

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

CREATE TABLE hotels_img(
   hotels_Img_Id INT AUTO_INCREMENT PRIMARY KEY,
   Img_Name VARCHAR(100),
   Hotel_Id INT,
   FOREIGN KEY (Hotel_Id) REFERENCES hotels(Hotel_Id)
       ON DELETE CASCADE
       ON UPDATE CASCADE
);

CREATE TABLE HotelAmenities (
    Amenity_ID INT AUTO_INCREMENT PRIMARY KEY,
    Hotel_ID INT,
    Amenity VARCHAR(100),
    FOREIGN KEY (Hotel_ID) REFERENCES Hotels(Hotel_ID) ON DELETE CASCADE
);

CREATE VIEW view_attractions AS
SELECT a.*, d.destination_name, d.country
FROM Attractions a
JOIN Destinations d ON a.destination_id = d.destination_id;

CREATE VIEW view_restaurants AS
SELECT a.*, d.destination_name, d.country
FROM restaurants a
JOIN Destinations d ON a.destination_id = d.destination_id;

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


-- 해당 경로에 해당 파일 이름으로 만들면 메모리가 뜨면서 DB를 초기화 해준다 (Embeded ? ) 테스트할때 이용하자