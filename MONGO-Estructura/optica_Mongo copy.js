// https://www.youtube.com/watch?v=lWMemPN9t6Q

// const { ObjectId } = require("mongodb");

// https://www.tutorialesprogramacionya.com/mongodbya/detalleconcepto.php?punto=26&codigo=26&inicio=20
// https://www.mongodb.com/docs/manual/

// const { MongoClient }  = require('mongodb');
// const url = 'mongodb://localhost:27017';
// const proveidors = new MongoClient(url);


// npm install mongodb



// use('optica_CULDAMPOLLA');

// db.dropDatabase();

// db.createCollection(proveidors);

db.proveidors.insertMany(
    [
        {
            "_id": "000000000000000000000001",
            "nom_proveidor":  'les_millors_ulleres',
            "telefon": 973823422,
            "fax":  973563456,
            "nif": 'G34678954'
        }
    ])