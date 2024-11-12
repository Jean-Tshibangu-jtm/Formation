DROP TABLE IF EXISTS vroomly.drivers ;
DROP TABLE IF EXISTS vroomly.customers ;
DROP TABLE IF EXISTS vroomly.rides ;

CREATE TABLE vroomly.customers (
    id UUID PRIMARY KEY,
    name TEXT,
    age INT
);

CREATE TABLE vroomly.drivers (
    id UUID PRIMARY KEY,
    name TEXT,
    age INT
);

CREATE TABLE vroomly.rides (
    driver_id UUID,
    customer_id UUID,
    timestamp TIMESTAMP,
    price FLOAT,
    PRIMARY KEY ((driver_id, customer_id), timestamp)
) WITH CLUSTERING ORDER BY (timestamp DESC);

INSERT INTO vroomly.customers (id, name, age) VALUES (6a6148d1-4a56-4d6a-a610-cdf7b7e3b959, 'Alice', 30);
INSERT INTO vroomly.customers (id, name, age) VALUES (021ec96f-7110-4703-99db-63acc9c113e8, 'Bob', 23);
INSERT INTO vroomly.customers (id, name, age) VALUES (f1233345-0c17-49bc-b0df-f28eb87b7f54, 'Charlie', 35);
INSERT INTO vroomly.customers (id, name, age) VALUES (8ee566b7-47d4-42c7-8784-d07973ab510e, 'Danielle', 72);
INSERT INTO vroomly.customers (id, name, age) VALUES (e4506494-e2a1-4ecc-888e-6ff36e7e59b0, 'Elodie', 26);
INSERT INTO vroomly.customers (id, name, age) VALUES (b5762ca9-6479-4277-ae76-2b4b34dad5c8, 'Franck', 18);
INSERT INTO vroomly.customers (id, name, age) VALUES (ce94d931-6ffa-48a5-b822-7c67e4d1a4d0, 'Guillaume', 29);
INSERT INTO vroomly.customers (id, name, age) VALUES (5838d413-882a-4641-96ea-150e386f59e7, 'Hamza', 33);
INSERT INTO vroomly.customers (id, name, age) VALUES (610747ac-8b3c-48ef-915d-79764663e510, 'Imane', 45);
INSERT INTO vroomly.customers (id, name, age) VALUES (4062af38-e764-4bb1-8330-f77c04fb5ad2, 'Ingrid', 56);
INSERT INTO vroomly.customers (id, name, age) VALUES (e62d750d-448e-4be4-89c6-5a5035226f8b, 'Ismaël', 16);
INSERT INTO vroomly.customers (id, name, age) VALUES (7a24537d-b74f-4e7e-a113-f31b971727ea, 'Joana', 22);
INSERT INTO vroomly.customers (id, name, age) VALUES (1a3df530-a5bf-40c8-8376-7b9152fc8ea4, 'Katia', 35);
INSERT INTO vroomly.customers (id, name, age) VALUES (6a942101-fda7-4506-a709-b55589af9ab2, 'Lisa', 19);
INSERT INTO vroomly.customers (id, name, age) VALUES (3a9eefb3-a7e1-46b3-b6f0-e9947425eb45, 'Manon', 38);
INSERT INTO vroomly.customers (id, name, age) VALUES (cec36b12-e5d3-4ac2-91f0-e722d1a74df9, 'Noémie', 41);
INSERT INTO vroomly.customers (id, name, age) VALUES (3b7b3db9-d3f3-4b4a-ae88-c2012085b30f, 'Octave', 36);
INSERT INTO vroomly.customers (id, name, age) VALUES (24468bc3-f659-43c1-b868-786721f4f0b0, 'Patrick', 55);
INSERT INTO vroomly.customers (id, name, age) VALUES (b51e4ffa-ac26-47d4-a322-37e9a581cd0c, 'Quentin', 40);
INSERT INTO vroomly.customers (id, name, age) VALUES (7305d606-2009-4fa7-aa58-94bdad2ceaff, 'Rosana', 37);
INSERT INTO vroomly.customers (id, name, age) VALUES (a4f1a713-cb90-487c-978e-d9bdc6a5dcbb, 'Sophie', 20);
INSERT INTO vroomly.customers (id, name, age) VALUES (3591b15e-8d8a-448a-aaee-a7db6edd5f46, 'Umberto', 70);
INSERT INTO vroomly.customers (id, name, age) VALUES (2185b48a-be4e-4c13-b5b4-8902fd0db2fd, 'Valeria', 19);
INSERT INTO vroomly.customers (id, name, age) VALUES (438b926e-ab1e-4ffc-9616-0bd44de34bc2, 'Weize', 25);
INSERT INTO vroomly.customers (id, name, age) VALUES (27e98f89-07df-437e-9c4b-a6094c2afba0, 'Xavier', 31);
INSERT INTO vroomly.customers (id, name, age) VALUES (391f353d-84d7-40e4-8057-512f45e34ec1, 'Yvonne', 87);
INSERT INTO vroomly.customers (id, name, age) VALUES (9b692c45-5c09-4adf-96cb-75f817c67513, 'Zoé', 66);



