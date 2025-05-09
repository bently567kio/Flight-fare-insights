CREATE DATABASE flight2;
USE flight2;

CREATE TABLE Users(
Users_id int Primary key,
name VARCHAR(225),
email VARCHAR(225),
Phone_number VARCHAR(20)
);

CREATE TABLE Service(
service_id int PRIMARY KEY,
name VARCHAR(225),
Descriptions TEXT,
Price DECIMAL(10,2));

CREATE TABLE Booking(
Booking_id int PRIMARY KEY,
Users_id int,
service_id int,
DATE DATE,
Status VARCHAR(100),
FOREIGN KEY(Users_id)  References Users(Users_id),
FOREIGN KEY(service_id) references Service(service_id));

CREATE TABLE Location(
Location_id int PRIMARY KEY,
Name VARCHAR(225),
Address VARCHAR(225),
City varchar(150),
Country VARCHAR(150)
);
ALTER TABLE Location
ADD column Booking_id int;
CREATE TABLE Reviews (
    Review_id int primary key,
    Users_id int,
    service_id int,
    Rating int,
    Comments Text,
    foreign key(Users_id) references Users(Users_id),
    foreign key(service_id) references Service(service_id)
);

CREATE TABLE Payment (
   Payment_id int PRIMARY KEY,
   Booking_id int,
   Amount DECIMAL(10,2),
   PaymentDate DATE,
   Payment_method VARCHAR(100),
   FOREIGN KEY(Booking_id) references Booking(Booking_id)
);

CREATE TABLE CancellationRefund (
    CancellationRefundID INT PRIMARY KEY,
    Booking_id int,
    CancellationDate DATE,
    RefundAmount DECIMAL(10, 2),
    FOREIGN KEY (Booking_id ) REFERENCES Booking(   Booking_id )
);

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    Users_id int,
	Booking_id  INT,
    Amount DECIMAL(10, 2),
    DueDate DATE,
    FOREIGN KEY (Users_id) REFERENCES Users(Users_id),
    FOREIGN KEY (Booking_id ) REFERENCES Booking( Booking_id )
);

CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY,
    Users_id int,
    Message TEXT,
    FOREIGN KEY ( Users_id) REFERENCES Users( Users_id)
);


INSERT INTO Users (Users_id, name, email, Phone_number) VALUES
(1, 'Rohan Sharma', 'rohan.sharma@email.com', '9876543210'),
(2, 'Aditi Patel', 'aditi.patel@email.com', '8765432109'),
(3, 'Raj Malhotra', 'raj.malhotra@email.com', '7654321098'),
(4, 'Meera Iyer', 'meera.iyer@email.com', '6543210987'),
(5, 'Aryan Verma', 'aryan.verma@email.com', '5432109876'),
(6, 'Simran Kaur', 'simran.kaur@email.com', '4321098765'),
(7, 'Kabir Das', 'kabir.das@email.com', '3210987654'),
(8, 'Ananya Rao', 'ananya.rao@email.com', '2109876543'),
(9, 'Vikram Mehta', 'vikram.mehta@email.com', '1098765432'),
(10, 'Sneha Joshi', 'sneha.joshi@email.com', '1987654321'),
(11, 'Rahul Singh', 'rahul.singh@email.com', '2876543210'),
(12, 'Priya Kapoor', 'priya.kapoor@email.com', '3765432109'),
(13, 'Arjun Nair', 'arjun.nair@email.com', '4654321098'),
(14, 'Tanya Bhatt', 'tanya.bhatt@email.com', '5543210987'),
(15, 'Kunal Saxena', 'kunal.saxena@email.com', '6432109876');

