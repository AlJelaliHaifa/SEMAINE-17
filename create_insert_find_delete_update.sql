-- creation de la base de donnée gescom_afpa
use gescom_afpa

-- creation de la collection categories
db.createCollection("categories")

-- Insertion d'éléments dans la collection categories
db.categories.insertOne({ 
                    "cat_id": 2,
                    "cat_name": "Outillage manuel",               
                    "cat_parent_id": "NULL",                                                                   
                   })

 db.categories.insertOne({ 
                    "cat_id": 3,
                    "cat_name": "Outillage mécanique",               
                    "cat_parent_id": "NULL",                                                                   
                   })

 db.categories.insertOne({ 
                    "cat_id": 4,
                    "cat_name": "Plants et semis",               
                    "cat_parent_id": "NULL",                                                                   
                   })

db.categories.insertOne({ 
                    "cat_id": 5,
                    "cat_name": "Arbres et arbustes",               
                    "cat_parent_id": "NULL",                                                                   
                   })

db.categories.insertOne({ 
                    "cat_id": 6,
                    "cat_name": "Pots et accessoires",               
                    "cat_parent_id": "NULL",                                                                   
                   })

db.categories.insertOne({ 
                    "cat_id": 7,
                    "cat_name": "Mobilier de jardin",               
                    "cat_parent_id": "NULL",                                                                   
                   })

db.categories.insertOne({ 
                    "cat_id": 8,
                    "cat_name": "Matériaux",               
                    "cat_parent_id": "NULL",                                                                   
                   })


-- creation de la collection countries
db.createCollection("countries")

-- Insertion d'éléments dans la collection countries
db.countries.insertOne({ 
                    "cou_id": "AD",
                    "cou_name": "Andorre",                                                                                 
                   })

db.countries.insertOne({ 
                    "cou_id": "AE",
                    "cou_name": "Émirats Arabes Unis",                                                                                 
                   })

db.countries.insertOne({ 
                    "cou_id": "AF",
                    "cou_name": "Afghanistan",                                                                                 
                   })

db.countries.insertOne({ 
                    "cou_id": "AG",
                    "cou_name": "Antigua-et-Barbuda",                                                                                 
                   })

db.countries.insertOne({ 
                    "cou_id": "AI",
                    "cou_name": "Anguilla",                                                                                 
                   })

db.countries.insertOne({ 
                    "cou_id": "AL",
                    "cou_name": "ALbanie",                                                                                 
                   })


db.countries.insertOne({ 
                    "cou_id": "AM",
                    "cou_name": "Arménie",                                                                                 
                   })


-- creation de la collection produit
db.createCollection("produits")

-- Insertion d'éléments dans la collection produits
db.produits.insertOne({ 
                    "pro_id":7,
                    "pro_cat_id":27,
                    "pro_ref": "barb001",
                    "pro_name": "Aramis",               
                    "pro_desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In porttitor sit amet ipsum sit amet dapibus. Cras suscipit neque ac magna sagittis lobortis. Duis venenatis enim ac nisl luctus, a scelerisque velit porttitor. Integer nec massa quis urna mollis consectetur et et nisl. Nullam eget nunc vitae nisl convallis faucibus. Vestibulum dapibus, metus nec molestie lobortis, nunc sem mollis tortor, et auctor dolor nunc at nisi. Pellentesque sit amet turpis nisi.",
                    "pro_price": 110.00,
                    "pro_stock": 2,
                    "pro_stock_alert": 5, 
                    "pro_color":"Brun",
                    "pro_picture": "jpg",
                    "pro_add_date": new Date('2018-04-18 00:00:00'),    
                    "pro_update_date": new Date('2018-11-14 00:00:00'),  
                    "pro_ean": 0,
                    "pro_publish": 0,
                    "pro_sup_id": 4,                                                             
                   })

  db.produits.insertOne({ 
                    "pro_id": 8,
                    "pro_cat_id": 27,
                    "pro_ref": "barb002",
                    "pro_libelle": "Athos",               
                    "pro_desc": "Curabitur pellentesque posuere luctus. Sed et risus vel quam pharetra pretium non quis odio. Praesent varius risus vel orci ultrices tincidunt.",
                    "pro_price": 249.99,
                    "pro_stock": 0,
                    "pro_stock_alert": 5, 
                    "pro_color":"Noir",
                    "pro_picture": "jpg",
                    "pro_add_date": new Date('2016-06-14 00:00:00'),    
                    "pro_update_date": new Date(),  
                    "pro_ean": 0,
                    "pro_publish": 0,
                    "pro_sup_id": 4,                                                              
                   })

db.produits.insertOne({
                    "pro_id": 11,
                    "pro_cat_id": 27,
                    "pro_ref": "barb003",
                    "pro_libelle": "Clatronic",               
                    "pro_desc": "Fusce rutrum odio sem, quis finibus nisl finibus a. Praesent dictum ex in lectus porta, vitae varius lacus eleifend. Sed sed lacinia mi, sed egestas odio. Integer a congue lectus.",
                    "pro_price": 135.90,
                    "pro_stock": 10,
                    "pro_stock_alert": 5, 
                    "pro_color":"Chrome",
                    "pro_picture": "jpg",
                    "pro_add_date": new Date('2017-10-18 00:00:00'),    
                    "pro_update_date": new Date('2018-08-23 00:00:00'),  
                    "pro_ean": 0,
                    "pro_publish": 0,
                    "pro_sup_id": 3,                                                              
                  })

db.produits.insertOne({
                    "pro_id": 12,
                    "pro_cat_id": 27,
                    "pro_ref": "barb004",
                    "pro_libelle": "Camping",               
                    "pro_desc": "Phasellus auctor mattis justo, in semper urna congue eget. Nunc sit amet nunc sed dui fringilla scelerisque a eget sem. Aenean cursus eros vehicula arcu blandit, sit amet faucibus leo finibus. Duis pharetra felis eget viverra tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
                    "pro_price": 100.00,
                    "pro_stock": 5,
                    "pro_stock_alert": 5, 
                    "pro_color":"Noir",
                    "pro_picture": "jpg",
                    "pro_add_date": new Date('2018-08-20 00:00:00'),    
                    "pro_update_date": new Date(),  
                    "pro_ean": 0,
                    "pro_publish": 1,
                    "pro_sup_id": 4,                                                              
                  })

db.produits.insertOne({
                    "pro_id": 10,
                    "pro_cat_id": 2,
                    "pro_ref": "SEC-B",
                    "pro_libelle": "Red",               
                    "pro_desc": "Phasellus ac gravida lorem. Aliquam sed aliquam nisl. Etiam non ornare sapien. Aenean ut tellus non risus varius bibendum quis vel ligula.",
                    "pro_price": 14.99,
                    "pro_stock": 16,
                    "pro_stock_alert": 5, 
                    "pro_color":"Rouge",
                    "pro_picture": "jpg",
                    "pro_add_date": new Date('2018-08-05 00:00:00'),    
                    "pro_update_date": new Date(),  
                    "pro_ean": 0,
                    "pro_publish": 0,
                    "pro_sup_id": 3,                                                              
                  })

-- Selection d'un élément de la collection categories par l'Id
db.categories.find( { _id : ObjectId("609a78b7b6ce10e635be393e") } ) 

-- Modification de "NULL" de la collection categories par 0
db.categories.updateOne( { "cat_id": "2" }, { $set :{ "cat_parent_id": 0 }} )

-- Suppression
db.countries.deleteOne( { "cou_id": "AM" })