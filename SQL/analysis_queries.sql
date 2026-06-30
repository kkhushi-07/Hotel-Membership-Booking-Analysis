-- sql
-- =====================================================
-- Hotel Membership & Booking Analysis
-- SQL Practice Problems
-- Author: Khushi
-- Database: Hotel Membership Database
-- =====================================================

-- =====================================================
-- Note:
-- This project uses MySQL 8.0 features such as Window Functions
-- (RANK(), SUM() OVER()).
-- =====================================================

-- =====================================================
-- SECTION 1 : BASIC SQL QUERIES
-- =====================================================


-- =====================================================
-- Problem 01
-- Question:
-- How many members are there in total?
--
-- SQL Concept:
-- COUNT()
--
-- Tables Used:
-- Member
--
-- Business Purpose:
-- Determine the total number of registered members in the system.
-- =====================================================

SELECT COUNT(*) AS TotalMembers
FROM member;



-- =====================================================
-- Problem 02
-- Question:
-- How many members belong to each subsidiary?
--
-- SQL Concept:
-- COUNT(), GROUP BY
--
-- Tables Used:
-- Member
--
-- Business Purpose:
-- Analyze the distribution of members across different subsidiaries.
-- =====================================================

SELECT
    Subsidiary,
    COUNT(MemberID) AS TotalMembers
FROM member
GROUP BY Subsidiary;



-- =====================================================
-- Problem 03
-- Question:
-- How many memberships exist for each product?
--
-- SQL Concept:
-- COUNT(), GROUP BY
--
-- Tables Used:
-- Membership
--
-- Business Purpose:
-- Identify the popularity of each membership product.
-- =====================================================

SELECT
    Product,
    COUNT(MembershipID) AS TotalMemberships
FROM membership1
GROUP BY Product;



-- =====================================================
-- Problem 04
-- Question:
-- How many memberships are Active, Expired, and Cancelled?
--
-- SQL Concept:
-- COUNT(), GROUP BY
--
-- Tables Used:
-- Membership
--
-- Business Purpose:
-- Monitor membership status and evaluate customer retention.
-- =====================================================

SELECT
    Status,
    COUNT(MembershipID) AS TotalMemberships
FROM Membership
GROUP BY Status;



-- =====================================================
-- Problem 05
-- Question:
-- How many hotels are there in each city?
--
-- SQL Concept:
-- COUNT(), GROUP BY
--
-- Tables Used:
-- Hotels
--
-- Business Purpose:
-- Analyze hotel distribution across different cities.
-- =====================================================

SELECT City,count(*) AS TotalHotel
FROM hotels
GROUP BY city;



-- =====================================================
-- Problem 06
-- Question:
-- What is the total number of bookings?
--
-- SQL Concept:
-- COUNT()
--
-- Tables Used:
-- Booking
--
-- Business Purpose:
-- Measure the total booking volume.
-- =====================================================

SELECT COUNT(BookingID) AS TotalBooking
FROM bookings;



-- =====================================================
-- Problem 07
-- Question:
-- What is the transaction count by payment method?
--
-- SQL Concept:
-- COUNT(), GROUP BY
--
-- Tables Used:
-- Transaction
--
-- Business Purpose:
-- Understand customer payment preferences.
-- =====================================================


SELECT PaymentMethod , COUNT(TransactionID) AS TotalTransaction
FROM transaction
GROUP BY PaymentMethod;


-- =====================================================
-- Problem 08
-- Question:
-- What is the total revenue by payment method?
--
-- SQL Concept:
-- SUM(), GROUP BY
--
-- Tables Used:
-- Transaction
--
-- Business Purpose:
-- Evaluate revenue contribution from each payment method.
-- =====================================================


SELECT PaymentMethod , SUM(Amount) AS TotalRevenue
FROM transaction
GROUP BY PaymentMethod;