INSERT INTO Service (service_id, name, Descriptions, Price) VALUES
(1, 'Domestic Economy Flight', 'Affordable economy-class flight within the country.', 4999.99),
(2, 'Domestic Business Flight', 'Comfortable business-class flight with premium services.', 12999.99),
(3, 'International Economy Flight', 'Budget-friendly international flight with essential amenities.', 25999.99),
(4, 'International Business Flight', 'Luxury business-class flight with lounge access.', 55999.99),
(5, 'Private Charter Flight', 'Personalized private jet experience for VIP travel.', 149999.99),
(6, 'Helicopter Tour', 'Scenic helicopter tour with breathtaking aerial views.', 9999.99),
(7, 'Cargo Flight Service', 'Reliable cargo transportation for shipments worldwide.', 19999.99),
(8, 'Medical Evacuation Flight', 'Emergency air transport for critical medical cases.', 99999.99),
(9, 'Military Transport Flight', 'Specialized flight services for defense operations.', 74999.99),
(10, 'Luxury First-Class Flight', 'Premium first-class travel with exclusive perks.', 79999.99),
(11, 'Budget Airlines Service', 'Low-cost airline service for budget-conscious travelers.', 3999.99),
(12, 'Regional Connector Flight', 'Short-distance flight connecting nearby cities.', 5999.99),
(13, 'Long-Haul Direct Flight', 'Non-stop flight for long-distance international travel.', 35999.99),
(14, 'Sightseeing Air Tour', 'Guided aerial sightseeing experience over landmarks.', 11999.99),
(15, 'Airline Membership Flight', 'Exclusive flight services for frequent airline members.', 8999.99);

INSERT INTO Booking (Booking_id, Users_id, service_id, DATE, Status) VALUES
(1, 3, 5, '2025-05-01', 'Confirmed'),
(2, 7, 1, '2025-05-02', 'Pending'),
(3, 12, 8, '2025-05-03', 'Cancelled'),
(4, 5, 2, '2025-05-04', 'Confirmed'),
(5, 9, 10, '2025-05-05', 'Confirmed'),
(6, 1, 6, '2025-05-06', 'Pending'),
(7, 11, 4, '2025-05-07', 'Cancelled'),
(8, 14, 15, '2025-05-08', 'Confirmed'),
(9, 2, 7, '2025-05-09', 'Confirmed'),
(10, 8, 12, '2025-05-10', 'Pending'),
(11, 10, 3, '2025-05-11', 'Cancelled'),
(12, 6, 9, '2025-05-12', 'Confirmed'),
(13, 4, 11, '2025-05-13', 'Pending'),
(14, 13, 14, '2025-05-14', 'Confirmed'),
(15, 15, 13, '2025-05-15', 'Cancelled');

UPDATE booking
SET DATE =
  CASE 
    WHEN Booking_id  = 1 THEN '2024-12-01' 
    WHEN Booking_id  = 2 THEN '2024-12-15' 
    WHEN Booking_id = 3 THEN '2024-07-03' 
    WHEN Booking_id  = 4 THEN '2024-07-10' 
    WHEN Booking_id  = 5 THEN '2024-06-25'
    WHEN Booking_id = 6 THEN '2024-01-06' 
    WHEN Booking_id  = 7 THEN '2024-08-07' 
    WHEN Booking_id  = 8 THEN '2024-08-20' 
    WHEN Booking_id = 9 THEN '2024-06-10' 
    WHEN Booking_id  = 10 THEN '2024-02-18' 
    WHEN Booking_id  = 11 THEN '2024-11-05' 
    WHEN Booking_id  = 12 THEN '2024-07-25' 
    WHEN Booking_id = 13 THEN '2024-12-08' 
    WHEN Booking_id = 14 THEN '2024-01-14' 
    WHEN Booking_id  = 15 THEN '2024-08-05' 
  END
WHERE Booking_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

SELECT * FROM booking;


