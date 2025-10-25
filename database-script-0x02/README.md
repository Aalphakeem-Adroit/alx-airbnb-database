# 🌱 Database Seeding — Airbnb Database

## 📘 Objective

The goal of this task is to **populate the Airbnb database** with **sample data** that reflects real-world usage.
This helps verify relationships, constraints, and functionality of the schema defined in the previous task.

---

## 📂 Overview

The **seed.sql** file inserts sample records into all main entities in the Airbnb database:

* `User`
* `Property`
* `Booking`
* `Payment`
* `Review`
* `Message`

The inserted data simulates a realistic environment where hosts list properties, guests make bookings, send messages, leave reviews, and process payments.

---

## 🧱 Tables Seeded

| Table        | Description                                   |
| ------------ | --------------------------------------------- |
| **User**     | Contains sample users (hosts, guests, admin). |
| **Property** | Holds property listings created by hosts.     |
| **Booking**  | Represents reservations made by guests.       |
| **Payment**  | Tracks payments for bookings.                 |
| **Review**   | Records guest reviews for properties.         |
| **Message**  | Stores messages exchanged between users.      |

---

## 💾 Sample Inserts

Each table is populated using standard **MySQL** `INSERT` statements.
UUIDs are generated dynamically using MySQL’s built-in `UUID()` function.

```sql
-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, role)
VALUES
(UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', 'host'),
(UUID(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', 'guest'),
(UUID(), 'Admin', 'User', 'admin@airbnb.com', 'hashed_password_3', 'admin');

-- Insert sample property
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
(UUID(), (SELECT user_id FROM User WHERE email='john.doe@example.com'),
'Seaside Apartment', 'Beautiful apartment with ocean view.', 'Lagos, Nigeria', 150.00);
```

> 🧠 Note: Subqueries are used to fetch the correct foreign key values dynamically.

---

## ⚙️ How to Use

1. **Ensure your schema is already created**

   * Run your `schema.sql` file first to create all tables.

2. **Load the seed data**

   * Open MySQL terminal or MySQL Workbench.
   * Run the following command:

     ```bash
     SOURCE path/to/seed.sql;
     ```

3. **Verify the data**

   ```sql
   SELECT * FROM User;
   SELECT * FROM Property;
   SELECT * FROM Booking;
   ```

---

## ⚡ Database Compatibility

This seeding file was written for **MySQL**.
It uses MySQL-supported features such as:

* `UUID()` for generating unique IDs
* `ENUM` data type
* `DEFAULT CURRENT_TIMESTAMP`

> For PostgreSQL users, equivalent functions (e.g. `gen_random_uuid()`) would need to be substituted.

---

## 🧩 Directory Structure

```
alx-airbnb-database/
│
├── database-script-0x02/
│   ├── seed.sql
│   └── README.md
│
├── schema.sql
├── normalization.md
└── ERD/
    └── erd_diagram.png
```

---

## 📊 Example Result Summary

| Table        | Example Data                                            |
| ------------ | ------------------------------------------------------- |
| **User**     | John Doe (Host), Jane Smith (Guest)                     |
| **Property** | Seaside Apartment – ₦150/night                          |
| **Booking**  | Jane Smith booked Seaside Apartment                     |
| **Payment**  | Stripe payment – ₦750                                   |
| **Review**   | “Amazing place! Clean and relaxing.”                    |
| **Message**  | Jane → John: “Hello, I’m interested in your apartment.” |

---

## 🧠 Author

**Busari Abdulhakeem Tunde (Alphakeem Adroit)**
📧 [Contact](mailto:alphakeem12@gmail.com)
💻 *ALX Software Engineering Student | Backend Developer | Frontend Developer*
