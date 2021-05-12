-- Exercice 1 : création d'une procédure stockée sans paramètre

-- Créez la procédure stockée Lst_Suppliers correspondant à la requête afficher le nom des fournisseurs pour lesquels une commande a été passée.

DELIMITER $$
CREATE PROCEDURE Lst_Suppliers()
BEGIN
SELECT sup_name
FROM suppliers
RIGHT JOIN products ON pro_sup_id = sup_id
RIGHT JOIN orders_details ON ode_pro_id = pro_id
WHERE ode_quantity IS NOT NULL
GROUP BY sup_name ;
END $$
DELIMITER;

-- Exécutez la commande SQL suivante pour obtenir des informations sur cette procédure stockée :
SHOW CREATE PROCEDURE Lst_Suppliers

-- Exécutez la pour vérifier qu'elle fonctionne conformément à votre attente.
CALL Lst_Suppliers();


-- Exercice 2 : création d'une procédure stockée avec un paramètre en entrée

-- Créer la procédure stockée Lst_Rush_Orders, qui liste les commandes ayant le libelle "commande urgente".

DELIMITER $$
CREATE PROCEDURE Lst_Rush_Orders()
BEGIN
SELECT*
FROM orders
WHERE ord_status LIKE "Commande Urgente" ;
END $$
DELIMITER;


-- Exercice 3 : création d'une procédure stockée avec plusieurs paramètres

-- Créer la procédure stockée CA_Supplier, qui pour un code fournisseur et une année entrée en paramètre, calcule et restitue le CA potentiel de ce fournisseur pour l'année souhaitée.

DELIMITER $$
CREATE PROCEDURE 
CA_Supplier(
    IN p_id INT(10),
    IN p_year INT(4)
)
BEGIN
SELECT sup_name,
ROUND(SUM(ode_quantity *(ode_unit_price *(1 - ode_discount * 0.01))),2) AS CA
FROM orders
LEFT JOIN orders_details ON ord_id = ode_ord_id
LEFT JOIN products ON pro_id = ode_pro_id
LEFT JOIN suppliers ON pro_sup_id = sup_id
WHERE ord_payment_date LIKE CONCAT(p_year, "%") AND sup_id = p_id
GROUP BY sup_name ;
END $$
DELIMITER;


/*On exécutera la requête que si le code fournisseur est valide, c'est-à-dire dans la table suppliers.
Testez cette procédure avec différentes valeurs des paramètres.*/

CALL CA_Supplier(3,2016)
CALL CA_Supplier(2,2017)
