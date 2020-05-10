# pipe from magrittr
`%>%` <- magrittr::`%>%`

# Carac database
carac <- c("https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405",
           "https://www.data.gouv.fr/fr/datasets/r/9a7d408b-dd72-4959-ae7d-c854ec505354",
           "https://www.data.gouv.fr/fr/datasets/r/96aadc9f-0b55-4e9a-a70e-c627ed97e6f7",
           "https://www.data.gouv.fr/fr/datasets/r/185fbdc7-d4c5-4522-888e-ac9550718f71",
           "https://www.data.gouv.fr/fr/datasets/r/85dfe8c6-589f-4e76-8a07-9f59e49ec10d",
           "https://www.data.gouv.fr/fr/datasets/r/18b1a57a-57bf-4bf1-b9ee-dfa5a3154225",
           "https://www.data.gouv.fr/fr/datasets/r/b2518ec1-6529-47bc-9d55-40e2effeb0e7",
           "https://www.data.gouv.fr/fr/datasets/r/37991267-8a15-4a9d-9b1c-ff3e6bea3625",
           "https://www.data.gouv.fr/fr/datasets/r/decdfe8c-38ff-4a06-b7fc-615785f2914d",
           "https://www.data.gouv.fr/fr/datasets/r/fdfacdb9-f48e-4759-bae5-48d063216acb",
           "https://www.data.gouv.fr/fr/datasets/r/722ebb99-c8b2-4635-bf8d-125dd280ee42",
           "https://www.data.gouv.fr/fr/datasets/r/6fc7b169-4dfe-442c-8c28-8bd773aeddf8",
           "https://www.data.gouv.fr/fr/datasets/r/fafa33cf-50cb-4092-a819-d5209f684089",
           "https://www.data.gouv.fr/fr/datasets/r/a47866f7-ece1-4de8-8d31-3a1b4f477e08") %>%
  purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1")

# Convert variable
carac <- carac %>%
  dplyr::as_tibble() %>%
  dplyr::mutate(
    Num_Acc = bit64::as.integer64(Num_Acc),
    an = as.numeric(an),
    mois = as.numeric(mois),
    jour = as.numeric(jour),
    hrmn = dplyr::case_when(
      nchar(hrmn) == 1 ~ paste0("000", hrmn),
      nchar(hrmn) == 2 ~ paste0("00", hrmn),
      nchar(hrmn) == 3 ~ paste0("0", hrmn),
      nchar(hrmn) == 4 ~ as.character(hrmn),
      TRUE ~ NA_character_
    ),
    hrmn = gsub("^(\\d{2})(\\d{2})$", "\\1:\\2", hrmn),
    lum = factor(lum, levels = 1:5,
                 labels = c("Plein jour", "Crépuscule ou aube", "Nuit sans éclairage public",
                            "Nuit avec éclairage public non allumé", "Nuit avec éclairage public allumé ")
    ),
    agg = factor(agg, levels = 1:2, labels = c("Hors agglomération", "En agglomération")),
    int = factor(int, levels = 1:9, labels = c("Hors intersection", "Intersection en X",
                                               "Intersection en T" , "Intersection en Y" ,
                                               "Intersection à plus de 4 branches" , "Giratoire",
                                               "Place", "Passage à niveau", "Autre intersection")
    ),
    atm = factor(atm, levels = 1:9, labels = c("Normale", "Pluie légère", "Pluie forte" ,
                                               "Neige - grêle ", "Brouillard - fumée",
                                               "Vent fort - tempête" , "Temps éblouissant",
                                               "Temps couvert ", "Autre")
    ),
    col = factor(col, levels = 1:7, labels = c("Deux véhicules - frontale", "Deux véhicules - par l’arrière",
                                               "Deux véhicules - par le coté ", "Trois véhicules et plus - en chaîne",
                                               "Trois véhicules et plus - collisions multiples",
                                               "Autre collision" , "Sans collision")
    ),
    com = dplyr::case_when(
      nchar(com) == 1 ~ paste0("00", com),
      nchar(com) == 2 ~ paste0("0", com),
      nchar(com) == 3 ~ as.character(com),
      TRUE ~ NA_character_
    ),
    gps = factor(gps, levels = c("M", "A", "G", "R", "Y"),
                 labels = c("Métropole", "Antilles (Martinique ou Guadeloupe)",
                            "Guyane", "Réunion", "Mayotte")
    ),
    lat = as.numeric(lat),
    long = as.numeric(long),
    dep = dplyr::case_when(
      nchar(dep) == 1 ~ paste0("00", dep),
      nchar(dep) == 2 ~ paste0("0", dep),
      nchar(dep) == 3 ~ as.character(dep),
      TRUE ~ NA_character_
    )
  )

# Save the data
usethis::use_data(carac, overwrite = TRUE)
