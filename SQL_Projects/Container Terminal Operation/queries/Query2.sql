-- 1. Insert a Ship into the `ship` table:
INSERT INTO ship (ship_id, name, flag, length, width) 
VALUES (200000001, 'Titanic', 'USA', 269.0, 28.0);

-- 2. Retrieve all ships that are greater than a specific length:
SELECT * 
FROM ship
WHERE length > 250.0;

-- 3. Find the schedule of a ship (by ship_id) for a particular time range:
SELECT s.ship, s.berth, s.arrival, s.departure
FROM schedule s
WHERE s.ship = 200000001
  AND s.arrival >= '2025-01-01 00:00:00'
  AND s.departure <= '2025-12-31 23:59:59';

-- 4. Insert a Transfer record into the `transfer` table:
INSERT INTO transfer (container, from_bay, from_row, from_tier, to_bay, to_row, to_tier, start, finish)
VALUES ('C123456789', 1, 1, 1, 2, 2, 2, '2025-03-01 08:00:00', '2025-03-01 10:00:00');

-- 5. Find the load operations for a particular ship and container:
SELECT l.ship, l.container, l.start, l.finish, l.from_bay, l.from_row, l.from_tier
FROM load l
WHERE l.ship = 200000001
  AND l.container = 'C123456789';

-- 6. Find the total number of containers currently in the yard (from_bay, from_row, from_tier).
SELECT COUNT(t.container) AS total_containers
FROM transfer t
WHERE t.finish IS NULL;  -- Assuming that finish is NULL if the transfer has not been completed

-- 7. Retrieve the schedule of all ships that have overlapping times (i.e., a ship arrives before another ship departs):
SELECT s1.ship, s1.arrival, s1.departure, s2.ship AS overlapping_ship, s2.arrival AS overlapping_arrival, s2.departure AS overlapping_departure
FROM schedule s1
JOIN schedule s2 ON s1.ship != s2.ship
WHERE s1.arrival < s2.departure
  AND s1.departure > s2.arrival;

-- 8. Find the number of containers loaded or unloaded by each ship within a specific date range:
SELECT l.ship, COUNT(l.container) AS total_containers
FROM load l
WHERE l.start >= '2025-01-01 00:00:00' AND l.finish <= '2025-12-31 23:59:59'
GROUP BY l.ship;

-- 9. Find the ships that are scheduled to berth at a specific berth (e.g., berth 1) and are still in the process of being loaded/unloaded:
SELECT s.ship, s.arrival, s.departure, l.container, l.start, l.finish
FROM schedule s
JOIN load l ON s.ship = l.ship
WHERE s.berth = 1
  AND l.finish IS NULL  -- Assuming that finish is NULL if the loading is not yet completed
  AND s.arrival <= NOW()
  AND s.departure >= NOW();

-- 10. Retrieve the ships that have docked and departed at least once, showing the container IDs loaded and unloaded during their scheduled time at berth:
SELECT DISTINCT s.ship, s.arrival, s.departure, l.container, l.direction
FROM schedule s
LEFT JOIN load l ON s.ship = l.ship
WHERE l.container IS NOT NULL
  AND l.start >= s.arrival
  AND l.finish <= s.departure;
