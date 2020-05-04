# pipe from magrittr
`%>%` <- magrittr::`%>%`

# Vehicle
vehicule <- c("https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167",
             "https://www.data.gouv.fr/fr/datasets/r/d6103d0c-6db5-466f-b724-91cbea521533",
             "https://www.data.gouv.fr/fr/datasets/r/be2191a6-a7cd-446f-a9fc-8d698688eb9e",
             "https://www.data.gouv.fr/fr/datasets/r/3420157e-7d23-4832-a710-a3a2f2df909c",
             "https://www.data.gouv.fr/fr/datasets/r/86c64436-427f-4042-a4ee-ed0aa31bac76",
             "https://www.data.gouv.fr/fr/datasets/r/3c059a3c-4624-4513-b3a4-2b18c48dfd47",
             "https://www.data.gouv.fr/fr/datasets/r/48683290-0d4d-429a-8fb6-977887098d5d",
             "https://www.data.gouv.fr/fr/datasets/r/569e3f44-ff4c-4a25-bb45-f4a3646b392d",
             "https://www.data.gouv.fr/fr/datasets/r/4dd8a9ea-785f-4e3f-8f83-3838a60ac7f5",
             "https://www.data.gouv.fr/fr/datasets/r/787ba26e-2588-47aa-b73d-346f120f9c59",
             "https://www.data.gouv.fr/fr/datasets/r/6d9e4024-8207-4020-ae4c-5b83504e7268",
             "https://www.data.gouv.fr/fr/datasets/r/6e905a7a-c48d-4f5c-a0bb-54b83c8dfe5f",
             "https://www.data.gouv.fr/fr/datasets/r/c3362179-9c39-4056-9503-ce00ea6b810e",
             "https://www.data.gouv.fr/fr/datasets/r/924b962b-4400-4468-9f7d-0bdba28f51e9") %>%
  purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1")

# Convert variable
vehicule <- vehicule %>%
  dplyr::as_tibble() %>%
  dplyr::mutate(
    Num_Acc = bit64::as.integer64(Num_Acc),
    senc = factor(senc, levels = 1:2,
                  labels = c("PK ou PR ou numéro d’adresse postale croissant", "PK ou PR ou numéro d’adresse postale décroissant")),
    catv = factor(catv, levels = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11",
                                   "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "30", "31", "32", "33", "34", "35",
                                   "36", "37", "38", "39", "40", "99"),
                  labels = c("Bicyclette", "Cyclomoteur <50cm3", "Voiturette", "scooter immatriculé", "motocyclette",
                             "side-car", "VL seul", "VL + caravane", "VL + remorque", "VU seul 1,5T <= PTAC <= 3,5T avec ou sans remorque",
                             "VU (10) + caravane", "VU (10) + remorque", "PL seul 3,5T <PTCA <= 7,5T",
                             "PL seul > 7,5T", "PL > 3,5T + remorque", "Tracteur routier seul",
                             "Tracteur routier + semi-remorque", "transport en commun", "tramway",
                             "Engin spécial", "Tracteur agricole", "Scooter < 50 cm3", "Motocyclette > 50 cm3 et <= 125 cm3",
                             "Scooter > 50 cm3 et <= 125 cm3", "Motocyclette > 125 cm3", "Scooter > 125 cm3",
                             "Quad léger <= 50 cm3 (Quadricycle à moteur non carrossé)",
                             "Quad lourd > 50 cm3 (Quadricycle à moteur non carrossé)", "Autobus",
                             "Autocar", "Train", "Tramway", "Autre véhicule")),
    obs = factor(obs, levels = 1:16,
                 labels = c("Véhicule en stationnement", "Arbre", "Glissière métallique", "Glissière béton",
                            "Autre glissière", "Bâtiment, mur, pile de pont", "Support de signalisation verticale ou poste d’appel d’urgence",
                            "Poteau", "Mobilier urbain", "Parapet", "Ilot, refuge, borne haute", "Bordure de trottoir",
                            "Fossé, talus, paroi rocheuse", "Autre obstacle fixe sur chaussée",
                            "Autre obstacle fixe sur trottoir ou accotement", "Sortie de chaussée sans obstacle")),
    obsm = factor(obsm, levels = c(1:2, 4:6, 9),
                  labels = c("Piéton", "Véhicule", "Véhicule sur rail", "Animal domestique",
                             "Animal sauvage", "Autre")),
    choc = factor(choc, levels = 1:9,
                  labels = c("Avant", "Avant droit", "Avant gauche", "Arrière", "Arrière droit", "Arrière gauche",
                             "Côté droit", "Côté gauche", "Chocs multiples (tonneaux)")),
    manv = factor(manv, levels = 1:24,
                  labels = c("Sans changement de direction", "Même sens, même file", "Entre 2 files",
                             "En marche arrière", "A contresens", "En franchissant le terre-plein central",
                             "Dans le couloir bus, dans le même sens", "Dans le couloir bus, dans le sens inverse",
                             "En s’insérant", "En faisant demi-tour sur la chaussée", "Changeant de file - A gauche",
                             "Changeant de file - A droite", "Déporté - A gauche", "Déporté - A droite",
                             "Tournant - A gauche", "Tournant - A droite", "Dépassant - A gauche", "Dépassant - A droite",
                             "Traversant la chaussée", "Manœuvre de stationnement", "Manœuvre d’évitement",
                             "Ouverture de porte", "Arrêté (hors stationnement)", "En stationnement (avec occupants)"))
  )

# Save the data
usethis::use_data(vehicule, overwrite = TRUE)
