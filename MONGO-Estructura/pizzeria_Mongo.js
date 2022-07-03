// https://www.ramoncarrasco.es/es/content/es/kb/126/como-hacer-consultas-en-mongodb-operadores



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
                "provincia": "Barcelona"
            },
            "empleats": [
                {
                    "_id": ObjectId("000000000000000000000100"),
                    "nom_empleat": 'Gerard',
                    "primer_cognom": 'Vereau',
                    "segon_cognom": 'Sanz',
                    "NIF": '45345346T',
                    "telefon": 935456234,
                    "correu_electronic": 'gerardvs@gmail.com',
                    "carrec, id_botiga": 'cuiner'
                },
                {
                    "_id": ObjectId("000000000000000000000101"),
                    "nom_empleat": 'Roger',
                    "primer_cognom": 'Mas',
                    "segon_cognom": 'Pou',
                    "NIF": '34353423Q',
                    "telefon": 936533464,
                    "correu_electronic": 'rogermas@yahoo.es',
                    "carrec, id_botiga": 'repartidor'
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000002"),
            "nom_botiga": "botiga_Tarragona",
            "adreza": {
                "carrer": 'Carrer dels Arcs',
                "numero": 34,
                "ciutat": 'Comarruga',
                "codi_postal": 43880,
                "provincia": "Tarragona"
            },
            "empleats": [
                {
                    "_id": ObjectId("000000000000000000000102"),
                    "nom_empleat": 'Montse',
                    "primer_cognom": 'Rodríguez',
                    "segon_cognom": 'Estévez',
                    "NIF": '43675456T',
                    "telefon": 933556753,
                    "correu_electronic": 'montse@hotmail.com',
                    "carrec, id_botiga": 'cuiner'
                },
                {
                    "_id": ObjectId("000000000000000000000103"),
                    "nom_empleat": 'Olga',
                    "primer_cognom": 'Gómez',
                    "segon_cognom": 'Sanjuan',
                    "NIF": '84734534K',
                    "telefon": 934654567,
                    "correu_electronic": 'olga.san@gmail.com',
                    "carrec, id_botiga": 'repartidor'
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000003"),
            "nom_botiga": "botiga_Lleida",
            "adreza": {
                "carrer": 'Carrer de Pere III',
                "numero": 7,
                "ciutat": 'Figueres',
                "codi_postal": 17600,
                "provincia": "Lleida"
            },
            "empleats": [
                {
                    "_id": ObjectId("000000000000000000000104"),
                    "nom_empleat": 'Joan',
                    "primer_cognom": 'Ballester',
                    "segon_cognom": 'Biosca',
                    "NIF": '34563443V',
                    "telefon": 972385332,
                    "correu_electronic": 'joanbb@gmail.com',
                    "carrec, id_botiga": 'cuiner'
                },
                {
                    "_id": ObjectId("000000000000000000000105"),
                    "nom_empleat": 'Jaume',
                    "primer_cognom": 'Ortega',
                    "segon_cognom": 'Coma',
                    "NIF": '67234534S',
                    "telefon": 972456423,
                    "correu_electronic": 'jaumeortega@gmail.com',
                    "carrec, id_botiga": 'repartidor'
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000004"),
            "nom_botiga": "botiga_Girona",
            "adreza": {
                "carrer": 'Passatge del Mig',
                "numero": 16,
                "ciutat": 'Montsonís',
                "codi_postal": 17600,
                "provincia": "Girona"
            },
            "empleats": [
                {
                    "_id": ObjectId("000000000000000000000106"),
                    "nom_empleat": 'Joaquim',
                    "primer_cognom": 'Bosch',
                    "segon_cognom": 'Giner',
                    "NIF": '24535435P',
                    "telefon": 935739534,
                    "correu_electronic": 'joaquim.bosch@gmail.com',
                    "carrec, id_botiga": 'cuiner'
                },
                {
                    "_id": ObjectId("000000000000000000000107"),
                    "nom_empleat": 'Susana',
                    "primer_cognom": 'Yebra',
                    "segon_cognom": 'Magaz',
                    "NIF": '85738544J',
                    "telefon": 935673422,
                    "correu_electronic": 'susana@yahoo.com',
                    "carrec, id_botiga": 'repartidor'
                }
            ]
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
            "data_registre": '2012-12-29',
            "adreza": {
                "carrer": "Carrer d'Àngel Guimerà",
                "numero": 42,
                "pis": '3',
                "ciutat": 'Badalona',
                "provincia": "Barcelona",
                "codi_postal": 08912
            },
            "comandes": [
                {
                    "_id": ObjectId("000000000000000000001000"),
                    "dataHora_comanda": new Date('2022-08-20 20:05:00'),
                    "botiga_id": ObjectId("000000000000000000000001"),
                    "tipus_comanda": 'botiga',
                    "productes_comanda": [
                        {
                            "producte": ObjectId("000000000000000000000009"),
                            "quantitat": 3,
                            "preu": 3.60
                        },
                        {
                            "producte": ObjectId("000000000000000000000016"),
                            "quantitat": 2,
                            "preu": 19.00
                        }
                    ],
                    "repartidor_id": ObjectId("000000000000000000000100"),
                    "dataHora_entrega": new Date('2022-08-20 20:50:00')
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000006"),
            "nom": 'Francesc',
            "primer_cognom": 'Romero',
            "segon_cognom": 'Gazquez',
            "telefon": 936547654,
            "correu_electronic": 'francesc@gmail.com',
            "data_registre": new Date('2015-05-17'),
            "adreza": {
                "carrer": 'Carrer Sicília',
                "numero": 110,
                "pis": 'Bx.',
                "porta": "A",
                "ciutat": 'Sabadell',
                "codi_postal": 08013,
                "pais": 'Espanya'
            },
        },
        {
            "_id": ObjectId("000000000000000000000007"),
            "nom": 'Jordi',
            "primer_cognom": 'Grau',
            "segon_cognom": 'Calmell',
            "telefon": 932264535,
            "correu_electronic": 'jordigc@gmail.com',
            "data_registre": new Date('2017-09-26'),
            "adreza": {
                "carrer": 'Carrer Major',
                "numero": 30,
                "pis": 1,
                "porta": 1,
                "ciutat": 'Sant Celoni',
                "codi_postal": 08740,
                "pais": 'Espanya'
            },
            "comandes": [
                {
                    "_id": ObjectId("000000000000000000001000"),
                    "dataHora_comanda": new Date('2022-05-24 21:00:00'),
                    "botiga_id": ObjectId("000000000000000000000004"),
                    "tipus_comanda": 'domicili',
                    "productes_comanda": [
                        {
                            "producte": ObjectId("000000000000000000000012"),
                            "quantitat": 2,
                            "preu": 14.30
                        },
                        {
                            "producte": ObjectId("000000000000000000000011"),
                            "quantitat": 1,
                            "preu": 1.60
                        },
                        {
                            "producte": ObjectId("000000000000000000000010"),
                            "quantitat": 1,
                            "preu": 1.60
                        }
                    ],
                    "repartidor_id": ObjectId("000000000000000000000105"),
                    "dataHora_entrega": new Date('2022-05-24 21:42:00')
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000008"),
            "nom": 'María',
            "primer_cognom": 'López',
            "segon_cognom": 'García',
            "telefon": 972785676,
            "correu_electronic": 'maria@yahoo.es',
            "data_registre": new Date('2018-11-15'),
            "adreza": {
                "carrer": 'Carrer Còrsega',
                "numero": 452,
                "pis": 3,
                "porta": 3,
                "ciutat": 'Barcelona',
                "codi_postal": 08025,
                "pais": 'Espanya'
            }
        }
    ]
);

db.productes.drop();
db.productes.insertMany(
    [
        {
            "_id": ObjectId("000000000000000000000009"),
            "tipus": 'beguda',
            "nom": 'Coca-cola',
            "descripcio": "Ampolla d'aigua de 50 ml. ",
            "preu": 1.20
        },
        {
            "_id": ObjectId("000000000000000000000010"),
            "tipus": 'beguda',
            "nom": 'Coca-cola',
            "descripcio": 'Llauna de coca-cola, de 33 ml.',
            "preu": 1.60
        },
        {
            "_id": ObjectId("000000000000000000000011"),
            "tipus": 'beguda',
            "nom": 'Aquarius',
            "descripcio": 'Llauna de Aquairius de 33 ml.',
            "preu": 1.60
        },
        {
            "_id": ObjectId("000000000000000000000012"),
            "tipus": 'hamburguesa',
            "nom": 'Hamburguesa clàssica',
            "descripcio": 'Hamburguesa de vedella, enciam, tomàquet i ceba caramelitzada',
            "preu": 7.15
        },
        {
            "_id": ObjectId("000000000000000000000013"),
            "tipus": 'hamburguesa',
            "nom": 'Hamburguesa completa',
            "descripcio": 'Hamburguesa de vedella, enciam, tomàquet, cogombre, ceba caramelitzada, ou fregit, salsa maionesa',
            "preu": 8.80
        },
        {
            "_ id": ObjectId("000000000000000000000014"),
            "tipus": 'pizza',
            "nom": 'Pizza Hawaiana',
            "categoria_pizza": 'massa fina',
            "descripcio": 'Massa fina amb trocets de pinya i pernil dolç, formatge',
            "preu": 9.75
        },
        {
            "_ id": ObjectId("000000000000000000000015"),
            "tipus": 'pizza',
            "nom": 'Pizza Margarita',
            "categoria_pizza": 'massa fina',
            "descripcio": "Tomàquet, mozzarella, oli d'oliva i orenga",
            "preu": 9.75
        },
        {
            "_ id": ObjectId("000000000000000000000016"),
            "tipus": 'pizza',
            "nom": 'Pizza Carbonara',
            "categoria_pizza": 'massa gruixuda',
            "descripcio": 'Massa gruixuda amb base de tomàquet, amb bacon, llàmines de xampinyons, ceba, formatge emmental i salsa carbonara, amb orenga',
            "preu": 9.50
        }
    ]
)

