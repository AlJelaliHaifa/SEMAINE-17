--LES VUES

--1 Afficher la liste des hôtels avec leur station.

--création de la vue v_hotel_station qui permet d'afficher le nom d'hôtel et sa station associé
CREATE VIEW v_hotel_station
AS
SELECT 
hot_nom AS "Nom d'hôtel", 
sta_nom AS "Nom de station" 
FROM hotel 
INNER JOIN station ON sta_id = hot_sta_id

--Affichage la liste des hôtels avec leur station.
SELECT * FROM v_hotel_station



-- 2 Afficher la liste des chambres et leur hôtel

-- création de la vu v_chambre_hotel pour associer le numéro de chambre et l'hôtel
CREATE VIEW v_chambre_hotel
AS
SELECT 
cha_numero AS "Numéro de chambre", 
hot_nom AS "Nom d'hôtel" 
FROM chambre 
INNER JOIN hotel ON hot_id = cha_hot_id

-- Affichage la liste des chambres et leur hôtel
SELECT * FROM v_chambre_hotel



--3 Afficher la liste des réservations avec le nom des clients

-- création de la vu v_client_reservation pour associer la date de reservation et le nom du client
CREATE VIEW v_client_reservation
AS
SELECT res_date AS "Date de réservation", 
cli_nom AS "Nom de client" 
FROM reservation 
INNER JOIN client ON cli_id = res_id

--Affichage de la liste des réservations avec le nom des clients
SELECT * FROM v_client_reservation



--4 Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station

-- création de la vu v_chambre_hotel pour associer le nom de l'hôtel et le nom de la station
CREATE VIEW v_chambre_hotel_station
AS
SELECT 
cha_numero AS "Numéro de chambre", 
hot_nom AS "Nom d'hôtel", 
sta_nom AS "Nom de station" 
FROM chambre 
LEFT JOIN hotel ON hot_id = cha_hot_id 
LEFT JOIN station ON sta_id = hot_sta_id

--Affichage de la liste des chambres avec le nom de l'hôtel et le nom de la station
SELECT * FROM v_chambre_hotel_station



--5 Afficher les réservations avec le nom du client et le nom de l'hôtel

-- création de la vu v_chambre_hotel pour associer les réservations avec le nom du client et le nom de l'hôtel

CREATE VIEW v_reservation_client_hotel
AS
SELECT
res_date AS "Date de réservation",
cli_nom AS "Nom de client",
hot_nom AS "Nom d'hôtel"
FROM client
JOIN reservation ON res_id = cli_id
JOIN chambre ON cha_id = res_cha_id
JOIN hotel ON hot_id = cha_hot_id

--Affichage des réservations avec le nom du client et le nom de l'hôtel

SELECT * FROM v_reservation_client_hotel
