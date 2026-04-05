--What is total fuel cost per truck?
SELECT
  truck_id,
  SUM(cost) AS total_fuel_cost
FROM fuel_purchases
GROUP BY truck_id
ORDER BY total_fuel_cost DESC;

--Which trucks have the highest maintenance cost?
SELECT
truck_id,
SUM(cost) AS total_maintenance_cost
FROM maintenance_records
GROUP BY truck_id
ORDER BY total_maintenance_cost DESC;

--What is the on-time delivery rate? (Calcuates the ontime percetange of deliveries)
SELECT
(SUM(CASE WHEN on_time_status = 'On Time' THEN 1 ELSE 0 END) * 100.0)
/ COUNT(*) AS on_time_delivery_rate
FROM delivery_events;
-- A key KPI for operational performance and customer satisfaction.
