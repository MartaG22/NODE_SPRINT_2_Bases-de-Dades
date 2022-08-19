db.usuaris.drop();
db.usuaris.insertMany(
    [
        {
            "_id": ObjectId("000000000000000000000001"),
            "correu": 'pepito@yahoo.com',
            "contrasenya": 'yoPepito',
            "naixement": '2000-10-15',
            "sexe": 'masculí',
            "codi_postal": 25087,
            "pais": 'Espanya',
            "videos": [
                {
                    "id_video": 1,
                    "estat_video": 'públic',
                    "titol_video": "L'Antàrtida",
                    "descripcio_video": "El descobriment de l'Antàrtida",
                    "data_hora_creacio": '2019-11-14',
                    "nom_etiqueta": 'Descobriments'
                },
                {
                    "id_video": 3,
                    "estat_video": 'privat',
                    "titol_video": "Vídeos de l'estiu",
                    "descripcio_video": 'Vídeos de les vacances 2022 i de la festa del poble',
                    "data_hora_creacio": '2022-08-15',
                    "nom_etiqueta": 'Coses meves'
                }
            ]
        },
        {
            "_id": ObjectId("000000000000000000000002"),
            "correu": 'mariadelao@hotmail.com',
            "contrasenya": 'odeOviedo',
            "naixement": '1995-08-15',
            "sexe": 'femení',
            "codi_postal": 10593,
            "pais": 'Espanya'
        },
        {
            "_id": ObjectId("000000000000000000000003"),
            "correu": 'lucca@gmail.com',
            "contrasenya": 'galloClaudio',
            "naixement": '1999-03-27',
            "sexe": 'altres',
            "codi_postal": 00017,
            "pais": 'Itàlia',
            "videos": [
                {
                    "id_video": 2,
                    "estat_video": 'públic',
                    "titol_video": 'Figures fàcils amb Origami',
                    "descripcio_video": "Comencem a fer figures fàcils d'origami, perquè vegis que és més secill d'el que sembla",
                    "data_hora_creacio": '2020-03-14',
                    "nom_etiqueta": 'Manualitats',
                    "like_dislike_videos": 
                        [
                            {
                                "id_like_dislike_video": 1,
                                "like_or_dislike_vide": "dislike",
                                "data_like_dislike_vid": '2022-01-10',
                                "id_usuari": 4
                            },
                            {
                                "id_like_dislike_video": 2,
                                "like_or_dislike_vide": "like",
                                "data_like_dislike_vid": '2021-10-20',
                                "id_usuari": 2
                            }
                        ],
                    "comentaris": [
                        {
                            "id_comentari": 2,
                            "comentari": "No m'agrada. No té res de fàcil",
                            "data_hora_comentari": '2021-10-20',
                            "id_usuari": 4,
                            "like_dislike_comentaris": [
                                {
                                    "id_like_dislike_comentari": 1,
                                    "like_or_dislike_comentari": "dislike",
                                    "data_like_dislike_comentari": '2021-10-14',
                                    "id_usuari": 3
                                }
                            ]
                        },
                        {
                            "id_comentari": 3,
                            "comentari": "M'agrada molt com ho explica",
                            "data_hora_comentari": '2022-01-10',
                            "id_usuari": 2
                        }
                    ]
                }
            ]
        },

        {
            "_id": ObjectId("000000000000000000000004"),
            "correu": 'fulanito@yahoo.com',
            "contrasenya": 'laMontañaMasAlta',
            "naixement": '1973-07-09',
            "sexe": 'masculí',
            "codi_postal": 35006,
            "pais": 'Alemanya'
        }
    ]

);