-- =====================================================
-- Problem 09
-- Question:
-- What is the highest transaction amount?
--
-- SQL Concept:
-- MAX()
--
-- Tables Used:
-- Transaction
--
-- Business Purpose:
-- Identify the highest-value transaction recorded.
-- =====================================================


SELECT max(Amount) AS HighestTransactionAmount
FROM transaction;



-- =====================================================
-- Problem 10
-- Question:
-- What is the lowest transaction amount?
--
-- SQL Concept:
-- MIN()
--
-- Tables Used:
-- Transaction
--
-- Business Purpose:
-- Identify the lowest-value transaction recorded.
-- =====================================================


SELECT min(Amount) AS HighestTransactionAmount
FROM transaction;


-- =====================================================
-- END OF SECTION 1 : BASIC SQL QUERIES
-- =====================================================


-- =====================================================
-- SECTION 2 : JOIN QUERIES
-- =====================================================


-- =====================================================
-- Problem 11
-- Question:
-- Display each member along with their membership product.
--
-- SQL Concept:
-- INNER JOIN
--
-- Tables Used:
-- Member, Membership
--
-- Business Purpose:
-- View each member together with the membership product they have purchased.
-- =====================================================


SELECT m.MemberID,m.Name,ms.Product
FROM member m
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID;



-- =====================================================
-- Problem 12
-- Question:
-- Display bookings along with hotel names.
--
-- SQL Concept:
-- INNER JOIN
--
-- Tables Used:
-- Booking, Hotels
--
-- Business Purpose:
-- Display booking records along with the corresponding hotel names.
-- =====================================================


SELECT b.BookingID,h.HotelName
FROM bookings b
INNER JOIN hotels h
ON b.HotelID=h.HotelID;



-- =====================================================
-- Problem 13
-- Question:
-- Display bookings along with member names.
--
-- SQL Concept:
-- Multiple INNER JOIN
--
-- Tables Used:
-- Member, Membership, Booking
--
-- Business Purpose:
-- Identify which member made each booking.
-- =====================================================


SELECT b.BookingID,m.Name
FROM bookings b
INNER JOIN membership1 ms
ON b.MembershipID=ms.MembershipID
INNER JOIN member m 
ON ms.MemberID=m.MemberID;



-- =====================================================
-- Problem 14
-- Question:
-- Display revenue for each booking.
--
-- SQL Concept:
-- INNER JOIN
--
-- Tables Used:
-- Booking, Transaction
--
-- Business Purpose:
-- Display the revenue generated by each booking.
-- =====================================================


SELECT b.BookingID,t.Amount AS Revenue
FROM bookings b
INNER JOIN transaction t
ON b.BookingID=t.BookingID;


-- =====================================================
-- Problem 15
-- Question:
-- Display member name, product and membership expiry date.
--
-- SQL Concept:
-- INNER JOIN
--
-- Tables Used:
-- Member, Membership
--
-- Business Purpose:
-- Monitor member subscriptions and upcoming membership expirations.
-- =====================================================


SELECT m.Name,ms.Product,ms.ExpiryDate
FROM member m
INNER JOIN membership1 ms
ON m.MemberID = ms.MemberID;


-- =====================================================
-- Problem 16
-- Question:
-- Calculate the booking count for each hotel.
--
-- SQL Concept:
-- INNER JOIN, COUNT(), GROUP BY
--
-- Tables Used:
-- Booking, Hotels
--
-- Business Purpose:
-- Measure booking volume for every hotel.
-- =====================================================


SELECT h.HotelID,h.HotelName,count(b.BookingID) AS TotalBooking
FROM hotels h
INNER JOIN bookings b
ON h.HotelID=b.HotelID
GROUP BY h.HotelID,h.HotelName;


-- =====================================================
-- Problem 17
-- Question:
-- Calculate the booking count for each city.
--
-- SQL Concept:
-- INNER JOIN, COUNT(), GROUP BY
--
-- Tables Used:
-- Booking, Hotels
--
-- Business Purpose:
-- Compare booking demand across different cities.
-- =====================================================

