-- Création d'un déclencheur

/*Créer une table commander_articles constituées de colonnes :
codart : id du produit
qte : quantité à commander
date : date du jour*/

DROP TABLE IF EXISTS commander_articles;
CREATE TABLE IF NOT EXISTS commander_articles (
  codart INT(11) NOT NULL,
  qte INT(11) NOT NULL,
  date DATE NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Créer un déclencheur after_products_update sur la table products : lorsque le stock physique devient inférieur au stock d'alerte, une nouvelle ligne est insérée dans la table commander_articles.

DELIMITER $$

CREATE TRIGGER after_products_update 
AFTER UPDATE ON products
FOR EACH ROW
BEGIN 
DECLARE id_prod INT ;
SET id_prod = NEW.pro_id ;
IF ((CAST(NEW.pro_stock AS signed INT) - CAST(New.pro_stock_alert AS signed INT)) < 0 AND (id_prod NOT IN (SELECT codart FROM commander_articles))) THEN 
INSERT INTO commander_articles VALUES (id_prod,CAST(NEW.pro_stock_alert AS signed INT) - CAST(NEW.pro_stock AS signed INT),(SELECT current_date())) ;
ELSE IF ((CAST(NEW.pro_stock AS signed INT) - CAST(New.pro_stock_alert AS signed INT)) < 0 ) THEN
UPDATE commander_articles SET qte = CAST(NEW.pro_stock_alert AS signed INT) - CAST(NEW.pro_stock AS signed INT), date = (SELECT current_date())  WHERE codart=id_prod ;
END IF;
END IF;
    
END $$

DELIMITER ;

-- Il n'y a pas de ligne crée dans commander_articles 
UPDATE products SET pro_stock = 6 WHERE pro_id = 8; 

-- Une ligne a été crée dans commander_articles avec qte = 1 
UPDATE products SET pro_stock = 4 WHERE pro_id = 8; 

-- La ligne a été modifié dans commander_articles avec qte = 2
UPDATE products SET pro_stock = 3 WHERE pro_id = 8; 