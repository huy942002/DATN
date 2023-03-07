﻿CREATE DATABASE DBKHACHSAN_FIX
GO
USE	DBKHACHSAN_FIX
GO
CREATE TABLE ROLES
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDR PRIMARY KEY (ID)
)
GO
CREATE TABLE NATIONALITY
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDNT PRIMARY KEY (ID)
)
GO
CREATE TABLE USERS
(
ID INT IDENTITY(1,1) NOT NULL,
USERNAME NVARCHAR(255) NOT NULL,
PASSWORD NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDUSER PRIMARY KEY (ID),
)
CREATE TABLE HISTORY
(
ID INT IDENTITY(1,1) NOT NULL,
ID_USER INT NOT NULL,
TIME_IN DATETIME NOT NULL,
TIME_OUT DATETIME NOT NULL,
HAND_OVER_STATUS INT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDHT PRIMARY KEY (ID),
CONSTRAINT FK_ID_USER3 FOREIGN KEY (ID_USER) REFERENCES USERS
)
GO
CREATE TABLE CUSTOMER
(
ID INT IDENTITY(1,1) NOT NULL,
ID_USER INT NULL,
FULLNAME NVARCHAR(255) NOT NULL,
EMAIL NVARCHAR(255) NULL,
CITIZEN_ID_CODE NVARCHAR(12) NULL,
GENDER NVARCHAR(5) NULL,
DATE_OF_BIRTH DATE NULL,
PHONE_NUMBER NVARCHAR(12) NULL,
ADDRESS NVARCHAR(255) NULL,
IMG NVARCHAR(255) NULL,
ID_NATIONALITY INT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDCT PRIMARY KEY (ID),
CONSTRAINT FK_ID_USER1 FOREIGN KEY (ID_USER) REFERENCES USERS,
CONSTRAINT FK_ID_NATIONALITY FOREIGN KEY (ID_NATIONALITY) REFERENCES NATIONALITY
)
GO
CREATE TABLE PERSONNEL
(
ID INT IDENTITY(1,1) NOT NULL,
ID_USER INT NOT NULL,
FULLNAME NVARCHAR(255) NOT NULL,
EMAIL NVARCHAR(50) NOT NULL,
GENDER NVARCHAR(5) NOT NULL,
CITIZEN_ID_CODE NVARCHAR(12) NULL,
DATE_OF_BIRTH DATE NOT NULL,
PHONE_NUMBER NVARCHAR(12) NOT NULL,
ADDRESS NVARCHAR(MAX) NULL,
ID_NATIONALITY INT NOT NULL,
IMG NVARCHAR(MAX) NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDST PRIMARY KEY (ID),
CONSTRAINT FK_ID_USER2 FOREIGN KEY (ID_USER) REFERENCES USERS,
CONSTRAINT FK_ID_NATIONALITY2 FOREIGN KEY (ID_NATIONALITY) REFERENCES NATIONALITY
)
GO
CREATE TABLE HAND_OVER
(
ID INT IDENTITY(1,1) NOT NULL,
ID_PERSONNEL INT NOT NULL,
RECEIVER NVARCHAR(255) NOT NULL,
DATE_TIME_START DATETIME NOT NULL,
DATE_TIME_END DATETIME NOT NULL,
MONEY_FIRST FLOAT NOT NULL,
TOTAL_MONEY FLOAT NOT NULL,
TOTAL_MONEY_CARD FLOAT NOT NULL,
TOTAL_CASH FLOAT NOT NULL,
SURCHARGE FLOAT NOT NULL,
MONEY_REAL FLOAT NOT NULL,
MONEY_HAND_OVER FLOAT NOT NULL,
NOTE NVARCHAR(255) NULL,
MONEY_STATUS INT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDHO PRIMARY KEY (ID),
CONSTRAINT FK_ID_PSN FOREIGN KEY (ID_PERSONNEL) REFERENCES PERSONNEL,
)
CREATE TABLE RESET_HAND_OVER
(
ID INT IDENTITY(1,1) NOT NULL,
ID_PERSONNEL INT NOT NULL,
RECEIVER NVARCHAR(255) NOT NULL,
DATE_TIME_START DATETIME NOT NULL,
DATE_TIME_END DATETIME NOT NULL,
TOTAL_MONEY FLOAT NOT NULL,
HAND_MONEY FLOAT NOT NULL,
NOTE NVARCHAR(255) NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDRHO PRIMARY KEY (ID),
CONSTRAINT FK_ID_PSN2 FOREIGN KEY (ID_PERSONNEL) REFERENCES PERSONNEL,
)
GO
CREATE TABLE AUTHORITY
(
ID INT IDENTITY(1,1) NOT NULL,
ID_ROLES INT NOT NULL,
ID_USER INT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDAU PRIMARY KEY (ID),
CONSTRAINT FK_ID_ROLES2 FOREIGN KEY (ID_ROLES) REFERENCES ROLES,
CONSTRAINT FK_ID_USER FOREIGN KEY (ID_USER) REFERENCES USERS
)
CREATE TABLE NUMBER_OF_FLOORS
(
ID INT IDENTITY(1,1) NOT NULL,
NUMBER_OF_FLOORS INT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDN PRIMARY KEY (ID)
)
GO
CREATE TABLE KIND_OF_ROOM
(
ID INT IDENTITY(1,1) NOT NULL,
ROOM_TYPE_NAME NVARCHAR(50) NOT NULL,
NOTE NVARCHAR(255) NULL,
PRICE_BY_DAY FLOAT NOT NULL,
HOURLY_PRICE FLOAT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_KIND_OF_ROOM PRIMARY KEY (ID),
)