SELECT h.City,count(b.BookingID) AS TotalBooking
FROM hotels h
INNER JOIN bookings b
ON h.HotelID=b.HotelID
GROUP BY h.City;



-- =====================================================
-- Problem 18
-- Question:
-- Calculate the booking count for each product.
--
-- SQL Concept:
-- Multiple INNER JOIN, COUNT(), GROUP BY
--
-- Tables Used:
-- Membership, Booking
--
-- Business Purpose:
-- Identify which membership product generates the highest number of bookings.
-- =====================================================

SELECT ms.Product,count(b.BookingID) AS TotalBooking
FROM membership1 ms
INNER JOIN bookings b
ON ms.MembershipID=b.MembershipID
GROUP BY ms.Product;



-- =====================================================
-- Problem 19
-- Question:
-- Calculate total revenue for each product.
--
-- SQL Concept:
-- Multiple INNER JOIN, SUM(), GROUP BY
--
-- Tables Used:
-- Membership, Booking, Transaction
--
-- Business Purpose:
-- Analyze revenue generated by each membership product.
-- =====================================================


SELECT ms.Product,sum(t.Amount) AS TotalRevenue
FROM membership1 ms
INNER JOIN bookings b
ON ms.MembershipID=b.MembershipID
INNER JOIN transaction t
ON b.BookingID=t.BookingID
GROUP BY ms.Product;


-- =====================================================
-- Problem 20
-- Question:
-- Calculate total revenue for each subsidiary.
--
-- SQL Concept:
-- Multiple INNER JOIN, SUM(), GROUP BY
--
-- Tables Used:
-- Member, Membership, Booking, Transaction
--
-- Business Purpose:
-- Compare revenue contribution of each subsidiary.
-- =====================================================


SELECT m.Subsidiary,sum(t.Amount) AS TotalRevenue
FROM member m
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
INNER JOIN bookings b
ON ms.MembershipID=b.MembershipID
INNER JOIN transaction t
ON b.BookingID=t.BookingID
GROUP BY m.Subsidiary;


-- =====================================================
-- END OF SECTION 2 : JOIN QUERIES
-- =====================================================


-- =====================================================
-- SECTION 3 : AGGREGATION & RANKING QUERIES
-- =====================================================


-- =====================================================
-- Problem 21
-- Question:
-- List the top 10 members by booking count.
--
-- SQL Concept:
-- COUNT(), GROUP BY, ORDER BY, LIMIT
--
-- Tables Used:
-- Member, Membership, Booking
--
-- Business Purpose:
-- Identify the members who have made the highest number of bookings.
-- =====================================================


SELECT m.MemberID,m.Name,count(b.BookingID) AS TotalBookings 
FROM member m
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
INNER JOIN bookings b
ON ms.MembershipID=b.MembershipID
GROUP by m.MemberID,m.Name
ORDER BY TotalBookings DESC
LIMIT 10;



-- =====================================================
-- Problem 22
-- Question:
-- List the top 10 members by revenue.
--
-- SQL Concept:
-- SUM(), GROUP BY, ORDER BY, LIMIT
--
-- Tables Used:
-- Member, Membership, Booking, Transaction
--
-- Business Purpose:
-- Identify the highest revenue-generating members.
-- =====================================================


SELECT m.MemberID,m.Name,sum(t.Amount) as TotalRevenue
FROM member M
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
INNER JOIN bookings b
ON ms.MembershipID=b.MembershipID
INNER JOIN transaction t
ON b.BookingID=t.BookingID
GROUP BY m.MemberID,m.Name
ORDER BY TotalRevenue DESC
LIMIT 10;



-- =====================================================
-- Problem 23
-- Question:
-- List the top 5 hotels by revenue.
--
-- SQL Concept:
-- SUM(), GROUP BY, ORDER BY, LIMIT
--
-- Tables Used:
-- Hotels, Booking, Transaction
--
-- Business Purpose:
-- Identify the hotels generating the highest revenue.
-- =====================================================


