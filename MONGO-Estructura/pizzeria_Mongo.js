db.botigues.drop();
db.botigues.insertMany(
    [
        {
            "_id": ObjectId("000000000000000000000001"),
            "nom_botiga": "botiga_Barcelona",
            "adreza": {
                "carrer": 'Carrer Indústria',
                "numero": 145,
                "pis": 3,
                "porta": 3,
                "localitat": 'Barcelona',
                "codi_postal": 08025,
                "provincia": "Barcelona",
            },
        },
        {
            "_id": ObjectId("000000000000000000000002"),
            "nom_botiga": "botiga_Tarragona",
            "adreza": {
                "carrer": 'Carrer dels Arcs',
                "numero": 34,
                "ciutat": 'Comarruga',
                "codi_postal": 43880,
                "provincia": "Tarragona",
            },
        },
        {
            "_id": ObjectId("000000000000000000000003"),
            "nom_botiga": "botiga_Lleida",
            "adreza": {
                "carrer": 'Carrer de Pere III',
                "numero": 7,
                "ciutat": 'Figueres',
                "codi_postal": 17600,
                "provincia": "Lleida",
            },
        },
        {
            "_id": ObjectId("000000000000000000000004"),
            "nom_botiga": "botiga_Girona",
            "adreza": {
                "carrer": 'Passatge del Mig',
                "numero": 16,
                "ciutat": 'Montsonís',
                "codi_postal": 17600,
                "provincia": "Girona",
            }
        }

    ]
);


db.clients.drop();
db.clients.insertMany(
    [
        {
            "_id": ObjectId("000000000000000000000005"),
            "nom": 'Irene',
            "primer_cognom": 'García',
            "segon_cognom": 'Fernandez',
            "telefon": 933555334,
            "correu_electronic": 'irenegf@yahoo.es',
            "data_registre": '2012-12-29'
        },
        {
            "_id": ObjectId("000000000000000000000006"),
            "nom": 'Francesc',
            "primer_cognom": 'Romero',
            "segon_cognom": 'Gazquez',
            "telefon": 936547654,
            "correu_electronic": 'francesc@gmail.com',
            "data_registre": '2015-05-17'
        },
        {
            "_id": ObjectId("000000000000000000000007"),
            "nom": 'Jordi',
            "primer_cognom": 'Grau',
            "segon_cognom": 'Calmell',
            "telefon": 932264535,
            "correu_electronic": 'jordigc@gmail.com',
            "data_registre": '2017-09-26'
        },
        {
            "_id": ObjectId("000000000000000000000008"),
            "nom": 'María',
            "primer_cognom": 'López',
            "segon_cognom": 'García',
            "telefon": 972785676,
            "correu_electronic": 'maria@yahoo.es',
            "data_registre": '2018-11-15'
        }
    ]
);

db.productes.drop();
db.productes.insertMany(
    [
        {
            "_id": ObjectId("000000000000000000000009"),
            "tipus_producte": 'beguda',
            "nom": 'Aigua',
            "descripcio": "Ampolla d'aigua de 50 ml. ",
            "preu": 1.20
        // id_categoriaPizza
}])


(1, 'pizza', 5, 'Pizza Hawaiana', 'Massa fina amb trocets de pinya i pernil dolç, formatge', 9.75),
// (2, 'beguda', NULL, 'Aigua', "Ampolla d'aigua de 50 ml. ", 1.20),
(3, 'pizza', 5, 'Pizza Margarita', "Tomàquet, mozzarella, oli d'oliva i orenga", 8.10),
(4, 'pizza', 4, 'Pizza Carbonara', 'Massa gruixuda amb base de tomàquet, amb bacon, ceba, formatge emmental i salsa carbonara, amb orenga', 9.50),
(5, 'beguda', NULL, 'Coca-cola', 'Llauna de coca-cola, de 33 ml.', 1.60),
(6, 'beguda', NULL, 'Aquarius', 'Llauna de Aquairius de 33 ml.', 1.60),
(7, 'hamburguesa', NULL, 'Hamburguesa clàssica', 'Hamburguesa de vedella, enciam, tomàquet i ceba caramelitzada', 7.15),
(8, 'hamburguesa', NULL, 'Hamburguesa completa',  'Hamburguesa de vedella, enciam, tomàquet, cogombre, ceba caramelitzada, ou fregit, salsa maionesa', 8.80);