INSERT INTO Location (Location_id, Name, Address, City, Country) VALUES
(1, 'Indira Gandhi International Airport', 'New Delhi, India', 'New Delhi', 'India'),
(2, 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai, India', 'Mumbai', 'India'),
(3, 'Kempegowda International Airport', 'Bengaluru, India', 'Bengaluru', 'India'),
(4, 'Dubai International Airport', 'Dubai, UAE', 'Dubai', 'United Arab Emirates'),
(5, 'Heathrow Airport', 'London, UK', 'London', 'United Kingdom'),
(6, 'John F. Kennedy International Airport', 'New York, USA', 'New York', 'United States'),
(7, 'Singapore Changi Airport', 'Singapore', 'Singapore', 'Singapore'),
(8, 'Sydney Kingsford Smith Airport', 'Sydney, Australia', 'Sydney', 'Australia'),
(9, 'Tokyo Haneda Airport', 'Tokyo, Japan', 'Tokyo', 'Japan'),
(10, 'Hong Kong International Airport', 'Chek Lap Kok, Hong Kong', 'Hong Kong', 'Hong Kong'),
(11, 'Frankfurt Airport', 'Frankfurt, Germany', 'Frankfurt', 'Germany'),
(12, 'Los Angeles International Airport', 'Los Angeles, USA', 'Los Angeles', 'United States'),
(13, 'Toronto Pearson International Airport', 'Toronto, Canada', 'Toronto', 'Canada'),
(14, 'Paris Charles de Gaulle Airport', 'Paris, France', 'Paris', 'France'),
(15, 'Beijing Capital International Airport', 'Beijing, China', 'Beijing', 'China');

INSERT INTO Reviews (Review_id, Users_id, service_id, Rating, Comments) VALUES
(1, 3, 5, 4, 'Great experience, smooth flight!'),
(2, 7, 1, 5, 'Excellent service and comfortable seating.'),
(3, 12, 8, 3, 'Average flight, but good staff assistance.'),
(4, 5, 2, 5, 'Loved the in-flight meals! Highly recommended.'),
(5, 9, 10, 4, 'Pleasant journey, but could improve legroom.'),
(6, 1, 6, 2, 'Flight delayed, not a great experience.'),
(7, 11, 4, 5, 'Premium service, worth every penny!'),
(8, 14, 15, 3, 'Good but baggage claim took too long.'),
(9, 2, 7, 4, 'Nice flight, smooth takeoff and landing.'),
(10, 8, 12, 5, 'Loved the hospitality and cabin crew service.'),
(11, 10, 3, 2, 'Not the best flight, too noisy.'),
(12, 6, 9, 4, 'Pretty decent, just minor inconveniences.'),
(13, 4, 11, 5, 'Excellent amenities, will book again!'),
(14, 13, 14, 3, 'Average service, but on-time departure.'),
(15, 15, 13, 1, 'Worst experience, lost my luggage!');

INSERT INTO Payment (Payment_id, Booking_id, Amount, PaymentDate, Payment_method) VALUES
(1, 3, 4999.99, '2025-05-01', 'Credit Card'),
(2, 7, 12999.99, '2025-05-02', 'PayPal'),
(3, 12, 25999.99, '2025-05-03', 'Debit Card'),
(4, 5, 55999.99, '2025-05-04', 'Net Banking'),
(5, 9, 149999.99, '2025-05-05', 'Credit Card'),
(6, 1, 9999.99, '2025-05-06', 'Cash'),
(7, 11, 19999.99, '2025-05-07', 'UPI'),
(8, 14, 99999.99, '2025-05-08', 'Credit Card'),
(9, 2, 74999.99, '2025-05-09', 'Debit Card'),
(10, 8, 79999.99, '2025-05-10', 'Net Banking'),
(11, 10, 3999.99, '2025-05-11', 'Credit Card'),
(12, 6, 5999.99, '2025-05-12', 'UPI'),
(13, 4, 35999.99, '2025-05-13', 'Cash'),
(14, 13, 11999.99, '2025-05-14', 'Debit Card'),
(15, 15, 8999.99, '2025-05-15', 'Net Banking');

UPDATE payment
SET PaymentDate =
  CASE 
    WHEN Payment_id  = 1 THEN '2024-12-01' 
    WHEN Payment_id  = 2 THEN '2024-12-15' 
    WHEN Payment_id= 3 THEN '2024-07-03' 
    WHEN Payment_id  = 4 THEN '2024-07-10' 
    WHEN Payment_id  = 5 THEN '2024-06-25'
    WHEN Payment_id = 6 THEN '2024-01-06' 
    WHEN Payment_id  = 7 THEN '2024-08-07' 
    WHEN Payment_id  = 8 THEN '2024-08-20' 
    WHEN Payment_id = 9 THEN '2024-06-10' 
    WHEN Payment_id  = 10 THEN '2024-02-18' 
    WHEN Payment_id = 11 THEN '2024-11-05' 
    WHEN Payment_id = 12 THEN '2024-07-25' 
    WHEN Payment_id = 13 THEN '2024-12-08' 
    WHEN Payment_id = 14 THEN '2024-01-14' 
    WHEN Payment_id  = 15 THEN '2024-08-05' 
  END
WHERE Payment_id IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

SELECT * FROM payment;

INSERT INTO CancellationRefund (CancellationRefundID, Booking_id, CancellationDate, RefundAmount) VALUES
(1, 3, '2025-05-01', 2500.00),
(2, 7, '2025-05-02', 5000.00),
(3, 12, '2025-05-03', 12000.00),
(4, 5, '2025-05-04', 7000.00),
(5, 9, '2025-05-05', 15000.00),
(6, 1, '2025-05-06', 4000.00),
(7, 11, '2025-05-07', 10000.00),
(8, 14, '2025-05-08', 8000.00),
(9, 2, '2025-05-09', 7500.00),
(10, 8, '2025-05-10', 9000.00),
(11, 10, '2025-05-11', 3000.00),
(12, 6, '2025-05-12', 4500.00),
(13, 4, '2025-05-13', 11000.00),
(14, 13, '2025-05-14', 6000.00),
(15, 15, '2025-05-15', 3500.00);

UPDATE cancellationRefund
SET CancellationDate =
  CASE 
    WHEN CancellationRefundID  = 1 THEN '2024-12-01' 
    WHEN CancellationRefundID  = 2 THEN '2024-12-15' 
    WHEN CancellationRefundID = 3 THEN '2024-07-03' 
    WHEN CancellationRefundID  = 4 THEN '2024-07-10' 
    WHEN CancellationRefundID  = 5 THEN '2024-06-25'
    WHEN CancellationRefundID = 6 THEN '2024-01-06' 
    WHEN CancellationRefundID = 7 THEN '2024-08-07' 
    WHEN CancellationRefundID  = 8 THEN '2024-08-20' 
    WHEN CancellationRefundID = 9 THEN '2024-06-10' 
    WHEN CancellationRefundID  = 10 THEN '2024-02-18' 
    WHEN CancellationRefundID= 11 THEN '2024-11-05' 
    WHEN CancellationRefundID = 12 THEN '2024-07-25' 
    WHEN CancellationRefundID = 13 THEN '2024-12-08' 
    WHEN CancellationRefundID= 14 THEN '2024-01-14' 
    WHEN CancellationRefundID  = 15 THEN '2024-08-05' 
  END
WHERE CancellationRefundID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
SELECt * FROM cancellationRefund;


INSERT INTO Invoices (InvoiceID, Users_id, Booking_id, Amount, DueDate) VALUES
(1, 3, 5, 4999.99, '2025-05-01'),
(2, 7, 1, 12999.99, '2025-05-02'),
(3, 12, 8, 25999.99, '2025-05-03'),
(4, 5, 2, 55999.99, '2025-05-04'),
(5, 9, 10, 149999.99, '2025-05-05'),
(6, 1, 6, 9999.99, '2025-05-06'),
(7, 11, 4, 19999.99, '2025-05-07'),
(8, 14, 15, 99999.99, '2025-05-08'),
(9, 2, 7, 74999.99, '2025-05-09'),
(10, 8, 12, 79999.99, '2025-05-10'),
(11, 10, 3, 3999.99, '2025-05-11'),
(12, 6, 9, 5999.99, '2025-05-12'),
(13, 4, 11, 35999.99, '2025-05-13'),
(14, 13, 14, 11999.99, '2025-05-14'),
(15, 15, 13, 8999.99, '2025-05-15');

UPDATE invoices
SET DueDate =
  CASE 
    WHEN InvoiceID = 1 THEN '2024-12-01' 
    WHEN InvoiceID  = 2 THEN '2024-12-15' 
    WHEN InvoiceID = 3 THEN '2024-07-03' 
    WHEN InvoiceID = 4 THEN '2024-07-10' 
    WHEN InvoiceID  = 5 THEN '2024-06-25'
    WHEN InvoiceID= 6 THEN '2024-01-06' 
    WHEN InvoiceID = 7 THEN '2024-08-07' 
    WHEN InvoiceID = 8 THEN '2024-08-20' 
    WHEN InvoiceID = 9 THEN '2024-06-10' 
    WHEN InvoiceID  = 10 THEN '2024-02-18' 
    WHEN InvoiceID= 11 THEN '2024-11-05' 
    WHEN InvoiceID= 12 THEN '2024-07-25' 
    WHEN InvoiceID = 13 THEN '2024-12-08' 
    WHEN InvoiceID= 14 THEN '2024-01-14' 
    WHEN InvoiceID = 15 THEN '2024-08-05' 
  END
WHERE InvoiceID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

SELECT *FROM invoices;






SELECT * FROM Invoices;

INSERT INTO Notifications (NotificationID, Users_id, Message) VALUES
(1, 3, 'Your flight booking has been confirmed.'),
(2, 7, 'Your payment has been successfully processed.'),
(3, 12, 'Your flight has been canceled. Refund is initiated.'),
(4, 5, 'Your flight will depart in 24 hours.'),
(5, 9, 'Your invoice is due tomorrow.'),
(6, 1, 'Thank you for choosing our airline!'),
(7, 11, 'Your flight has been rescheduled. Check your itinerary.'),
(8, 14, 'Special offer: 20% discount on your next booking!'),
(9, 2, 'Your payment receipt has been emailed.'),
(10, 8, 'Your flight has been delayed by 1 hour.'),
(11, 10, 'Reminder: Check-in opens tomorrow.'),
(12, 6, 'Your baggage details have been updated.'),
(13, 4, 'Feedback requested: Rate your recent flight.'),
(14, 13, 'Exclusive membership offer: Earn bonus points!'),
(15, 15, 'Your refund has been processed successfully.');




#1 How can you list all flights that have received a rating of 4 or above in the Reviews table?
SELECT * 
FROM Service as s1
inner join Reviews as r1 on s1.service_id=r1.Review_id
WHERE Rating >=4
Order BY s1.Price desc;

 #2 How many flights have been canceled due to poor ratings and negative reviews? 
SELECT *
FROM cancellationrefund as cr
inner join Reviews as r1 on cr.CancellationRefundID=r1.Review_id
WHERE r1.Rating <=3;

#3 How much financial loss do airlines incur due to cancellations and refund policies?
SELECT 
Sum(RefundAmount) as Amount
FROM cancellationrefund as cr
inner join Reviews as r1 on cr.CancellationRefundID=r1.Review_id
WHERE r1.Rating <=3;

# Which date had the highest number of ticket cancellations in each month?
SELECT *,monthname(b1.DATE)
FROM booking as b1
inner join cancellationrefund as c1 on b1.Booking_id=c1.CancellationRefundID
WHERE status ="Cancelled";

#Which airline charges the highest fare for a ticket?
SELECT Name,Price
FROM service
WHERE Price >50000;

#Which airline charges the lowest fare for a ticket?
SELECT 
Name,
Price 
FROM service
WHERE Price <25000;



#Which cities have the highest number of bookings? code
SELECT 
    l.City,
    COUNT(b.Booking_id) AS TotalBookings
FROM 
    booking b
JOIN 
    location l ON b.Location_id = l.Location_id
GROUP BY 
    l.City
ORDER BY 
    TotalBookings DESC;
    
    ALTER TABLE booking
    add column Location_id int;





 



 




















