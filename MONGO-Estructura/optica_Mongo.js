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

db.proveidors.drop();
db.proveidors.insertMany(
    [
        {
            "_id": ObjectId("000000000000000000000001"),
            "nom_proveidor": 'les_millors_ulleres',
            "telefon": 973823422,
            "fax": 973563456,
            "nif": 'G34678954',
            "adreza": {
                "carrer": 'Carrer Còrsega',
                "numero": 452,
                "pis": 3,
                "porta": 3,
                "ciutat": 'Barcelona',
                "codi_postal": 08025,
                "pais": 'Espanya'
            },
            // (543, 'Ray Ban', 1),
            "marques": [
                {
                    "_id": ObjectId("000000000000000000000008"),
                    "marca": 'Ray Ban',
                    "ulleres": [{
                        "_id": ObjectId("000000000000000000000020"),
                        "id_ullera": '1122334455',
                        "model": '0RB3447',
                        "graduacio_esq": 1.25,
                        "graduacio_der": 1.50,
                        "tipus_montura": 'metàl·lica',
                        "color_montura": 'daurat',
                        "color_vidres": 'verd',
                        "preu": 101.95
                    }]
                },
                {
                    "_id": ObjectId("000000000000000000000009"),
                    "marca": 'Hugo Boss',
                    "ullera": [{
                        "_id": ObjectId("000000000000000000000021"),
                        "id_ullera": '1234567890',
                        "model": 'BOSS0680/N',
                        "graduacio_esq": 0.75,
                        "graduacio_der": 1.00,
                        "tipus_montura": 'pasta',
                        "color_montura": 'negre',
                        "color_vidres": 'transparent',
                        "preu": 145.00
                    }],
                    "ullera": [{
                        "_id": ObjectId("000000000000000000000022"),
                        "id_ullera": '1209876547',
                        "model": 'BOSN0500J/B',
                        "graduacio_esq": 1.75,
                        "graduacio_der": 2.00,
                        "tipus_montura": 'flotant',
                        "color_montura": 'negre',
                        "color_vidres": 'transparent',
                        "preu": 145.00
                    }]
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000002"),
            "nom_proveidor": 'ulleres_molones',
            "telefon": 923459644,
            "fax": 923459648,
            "nif": 'H14485394',
            "adreza": {
                "carrer": 'Carrer de Brujas',
                "numero": 101,
                "pis": 1,
                "porta": "A",
                "ciutat": 'Sabadell',
                "codi_postal": 08202,
                "pais": 'Espanya'
            },
            // (743, 'Prada', 2),
            "marques": [
                {
                    "_id": ObjectId("0000000000000000000000010"),
                    "marca": 'Prada',
                    "ulleres": [{
                        "_id": ObjectId("000000000000000000000023"),
                        "id_ullera": '1566778844',
                        "model": 'PR-06YS-09Q5S0',
                        "graduacio_esq": 2.00,
                        "graduacio_der": 1.75,
                        "tipus_montura": 'pasta',
                        "color_montura": 'negre',
                        "color_vidres": 'negre fumat',
                        "preu": 218.95
                    }]
                },
            // (342, 'Tous', 2),
                {
                    "_id": ObjectId("0000000000000000000000011"),
                    "marca": 'Tous',
                    "ulleres": [{
                        "_id": ObjectId("000000000000000000000024"),
                        "id_ullera": '1353345534',
                        "model": 'STOA04 0GGD',
                        "graduacio_esq": 0.00,
                        "graduacio_der": 1.00,
                        "tipus_montura": 'metàl·lica',
                        "color_montura": 'coure',
                        "color_vidres": 'verd',
                        "preu": 180.25
                    }]
                },
            // (234, 'Etnia Barcelona', 2),
                {
                    "_id": ObjectId("0000000000000000000000012"),
                    "marca": 'Etnia Barcelona',
                    "ulleres": [{
                        "_id": ObjectId("000000000000000000000025"),
                        "id_ullera": '1456587988',
                        "model": 'SUN/HVBL-YEL',
                        "graduacio_esq": 0.75,
                        "graduacio_der": 1.00,
                        "tipus_montura": 'pasta',
                        "color_montura": 'groc amb ratlles',
                        "color_vidres": 'groc',
                        "preu": 190.50
                    }]
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000003"),
            "nom_proveidor": 'best_glasses',
            "telefon": 954778565,
            "fax": 953886748,
            "nif": 'M74835456',
            "adreza": {
                "carrer": 'Dumbarton Road',
                "numero": 305,
                "pis": 4,
                "porta": 1,
                "ciutat": 'Glasgow',
                "codi_postal": 55555,
                "pais": 'United Kingdom'
            },
            // (235, 'Timberland', 3),
            "marques": [
                {
                    "_id": ObjectId("000000000000000000000013"),
                    "marca": 'Timberland',
                    "ulleres": [{
                        "_id": ObjectId("000000000000000000000026"),
                        "id_ullera": '1576455754',
                        "model": 'T-9033.938',
                        "graduacio_esq": 1.05,
                        "graduacio_der": 2.00,
                        "tipus_montura": 'flotant',
                        "color_montura": 'platejat',
                        "color_vidres": 'transparents',
                        "preu": 180.25
                    }]
                },
            // (877, 'Ralph Lauren', 3);
                {
                    "_id": ObjectId("000000000000000000000014"),
                    "marca": 'Ralph Lauren',
                    "ullera": [{
                        "_id": ObjectId("000000000000000000000027"),
                        "id_ullera": '1454556464',
                        "model": 'RL9033/938',
                        "graduacio_esq": 1.75,
                        "graduacio_der": 1.25,
                        "tipus_montura": 'metàl·lica',
                        "color_montura": 'negre',
                        "color_vidres": 'transparent',
                        "preu": 130.50
                    }]
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000004"),
            "nom_proveidor": 'safag',
            "telefon": 971854872,
            "fax": 971482454,
            "nif": 'U23492324',
            "adreza": {
                "carrer": 'Carrer de Sant Josep',
                "numero": 35,
                "pis": "Bx.",
                "porta": 2,
                "ciutat": 'Maó',
                "codi_postal": 07703,
                "pais": 'Espanya'
            },
            // (323, 'Carolina Herrera', 3),
            "marques": [
                {
                    "_id": ObjectId("0000000000000000000000015"),
                    "marca": 'Carolina Herrera',
                    "ulleres": [{
                        "_id": ObjectId("000000000000000000000028"),
                        "id_ullera": '1246464675',
                        "model": 'CH-6455.67',
                        "graduacio_esq": 2.50,
                        "graduacio_der": 1.50,
                        "tipus_montura": 'flotant',
                        "color_montura": 'negre',
                        "color_vidres": 'transparents',
                        "preu": 220.85
                    }]
                }
            ]
        }
    ]
),


// db.createCollection(clients);
db.clients.drop();
db.clients.insertMany([
    {
        "_id": ObjectId("000000000000000000000005"),
        "nom": 'Irene',
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
        "nom": 'Francesc',
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
        "data_registre": '2017-09-26',
    }
])