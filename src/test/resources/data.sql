insert into customer (customer_id, password, name, email, phone_number, address)
values ('id1', 'qwer123', '홍길동', 'test1@test.com', '01012341235', '부산시');

insert into customer (customer_id, password, name, email, phone_number, address)
values ('id2', 'qwer123', '김첨지', 'test2@test.com', '01012341236', '부산시');

insert into destinations (destination_name, country, destination_description)
values ('JPN-NRT', 'Japan', '바로옆 개꿀');

insert into attractions (destination_id, attraction_name, type, attraction_description)
values (1, '도쿄타워', 'CityTour', '높음');

insert into restaurants (Destination_ID ,restaurant_Name, Cuisine, restaurant_Description)
values (1,'먹담','한식 뷔페', 'JMT');

INSERT INTO Hotels (Hotel_Name, Destination_name,Star_Rating,Description)
values ('아난티', 'JPN-NRT', 4, '아난티 도쿄');

INSERT INTO pack (pack_name ,destination_name, pack_type, start_date, end_date, price)
VALUES ('도쿄 패키지','JPN-NRT', 'TOUR', CURDATE(), '2024-05-07', 150);

INSERT INTO schedule (pack_id, day_number, Schedule_type,description)
values (1, 1, 'TOUR', '도쿄 투어');
INSERT INTO schedule (pack_id, day_number, Schedule_type,description)
values (1, 2, 'TOUR', '도쿄 시내');

INSERT INTO attraction_each_day values (1, 1, 1);
INSERT INTO restaurant_each_day values(1,1,1);
INSERT INTO hotel_each_day values(1,1,1);

INSERT INTO hotels_img (Img_Name, Hotel_id) values ('아난티 사진.jpg', 1) ;
INSERT INTO HotelAmenities (hotel_id, amenity) values (1, 'swimming pool');
INSERT INTO HotelAmenities (hotel_id, amenity) values (1, 'gym');