GO
CREATE TABLE IMAGE_KIND_OF_ROOM
(
ID INT IDENTITY(1,1) NOT NULL,
ID_KIND_OF_ROOM INT NOT NULL,
URL NVARCHAR(MAX) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_IMAGE_KIND_OF_ROOM PRIMARY KEY (ID),
CONSTRAINT FK_IMAGE_KIND_OF_ROOM_KIND_OF_ROOM FOREIGN KEY (ID_KIND_OF_ROOM) REFERENCES KIND_OF_ROOM,
)


GO
CREATE TABLE ROOMS
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NULL,
ID_NUMBER_OF_FLOORS INT NOT NULL,
ID_KIND_OF_ROOM INT NOT NULL,
NOTE NVARCHAR(255) NULL,
IMG NVARCHAR(255) NULL,
IMG1 NVARCHAR(255) NULL,
IMG2 NVARCHAR(255) NULL,
IMG3 NVARCHAR(255) NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDROOM PRIMARY KEY (ID),
CONSTRAINT FK_ID_NUMBER_OF_FLOORS FOREIGN KEY (ID_NUMBER_OF_FLOORS) REFERENCES NUMBER_OF_FLOORS,
CONSTRAINT FK_ID_KIND_OF_ROOM FOREIGN KEY (ID_KIND_OF_ROOM) REFERENCES KIND_OF_ROOM

)
GO
CREATE TABLE FACILITIES
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_FACILITIES PRIMARY KEY (ID)
)
GO
CREATE TABLE FACILITIES_DETAILS
(
ID INT IDENTITY(1,1) NOT NULL,
ID_FACILITIES INT NOT NULL,
ID_ROOMS INT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDFACILITIESDETAILS PRIMARY KEY (ID),
CONSTRAINT FK_ID_FACILITIES FOREIGN KEY (ID_FACILITIES) REFERENCES FACILITIES,
CONSTRAINT FK_ID_ROOMS FOREIGN KEY (ID_ROOMS) REFERENCES ROOMS
)
GO 
CREATE TABLE RENTAL_TYPES
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_RENTAL_TYPES PRIMARY KEY (ID)
)
GO
CREATE TABLE PAYMENT_TYPE
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_PAYMENT_TYPE PRIMARY KEY (ID),
)
GO
CREATE TABLE ROOM_REFUND_CONDITIONS
(
ID INT IDENTITY(1,1) NOT NULL,
REFUND_CONDITIONS NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_ROOM_REFUND_CONDITIONS PRIMARY KEY (ID)
)

