# 🏡 ALX Airbnb Database Project

## 📘 Overview

The **ALX Airbnb Database Project** is a structured database design and implementation of an Airbnb-like system.
It follows the software engineering best practices taught in the **ALX Backend Specialization**, focusing on database normalization, schema design, and data seeding using **MySQL**.

This project models real-world Airbnb operations — including **users**, **properties**, **bookings**, **payments**, **reviews**, and **messaging** — ensuring data integrity, efficiency, and scalability.

---

## 🧩 Project Structure

```
alx-airbnb-database/
│
├── ERD/
│   ├── requirements.md         # ER Diagram definition and entity relationships
│   └── erd_diagram.png         # Visual representation of the database model
│
├── database-script-0x02/
│   ├── seed.sql                # SQL script for inserting sample data
│   └── README.md               # Documentation for database seeding
│
├── schema.sql                  # MySQL DDL script (CREATE TABLE statements)
├── normalization.md            # Explanation of normalization steps to achieve 3NF
├── README.md                   # Main repository documentation (this file)
```

---

## 🎯 Objectives

1. **Define entities and relationships** using an Entity-Relationship Diagram (ERD).
2. **Normalize** the database design up to the **Third Normal Form (3NF)**.
3. **Implement the schema** using MySQL DDL (`CREATE TABLE`, constraints, indexes).
4. **Seed the database** with realistic sample data for testing.

---

## 🧱 Core Entities

| Entity       | Description                                   |
| ------------ | --------------------------------------------- |
| **User**     | Represents guests, hosts, and administrators. |
| **Property** | Contains listings posted by hosts.            |
| **Booking**  | Stores reservations made by guests.           |
| **Payment**  | Tracks payments for each booking.             |
| **Review**   | Contains user feedback and ratings.           |
| **Message**  | Manages communication between users.          |

---

## 🔒 Constraints & Relationships

| Constraint      | Purpose                                                        |
| --------------- | -------------------------------------------------------------- |
| **PRIMARY KEY** | Uniquely identifies each record.                               |
| **FOREIGN KEY** | Links entities and ensures referential integrity.              |
| **UNIQUE**      | Prevents duplicate data (e.g., emails).                        |
| **NOT NULL**    | Enforces required fields.                                      |
| **CHECK**       | Validates specific value ranges (e.g., ratings 1–5).           |
| **ENUM**        | Restricts fields to predefined values (e.g., roles, statuses). |

---

## ⚡ Indexing Strategy

Indexes are used to improve query performance and search efficiency.

| Table      | Column                      | Purpose                                             |
| ---------- | --------------------------- | --------------------------------------------------- |
| `User`     | `email`                     | Fast lookup for authentication and user management. |
| `Property` | `property_id`               | Quick access and joins.                             |
| `Booking`  | `property_id`, `booking_id` | Efficient retrieval of reservations.                |
| `Payment`  | `booking_id`                | Quick payment lookups.                              |

> **Note:** Primary keys are automatically indexed by MySQL.

---

## 💾 Technologies Used

* **Database Engine:** MySQL
* **Modeling Tool:** Draw.io (for ERD creation)
* **Language:** SQL
* **Documentation:** Markdown (`.md`)

---

## 🧠 Database Design Process

### 1️⃣ Entity Identification

Defined major entities: `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`.

### 2️⃣ Relationship Definition

Established relationships such as:

* One **User (Host)** → Many **Properties**
* One **User (Guest)** → Many **Bookings**
* One **Booking** → One **Payment**
* One **Property** → Many **Reviews**
* One **User** → Many **Messages**

### 3️⃣ Normalization

Ensured database meets **Third Normal Form (3NF)** by:

* Eliminating redundant data.
* Ensuring each attribute depends only on the key.
* Maintaining atomic column values.

### 4️⃣ Implementation (DDL)

Defined tables, constraints, and indexes in `schema.sql`.

### 5️⃣ Seeding

Populated tables with realistic sample data using `seed.sql`.

---

## ⚙️ How to Run the Project

1. **Create the database**

   ```sql
   CREATE DATABASE airbnb_db;
   USE airbnb_db;
   ```

2. **Run the schema script**

   ```bash
   SOURCE schema.sql;
   ```

3. **Seed the database**

   ```bash
   SOURCE database-script-0x02/seed.sql;
   ```

4. **Verify data**

   ```sql
   SELECT * FROM User;
   SELECT * FROM Property;
   SELECT * FROM Booking;
   ```

---

## ✅ Deliverables

* `requirements.md` → ERD entities and relationships
* `normalization.md` → Normalization explanation (up to 3NF)
* `schema.sql` → Database creation script
* `seed.sql` → Data seeding script
* `README.md` → Project documentation

---

## 👨‍💻 Author

**Busari Abdulhakeem Tunde (Alphakeem Adroit)**
📧 [Contact](mailto:alphakeem12@gmail.com)
💼 *ALX Software Engineering Student | Backend Developer | Frontend Developer*

---

## 🏁 Final Notes

This project serves as a foundation for future **Airbnb-like backend systems** —
providing a scalable, normalized, and well-structured database ready for integration with application logic (APIs, authentication, etc.).

---