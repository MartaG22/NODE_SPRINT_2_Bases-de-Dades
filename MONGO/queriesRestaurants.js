use(restaurantsMongo);


// 1. Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants.
db.restaurants.find();

// 2. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine per tots els documents en la col·lecció Restaurants.
db.restaurants.find({},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1});

// 3. Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però exclou el camp _id per tots els documents en la col·lecció Restaurants.
db.restaurants.find({},{"restaurant_id":1, "name":1, "borough":1, "cuisine":1, "_id":0});

// 4. Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però exclou el camp _id per tots els documents en la col·lecció Restaurants.
// db.restaurants.find({address: {"zipcode":1}}, {"restaurant_id":1, "name":1, "borough":1, "_id":0});

// 5. Escriu una consulta per mostrar tots els restaurants que estan en el Bronx.
db.restaurants.find({"borough": "Bronx"});

// 6. Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx.
db.restaurants.find({"borough": "Bronx"}).limit(5);

// 7. Escriu una consulta per mostrar el pròxim 5 restaurants després de saltar els primers 5 del Bronx.
// db.restaurants.find({"borough": "Bronx"});

// 8. Escriu una consulta per trobar els restaurants que tenen un score de més de 90.
// db.restaurants.find({"score":})

// 9. Escriu una consulta per trobar els restaurants que tenen un score de més de 80 però menys que 100.
// 10. Escriu una consulta per trobar els restaurants que es localitzen en valor de latitud menys de -95.754168.
// 11. Escriu una consulta de MongoDB per a trobar els restaurants que no preparen cap cuisine de 'American' i la seva qualificació és superior a 70 i latitud inferior a -65.754168.