GO
CREATE TABLE BOOKING
(
ID INT IDENTITY(1,1) NOT NULL,
CUSTOMER_NAME NVARCHAR(255) NOT NULL,
CUSTOMER_PHONE_NUMBER NVARCHAR(255) NOT NULL,
CUSTOMER_EMAIL NVARCHAR(255) NOT NULL,
ID_KIND_OF_ROOM INT NOT NULL,
HIRE_DATE DATE NOT NULL,
CHECK_OUT_DAY DATE NOT NULL,
NUMBER_OF_ADULTS INT NOT NULL,
NUMBER_OF_KIDS INT NOT NULL,
DEPOSITS FLOAT NULL,
NOTE NVARCHAR(255) NULL,
PAYMENT_STATUS INT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_IDBOOKING PRIMARY KEY (ID),
CONSTRAINT FK_ID_KIND_OF_ROOM_BK FOREIGN KEY (ID_KIND_OF_ROOM) REFERENCES KIND_OF_ROOM
)

GO
CREATE TABLE BILLS
(
ID INT IDENTITY(1,1) NOT NULL,
ID_CUSTOMER INT NOT NULL,
ID_PERSONNEL INT NOT NULL,
ID_ROOM_REFUND_CONDITIONS INT NULL,
ID_PAYMENT_TYPE INT NULL,
NUMBER_OF_ADULTS INT NOT NULL,
NUMBER_OF_KIDS INT NOT NULL,
HIRE_DATE DATETIME NOT NULL,
CHECK_OUT_DAY DATETIME NULL,
DEPOSITS FLOAT NULL,
DATE_OF_PAYMENT DATETIME NULL,
TOTAL_CASH FLOAT NULL, 
TOTAL_CARD FLOAT NULL,
STATUS INT NOT NULL,
ID_BOOKING INT NULL,

CONSTRAINT PK_ID_BILLS PRIMARY KEY (ID),
CONSTRAINT FK_ID_CUSTOMER FOREIGN KEY (ID_CUSTOMER) REFERENCES CUSTOMER,
CONSTRAINT FK_ID_PERSONNEL FOREIGN KEY (ID_PERSONNEL) REFERENCES PERSONNEL,
CONSTRAINT FK_ID_PAYMENT_TYPE FOREIGN KEY (ID_PAYMENT_TYPE) REFERENCES PAYMENT_TYPE,
CONSTRAINT FK_ID_ROOM_REFUND_CONDITIONS FOREIGN KEY (ID_ROOM_REFUND_CONDITIONS) REFERENCES ROOM_REFUND_CONDITIONS,
CONSTRAINT FK_BILLS_BOOKING FOREIGN KEY (ID_BOOKING) REFERENCES BOOKING,
)

GO
CREATE TABLE CONFIG_TIME
(
ID INT IDENTITY(1,1) NOT NULL,
TIME_IN NVARCHAR(255) NOT NULL,
TIME_OUT NVARCHAR(255) NOT NULL,
STATUS INT NOT NULL,

CONSTRAINT PK_ID_CONFIG_TIME PRIMARY KEY (ID),
)