SELECT h.HotelID,h.HotelName,SUM(t.Amount) as Revenue 
FROM hotels h
INNER JOIN bookings b
ON h.HotelID=b.HotelID
INNER JOIN transaction t
ON b.BookingID=t.BookingID
GROUP BY h.HotelID,h.HotelName
ORDER BY Revenue 
LIMIT 5;



-- =====================================================
-- Problem 24
-- Question:
-- List the top 5 cities by revenue.
--
-- SQL Concept:
-- SUM(), GROUP BY, ORDER BY, LIMIT
--
-- Tables Used:
-- Hotels, Booking, Transaction
--
-- Business Purpose:
-- Compare revenue generated across different cities.
-- =====================================================


SELECT h.City,SUM(t.Amount) as TotalRevenue
FROM hotels h
INNER JOIN bookings b
ON h.HotelID=b.HotelID
INNER JOIN transaction t
ON b.BookingID=t.BookingID
GROUP BY h.City
ORDER BY TotalRevenue DESC
LIMIT 5;



-- =====================================================
-- Problem 25
-- Question:
-- What is the average transaction amount?
--
-- SQL Concept:
-- AVG()
--
-- Tables Used:
-- Transaction
--
-- Business Purpose:
-- Determine the average value of a transaction.
-- =====================================================


SELECT AVG(Amount) AS AverageTransactionAmount
FROM transaction;


-- =====================================================
-- Problem 26
-- Question:
-- What is the average revenue per booking?
--
-- SQL Concept:
-- AVG(), INNER JOIN
--
-- Tables Used:
-- Booking, Transaction
--
-- Business Purpose:
-- Calculate the average revenue generated from each booking.
-- =====================================================


SELECT
    AVG(t.Amount) AS AverageRevenuePerBooking
FROM bookings b
INNER JOIN transaction t
    ON b.BookingID = t.BookingID;



-- =====================================================
-- Problem 27
-- Question:
-- What is the average number of bookings per member?
--
-- SQL Concept:
-- AVG(), Subquery
--
-- Tables Used:
-- Member, Membership, Booking
--
-- Business Purpose:
-- Measure the average booking activity of members.
-- =====================================================

SSELECT
    AVG(TotalBookings) AS AverageBookingsPerMember
FROM
(
    SELECT
        m.MemberID,
        COUNT(b.BookingID) AS TotalBookings
    FROM Member m
    INNER JOIN Membership1 ms
        ON m.MemberID = ms.MemberID
    INNER JOIN bookings b
        ON ms.MembershipID = b.MembershipID
    GROUP BY m.MemberID
) AS BookingSummary;


-- =====================================================
-- Problem 28
-- Question:
-- Find members who have multiple memberships.
--
-- SQL Concept:
-- GROUP BY, HAVING
--
-- Tables Used:
-- Member, Membership
--
-- Business Purpose:
-- Identify members holding more than one membership.
-- =====================================================


SELECT m.MemberID,m.Name,COUNT(ms.MembershipID) AS TotalMembership
FROM member m 
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
GROUP BY m.MemberID,m.Name
HAVING COUNT(ms.MembershipID) > 1;



-- =====================================================
-- Problem 29
-- Question:
-- Find hotels with more than 100 bookings.
--
-- SQL Concept:
-- GROUP BY, HAVING
--
-- Tables Used:
-- Hotels, Booking
--
-- Business Purpose:
-- Identify hotels with high booking volume.
-- =====================================================


SELECT h.HotelID , h.HotelName , COUNT(b.BookingID) as TotalBooking
FROM hotels h
INNER JOIN bookings b
ON h.HotelID=b.HotelID
GROUP BY h.HotelID , h.HotelName
HAVING COUNT(b.BookingID) > 100;


