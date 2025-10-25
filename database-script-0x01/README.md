# 🏗️ Design Database Schema (DDL)

## 📘 Objective

The goal of this task is to **define the database schema** for the ALX Airbnb project using **SQL Data Definition Language (DDL)**.
The schema represents all entities, their attributes, relationships, and constraints according to the provided database specification.

---

## 📋 Overview

The database schema captures the core structure of the Airbnb-like system.
It defines **tables**, **columns**, **data types**, **primary keys**, **foreign keys**, **constraints**, and **indexes** to ensure efficiency, integrity, and consistency.

---

## 🧱 Database Entities

Key entities in the schema include:

* **User** – Represents registered users (hosts and guests).
* **Property** – Details of listed properties (apartments, homes, etc.).
* **Booking** – Tracks reservations made by users.
* **Payment** – Manages payment records for bookings.
* **Review** – Stores reviews and ratings of properties by guests.

---

## ⚙️ SQL Schema Definition

Each entity is defined using `CREATE TABLE` statements with appropriate **data types**, **constraints**, and **relationships**.
Below are examples of common SQL elements used:

```sql
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Property (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    price_per_night DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
```

---

## 🔒 Constraints

Constraints ensure **data validity** and **referential integrity**:

| Constraint Type | Purpose                                        |
| --------------- | ---------------------------------------------- |
| **PRIMARY KEY** | Uniquely identifies each record.               |
| **FOREIGN KEY** | Maintains relationship between tables.         |
| **UNIQUE**      | Prevents duplicate values (e.g., email).       |
| **NOT NULL**    | Ensures required fields are always filled.     |
| **DEFAULT**     | Provides automatic values for certain columns. |

---

## ⚡ Indexing

Indexes improve query speed and overall database performance.

### **Primary Keys**

* Automatically indexed by MySQL.

### **Additional Indexes**

| Table      | Column                      | Purpose                                |
| ---------- | --------------------------- | -------------------------------------- |
| `User`     | `email`                     | Fast user lookup and login validation. |
| `Property` | `property_id`               | Quick access and joins.                |
| `Booking`  | `property_id`, `booking_id` | Efficient queries and updates.         |
| `Payment`  | `booking_id`                | Quick retrieval of payment details.    |

**SQL Example:**

```sql
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_id ON Property(property_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_id ON Booking(booking_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

---

## ✅ Deliverables

* **SQL file:** `schema.sql` (contains all CREATE TABLE statements)
* **README file:** `README.md` (this documentation)

---

## 🧩 Directory Structure

```
alx-airbnb-database/
│
├── ERD/
│   └── erd_diagram.png
│
├── schema.sql
├── normalization.md
└── README.md
```

---

## 🧠 Author

**Busari Abdulhakeem Tunde (Alphakeem Adroit)**
📧 [Contact](mailto:alphakeem12@gmail.com)
💻 *ALX Software Engineering Student | Backend Developer | Frontend Developer

---