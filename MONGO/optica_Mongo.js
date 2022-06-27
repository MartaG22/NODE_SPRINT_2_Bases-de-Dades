// https://www.youtube.com/watch?v=lWMemPN9t6Q

// https://www.tutorialesprogramacionya.com/mongodbya/detalleconcepto.php?punto=26&codigo=26&inicio=20
// https://www.mongodb.com/docs/manual/


// npm install mongodb

use('optica_CULDAMPOLLA');

db.dropDatabase();

use('optica_CULDAMPOLLA');
db.createCollection('proveidors');

db.proveidors.insertMany(
    [
        {
            id: 1,
            nom_proveidor:  'les_millors_ulleres',
            telefon: 973823422,
            fax:  973563456,
            nif: 'G34678954'
        },
        {
            id: 2,
            nom_proveidor:  'ulleres_molones',
            telefon: 923459644,
            fax: 923459648,
            nif: 'H14485394'
        },
        {
            id: 3,
            nom_proveidor: 'best_glasses',
            telefon: 954778565,
            fax: 953886748,
            nif: 'M74835456'
        },
        {
            id: 3,
            nom_proveidor: 'safag',
            telefon: 971854872,
            fax: 971482454,
            nif: 'U23492324'
        },       
    ]),

db.clients.drop();
db.clients.insertMany([
    {
        _id: ObjectId("458525ff55ff55f48aaaaa03"), 
        nom: 
        primer_cognom:
        segon_cognom:
        adreza: {
            carrer: 
            numero: 
            pis:
            porta:
            ciutat: 
            codi_postal:
            pais: 
        },
        telefon:
        correu_electronic: 
        data_registre:        
        recomanacio:
    }
])

{
    "_id": {
      "$oid": "62b983e905342e13b2013384"
          "nom": 'Irene',
          "primer_cognom": 'García',
          "segon_cognom": 'Fernandez',
          "adreza": {
              "carrer": 'Carrer Còrsega',
              "numero": 458,
              "pis": 3,
              "porta": 3,
              "ciutat": 'Barcelona',
              "codi_postal": 08025
              "pais": 'Espanya'
          },
          "telefon": 933555334,
          "correu_electronic":'irenegf@yahoo.es',
          "data_registre":'2012-12-29'
      }
  
    }
  }