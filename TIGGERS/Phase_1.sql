-- 1.Mettez en place ce trigger, puis ajoutez un produit dans une commande, vérifiez que le champ total est bien mis à jour.

DROP TRIGGER IF EXISTS maj_total;

DELIMITER $$
CREATE TRIGGER maj_total 
AFTER INSERT ON lignedecommande
FOR EACH ROW
BEGIN 
DECLARE id_com INT ;
DECLARE tot Decimal ;
SET id_com = NEW.id_commande ;
SET tot = (SELECT SUM(prix*quantite) FROM lignedecommande WHERE id_commande=id_com);
UPDATE commande SET total=tot WHERE id=id_com ;
END $$

DELIMITER ;


INSERT INTO lignedecommande (id_commande, id_produit, quantite, prix) 
VALUES ('2', '3', '5', '10.00')

-- Le total est a 200.00 après l'insertion.


-- 2.Ce trigger ne fonctionne que lorsque l'on ajoute des produits, les modifications ou suppressions ne permettent pas de recalculer le total. Comment pourrait-on faire ?

-- Faire un TRIGGER pour les modifications 
DROP TRIGGER IF EXISTS maj2_total;

DELIMITER $$

CREATE TRIGGER maj2_total
AFTER UPDATE ON lignedecommande
FOR EACH ROW
BEGIN 
DECLARE id_com INT ;
DECLARE tot Decimal ;
SET id_com = New.id_commande ;
SET tot = (SELECT SUM(prix*quantite) FROM lignedecommande WHERE id_commande=id_com);
UPDATE commande SET total=tot WHERE id=id_com ;
END $$

DELIMITER ;

UPDATE lignedecommande SET prix = 13.00 where id_produit = 2;
-- Les modifications sont visibles , quand l'id_produit est 2 le prix est de 13.00

-- Faire un TRIGGER pour les suppressions
DROP TRIGGER IF EXISTS maj3_total;

DELIMITER $$

CREATE TRIGGER maj3_total
AFTER DELETE ON lignedecommande
FOR EACH ROW
BEGIN 
 DECLARE id_com INT ;
DECLARE tot Decimal ;
SET id_com = OLD.id_commande ;
SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande=id_com);
UPDATE commande SET total=tot WHERE id=id_com ;
END $$

DELIMITER ;

DELETE FROM lignedecommande WHERE id_produit = 4;
-- il y a une modification sur la commande 2 car elle compte un produit qui a pour id 4


-- 3.Un champ remise était prévu dans la table commande. Comment pourrait-on le prendre en compte ?

-- Faire un TRIGGER qui prend en compte les remises
DROP TRIGGER IF EXISTS maj4_total;

DELIMITER $$

CREATE TRIGGER maj4_total
AFTER INSERT ON lignedecommande
FOR EACH ROW
BEGIN 
DECLARE id_com INT ;
DECLARE tot Decimal ;
SET id_com = New.id_commande ;
SET tot = (SELECT SUM(prix*quantite) FROM lignedecommande WHERE id_commande=id_com);
UPDATE commande SET total = ((tot * remise) / 100) WHERE id=id_com ;
END $$

DELIMITER ;

INSERT INTO lignedecommande (id_commande, id_produit, quantite, prix) 
VALUES ('2', '3', '3', '10.00')
 



