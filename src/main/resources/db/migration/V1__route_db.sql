-- 1. Table: buses
CREATE TABLE `buses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bus_number` varchar(255) DEFAULT NULL,
  `total_seats` int NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 2. Table: passengers
CREATE TABLE `passengers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 3. Table: trips
CREATE TABLE `trips` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `arrival_time` datetime(6) DEFAULT NULL,
  `departure_time` datetime(6) DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `fare` double DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `bus_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2vg7b2xayoq4ogt2kbsot4juq` (`bus_id`),
  CONSTRAINT `FK2vg7b2xayoq4ogt2kbsot4juq` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 4. Table: seats
CREATE TABLE `seats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `available` bit(1) DEFAULT NULL,
  `seat_number` varchar(255) DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4vm7xuvuh00qp354d1vywnqu2` (`trip_id`),
  CONSTRAINT `FK4vm7xuvuh00qp354d1vywnqu2` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 5. Table: bookings
CREATE TABLE `bookings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_time` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `passenger_id` bigint DEFAULT NULL,
  `seat_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKc0glhtng6ln3mnqh1aqjpqaxm` (`seat_id`),
  KEY `FKdrfy7gcwhtaubn8vgbc4jv989` (`passenger_id`),
  CONSTRAINT `FKdrfy7gcwhtaubn8vgbc4jv989` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`),
  CONSTRAINT `FKhmf8yyefriw5ski3jibaua6n` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 6. Table: payments
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `paid_at` datetime(6) DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKnuscjm6x127hkb15kcb8n56wo` (`booking_id`),
  CONSTRAINT `FKc52o2b1jkxttngufqp3t7jr3h` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


