-- INSERT INTO ship (ship_id, name, flag, length, width) 
-- VALUES (758684911, 'Garuda Kencana', 'Indonesia', 543.14, 61.32);
-- INSERT INTO berth (berth_id) VALUES (15);
-- INSERT INTO datetime (datetimevalue) VALUES ('2024-04-15 10:00:00');
-- INSERT INTO datetime (datetimevalue) VALUES ('2024-04-18 18:00:00');
-- INSERT INTO schedule (ship, berth, arrival, departure) 
-- VALUES (758684911, 15, '2024-04-15 10:00:00', '2024-04-18 18:00:00');

-- INSERT INTO ship (ship_id, name, flag, length, width) 
-- VALUES (421212121, 'Naga Hitam', 'Indonesia', 244.14, 31.22);
-- INSERT INTO berth (berth_id) VALUES (14);
-- INSERT INTO datetime (datetimevalue) VALUES ('2024-04-16 12:10:00');
-- INSERT INTO datetime (datetimevalue) VALUES ('2024-04-20 09:13:00');
-- INSERT INTO schedule (ship, berth, arrival, departure) 
-- VALUES (421212121, 14, '2024-04-16 12:10:00', '2024-04-20 09:13:00');

-- INSERT INTO container (container_id) VALUES ('IDNA4142515');

SELECT * FROM transfer

INSERT INTO yard (bay, row, tier) VALUES (15, 15, 15);
INSERT INTO datetime (datetimevalue) VALUES ('2024-04-16 12:00:00');
INSERT INTO datetime (datetimevalue) VALUES ('2024-04-17 09:30:00');
INSERT INTO unload (to_bay, to_row, to_tier, ship, container, start, finish)
VALUES (15, 15, 15, 758684911, 'IDNA4142515', '2024-04-16 12:00:00', '2024-04-17 09:30:00');

INSERT INTO datetime (datetimevalue) VALUES ('2024-04-17 12:00:00');
INSERT INTO datetime (datetimevalue) VALUES ('2024-04-17 16:30:00');
INSERT INTO transfer (container, from_bay, from_row, from_tier, to_bay, to_row, to_tier, start, finish)
VALUES ('IDNA4142515', 15, 15, 15, 1, 1, 1, '2024-04-17 12:00:00', '2024-04-17 16:30:00');

INSERT INTO yard (bay, row, tier) VALUES (15, 15, 15);
INSERT INTO datetime (datetimevalue) VALUES ('2024-04-16 12:00:00');
INSERT INTO datetime (datetimevalue) VALUES ('2024-04-17 09:30:00');
INSERT INTO unload (to_bay, to_row, to_tier, ship, container, start, finish)
VALUES (15, 15, 15, 758684911, 'IDNA4142515', '2024-04-16 12:00:00', '2024-04-17 09:30:00');