GO
CREATE TABLE DETAILS_INVOICE
(
ID INT IDENTITY(1,1) NOT NULL,
ID_BILL INT NOT NULL,
ID_ROOMS INT NOT NULL,
ID_RENTAL_TYPES INT NOT NULL,
HIRE_DATE DATETIME NOT NULL,
CHECK_OUT_DAY DATETIME NULL,
NUMBER_OF_DAYS_OF_RENT INT NULL,
NUMBER_OF_HOURS_TO_RENT INT NULL,
NUMBER_OF_PEOPLE INT NULL,
TOTAL_CASH FLOAT NULL, 
STATUS INT NOT NULL

CONSTRAINT PK_ID_DETAILS_INVOICE PRIMARY KEY (ID),
CONSTRAINT FK_ID_BILL3 FOREIGN KEY (ID_BILL) REFERENCES BILLS,
CONSTRAINT FK_ID_ROOMS_3 FOREIGN KEY (ID_ROOMS) REFERENCES ROOMS,
CONSTRAINT FK_ID_RENTAL_TYPES_3 FOREIGN KEY (ID_RENTAL_TYPES) REFERENCES RENTAL_TYPES,
)

GO
CREATE TABLE SERVICE_TYPE
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NOT NULL,
NOTE NVARCHAR(255) NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_SERVICE_TYPE PRIMARY KEY (ID),
)
GO
CREATE TABLE SERVICESS
(
ID INT IDENTITY(1,1) NOT NULL,
NAME NVARCHAR(255) NOT NULL,
ID_SERVICE_TYPE INT NOT NULL,
PRICES FLOAT NOT NULL,
NOTE NVARCHAR(255) NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_SERVICESS PRIMARY KEY (ID),
CONSTRAINT FK_ID_SERVICE_TYPE FOREIGN KEY (ID_SERVICE_TYPE) REFERENCES SERVICE_TYPE
)
GO
CREATE TABLE SERVICE_DETAILS
(
ID INT IDENTITY(1,1) NOT NULL,
ID_SERVICE INT NOT NULL,
ID_DETAILS_INVOICE INT NOT NULL,
QUANTITY INT NOT NULL,
TOTAL_CASH FLOAT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_SERVICE_DETAILS PRIMARY KEY (ID),
CONSTRAINT FK_ID_SERVICE FOREIGN KEY (ID_SERVICE) REFERENCES SERVICESS,
CONSTRAINT FK_ID_DETAILS_INVOICE FOREIGN KEY (ID_DETAILS_INVOICE) REFERENCES DETAILS_INVOICE
)
GO
CREATE TABLE SERVICE_AVAILABLE
(
ID INT IDENTITY(1,1) NOT NULL,
ID_SERVICE INT NOT NULL,
ID_ROOMS INT NOT NULL,
QUANTITY INT NOT NULL,
PRICES FLOAT NOT NULL,
STATUS INT NOT NULL

CONSTRAINT PK_ID_SERVICE_AVAILABLE PRIMARY KEY (ID),
CONSTRAINT FK_ID_SERVICES FOREIGN KEY (ID_SERVICE) REFERENCES SERVICESS,
CONSTRAINT FK_ID_ROOMS4 FOREIGN KEY (ID_ROOMS) REFERENCES ROOMS
)

