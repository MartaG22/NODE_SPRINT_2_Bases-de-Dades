const database = 'culdampolla';
const collection = 'clients';

// Create a new database.
use(culdampolla);

// Create a new collection.
db.createCollection(proveidors);

db.proveidors.insertMany(
    [
        {
            _id: "000000000000000000000001",
            nom_proveidor:  'les_millors_ulleres',
            telefon: 973823422,
            fax:  973563456,
            nif: 'G34678954'
        },
        {
            _id: "000000000000000000000002",
            nom_proveidor:  'ulleres_molones',
            telefon: 923459644,
            fax: 923459648,
            nif: 'H14485394'
        },
        {
            _id: "000000000000000000000003",
            nom_proveidor: 'best_glasses',
            telefon: 954778565,
            fax: 953886748,
            nif: 'M74835456'
        },
        {
            _id: "000000000000000000000004",
            nom_proveidor: 'safag',
            telefon: 971854872,
            fax: 971482454,
            nif: 'U23492324'
        },       
    ])
