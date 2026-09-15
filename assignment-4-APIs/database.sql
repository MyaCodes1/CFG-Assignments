CREATE DATABASE IF NOT EXISTS adventurers_guild;

USE adventurers_guild;

CREATE TABLE IF NOT EXISTS expeditions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    difficulty VARCHAR(20) NOT NULL,
    party_size INT NOT NULL,
    duration_days INT NOT NULL,
    campsite VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Open'
);

INSERT INTO expeditions
(name, destination, difficulty, party_size, duration_days, campsite, status)
VALUES
('Dragon''s Peak Expedition', 'Dragon''s Peak', 'Hard', 4, 5, 'Ashwood Camp', 'Open'),
('Moonlit Forest Trek', 'Moonlit Forest', 'Easy', 2, 2, 'Silverpine Camp', 'Open'),
('Goblin Marsh Patrol', 'Greenfen Marsh', 'Medium', 5, 3, 'Goblin''s Crossing', 'Open'),
('Ruins of Eldoria', 'Eldoria', 'Hard', 6, 7, 'Ancient Watchtower', 'Open');