INSERT INTO vroomly.drivers (id, name, age) VALUES (a9d15b6d-5fbc-4874-849d-1f4bfc2c3af1, 'Alex', 32);
INSERT INTO vroomly.drivers (id, name, age) VALUES (c3e60e90-12b2-486a-beb9-c86a0a3b3e29, 'Bernard', 45);
INSERT INTO vroomly.drivers (id, name, age) VALUES (f61455b7-16d4-4f6e-bb7c-34048bcfb01c, 'Chantal', 28);
INSERT INTO vroomly.drivers (id, name, age) VALUES (b37a69de-68e4-4f39-8a6d-c0db4dba8160, 'Dimitri', 39);
INSERT INTO vroomly.drivers (id, name, age) VALUES (a7f84b20-2e73-45b6-bda5-b4fede6cfb1d, 'Elena', 41);
INSERT INTO vroomly.drivers (id, name, age) VALUES (efb357e2-c648-4317-80e6-ffbe85f40f2f, 'François', 54);
INSERT INTO vroomly.drivers (id, name, age) VALUES (3bc05f41-b9cb-4563-a86d-2196cb057a32, 'Gérard', 38);
INSERT INTO vroomly.drivers (id, name, age) VALUES (66a11e56-9d41-420e-b676-6d8c5d4771b7, 'Hélène', 29);
INSERT INTO vroomly.drivers (id, name, age) VALUES (784b2a36-df9d-4828-b17c-2bda0f43bb8a, 'Igor', 35);
INSERT INTO vroomly.drivers (id, name, age) VALUES (d3e1d944-4a18-4385-b63b-20e7e8d5ab1f, 'Julie', 44);
INSERT INTO vroomly.drivers (id, name, age) VALUES (ab1f372c-2441-4f26-97c6-3f6a81a4ff12, 'Karim', 27);
INSERT INTO vroomly.drivers (id, name, age) VALUES (6a75f5d9-b4b5-4c57-a716-5d4de2e0c1b1, 'Luc', 53);
INSERT INTO vroomly.drivers (id, name, age) VALUES (1a2d7891-51f5-4b6f-bd6e-d7f5f76039ff, 'Marie', 36);
INSERT INTO vroomly.drivers (id, name, age) VALUES (7b4dcedf-2e59-4af0-91b7-f69a6de4f9d3, 'Nicolas', 50);
INSERT INTO vroomly.drivers (id, name, age) VALUES (ea92db26-6278-4c33-9142-215b81f5de3e, 'Olga', 31);
INSERT INTO vroomly.drivers (id, name, age) VALUES (2bd45770-e22f-4fb6-baa8-2ad5d3ecf39a, 'Patrick', 47);
INSERT INTO vroomly.drivers (id, name, age) VALUES (564c1d9b-4e8d-45cf-bd94-ec671d9b21a6, 'Quentin', 34);
INSERT INTO vroomly.drivers (id, name, age) VALUES (134de6ff-4a91-4724-9e45-5d3f4b1b5f4f, 'Rebecca', 40);
INSERT INTO vroomly.drivers (id, name, age) VALUES (ad37f6be-8339-49e8-aba3-e849b8a7c7e1, 'Sébastien', 26);
INSERT INTO vroomly.drivers (id, name, age) VALUES (4c1e743a-41e3-4ff6-9265-fb4c97176ab1, 'Thierry', 46);
INSERT INTO vroomly.drivers (id, name, age) VALUES (a9e3f5d8-4c9d-42de-b833-6baf9e4e4bff, 'Ursula', 37);
INSERT INTO vroomly.drivers (id, name, age) VALUES (7d43e1cb-59c7-4d79-917b-18d8b3a7487c, 'Vincent', 30);
INSERT INTO vroomly.drivers (id, name, age) VALUES (34bdbefe-97d1-4d87-938b-e276f4c3c6cf, 'William', 49);
INSERT INTO vroomly.drivers (id, name, age) VALUES (45fd2d8d-dfe8-49a7-9a0b-cf8b54d9b4fa, 'Xavier', 28);
INSERT INTO vroomly.drivers (id, name, age) VALUES (b0f965e1-b57f-4f37-876f-3bfa5f7a7ae9, 'Yasmine', 42);
INSERT INTO vroomly.drivers (id, name, age) VALUES (e5c6b7ae-3c0b-44c8-9f2e-8d0c23f6ff6f, 'Zoé', 33);
INSERT INTO vroomly.drivers (id, name, age) VALUES (20bf94b7-5b5a-4bb7-b2b3-0d4f8e7e9d21, 'Arthur', 25);
INSERT INTO vroomly.drivers (id, name, age) VALUES (933d1c4f-eaad-41b7-96e8-b7bf4f645ab9, 'Bruno', 35);
INSERT INTO vroomly.drivers (id, name, age) VALUES (d074af0c-64f7-4e1b-92b4-749c8df1476a, 'Chloé', 40);
INSERT INTO vroomly.drivers (id, name, age) VALUES (96b2f07a-2b6c-41d1-9f84-5c3ab92cb987, 'Damien', 31);

INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (a9d15b6d-5fbc-4874-849d-1f4bfc2c3af1, 6a6148d1-4a56-4d6a-a610-cdf7b7e3b959, '2024-11-01 14:23:00', 23.5);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (c3e60e90-12b2-486a-beb9-c86a0a3b3e29, 021ec96f-7110-4703-99db-63acc9c113e8, '2024-10-15 09:12:00', 18.7);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (f61455b7-16d4-4f6e-bb7c-34048bcfb01c, f1233345-0c17-49bc-b0df-f28eb87b7f54, '2024-09-10 20:45:00', 34.2);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (b37a69de-68e4-4f39-8a6d-c0db4dba8160, 8ee566b7-47d4-42c7-8784-d07973ab510e, '2024-09-23 17:30:00', 29.0);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (a7f84b20-2e73-45b6-bda5-b4fede6cfb1d, e4506494-e2a1-4ecc-888e-6ff36e7e59b0, '2024-08-19 08:47:00', 21.3);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (efb357e2-c648-4317-80e6-ffbe85f40f2f, b5762ca9-6479-4277-ae76-2b4b34dad5c8, '2024-07-11 12:15:00', 26.8);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (3bc05f41-b9cb-4563-a86d-2196cb057a32, ce94d931-6ffa-48a5-b822-7c67e4d1a4d0, '2024-06-24 10:30:00', 19.9);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (66a11e56-9d41-420e-b676-6d8c5d4771b7, 5838d413-882a-4641-96ea-150e386f59e7, '2024-06-01 15:22:00', 32.5);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (784b2a36-df9d-4828-b17c-2bda0f43bb8a, 610747ac-8b3c-48ef-915d-79764663e510, '2024-05-14 18:45:00', 27.4);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (d3e1d944-4a18-4385-b63b-20e7e8d5ab1f, 4062af38-e764-4bb1-8330-f77c04fb5ad2, '2024-04-29 11:10:00', 24.0);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (ab1f372c-2441-4f26-97c6-3f6a81a4ff12, e62d750d-448e-4be4-89c6-5a5035226f8b, '2024-03-05 07:55:00', 22.9);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (6a75f5d9-b4b5-4c57-a716-5d4de2e0c1b1, 7a24537d-b74f-4e7e-a113-f31b971727ea, '2024-02-11 20:10:00', 30.1);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (1a2d7891-51f5-4b6f-bd6e-d7f5f76039ff, 1a3df530-a5bf-40c8-8376-7b9152fc8ea4, '2024-01-27 14:30:00', 17.5);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (7b4dcedf-2e59-4af0-91b7-f69a6de4f9d3, 6a942101-fda7-4506-a709-b55589af9ab2, '2024-01-10 09:50:00', 28.3);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (ea92db26-6278-4c33-9142-215b81f5de3e, 3a9eefb3-a7e1-46b3-b6f0-e9947425eb45, '2023-12-31 23:59:00', 25.7);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (2bd45770-e22f-4fb6-baa8-2ad5d3ecf39a, cec36b12-e5d3-4ac2-91f0-e722d1a74df9, '2023-12-15 17:30:00', 20.6);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (564c1d9b-4e8d-45cf-bd94-ec671d9b21a6, 3b7b3db9-d3f3-4b4a-ae88-c2012085b30f, '2023-11-20 14:10:00', 23.8);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (134de6ff-4a91-4724-9e45-5d3f4b1b5f4f, 24468bc3-f659-43c1-b868-786721f4f0b0, '2023-10-07 19:45:00', 29.9);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (ad37f6be-8339-49e8-aba3-e849b8a7c7e1, b51e4ffa-ac26-47d4-a322-37e9a581cd0c, '2023-09-23 08:40:00', 18.3);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (4c1e743a-41e3-4ff6-9265-fb4c97176ab1, 7305d606-2009-4fa7-aa58-94bdad2ceaff, '2023-08-15 22:00:00', 33.2);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (a9e3f5d8-4c9d-42de-b833-6baf9e4e4bff, a4f1a713-cb90-487c-978e-d9bdc6a5dcbb, '2023-07-11 18:25:00', 27.8);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (7d43e1cb-59c7-4d79-917b-18d8b3a7487c, 3591b15e-8d8a-448a-aaee-a7db6edd5f46, '2023-06-02 10:00:00', 24.6);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (34bdbefe-97d1-4d87-938b-e276f4c3c6cf, b1954eb9-9737-48a2-bb68-d7e9f607c81a, '2023-05-20 16:15:00', 32.0);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (45fd2d8d-dfe8-49a7-9a0b-cf8b54d9b4fa, 9bb3eebc-b4f3-4eb3-95f2-d4a5eb1d8c9a, '2023-04-07 11:45:00', 19.2);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (b0f965e1-b57f-4f37-876f-3bfa5f7a7ae9, c10a4b2c-c0c4-4f3c-a29d-f1e5b5204c4c, '2023-03-14 20:30:00', 26.9);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (e5c6b7ae-3c0b-44c8-9f2e-8d0c23f6ff6f, a6be5739-2c0a-4114-b4e9-e54855a64bc8, '2023-02-02 07:35:00', 30.5);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (20bf94b7-5b5a-4bb7-b2b3-0d4f8e7e9d21, 784aa7e2-8b9a-4ad1-8517-3a054d2f4b29, '2023-01-23 09:55:00', 23.4);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (933d1c4f-eaad-41b7-96e8-b7bf4f645ab9, 92c03c5e-6a7b-42b4-ae14-dfc0f3404e3a, '2023-01-05 18:00:00', 31.7);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (d074af0c-64f7-4e1b-92b4-749c8df1476a, cff23c1d-7b3f-4076-95c4-2c2fbe635beb, '2022-12-18 13:20:00', 28.6);
INSERT INTO vroomly.rides (driver_id, customer_id, timestamp, price) VALUES (96b2f07a-2b6c-41d1-9f84-5c3ab92cb987, 82f54b3e-dc3f-492f-b5a3-7d23a7250de8, '2022-11-02 15:45:00', 25.1);
