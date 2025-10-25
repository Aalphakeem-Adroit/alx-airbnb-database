# **Database Normalization – AirBnB Clone**

## **Objective**

The goal of normalization is to organize the database structure to **minimize redundancy**, **ensure data integrity**, and **improve efficiency**.
This document explains the normalization process applied to the **AirBnB database schema** to achieve **Third Normal Form (3NF).**

---

## **1. Understanding Normalization**

Normalization is the process of dividing data into related tables to eliminate redundancy and dependency issues.
The main normal forms are:

| Normal Form                  | Description                                                                             |
| ---------------------------- | --------------------------------------------------------------------------------------- |
| **1NF (First Normal Form)**  | Ensures atomic (indivisible) values and unique records.                                 |
| **2NF (Second Normal Form)** | Removes partial dependencies; each non-key attribute depends on the entire primary key. |
| **3NF (Third Normal Form)**  | Removes transitive dependencies; non-key attributes depend only on the primary key.     |

---

## **2. Step-by-Step Normalization Process**

### **Step 1 – First Normal Form (1NF)**

**Rules Applied:**

* Each column holds atomic values (no repeating groups or arrays).
* Each record is unique and identifiable by a **primary key**.

**Implementation:**

* Each entity (User, Property, Booking, Payment, Review, Message) has a **primary key**.
* All attributes contain **atomic values** — for example:

  * `User` stores single `email`, `phone_number` values.
  * `Property` stores single `location` and `pricepernight` per record.

✅ **Result:** Database is in **1NF**.

---

### **Step 2 – Second Normal Form (2NF)**

**Rules Applied:**

* Must first satisfy **1NF**.
* All non-key attributes must depend on the **whole primary key**, not part of it.

**Implementation:**

* Each table has a **single-column primary key (UUID)**, so partial dependency cannot occur.
* Example:

  * In `Booking`, all attributes (`start_date`, `end_date`, `status`, etc.) depend fully on `booking_id`.
  * In `Property`, attributes depend on `property_id`.

✅ **Result:** Database is in **2NF**.

---

### **Step 3 – Third Normal Form (3NF)**

**Rules Applied:**

* Must first satisfy **2NF**.
* No transitive dependency — non-key attributes should not depend on other non-key attributes.

**Implementation:**

* Each non-key attribute depends directly on the table’s **primary key**:

  * In `User`, `first_name`, `last_name`, `email`, etc. depend only on `user_id`.
  * In `Property`, `name`, `location`, and `pricepernight` depend only on `property_id`.
  * In `Booking`, `total_price` depends on the `booking_id`, not on `property_id` or `user_id`.
  * In `Payment`, `amount` depends on `payment_id`, and not indirectly through `booking_id`.

✅ **Result:** Database design satisfies **3NF**.

---

## **3. Summary of 3NF Compliance**

| Table        | Primary Key | Dependencies                     | Normal Form |
| ------------ | ----------- | -------------------------------- | ----------- |
| **User**     | user_id     | All fields depend on user_id     | 3NF         |
| **Property** | property_id | All fields depend on property_id | 3NF         |
| **Booking**  | booking_id  | All fields depend on booking_id  | 3NF         |
| **Payment**  | payment_id  | All fields depend on payment_id  | 3NF         |
| **Review**   | review_id   | All fields depend on review_id   | 3NF         |
| **Message**  | message_id  | All fields depend on message_id  | 3NF         |

---

## **4. Justification**

* No multi-valued attributes or repeating groups (**1NF satisfied**).
* No partial dependencies due to single-column primary keys (**2NF satisfied**).
* No transitive dependencies; attributes depend only on primary keys (**3NF satisfied**).
* The schema ensures **data consistency**, **minimal redundancy**, and **optimized queries** for relationships.

---

## **5. Conclusion**

After applying normalization principles, the **AirBnB database** is fully normalized up to **Third Normal Form (3NF)**.
This guarantees efficient data management, avoids anomalies during **insert**, **update**, or **delete** operations, and supports scalable relational integrity.

---
