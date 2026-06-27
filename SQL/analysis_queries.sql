-- sql
-- =====================================================
-- Hotel Membership & Booking Analysis
-- SQL Practice Problems
-- Author: Khushi
-- Database: Hotel Membership Database
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
