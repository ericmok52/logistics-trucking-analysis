-- Which driver generates the most revenue?
SELECT
d.driver_id,
SUM(l.revenue) AS total_revenue
FROM drivers d
JOIN trips t
ON d.driver_id = t.driver_id
JOIN loads l
ON t.load_id = l.load_id
GROUP BY d.driver_id
ORDER BY total_revenue DESC;

--How many trips has each driver completed?
SELECT
d.driver_id,
COUNT(t.trip_id) AS total_trips
FROM drivers d
JOIN trips t
ON d.driver_id = t.driver_id
GROUP BY d.driver_id
ORDER BY total_trips DESC;

--low counts can indicate inefficiencies