-- INSERT
---
INSERT INTO USERS (USERNAME, PASSWORD, STATUS) VALUES ('lanhv', '$2y$10$W93Hb8s4DWy4l0XlwAbmx.P/1u9AJPTMiUJxNwHfntPwrCvz.BtGq', 1)
INSERT INTO USERS (USERNAME, PASSWORD, STATUS) VALUES ('trucnv', '$2y$10$.YNZtUFgIUvitTEm/YxvQunwttpt.121QYZMhfMXjhIrRr4UdZM5u', 1)
INSERT INTO USERS (USERNAME, PASSWORD, STATUS) VALUES ('vubq', '$2y$10$hcRXwyKitnVF5BP5fPKADeOC7ZuN6URAGvYK4qIHE3rVdwXuRiJMC', 1)
INSERT INTO USERS (USERNAME, PASSWORD, STATUS) VALUES ('huynh', '$2y$10$tBJ8qkd5rKkD4/HgBNQrcOQMNnOCCBHyiHvHgBT/sjGEvnwd7hK4G', 1)
INSERT INTO USERS (USERNAME, PASSWORD, STATUS) VALUES ('chidp', '$2y$10$2qdhajHoJnPHMfX3lWVLHeFzVF8097DdvbKAi5DPMsrSBL5ZSGjrW', 1)
INSERT INTO USERS (USERNAME, PASSWORD, STATUS) VALUES ('teonv', '$2y$10$9k6KiLhtRCD0Xb//dUKbMOE/WlBZym5uDNgZ13ba2Z0Efl.4RgA3C', 1)
INSERT INTO USERS (USERNAME, PASSWORD, STATUS) VALUES ('teonv2', '$2y$10$uUJ2LC7aAjABohjqYd0U9.1hOfPTThmsXaON4gETTmr.09V6O03Xu', 1)
---
INSERT INTO ROLES (NAME, STATUS) VALUES (N'Quản lý', 1)
INSERT INTO ROLES (NAME, STATUS) VALUES (N'Nhân viên', 1)
INSERT INTO ROLES (NAME, STATUS) VALUES (N'Khách hàng', 1)
---
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (1, 1, 1)
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (2, 1, 1)
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (1, 2, 1)
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (1, 3, 1)
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (1, 4, 1)
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (2, 5, 1)
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (3, 6, 1)
INSERT INTO AUTHORITY (ID_ROLES, ID_USER, STATUS) VALUES (2, 7, 1)
---
INSERT INTO NATIONALITY (NAME, STATUS) VALUES (N'Việt Nam', 1)
INSERT INTO NATIONALITY (NAME, STATUS) VALUES (N'Hàn Quốc', 1)
INSERT INTO NATIONALITY (NAME, STATUS) VALUES (N'Nhật Bản', 0)
---
INSERT INTO CUSTOMER (ID_USER, FULLNAME, EMAIL, CITIZEN_ID_CODE, GENDER,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, IMG, ID_NATIONALITY, STATUS)
		VALUES (5, N'Hồ Văn Lân', 'lanhv@gmail.com', '987654321', N'Nam', 
		'2/3/1999', '0345789999', N'Đà Nẵng', 'lanhv.jpg', 1, 1)
INSERT INTO CUSTOMER (ID_USER, FULLNAME, EMAIL, CITIZEN_ID_CODE, GENDER,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, IMG, ID_NATIONALITY, STATUS)
		VALUES (6, N'Nguyễn Văn Tèo', 'teonv@gmail.com', '987654321', N'Nam', 
		'2/3/1998', '0345789999', N'Đà Nẵng', 'teo.jpg', 1, 1)
---
INSERT INTO PERSONNEL (ID_USER, FULLNAME, EMAIL, GENDER, CITIZEN_ID_CODE,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, ID_NATIONALITY, IMG, STATUS)
		VALUES (1, N'Hồ Văn Lân', 'holan2k@gmail.com', N'Nam', '178954321',
		'02/23/2000', '0334407886', N'Nghệ An', 1, 'lan.jpg', 1)
INSERT INTO PERSONNEL (ID_USER, FULLNAME, EMAIL, GENDER, CITIZEN_ID_CODE,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, ID_NATIONALITY, IMG, STATUS)
		VALUES (2, N'Nguyễn Văn Trức', 'trucnv@gmail.com', N'Nam', '222222222',
		'2/2/2000', '0333797979', N'Hà Nội', 1, 'truc.jpg', 1)
INSERT INTO PERSONNEL (ID_USER, FULLNAME, EMAIL, GENDER, CITIZEN_ID_CODE,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, ID_NATIONALITY, IMG, STATUS)
		VALUES (3, N'Bùi Quang Vũ', 'vubq@gmail.com', N'Nam', '333333333',
		'3/3/2002', '032198765', N'Hải Dương', 1, 'vu.jpg', 1)
INSERT INTO PERSONNEL (ID_USER, FULLNAME, EMAIL, GENDER, CITIZEN_ID_CODE,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, ID_NATIONALITY, IMG, STATUS)
		VALUES (4, N'Nguyễn Hoàng Huy', 'huynh@gmail.com', N'Nam', '444444444',
		'4/4/2002', '0343219876', N'Kon Tum', 1, 'huy.jpg', 1)
