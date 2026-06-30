# 🗄️ Database Schema

## Overview

The Hotel Membership & Booking database consists of **7 related tables** that store information about members, memberships, bookings, hotels, transactions, entitlements, and renewals.

---

## 1. member

| Column | Data Type | Description |
|---------|-----------|-------------|
| MemberID | INT | Primary Key |
| Name | VARCHAR | Member name |
| JoinDate | DATE | Member registration date |
| Subsidiary | VARCHAR | Member's subsidiary |

---

## 2. membership1

| Column | Data Type | Description |
|---------|-----------|-------------|
| MembershipID | INT | Primary Key |
| MemberID | INT | Foreign Key → Member.MemberID |
| Product | VARCHAR | Membership product |
| ExpiryDate | DATE | Membership expiry date |
| Status | VARCHAR | Active / Expired / Cancelled |

---

## 3. bookings

| Column | Data Type | Description |
|---------|-----------|-------------|
| BookingID | INT | Primary Key |
| MembershipID | INT | Foreign Key → Membership.MembershipID |
| HotelID | INT | Foreign Key → Hotels.HotelID |
| BookingDate | DATE | Booking creation date |
| CheckInDate | DATE | Hotel check-in date |

---

## 4. hotels

| Column | Data Type | Description |
|---------|-----------|-------------|
| HotelID | INT | Primary Key |
| HotelName | VARCHAR | Hotel name |
| City | VARCHAR | Hotel city |

---

## 5. transaction

| Column | Data Type | Description |
|---------|-----------|-------------|
| TransactionID | INT | Primary Key |
| BookingID | INT | Foreign Key → Booking.BookingID |
| Amount | DECIMAL | Transaction amount |
| PaymentMethod | VARCHAR | Payment method |

---

## 6. entitlements

| Column | Data Type | Description |
|---------|-----------|-------------|
| EntitlementID | INT | Primary Key |
| MembershipID | INT | Foreign Key → Membership.MembershipID |
| Benefit | VARCHAR | Membership benefit |

---

## 7. renewals

| Column | Data Type | Description |
|---------|-----------|-------------|
| RenewalID | INT | Primary Key |
| MembershipID | INT | Foreign Key → Membership.MembershipID |
| RenewalDate | DATE | Renewal date |

---

# Database Relationships

- member → membership1 (One-to-Many)
- membership1 → bookings (One-to-Many)
- hotels → bookings (One-to-Many)
- bookings → transaction (One-to-One or One-to-Many depending on business rules)
- membership1 → entitlements (One-to-Many)
- membership1 → renewals (One-to-Many)