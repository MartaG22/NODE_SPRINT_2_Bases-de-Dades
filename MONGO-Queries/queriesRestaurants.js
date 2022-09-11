db.restaurants.find();
db.restaurants.find({},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});
db.restaurants.find({},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({}, {"restaurant_id":1, "name":1, "borough":1, "address.zipcode":1, "_id":0});
db.restaurants.find({"borough": "Bronx"});
db.restaurants.find({"borough": "Bronx"}).limit(5);
db.restaurants.find({"borough": "Bronx"}).skip(5).limit(5);
db.restaurants.find({"grades.score": {$gt:90}});
db.restaurants.find({"grades.score": {$gt:80, $lte:100}});
db.restaurants.find({"address.coord":{$lte: -95.754168}});
db.restaurants.find({ $and: [{ "cuisine": { $not: /American/ }, "grades.score": { $gt: 70 }, "address.coord.0": { $lte: -65.754168 } }] });    //! Corregida
db.restaurants.find({ "cuisine": { $not: /American/ }, "grades.score": { $gt: 70 }, "address.coord.0": { $lte: -65.754168 } });        //! Corregida
db.restaurants.find({"cuisine":{$not: /American/}, "grades.grade": {$regex: /A/}, "borough": {$not: /Brooklyn/}}).sort({"cuisine": -1});
db.restaurants.find({"name": {$regex: /^Wil/}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"name": {$regex: /ces$/}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"name": {$regex: /Reg/i}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"borough": "Bronx"},  {$or: [{"cuisine": {$regex: /American/}, "cuisine": {$regex: /Chinese/}}]});
db.restaurants.find({$or: [{"borough": "Staten Island"}, {"borough": "Queens"}, {"borough": "Bronx"}, {"borough": "Brooklyn"}]},{"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({$nor: [{"borough": "Staten Island"}, {"borough": "Queens"}, {"borough": "Bronx"}, {"borough": "Brooklyn"}]},{"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"grades.score": {$lte: 10}}, {"name":1, "restaurant_id":1, "borough":1, "grades.score":1, "cuisine":1, "_id":0});
db.restaurants.find({ $and: [{ "cuisine": ("Seafood", "American", "Chinese") }, { "name": { $regex: /^Wil/ } }] }, { "name": 1, "restaurant_id": 1, "borough": 1, "cuisine": 1, "_id": 0 }); //! corregir  NO VA
db.restaurants.find({"grades.grade": "A", "grades.score": 11, "grades.date": ISODate("2014-08-11T00:00:00Z")}, {"restaurant_id":1, "name":1, "grades":1, "_id":0}).pretty();
db.restaurants.find({"grades.1.grade": "A", "grades.1.score": 9, "grades.1.date": ISODate("2014-08-11T00:00:00Z")}, {"restaurant_id":1, "name":1, "grades.grade":1});
db.restaurants.find({"address.coord.1": {$gt: 42, $lte: 52}},{"restaurant_id":1, "name":1, "address":1});
db.restaurants.find({}).sort({"cuisine": 1});
db.restaurants.find({}).sort({"cuisine": -1});
db.restaurants.find({},{"cuisine": 1, "borough": 1}).sort({"cuisine": 1, "borough": -1});
// db.restaurant.find({ "address.street": { $exists: null } });    //! Corregida   NO VA
// db.restaurant.find({ "address.coord": {$type: "double" }});

db.restaurants.find({"name": {$regex: /mon/i}}, {"name":1, "borough":1, "address.coord":1, "cuisine":1, "_id":0});
db.restaurants.find({"name": {$regex: /^Mad/}}, {"name":1, "borough":1, "address.coord":1, "cuisine":1, "_id":0});



//21:
db.restaurants.find()
db.restaurants.find({ $and: [{ cuisine: { $ne: "American " } }, { cuisine: { $ne: "Chinese" } }, { $or: [{ name: { $regex: /fish/i } }, { name: { $regex: /^Wil/i } }] }] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 });

db.restaurants.find({ $and: [{ "cuisine": { $ne: "American", "Chinese" } }, ("Seafood") }, { "name": { $regex: /^Wil/ } }] }, { "name": 1, "restaurant_id": 1, "borough": 1, "cuisine": 1, "_id": 0 }); //! corregir


//!PRUEBAS!
db.restaurants.find({ $sum: { [{ $eq: [{ "address.coord": { $type: "double" } }] }]} });
db.restaurants.find({ $sum: { $cond: [{ $eq: [{ "address.coord": { $type: "double" } }] }] } });

// 11. Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i la seva qualificació és superior a 70 i latitud inferior a -65.754168.
// 12. Escriu una consulta per trobar els restaurants que no preparen cap cuisine de 'American' i van aconseguir un marcador més de 70 i localitzat en la longitud menys que -65.754168. Nota: Fes aquesta consulta sense utilitzar $and operador.
// 21. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que preparen peix excepte 'American' i 'Chinees' o el name del restaurant comença amb lletres 'Wil'.

// 28. Escriu una consulta per saber tant si totes les direccions contenen el carrer o no.
// 29. Escriu una consulta que seleccionarà tots els documents en la col·lecció de restaurants on el valor del camp coord és Double.
// 30. Escriu una consulta que seleccionarà el restaurant_id, name i grade per a aquells restaurants que retornin 0 com a resta després de dividir el marcador per 7.
