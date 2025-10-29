## 📘 Advanced SQL Joins – Airbnb Database Project

### 📂 Directory

`database-adv-script/`

### 📄 File

`joins_queries.sql`
`README.md`

---

### 🧩 **Objective**

This script demonstrates the use of **SQL JOIN operations** on the **Airbnb database schema**, showcasing how to retrieve related data across multiple tables such as `User`, `Property`, `Booking`, and `Review`.

It is designed to illustrate the differences between **INNER JOIN**, **LEFT JOIN**, and **FULL OUTER JOIN**, and how they can be applied to real-world data relationships.

---

### 🏗️ **Tables Used**

* **User** – contains user details (guests, hosts, admins)
* **Property** – holds information about listed properties
* **Booking** – links users to properties through their reservations
* **Review** – stores feedback given by users on properties

---

### 🔍 **Queries Included**

#### 1️⃣ **INNER JOIN – Users and Their Bookings**

Retrieves all bookings and the respective users who made those bookings.

```sql
SELECT 
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    CONCAT(User.first_name, ' ', User.last_name) AS full_name,
    User.email
FROM 
    Booking
INNER JOIN 
    User
ON 
    Booking.user_id = User.user_id;
```

**Purpose:**
Displays only users who have made bookings (matched records in both tables).

---

#### 2️⃣ **LEFT JOIN – Properties and Their Reviews**

Retrieves all properties along with their reviews, including properties with no reviews.

```sql
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.created_at
FROM 
    Property
LEFT JOIN 
    Review
ON 
    Property.property_id = Review.property_id;
```

**Purpose:**
Shows every property and its reviews if available.
Unreviewed properties will still appear with `NULL` values for review fields.

---

#### 3️⃣ **FULL OUTER JOIN – Users and Bookings**

Retrieves all users and all bookings, even if a user has no booking or a booking isn’t linked to a user.

```sql
SELECT
    User.user_id,
    CONCAT(User.first_name, ' ', User.last_name) AS full_name,
    User.email,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status
FROM
    User
FULL OUTER JOIN
    Booking
ON
    User.user_id = Booking.user_id;
```

**Purpose:**
Displays every record from both tables — users without bookings and bookings without users.

> ⚠️ **Note (for MySQL users):**
> MySQL doesn’t natively support `FULL OUTER JOIN`.
> Use a `UNION` of `LEFT JOIN` and `RIGHT JOIN` queries to simulate the same result.

---

### 🧠 **Key Learnings**

* Understanding how **JOINs** link multiple tables logically.
* Differentiating between **INNER**, **LEFT**, and **FULL OUTER JOINs**.
* Applying JOINs to reflect **real Airbnb use cases**, such as users without bookings or unreviewed properties.
* Handling `NULL` values in join operations effectively.

---

### 🧾 **Author**

**Busari Abdulhakeem Tunde (Alphakeem Adroit)**
📘 *ALX Software Engineering Program*
💻 *Database Management & Advanced SQL Practice*
