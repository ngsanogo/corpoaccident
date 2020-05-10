# pipe from magrittr
`%>%` <- magrittr::`%>%`

# usager
usager <- c("https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a",
            "https://www.data.gouv.fr/fr/datasets/r/07bfe612-0ad9-48ef-92d3-f5466f8465fe",
            "https://www.data.gouv.fr/fr/datasets/r/e4c6f4fe-7c68-4a1d-9bb6-b0f1f5d45526",
            "https://www.data.gouv.fr/fr/datasets/r/b43a4237-9359-4217-b833-8d3dc29a6c24",
            "https://www.data.gouv.fr/fr/datasets/r/457c10ff-ea6c-4238-9af1-d8dc62b896d4",
            "https://www.data.gouv.fr/fr/datasets/r/af4349c5-0293-4639-8694-b8b628bfc6c3",
            "https://www.data.gouv.fr/fr/datasets/r/a19e060e-1c18-4272-ac4e-d4745ab8fade",
            "https://www.data.gouv.fr/fr/datasets/r/bd946492-31b3-428e-8494-a1e203bdc9cc",
            "https://www.data.gouv.fr/fr/datasets/r/c5e5664d-1483-41da-a4c6-5f1727d7a353",
            "https://www.data.gouv.fr/fr/datasets/r/2387db3d-11ee-4df4-aa31-4c3c748244d4",
            "https://www.data.gouv.fr/fr/datasets/r/433e26cf-d4c8-4dd9-b3f2-ecbc8a8f0509",
            "https://www.data.gouv.fr/fr/datasets/r/c5c30fc2-9bfd-4bcd-b45b-f01a31f1d087",
            "https://www.data.gouv.fr/fr/datasets/r/ebb4c37e-1616-497d-b5ed-f8113bed2ae7",
            "https://www.data.gouv.fr/fr/datasets/r/cecdbd46-11f2-41fa-b0bd-e6e223de6b3c") %>%
  purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1")

# Convert variable
usager <- usager %>%
  dplyr::as_tibble() %>%
  dplyr::mutate(
    Num_Acc = bit64::as.integer64(Num_Acc),
    place = as.numeric(place),
    catu = factor(catu, levels = 1:4, labels = c("Conducteur", "Passager", "Piéton", "Piéton en roller ou en trottinette")),
    grav = factor(grav, levels = 1:4, labels = c("Indemne", "Tué", "Blessé hospitalisé", "Blessé léger")),
    sexe = factor(sexe, levels = 1:2, labels = c("Homme", "Femme")),
    an_nais = as.numeric(an_nais),
    trajet = factor(trajet, levels = c(1:5, 9),
                    labels = c("Domicile – travail", "Domicile – école", "Courses – achats",
                               "Utilisation professionnelle", "Promenade – loisirs", "Autre")),
    secu = factor(secu, levels = paste0(rep(c(1:4, 9), each = 3), rep(1:3, 5)),
                  label = paste0(rep(c("Ceinture", "Casque", "Dispositif enfants", "Equipement réfléchissant", "Autre"), each = 3),
                                 rep(c("Oui", "Non", "Non déterminable"), 5))
    ),
    locp = factor(locp, levels = 1:8,
                  labels = c("A + 50 m du passage piéton", "A – 50 m du passage piéton", "Sans signalisation lumineuse",
                             "Avec signalisation lumineuse", "Sur trottoir", "Sur accotement",
                             "Sur refuge ou BAU", "Sur contre allée")),
    actp = factor(actp, levels = c(0:6, 9),
                  labels = c("non renseigné ou sans objet", "Sens véhicule heurtant", "Sens inverse du véhicule",
                             "Traversant", "Masqué", "Jouant – courant", "Avec animal", "Autre")),
    etatp = factor(etatp, levels = 1:3, labels = c("Seul", "Accompagné", "En groupe"))
  )

# Save the data
usethis::use_data(usager, overwrite = TRUE)