INSERT INTO PERSONNEL (ID_USER, FULLNAME, EMAIL, GENDER, CITIZEN_ID_CODE,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, ID_NATIONALITY, IMG, STATUS)
		VALUES (5, N'Đinh Phương Chi', 'chidp@gmail.com', N'Nữ', '555555555',
		'5/5/2002', '0354321987', N'Dak Lak', 1, 'chi.jpg', 1)
INSERT INTO PERSONNEL (ID_USER, FULLNAME, EMAIL, GENDER, CITIZEN_ID_CODE,
						DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, ID_NATIONALITY, IMG, STATUS)
		VALUES (7, N'FPOLY', 'fpoly@gmail.com', N'Nam', '66666666',
		'9/9/2002', '0354321987', N'Hà Nội', 1, 'fpoly.jpg', 1)
---
INSERT INTO HAND_OVER(ID_PERSONNEL,RECEIVER,DATE_TIME_START,DATE_TIME_END,TOTAL_MONEY,MONEY_FIRST,TOTAL_MONEY_CARD,TOTAL_CASH,SURCHARGE,MONEY_REAL,MONEY_HAND_OVER, NOTE,MONEY_STATUS, STATUS)
VALUES(6,N'','2022-10-31T09:35:53','2022-10-31T09:35:53',0,500000,0,500000,0,0,0,N'Đã nhận ca từ quản lý lúc 2022-10-31T09:35:53',1,0) 
---
INSERT INTO RESET_HAND_OVER(ID_PERSONNEL,RECEIVER,DATE_TIME_START,DATE_TIME_END,TOTAL_MONEY,HAND_MONEY,NOTE,STATUS) 
VALUES(6,N'huynh','2022-10-31T09:35:53','2022-10-31T12:35:53',3000000,2000000,N'Còn dư 1 triệu',1)
---
INSERT INTO PAYMENT_TYPE (NAME, STATUS) VALUES (N'Chuyển khoản', 1)
INSERT INTO PAYMENT_TYPE (NAME, STATUS) VALUES (N'Tiền mặt', 1)
---
INSERT INTO ROOM_REFUND_CONDITIONS(REFUND_CONDITIONS, STATUS) VALUES (N'Hủy phòng trước 3 ngày', 1)
INSERT INTO ROOM_REFUND_CONDITIONS(REFUND_CONDITIONS, STATUS) VALUES (N'Sự cố', 1)
---
INSERT INTO BILLS (ID_CUSTOMER, ID_PERSONNEL,ID_PAYMENT_TYPE,ID_ROOM_REFUND_CONDITIONS,
				HIRE_DATE,NUMBER_OF_ADULTS,NUMBER_OF_KIDS, TOTAL_CASH,TOTAL_CARD, DEPOSITS, CHECK_OUT_DAY, DATE_OF_PAYMENT, STATUS)
		VALUES (1,3, 1,1, '2022-12-04 12:00',3,2,6000000,500000,3000000, '2022-12-04 12:00', '2022-12-06 12:00', 1)
INSERT INTO BILLS (ID_CUSTOMER, ID_PERSONNEL,ID_PAYMENT_TYPE,ID_ROOM_REFUND_CONDITIONS,
				HIRE_DATE,NUMBER_OF_ADULTS,NUMBER_OF_KIDS, TOTAL_CASH,TOTAL_CARD, DEPOSITS, CHECK_OUT_DAY, DATE_OF_PAYMENT, STATUS)
		VALUES (1,3, 1,1, '2022-12-04 12:00',3,2,6000000,500000,3000000, '2022-12-04 19:00', '2022-12-06 20:00', 1)
