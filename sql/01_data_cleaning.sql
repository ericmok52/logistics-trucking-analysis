
-- This file contains basic data checks and cleaning steps
-- to ensure the dataset is consistent and usable for analysis.

-- 1. Check for NULL values in key columns
SELECT *
FROM drivers
WHERE driver_id IS NULL;

SELECT *
FROM customers
WHERE customer_id IS NULL;

SELECT *
FROM loads
WHERE revenue IS NULL;

-- 2. Check for missing or invalid dates
SELECT *
FROM drivers
WHERE hire_date IS NULL;

SELECT *
FROM drivers
WHERE termination_date < hire_date;

-- 3. Handle NULL termination dates (active drivers)
-- Replace NULL with current date for analysis purposes
SELECT
driver_id,
hire_date,
COALESCE(termination_date, CURRENT_DATE) AS adjusted_termination_date
FROM drivers;

-- 4. Check for duplicate records
SELECT
customer_id,
COUNT(*) AS count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 5. Check for negative or unrealistic values
SELECT *
FROM loads
WHERE revenue < 0;

SELECT *
FROM fuel_purchases
WHERE cost < 0;

