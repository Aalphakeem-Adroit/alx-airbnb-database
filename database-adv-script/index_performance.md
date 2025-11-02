## 🧩 **1. Objective Recap**

I’ll be creating indexes on columns that are:

* Frequently used in `WHERE`, `JOIN`, or `ORDER BY` clauses.
* Often searched or filtered.
* Used as foreign keys for relationships.

My schema involves **User**, **Property**, and **Booking** tables — which are the most queried.

---

## ⚡ **2. Identify High-Usage Columns**

<!-- Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses). -->

| Table        | Column        | Reason for Index                          |
| ------------ | ------------- | ----------------------------------------- |
| **User**     | `email`       | Frequently used for login & lookups       |
| **Property** | `property_id` | Used in JOINs with Booking, Review        |
| **Booking**  | `booking_id`  | Used in JOINs with Payment                |
| **Booking**  | `user_id`     | Used to fetch bookings by user            |
| **Property** | `host_id`     | Used to retrieve all properties by a host |

---

## 🧠 **3. SQL Commands to Create Indexes**

<!-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql -->

```sql
-- ==========================================================
-- DATABASE INDEX OPTIMIZATION SCRIPT
-- File: database_index.sql
-- Project: alx-airbnb-database
-- ==========================================================

-- 1. Index on User email (for faster login & lookups)
CREATE INDEX idx_user_email ON User (email);

-- 2. Index on Property ID (for quick joins)
CREATE INDEX idx_property_id ON Property (property_id);

-- 3. Index on Property host_id (for quick host property retrieval)
CREATE INDEX idx_property_host_id ON Property (host_id);

-- 4. Index on Booking ID (for joins with Payment)
CREATE INDEX idx_booking_id ON Booking (booking_id);

-- 5. Index on Booking user_id (for queries retrieving a user’s bookings)
CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- 6. Optional: Index on Booking property_id (useful for property-based searches)
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- ==========================================================
-- CHECKING PERFORMANCE IMPROVEMENT
-- ==========================================================
-- Before creating indexes, run:
-- EXPLAIN SELECT * FROM Booking WHERE user_id = 'some_user_id';
-- After creating indexes, run the same command again and observe reduced query cost/time.
```

---

## ⚙️ **4. Performance Testing (Using EXPLAIN or ANALYZE)**

<!-- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE. -->

### ✅ Before Index

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = '123';
```

* Output should show **full table scan** — MySQL has to read every row.

### ✅ After Index

```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = '123';
```

* Output now shows **index usage** (`idx_booking_user_id`).
* Query cost drops drastically — faster lookup.

---

## 📘 **Note**

Indexes don’t change data; they **speed up retrieval** at the cost of:

* Slightly slower `INSERT` or `UPDATE` operations.
* Additional disk space for index storage.

But for a read-heavy system like **Airbnb**, they’re essential for scalability.