INSERT INTO BILLS (ID_CUSTOMER, ID_PERSONNEL,ID_PAYMENT_TYPE,ID_ROOM_REFUND_CONDITIONS,
				HIRE_DATE,NUMBER_OF_ADULTS,NUMBER_OF_KIDS, TOTAL_CASH,TOTAL_CARD, DEPOSITS, CHECK_OUT_DAY, DATE_OF_PAYMENT, STATUS)
		VALUES (1,3, 1,1, '2022-12-06 14:50',3,2,6000000,500000,3000000, '2022-12-06 14:55', '2022-12-06 15:00', 1)

INSERT INTO BILLS (ID_CUSTOMER, ID_PERSONNEL,ID_PAYMENT_TYPE,ID_ROOM_REFUND_CONDITIONS,
				HIRE_DATE,NUMBER_OF_ADULTS,NUMBER_OF_KIDS, TOTAL_CASH,TOTAL_CARD, DEPOSITS, CHECK_OUT_DAY, DATE_OF_PAYMENT, STATUS)
		VALUES (2, 4, 1,2, '10/05/2022',2,2,8000000,4000000,3000000, '10/06/2022', '', 0)
---dateOfLogin <= x.dateOfPayment <= now

INSERT INTO RENTAL_TYPES (NAME, STATUS) VALUES (N'Theo ngày', 1)
INSERT INTO RENTAL_TYPES (NAME, STATUS) VALUES (N'Theo giờ', 1)
--- 
INSERT INTO SERVICE_TYPE (NAME, NOTE, STATUS) VALUES (N'Giặt là', N'Dịch vụ giặt là trả đồ sau 6h.', 1)
INSERT INTO SERVICE_TYPE (NAME, NOTE, STATUS) VALUES (N'Dọn phòng', N'Dịch vụ dọn phòng ngay.', 1)
INSERT INTO SERVICE_TYPE (NAME, NOTE, STATUS) VALUES (N'Đồ uống', N'Các loại đồ uống', 1)
INSERT INTO SERVICE_TYPE (NAME, NOTE, STATUS) VALUES (N'Đồ ăn', N'Các loại đồ ăn', 1)
---
INSERT INTO SERVICESS (NAME, ID_SERVICE_TYPE, PRICES, NOTE, STATUS) 
			VALUES (N'Giặt bikini', 1, '60000', N'60.000 dong/ kg', 1 )
INSERT INTO SERVICESS (NAME, ID_SERVICE_TYPE, PRICES, NOTE, STATUS) 
			VALUES (N'Cafe sữa đá', 3, '49000', N'49.000 dong/ cup ', 1 )
INSERT INTO SERVICESS (NAME, ID_SERVICE_TYPE, PRICES, NOTE, STATUS) 
			VALUES (N'Pizza', 1, '89000', N'89.000 đồng/ cake', 1 )
INSERT INTO SERVICESS (NAME, ID_SERVICE_TYPE, PRICES, NOTE, STATUS) 
			VALUES (N'Nước lọc', 3, '10000', N'10.000 dong/ bot', 1 )
INSERT INTO SERVICESS (NAME, ID_SERVICE_TYPE, PRICES, NOTE, STATUS) 
			VALUES (N'Cafe gói', 3, '9000', N'9.000 dong/ pack ', 1 )
INSERT INTO SERVICESS (NAME, ID_SERVICE_TYPE, PRICES, NOTE, STATUS) 
			VALUES (N'Redbull', 3, '15000', N'15.000 đồng/ lon', 1 )