-- =====================================================
-- Problem 30
-- Question:
-- Find products whose revenue is above the overall average product revenue.
--
-- SQL Concept:
-- Subquery, SUM(), HAVING
--
-- Tables Used:
-- Membership, Booking, Transaction
--
-- Business Purpose:
-- Identify high-performing membership products.
-- =====================================================

SELECT
    ms.Product,
    SUM(t.Amount) AS TotalRevenue
FROM Membership1 ms
INNER JOIN bookings b
    ON ms.MembershipID = b.MembershipID
INNER JOIN transaction t
    ON b.BookingID = t.BookingID
GROUP BY ms.Product
HAVING SUM(t.Amount) >
(
    SELECT AVG(ProductRevenue)
    FROM
    (
        SELECT
            SUM(t2.Amount) AS ProductRevenue
        FROM Membership1 ms2
        INNER JOIN bookings b2
            ON ms2.MembershipID = b2.MembershipID
        INNER JOIN Transaction t2
            ON b2.BookingID = t2.BookingID
        GROUP BY ms2.Product
    ) AS RevenueSummary
);


-- =====================================================
-- END OF SECTION 3 : AGGREGATION & RANKING QUERIES
-- =====================================================


-- =====================================================
-- SECTION 4 : ADVANCED SQL QUERIES
-- =====================================================


-- =====================================================
-- Problem 31
-- Question:
-- Find members without any membership.
--
-- SQL Concept:
-- LEFT JOIN, IS NULL
--
-- Tables Used:
-- Member, Membership
--
-- Business Purpose:
-- Identify registered members who have not purchased any membership.
-- =====================================================


SELECT m.MemberID,m.Name
FROM member m
LEFT JOIN membership1 ms
ON m.MemberID=ms.MemberID
WHERE ms.MembershipID IS NULL;



-- =====================================================
-- Problem 32
-- Question:
-- Find members without any bookings.
--
-- SQL Concept:
-- LEFT JOIN, IS NULL
--
-- Tables Used:
-- Member, Membership, Booking
--
-- Business Purpose:
-- Identify members who have memberships but have never made a booking.
-- =====================================================


SELECT m.MemberID,m.Name
FROM member m
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
LEFT JOIN bookings b
ON ms.MembershipID=b.MembershipID
WHERE b.BookingID IS NULL;


-- =====================================================
-- Problem 33
-- Question:
-- Find memberships without any entitlements.
--
-- SQL Concept:
-- LEFT JOIN, IS NULL
--
-- Tables Used:
-- Membership, Entitlements
--
-- Business Purpose:
-- Identify memberships that do not have any assigned benefits.
-- =====================================================


SELECT ms.MembershipID
FROM membership1 ms
LEFT JOIN entitlements e
ON ms.MembershipID=e.MembershipID
WHERE e.EntitlementID IS NULL;


-- =====================================================
-- Problem 34
-- Question:
-- Find hotels without any bookings.
--
-- SQL Concept:
-- LEFT JOIN, IS NULL
--
-- Tables Used:
-- Hotels, Booking
--
-- Business Purpose:
-- Identify hotels that have never received a booking.
-- =====================================================


SELECT h.HotelID,h.HotelName
FROM hotels h
LEFT JOIN bookings b
ON h.HotelID=b.HotelID
WHERE b.BookingID IS NULL;


-- =====================================================
-- Problem 35
-- Question:
-- Find members who have entitlements but no bookings.
--
-- SQL Concept:
-- Multiple JOINs, LEFT JOIN, IS NULL
--
-- Tables Used:
-- Member, Membership, Entitlements, Booking
--
-- Business Purpose:
-- Identify members who have benefits but have not used them.
-- =====================================================


SELECT m.MemberID,m.Name
FROM member m
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
INNER JOIN entitlements e
ON ms.MembershipID=e.MembershipID
LEFT JOIN bookings b
ON ms.MembershipID=b.MembershipID
WHERE b.BookingID IS NULL;


