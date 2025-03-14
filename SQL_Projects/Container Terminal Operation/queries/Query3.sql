-- Query 1: Combine load, unload, and transfer actions for a specific container
SELECT 
    NULL AS from_ship, CONCAT('(', bay, ', ', row, ', ', tier, ')') AS from_terminal,
    ship AS to_ship, NULL AS to_terminal, start, finish, 'load' AS type
FROM load WHERE container = 'TOIQ6183701'

UNION

SELECT 
    ship AS from_ship, NULL AS from_terminal, NULL AS to_ship,
    CONCAT('(', bay, ', ', row, ', ', tier, ')') AS to_terminal, start, finish, 'unload' AS type
FROM unload WHERE container = 'TOIQ6183701'

UNION

SELECT 
    NULL AS from_ship, CONCAT('(', from_bay, ', ', from_row, ', ', from_tier, ')') AS from_terminal,
    NULL AS to_ship, CONCAT('(', to_bay, ', ', to_row, ', ', to_tier, ')') AS to_terminal, start, finish, 'transfer' AS type
FROM transfer WHERE container = 'TOIQ6183701'
ORDER BY start;

-- Query 2: Combine load, unload, and transfer actions on a specific date
SELECT container, from_ship, from_yard, to_ship, to_yard, start, type
FROM (
    SELECT container, NULL AS from_ship, CONCAT('(', bay, ', ', row, ', ', tier, ')') AS from_yard, 
           ship AS to_ship, NULL AS to_yard, start, 'load' AS type
    FROM load

    UNION

    SELECT container, ship AS from_ship, NULL AS from_yard, NULL AS to_ship,
           CONCAT('(', bay, ', ', row, ', ', tier, ')') AS to_yard, start, 'unload' AS type
    FROM unload

    UNION

    SELECT container, NULL AS from_ship, CONCAT('(', from_bay, ', ', from_row, ', ', from_tier, ')') AS from_yard,
           NULL AS to_ship, CONCAT('(', to_bay, ', ', to_row, ', ', to_tier, ')') AS to_yard, start, 'transfer' AS type
    FROM transfer
) AS combined_actions
WHERE DATE(start) = '2024-02-01'
ORDER BY start;