---
INSERT INTO KIND_OF_ROOM(ROOM_TYPE_NAME, NOTE, PRICE_BY_DAY,HOURLY_PRICE, STATUS) VALUES (N'Phòng đơn', N'Single room', 0,0, 1)
INSERT INTO KIND_OF_ROOM(ROOM_TYPE_NAME, NOTE, PRICE_BY_DAY,HOURLY_PRICE, STATUS) VALUES (N'Phòng đôi', N'Double room' , 0,0, 1)
INSERT INTO KIND_OF_ROOM(ROOM_TYPE_NAME, NOTE, PRICE_BY_DAY,HOURLY_PRICE, STATUS) VALUES (N'Phòng 2 đơn', N'Twin room' , 0,0, 1)
INSERT INTO KIND_OF_ROOM(ROOM_TYPE_NAME, NOTE, PRICE_BY_DAY,HOURLY_PRICE, STATUS) VALUES (N'Phòng VIP 1', N'King room' , 0,0, 1)
INSERT INTO KIND_OF_ROOM(ROOM_TYPE_NAME, NOTE, PRICE_BY_DAY,HOURLY_PRICE, STATUS) VALUES (N'Phòng VIP 2', N'Queen room', 0,0, 1)
---

---
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (2, 1)
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (3, 1)
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (4, 1)
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (5, 1)
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (6, 1)
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (7, 1)
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (8, 1)
INSERT INTO NUMBER_OF_FLOORS (NUMBER_OF_FLOORS, STATUS) VALUES (9, 1)
---
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3,STATUS)
			VALUES ('P201', 1, 2, N'Phòng 2 người', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 1)
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3,STATUS)
			VALUES ('P202', 1, 1, N'Phòng 1 người',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',1)
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3, STATUS)
			VALUES ('P203', 1, 2, N'Phòng 2 người',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',1)
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3, STATUS)
			VALUES ('P204', 1, 1, N'Phòng 1 người',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',1)
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3, STATUS)
			VALUES ('P205', 1, 2, N'Phòng 2 người',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',1)
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3, STATUS)
			VALUES ('P206', 1, 1, N'Phòng 1 người',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',1)
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3, STATUS)
			VALUES ('P207', 1, 2, N'Phòng 2 người',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',1)
INSERT INTO ROOMS (NAME, ID_NUMBER_OF_FLOORS, ID_KIND_OF_ROOM, NOTE, IMG, IMG1, IMG2, IMG3, STATUS)
			VALUES ('P208', 1, 1, N'Phòng 1 người',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg', 
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',
'https://res.cloudinary.com/dwbx0ov8v/image/upload/v1669303613/can_ho_dich_vu_trksik.jpg',1)
---
INSERT INTO FACILITIES (NAME, STATUS) VALUES (N'Tivi', 1)
INSERT INTO FACILITIES (NAME, STATUS) VALUES (N'Máy sấy tóc', 1)
INSERT INTO FACILITIES (NAME, STATUS) VALUES (N'Mini bar', 1)
INSERT INTO FACILITIES (NAME, STATUS) VALUES (N'Tủ quần áo', 1)
INSERT INTO FACILITIES (NAME, STATUS) VALUES (N'Đèn ngủ', 1)
INSERT INTO FACILITIES (NAME, STATUS) VALUES (N'Ghế đẩu', 1)
INSERT INTO FACILITIES (NAME, STATUS) VALUES (N'Bàn', 1)
---
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (1, 1, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (2, 1, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (3, 1, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (4, 1, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (5, 1, 1)

INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (1, 2, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (2, 2, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (3, 2, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (4, 2, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (5, 2, 1)

INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (1, 3, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (2, 3, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (3, 3, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (4, 3, 1)
INSERT INTO FACILITIES_DETAILS (ID_FACILITIES, ID_ROOMS, STATUS) VALUES (5, 3, 1)

---
INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (4, 1, '10000', 2, 1)
INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (5, 1, '9000', 2, 1)
INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (6, 1, '15000', 1, 1)

INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (4, 2, '10000', 2, 1)
INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (5, 2, '9000', 2, 1)
INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (6, 2, '15000', 1, 1)

INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (4, 3, '10000', 2, 1)
INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (5, 3, '9000', 2, 1)
INSERT INTO SERVICE_AVAILABLE (ID_SERVICE, ID_ROOMS, PRICES, QUANTITY, STATUS)
	VALUES (6, 3, '15000', 1, 1)



