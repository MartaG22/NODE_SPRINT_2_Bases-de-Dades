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
db.restaurants.find({"cuisine":{$not: /American/}, "grades.score": {$gt:70},"address.coord":{$lte: -65.754168}});
db.restaurants.find({"cuisine":{$not: /American/}, "grades.score": {$gt:70}, "address.coord": {$lte: -65.754168}});
db.restaurants.find({"cuisine":{$not: /American/}, "grades.grade": {$regex: /A/}, "borough": {$not: /Brooklyn/}}).sort({"cuisine": -1});
db.restaurants.find({"name": {$regex: /^Wil/}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"name": {$regex: /ces$/}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"name": {$regex: /Reg/i}}, {"name":1, "restaurant_id":1,  "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"borough": "Bronx"},  {$or: [{"cuisine": {$regex: /American/}, "cuisine": {$regex: /Chinese/}}]});
db.restaurants.find({$or: [{"borough": "Staten Island"}, {"borough": "Queens"}, {"borough": "Bronx"}, {"borough": "Brooklyn"}]},{"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({$nor: [{"borough": "Staten Island"}, {"borough": "Queens"}, {"borough": "Bronx"}, {"borough": "Brooklyn"}]},{"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"grades.score": {$lte: 10}}, {"name":1, "restaurant_id":1, "borough":1, "grades.score":1, "cuisine":1, "_id":0});
db.restaurants.find({$or: [{"cuisine": ("Seafood", "American", "Chinese")}, {"name": {$regex: /^Wil/}}]}, {"name":1, "restaurant_id":1, "borough":1, "cuisine":1, "_id":0});
db.restaurants.find({"grades.grade": "A", "grades.score": 11, "grades.date": ISODate("2014-08-11T00:00:00Z")}, {"restaurant_id":1, "name":1, "grades":1, "_id":0}).pretty();
db.restaurants.find({"grades.1.grade": "A", "grades.1.score": 9, "grades.1.date": ISODate("2014-08-11T00:00:00Z")}, {"restaurant_id":1, "name":1, "grades.grade":1});
db.restaurants.find({"address.coord.1": {$gt: 42, $lte: 52}},{"restaurant_id":1, "name":1, "address":1});
db.restaurants.find({}).sort({"cuisine": 1});
db.restaurants.find({}).sort({"cuisine": -1});
db.restaurants.find({},{"cuisine": 1, "borough": 1}).sort({"cuisine": 1, "borough": -1});



db.restaurants.find({"name": {$regex: /mon/i}}, {"name":1, "borough":1, "address.coord":1, "cuisine":1, "_id":0});
db.restaurants.find({"name": {$regex: /^Mad/}}, {"name":1, "borough":1, "address.coord":1, "cuisine":1, "_id":0});