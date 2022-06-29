// https://www.youtube.com/watch?v=lWMemPN9t6Q

// const { ObjectId } = require("mongodb");

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
            "_id": ObjectId("000000000000000000000001"),
            "nom_proveidor":  'les_millors_ulleres',
            "telefon": 973823422,
            "fax":  973563456,
            "nif": 'G34678954'
        },
        {
            "_id": ObjectId("000000000000000000000002"),
            "nom_proveidor":  'ulleres_molones',
            "telefon": 923459644,
            "fax": 923459648,
            "nif": 'H14485394'
        },
        {
            "_id": ObjectId("000000000000000000000003"),
            "nom_proveidor": 'best_glasses',
            "telefon": 954778565,
            "fax": 953886748,
            "nif": 'M74835456'
        },
        {
            "_id": ObjectId("000000000000000000000004"),
            "nom_proveidor": 'safag',
            "telefon": 971854872,
            "fax": 971482454,
            "nif": 'U23492324'
        }   
    ]),

// db.createCollection(clients);

db.clients.insertMany([
    {
        "_id": ObjectId("000000000000000000000005"),
        "nom":'Irene',
        "primer_cognom": 'García',
        "segon_cognom": 'Fernandez',
        "adreza": {
            "carrer": "Carrer d'Àngel Guimerà",
            "numero": 42,
            "pis": '3',
            "ciutat": 'Vallirana',
            "codi_postal": 08759,
            "pais": 'Espanya'
        },
        "telefon": 933555334,
        "correu_electronic": 'irenegf@yahoo.es',
        "data_registre": '2012-12-29'
    },
    {
        "_id": ObjectId("000000000000000000000006"),
        "nom":'Francesc',
        "primer_cognom": 'Romero',
        "segon_cognom": 'Gazquez',
        "adreza": {
            "carrer": 'Carrer Sicília',
            "numero": 110,
            "pis": 'Bx.',
            "porta": "A",
            "ciutat": 'Sabadell',
            "codi_postal": 08013,
            "pais": 'Espanya'
        },
        "telefon": 936547654,
        "correu_electronic": 'francesc@gmail.com',
        "data_registre": '2015-05-17'
    },
    {
        "_id": ObjectId("000000000000000000000007"),
        "nom": 'Jordi',
        "primer_cognom": 'Grau',
        "segon_cognom": 'Calmell',
        "adreza": {
            "carrer": 'Carrer Major',
            "numero": 30,
            "pis": 1,
            "porta": 1,
            "ciutat": 'Sant Celoni',
            "codi_postal": 08740,
            "pais": 'Espanya'
        },
        "telefon": 932264535,
        "correu_electronic": 'jordigc@gmail.com',
        "data_registre": '2017-09-26'
        // "recomanacio": ObjectId("000000000000000000000008"),
    }
])