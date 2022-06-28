use(restaurantsMongo);


// 1. Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants.
db.restaurants.find();

// 2. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine per tots els documents en la col·lecció Restaurants.
db.restaurants.find({},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});

// 3. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però exclou el camp _id per tots els documents en la col·lecció Restaurants.
db.restaurants.find({},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1, "_id":0});

// 4. Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però exclou el camp _id per tots els documents en la col·lecció Restaurants.
db.restaurants.find({}, {"restaurant_id":1, "name":1, "borough":1, "address.zipcode":1, "_id":0});

// 5. Escriu una consulta per mostrar tots els restaurants que estan en el Bronx.
db.restaurants.find({"borough": "Bronx"});

// 6. Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx.
db.restaurants.find({"borough": "Bronx"}).limit(5);

// 7. Escriu una consulta per mostrar el pròxim 5 restaurants després de saltar els primers 5 del Bronx.
db.restaurants.find({"borough": "Bronx"}).skip(5).limit(5);

// 8. Escriu una consulta per trobar els restaurants que tenen un score de més de 90.
db.restaurants.find({"grades.score": {$gt:90}});

// 9. Escriu una consulta per trobar els restaurants que tenen un score de més de 80 però menys que 100.
db.restaurants.find({"grades.score": {$gt:80, $lte:100}});

// 10. Escriu una consulta per trobar els restaurants que es localitzen en valor de latitud menys de -95.754168.
db.restaurants.find({"address.coord":{$lte: -95.754168}});

// 11. Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i la seva qualificació és superior a 70 i latitud inferior a -65.754168.
db.restaurants.find({"cuisine":{$not: /American/}, "grades.score": {$gt:70},"address.coord":{$lte: -65.754168}});

// 12. Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van aconseguir un marcador més de 70 i localitzat en la longitud menys que -65.754168. Nota: Fes aquesta consulta sense utilitzar $and operador.
db.restaurants.find({"cuisine":{$not: /American/}, "grades.score": {$gt:70}, "address.coord": {$lte: -65.754168}});

// 13. Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van obtenir un punt de grau 'A' no pertany a Brooklyn. S'ha de mostrar el document segons la cuisine en ordre descendent.
db.restaurants.find({"cuisine":{$not: /American/}, "grades.grade": {$regex: /A/}, "borough": {$not: /Brooklyn/}}).sort({"cuisine": -1});

// 14. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Wil' com les tres primeres lletres en el seu nom.
db.restaurants.find({"name": {$regex: /^Wil/}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});

// 15. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'ces' com les últimes tres lletres en el seu nom.
db.restaurants.find({"name": {$regex: /ces$/}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});

// 16. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Reg' com tres lletres en algun lloc en el seu nom.
db.restaurants.find({"name": {$regex: /Reg/i}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});

// 17. Escriu una consulta per trobar els restaurants que pertanyen al Bronx i van preparar qualsevol plat americà o xinès.
db.restaurants.find({"borough": "Bronx"},  {$or: [{"cuisine": {$regex: /American/}, "cuisine": {$regex: /Chinese/}}]});

// 18. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que pertanyen a Staten Island o Queens o Bronx o Brooklyn.
db.restaurants.find({$or: [{"borough": "Staten Island"}, {"borough": "Queens"}, {"borough": "Bronx"}, {"borough": "Brooklyn"}]},{"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});

// 19. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que no pertanyen a Staten Island o Queens o Bronx o Brooklyn.
db.restaurants.find({$nor: [{"borough": "Staten Island"}, {"borough": "Queens"}, {"borough": "Bronx"}, {"borough": "Brooklyn"}]},{"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});

// 20. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que aconsegueixin un marcador que no és més de 10.
db.restaurants.find(({"grades.score": {$lte: 10}}), {"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});

// 21. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que preparen peix excepte 'American' i 'Chinees' o el name del restaurant comença amb lletres 'Wil'.
db.restaurants.find({$or: [{"cuisine": ("Seafood", "American", "Chinese")}, {"name": {$regex: /^Wil/}}]}, {"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});

// 22. Escriu una consulta per trobar el restaurant_id, name, i grades per a aquells restaurants que aconsegueixin un grau "A" i un score 11 en dades d'estudi ISODate "2014-08-11T00:00:00Z".
/*db.restaurants.find({"date": {$eq:ISODate("2014-08-11T00:00:00Z")}}, {"name":1, "restaurant_id":1, "grades":1, "_id":0});
db.restaurants.find({"grades": {"grade": {$eq: "A"}}}, {'date': {$eq:ISODate('2014-08-11T00:00:00Z')}}, {'restaurant_id': 1, 'name': 1, 'grades': 1});

'date': {$eq:ISODate('2014-08-11T00:00:00Z')
db.restaurants.find( {'grades': {$elemMatch: {'grade': {$eq:'A'}, 'score': {$eq:11}, 'date': {$eq:ISODate('2014-08-11T00:00:00Z')}} }}, {'restaurant_id': 1, 'name': 1, 'grades': 1});
db.restaurants.find( {'date': {$eq:ISODate('2014-08-11T00:00:00Z')}} , {'restaurant_id': 1, 'name': 1, 'grades': 1}); */


// 23. Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants on el 2n element de varietat de graus conté un grau de "A" i marcador 9 sobre un ISODate "2014-08-11T00:00:00Z".
// 24. Escriu una consulta per trobar el restaurant_id, name, adreça i ubicació geogràfica per a aquells restaurants on el segon element del array coord conté un valor que és més de 42 i fins a 52.



// 25. Escriu una consulta per organitzar el nom dels restaurants en ordre ascendent juntament amb totes les columnes.
db.restaurants.find({}).sort({"cuisine": 1});

// 26. Escriu una consulta per organitzar el nom dels restaurants en ordre descendent juntament amb totes les columnes.
db.restaurants.find({}).sort({"cuisine": -1});

// 27. Escriu una consulta per organitzar els restaurants amb el nom de la cuisine en ordre ascendent i pel barri en ordre descendent.
db.restaurants.find({},{"cuisine": 1, "borough": 1}).sort({"cuisine": 1, "borough": -1});

// 28. Escriu una consulta per saber tant si totes les direccions contenen el carrer o no.
// 29. Escriu una consulta que seleccionarà tots els documents en la col·lecció de restaurants on el valor del camp coord és Double.
db.restaurants.find({},{});
db.restaurants.find( {'address.coord': {$type: 'double'}}, {'name': 1,} );


// 30. Escriu una consulta que seleccionarà el restaurant_id, name i grade per a aquells restaurants que retornin 0 com a resta després de dividir el marcador per 7.
// db.restaurants.find({},{"restaurant_id":1, "name":1, "grade"});

// 31. Escriu una consulta per trobar el name de restaurant, borough, longitud i altitud i cuisine per a aquells restaurants que contenen 'mon' com tres lletres en algun lloc del seu nom.
db.restaurants.find({"name": {$regex: /mon/i}}, {"name":1, "borough":1, "address.coord":1, "cuisine":1, "_id":0});

// 32. Escriu una consulta per trobar el name de restaurant, borough, longitud i latitud i cuisine per a aquells restaurants que contenen 'Mad' com primeres tres lletres del seu nom.
db.restaurants.find({"name": {$regex: /^Mad/}}, {"name":1, "borough":1, "address.coord":1, "cuisine":1, "_id":0});



