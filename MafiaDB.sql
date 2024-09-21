DROP TABLE gangsters CASCADE CONSTRAINTS;
DROP TABLE hitmans CASCADE CONSTRAINTS;
DROP TABLE messengers CASCADE CONSTRAINTS;
DROP TABLE financiers CASCADE CONSTRAINTS;
DROP TABLE messages CASCADE CONSTRAINTS;
DROP TABLE banks CASCADE CONSTRAINTS;
DROP TABLE locations CASCADE CONSTRAINTS;
DROP TABLE deliveries CASCADE CONSTRAINTS;

DROP SEQUENCE gangster_id_seq;
DROP SEQUENCE bank_id_seq;
DROP SEQUENCE location_id_seq;
DROP SEQUENCE message_id_seq;

CREATE SEQUENCE gangster_id_seq
START WITH 100
INCREMENT BY 1;

CREATE SEQUENCE bank_id_seq 
START WITH 1 
INCREMENT BY 1;

CREATE SEQUENCE location_id_seq 
START WITH 1000
INCREMENT BY 1;

CREATE SEQUENCE message_id_seq 
START WITH 10 
INCREMENT BY 1;

CREATE TABLE gangsters (
    gangster_id NUMBER(5) DEFAULT gangster_id_seq.NEXTVAL PRIMARY KEY,
    partner_id NUMBER(5),
    first_name VARCHAR2(20) NOT NULL,
    last_name VARCHAR2(20) NOT NULL,
    age NUMBER(3) NOT NULL,
    hire_date DATE,
    CHECK (age > 0)
);

CREATE TABLE locations (
    location_id NUMBER(5) DEFAULT location_id_seq.NEXTVAL PRIMARY KEY,
    location_name VARCHAR(20) NOT NULL,
    UNIQUE (location_name)
);

CREATE TABLE banks (
    bank_id NUMBER(5) DEFAULT bank_id_seq.NEXTVAL PRIMARY KEY,
    bank_name VARCHAR(50) NOT NULL,
    location_id NUMBER(5) REFERENCES locations (location_id) NOT NULL
);

CREATE TABLE hitmans (
    hitman_id NUMBER(5) REFERENCES gangsters (gangster_id) NOT NULL,
    weapon VARCHAR2(25) NOT NULL,
    CHECK (weapon IN ('AK-47', 'Glock', 'Knife'))
);

CREATE TABLE financiers (
    financier_id NUMBER(5) REFERENCES gangsters (gangster_id) NOT NULL,
    rating  NUMBER(5) NOT NULL,
    bank_id NUMBER(5) REFERENCES banks (bank_id) NOT NULL,
    CHECK (rating >= 0 AND rating <= 5),
    UNIQUE (bank_id)
);

CREATE TABLE messengers (
    messenger_id NUMBER(5) REFERENCES gangsters (gangster_id) NOT NULL,
    transport VARCHAR2(50) NOT NULL,
    CHECK (transport IN ('Van', 'Car', 'Truck', 'Motorcycle', 'Plane'))
    );

CREATE TABLE messages (
    message_id NUMBER(5) DEFAULT message_id_seq.NEXTVAL PRIMARY KEY,
    messenger_id NUMBER(5) REFERENCES gangsters (gangster_id) NOT NULL,
    message_format VARCHAR2(50) NOT NULL,
    CHECK (message_format IN ('E-mail', 'Mail', 'Fax', 'Morse', 'Binari', 'Messenger Pigeon'))
);

CREATE TABLE deliveries (
    gangster_id NUMBER(5) REFERENCES gangsters (gangster_id) NOT NULL,
    message_id NUMBER(5) REFERENCES messages (message_id) NOT NULL,
    delivery_date DATE NOT NULL,
    response VARCHAR(300),
    UNIQUE (gangster_id, message_id, delivery_date)
);

INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (100, 101, 'Cristophe', 'Sorie', 17, NULL);
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (101, 100, 'Thomas', 'Roncerous', 58, NULL);
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (102, NULL, 'Joseff', 'Pedréro', 58, TO_DATE('2015-12-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (103, 101, 'John', 'Doe', 23, TO_DATE('2022-06-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (104, NULL, 'Maria', 'Garcia', 32, TO_DATE('2019-02-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (105, 103, 'James', 'Smith', 45, TO_DATE('2017-09-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (106, 104, 'Toni', 'Cipriani', 29, TO_DATE('2018-11-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (107, 108, 'Carl', 'Johnson', 37, TO_DATE('2016-03-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (108, 107, 'Laura', 'Davis', 41, TO_DATE('2014-07-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (109, 110, 'Michael', 'Wilson', 52, TO_DATE('2013-09-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (110, 109, 'Jennifer', 'Martinez', 27, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (111, NULL, 'William', 'Anderson', 33, NULL);
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (112, NULL, 'Elizabeth', 'Taylor', 48, TO_DATE('2011-08-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (113, 114, 'Christopher', 'Lee', 21, TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (114, 113, 'Jessica', 'Hernandez', 39, NULL);
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (115, 136, 'Daniel', 'Moore', 44, TO_DATE('2017-01-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (116, NULL, 'Ashley', 'Jackson', 26, TO_DATE('2021-12-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (117, NULL, 'Matthew', 'Martin', 31, TO_DATE('2019-11-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (118, 138, 'Samantha', 'Thompson', 36, TO_DATE('2016-07-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (119, 120, 'Johann', 'Laporte', 50, TO_DATE('2014-03-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (120, 119, 'Henry', 'Negréire', 28, TO_DATE('2022-09-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (121, 122, 'Robert', 'Nelson', 42, NULL);
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (122, 121, 'Stephanie', 'Carter', 47, TO_DATE('2013-02-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (123, 124, 'Joshua', 'Mitchell', 22, TO_DATE('2023-03-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (124, 123, 'Heather', 'Perez', 40, TO_DATE('2018-04-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (125, 126, 'Kevin', 'Roberts', 35, TO_DATE('2016-02-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (126, 125, 'Brittany', 'Turner', 30, TO_DATE('2019-12-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (127, 128, 'Jason', 'Phillips', 46, TO_DATE('2014-06-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (128, 127, 'Melissa', 'Campbell', 38, TO_DATE('2017-02-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (129, 130, 'Ryan', 'Parker', 25, NULL);
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (130, 129, 'Nicole', 'Evans', 33, TO_DATE('2020-03-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (131, 132, 'Eric', 'Edwards', 23, TO_DATE('2022-01-08', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (132, 131, 'Amber', 'Heard', 43, TO_DATE('2021-11-01', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (133, 134, 'Dominic', 'Austrain', 55, TO_DATE('2021-12-05', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (134, 133, 'David', 'Colado', 35, TO_DATE('2019-12-05', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (135, 137, 'Carlitos', 'Carvajal', 19, TO_DATE('2020-04-06', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (136, 115, 'Alex', 'Parra', 18, TO_DATE('2020-09-15', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (137, 135, 'Antonio', 'Banderas', 60, TO_DATE('2016-05-02', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (138, 118, 'Nicolas', 'Cage', 45, TO_DATE('2015-07-08', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (139, 140, 'Alex', 'Farrero', 22, TO_DATE('2021-05-07', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (140, 139, 'Eric', 'Garcia', 29, TO_DATE('2018-01-18', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (141, 142, 'Roser', 'Sallieti', 25, TO_DATE('2020-08-30', 'YYYY-MM-DD'));
INSERT INTO gangsters (gangster_id, partner_id, first_name, last_name, age, hire_date) VALUES (142, 141, 'David', 'De Mingo', 55, TO_DATE('2023-05-30', 'YYYY-MM-DD'));

INSERT INTO locations (location_id, location_name) VALUES (1001, 'Louvre');
INSERT INTO locations (location_id, location_name) VALUES (1002, 'Bourse');
INSERT INTO locations (location_id, location_name) VALUES (1003, 'Temple');
INSERT INTO locations (location_id, location_name) VALUES (1004, 'Hotel de Ville');
INSERT INTO locations (location_id, location_name) VALUES (1005, 'Panthéon');
INSERT INTO locations (location_id, location_name) VALUES (1006, 'Luxembourg');
INSERT INTO locations (location_id, location_name) VALUES (1007, 'Palais Bourbon');
INSERT INTO locations (location_id, location_name) VALUES (1008, 'Elysée');
INSERT INTO locations (location_id, location_name) VALUES (1009, 'Opéra');
INSERT INTO locations (location_id, location_name) VALUES (1010, 'Entrepot');
INSERT INTO locations (location_id, location_name) VALUES (1011, 'Popincourt');
INSERT INTO locations (location_id, location_name) VALUES (1012, 'Reuilly');
INSERT INTO locations (location_id, location_name) VALUES (1013, 'Gobelin');
INSERT INTO locations (location_id, location_name) VALUES (1014, 'Observatoire');
INSERT INTO locations (location_id, location_name) VALUES (1015, 'Vaugirard');
INSERT INTO locations (location_id, location_name) VALUES (1016, 'Passy');
INSERT INTO locations (location_id, location_name) VALUES (1017, 'Batignolles-Monceaux');
INSERT INTO locations (location_id, location_name) VALUES (1018, 'Butte-Montmartre');
INSERT INTO locations (location_id, location_name) VALUES (1019, 'Buttes-Chaumont');
INSERT INTO locations (location_id, location_name) VALUES (1020, 'Mélinmontant');

INSERT INTO banks (bank_id, bank_name, location_id) VALUES (1, 'Moritz', 1013);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (2, 'Aareal Bank AG', 1019);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (3, 'Bank Audi France', 1015);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (4, 'Bank Sepah', 1001);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (5, 'Al Khaliji France', 1018);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (6, 'Allianz banque', 1006);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (7, 'Allianz securite', 1006);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (8, 'Amundi Euro-Liquidity SRI', 1002);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (9, 'Arab Banking Corporation SA', 1007);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (10, 'Astorg pension', 1008);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (11, 'Cofidis', 1006);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (12, 'CNOVA PAY', 1020);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (13, 'CMB MONACO', 1018);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (14, 'Corsabail', 1001);
INSERT INTO banks (bank_id, bank_name, location_id) VALUES (15, 'ING Bank NV', 1003);

INSERT INTO hitmans (hitman_id, weapon) VALUES (128, 'Glock');
INSERT INTO hitmans (hitman_id, weapon) VALUES (119, 'AK-47');
INSERT INTO hitmans (hitman_id, weapon) VALUES (120, 'Glock');
INSERT INTO hitmans (hitman_id, weapon) VALUES (108, 'Knife');
INSERT INTO hitmans (hitman_id, weapon) VALUES (107, 'AK-47');
INSERT INTO hitmans (hitman_id, weapon) VALUES (112, 'Glock');
INSERT INTO hitmans (hitman_id, weapon) VALUES (109, 'Knife');
INSERT INTO hitmans (hitman_id, weapon) VALUES (117, 'AK-47');
INSERT INTO hitmans (hitman_id, weapon) VALUES (122, 'Glock');
INSERT INTO hitmans (hitman_id, weapon) VALUES (105, 'Knife');
INSERT INTO hitmans (hitman_id, weapon) VALUES (106, 'AK-47');
INSERT INTO hitmans (hitman_id, weapon) VALUES (127, 'Knife');
INSERT INTO hitmans (hitman_id, weapon) VALUES (111, 'Glock');
INSERT INTO hitmans (hitman_id, weapon) VALUES (113, 'Glock');
INSERT INTO hitmans (hitman_id, weapon) VALUES (114, 'AK-47');

INSERT INTO messengers (messenger_id, transport) VALUES (131, 'Car');
INSERT INTO messengers (messenger_id, transport) VALUES (125, 'Van');
INSERT INTO messengers (messenger_id, transport) VALUES (118, 'Truck');
INSERT INTO messengers (messenger_id, transport) VALUES (130, 'Motorcycle');
INSERT INTO messengers (messenger_id, transport) VALUES (129, 'Plane');
INSERT INTO messengers (messenger_id, transport) VALUES (126, 'Plane');
INSERT INTO messengers (messenger_id, transport) VALUES (103, 'Motorcycle');
INSERT INTO messengers (messenger_id, transport) VALUES (110, 'Van');
INSERT INTO messengers (messenger_id, transport) VALUES (121, 'Truck');
INSERT INTO messengers (messenger_id, transport) VALUES (109, 'Van');
INSERT INTO messengers (messenger_id, transport) VALUES (119, 'Motorcycle');
INSERT INTO messengers (messenger_id, transport) VALUES (104, 'Plane');
INSERT INTO messengers (messenger_id, transport) VALUES (115, 'Van');
INSERT INTO messengers (messenger_id, transport) VALUES (116, 'Truck');
INSERT INTO messengers (messenger_id, transport) VALUES (123, 'Car');

INSERT INTO financiers (financier_id, rating, bank_id) VALUES (100, 5, 1);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (101, 5, 6);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (102, 1, 9);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (124, 4, 10);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (132, 2, 7);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (133, 4, 13);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (134, 2, 11);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (135, 1, 15);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (136, 3, 14);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (137, 3, 2);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (138, 2, 3);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (139, 1, 8);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (140, 1, 5);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (141, 2, 12);
INSERT INTO financiers (financier_id, rating, bank_id) VALUES (142, 4, 4);

INSERT INTO messages (message_id, message_format, messenger_id) VALUES (10, 'Fax', 125);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (11, 'E-mail', 118);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (12, 'Mail', 130);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (13, 'Messenger Pigeon', 129);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (14, 'Mail', 126);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (15, 'Fax', 103);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (16, 'Morse', 110);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (17, 'Messenger Pigeon', 121);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (18, 'E-mail', 131);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (19, 'Fax', 109);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (20, 'Binari', 121);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (21, 'E-mail', 125);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (22, 'Mail', 118);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (23, 'Fax', 130);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (24, 'Mail', 129);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (25, 'Fax', 126);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (26, 'Morse', 103);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (27, 'E-mail', 110);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (28, 'Mail', 121);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (29, 'E-mail', 125);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (30, 'Messenger Pigeon', 118);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (31, 'Fax', 130);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (32, 'Binari', 129);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (33, 'Mail', 126);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (34, 'Messenger Pigeon', 103);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (35, 'Binari', 110);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (36, 'Fax', 121);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (37, 'Mail', 109);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (38, 'Morse', 119);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (39, 'E-mail', 104);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (40, 'Mail', 115);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (41, 'Messenger Pigeon', 116);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (42, 'E-mail', 123);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (43, 'Fax', 110);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (44, 'Messenger Pigeon', 121);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (45, 'E-mail', 109);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (46, 'Mail', 119);
INSERT INTO messages (message_id, message_format, messenger_id) VALUES (47, 'Fax', 104);

INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (101, 10, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'Job complete');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (102, 11, TO_DATE('2023-09-03', 'YYYY-MM-DD'), 'Job complete.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (106, 12, TO_DATE('2023-10-03', 'YYYY-MM-DD'), 'Thank you for the information you have provided about the project');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (102, 13, TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'I am unable to fulfill your request due to money fill');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (104, 14, TO_DATE('2024-04-13', 'YYYY-MM-DD'), 'I suggest you reconsider your position and seek a peaceful solution');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (104, 15, TO_DATE('2024-04-24', 'YYYY-MM-DD'), NULL);
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (110, 16, TO_DATE('2024-04-30', 'YYYY-MM-DD'), 'The project could not be completed due to lack of money. Report immediately.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (120, 17, TO_DATE('2024-05-06', 'YYYY-MM-DD'), NULL);
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (101, 18, TO_DATE('2024-05-07', 'YYYY-MM-DD'), 'Presentation card Financier: Thomas Roncerous Telf: 654322145 Address: Gobelin');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (102, 19, TO_DATE('2024-05-09', 'YYYY-MM-DD'), NULL);
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (115, 20, TO_DATE('2024-05-10', 'YYYY-MM-DD'), 'Stop with that.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (116, 21, TO_DATE('2024-05-23', 'YYYY-MM-DD'), 'Need more information on the project.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (117, 22, TO_DATE('2024-05-30', 'YYYY-MM-DD'), 'Job rejected.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (100, 23, TO_DATE('2024-05-31', 'YYYY-MM-DD'), 'The subject has been assassinated already. Im waiting for the papercheck.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (105, 24, TO_DATE('2024-10-06', 'YYYY-MM-DD'), NULL);
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (102, 25, TO_DATE('2024-06-18', 'YYYY-MM-DD'), 'Presentation card Financier: Michael Ronstey Telf: 693248543 Address: Temple');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (100, 26, TO_DATE('2024-06-20', 'YYYY-MM-DD'), 'The subjects were last seen on the airport a couple of days ago. ');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (117, 27, TO_DATE('2024-06-22', 'YYYY-MM-DD'), 'The issue has been resolved but will need to be monitored in the coming weeks.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (100, 28, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 'Job completed with success.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (111, 29, TO_DATE('2024-07-11', 'YYYY-MM-DD'), 'Job rejected. I am sorry.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (112, 30, TO_DATE('2024-07-27', 'YYYY-MM-DD'), 'I still dont know about what we talked two days ago.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (119, 31, TO_DATE('2024-07-28', 'YYYY-MM-DD'), NULL);
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (106, 32, TO_DATE('2024-07-30', 'YYYY-MM-DD'), NULL);
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (105, 33, TO_DATE('2024-08-07', 'YYYY-MM-DD'), 'Job rejected. Propose another one.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (107, 34, TO_DATE('2024-08-16', 'YYYY-MM-DD'), 'Job complete.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (104, 35, TO_DATE('2024-08-21', 'YYYY-MM-DD'), 'Report back to the boss in that case.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (100, 36, TO_DATE('2024-08-30', 'YYYY-MM-DD'), NULL);
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (101, 37, TO_DATE('2024-09-04', 'YYYY-MM-DD'), 'Im at the position right now.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (120, 38, TO_DATE('2024-11-28', 'YYYY-MM-DD'), 'The issue has been resolved but will need to be monitored in the coming weeks.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (119, 39, TO_DATE('2024-11-29', 'YYYY-MM-DD'), 'The bomb has been planted, will keep informing...');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (116, 40, TO_DATE('2025-02-12', 'YYYY-MM-DD'), 'Job complete.');
INSERT INTO deliveries (gangster_id, message_id, delivery_date, response) VALUES (111, 41, TO_DATE('2025-05-17', 'YYYY-MM-DD'), 'Job rejected.');