-- =====================================================
-- Problem 36
-- Question:
-- Find members who have bookings but no entitlements.
--
-- SQL Concept:
-- Multiple JOINs, LEFT JOIN, IS NULL
--
-- Tables Used:
-- Member, Membership, Booking, Entitlements
--
-- Business Purpose:
-- Identify members actively booking hotels without membership benefits.
-- =====================================================


SELECT m.MemberID,m.Name
FROM member m
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
INNER JOIN bookings b
ON ms.MembershipID=b.MembershipID
LEFT JOIN entitlements e
ON ms.MembershipID=e.MembershipID
WHERE e.entitlementID IS NULL;



-- =====================================================
-- Problem 37
-- Question:
-- Find the top 3 members by revenue within each subsidiary.
--
-- SQL Concept:
-- Window Function (RANK())
--
-- Tables Used:
-- Member, Membership, Booking, Transaction
--
-- Business Purpose:
-- Identify the highest revenue-generating members in each subsidiary.
-- =====================================================


SELECT *FROM(
SELECT m.Subsidiary,m.MemberID,m.Name,SUM(t.Amount) as TotalRevenue ,
RANK () OVER
(
partition by m.Subsidiary
ORDER BY SUM(t.Amount) DESC
)AS RevenueRank
FROM member m
INNER JOIN membership1 ms
ON m.MemberID=ms.MemberID
INNER JOIN bookings b
ON ms.MembershipID=b.MembershipID
INNER JOIN transaction t
ON b.BookingID=t.BookingID
GROUP BY m.Subsidiary, m.MemberID,m.Name
ORDER BY RevenueRank DESC
)RankedMember
WHERE RevenueRank <=3;



-- =====================================================
-- Problem 38
-- Question:
-- Calculate running revenue by booking date.
--
-- SQL Concept:
-- SUM() OVER()
--
-- Tables Used:
-- Booking, Transaction
--
-- Business Purpose:
-- Monitor cumulative revenue over time.
-- =====================================================


SELECT b.BookingDate,t.Amount,SUM(t.Amount) OVER (
ORDER BY b.BookingDate 
) AS RunningRevenue
FROM bookings b
INNER JOIN transaction t
ON b.BookingID=t.BookingID;



-- =====================================================
-- Problem 39
-- Question:
-- Calculate cumulative monthly revenue.
--
-- SQL Concept:
-- Window Function, SUM() OVER()
--
-- Tables Used:
-- Booking, Transaction
--
-- Business Purpose:
-- Analyze month-by-month cumulative revenue growth.
-- =====================================================

SELECT
    DATE_FORMAT(b.BookingDate,'%Y-%m') AS Month,
    SUM(t.Amount) AS MonthlyRevenue,
    SUM(SUM(t.Amount)) OVER
    (
        ORDER BY DATE_FORMAT(b.BookingDate,'%Y-%m')
    ) AS CumulativeRevenue
FROM bookings b
INNER JOIN transaction t
    ON b.BookingID = t.BookingID
GROUP BY DATE_FORMAT(b.BookingDate,'%Y-%m');



-- =====================================================
-- Problem 40
-- Question:
-- Calculate the renewal rate by product.
--
-- SQL Concept:
-- JOIN, Aggregate Functions
--
-- Tables Used:
-- Membership, Renewals
--
-- Business Purpose:
-- Measure the percentage of memberships renewed for each product.
-- =====================================================

SELECT
    ms.Product,
    COUNT(r.RenewalID) AS RenewedMemberships,
    COUNT(ms.MembershipID) AS TotalMemberships,
    ROUND(
        COUNT(r.RenewalID) * 100.0 /
        COUNT(ms.MembershipID),
        2
    ) AS RenewalRate
FROM membership1 ms
LEFT JOIN renewals r
    ON ms.MembershipID = r.MembershipID
GROUP BY ms.Product;