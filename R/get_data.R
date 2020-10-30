#' Charge l'ensemble des données des années spécifiées.
#'
#' @param years Vecteur numérique des années à télécharger; la valeur par défaut est NA_integer_
#'
#' @return Renvoie une liste contenant les tables caractéristique, lieux, usagers et véhicules.
#' @examples
#' \dontrun{
#' get_data(2018)
#' }
#' @export

get_data <- function(years = NA_integer_) {
  datalist <- get_datalist(years)
  # Caractéristique
  carac <- datalist %>%
    dplyr::filter(grepl(filename, pattern = "carac")) %>%
    dplyr::pull(url) %>%
    purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1") %>%
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
                   labels = c("Plein jour", "Cr\u00e9puscule ou aube", "Nuit sans \u00e9clairage public",
                              "Nuit avec \u00e9clairage public non allum\u00e9", "Nuit avec \u00e9clairage public allum\u00e9 ")
      ),
      agg = factor(agg, levels = 1:2, labels = c("Hors agglom\u00e9ration", "En agglom\u00e9ration")),
      int = factor(int, levels = 1:9, labels = c("Hors intersection", "Intersection en X",
                                                 "Intersection en T" , "Intersection en Y" ,
                                                 "Intersection \u00e0 plus de 4 branches" , "Giratoire",
                                                 "Place", "Passage \u00e0 niveau", "Autre intersection")
      ),
      atm = factor(atm, levels = 1:9, labels = c("Normale", "Pluie l\u00e9g\u00e8re", "Pluie forte" ,
                                                 "Neige - gr\u00eale ", "Brouillard - fum\u00e9e",
                                                 "Vent fort - temp\u00eate" , "Temps \u00e9blouissant",
                                                 "Temps couvert ", "Autre")
      ),
      col = factor(col, levels = 1:7, labels = c("Deux v\u00e9hicules - frontale", "Deux v\u00e9hicules - par l\u2019arri\u00e8re",
                                                 "Deux v\u00e9hicules - par le cot\u00e9 ", "Trois v\u00e9hicules et plus - en cha\u00eene",
                                                 "Trois v\u00e9hicules et plus - collisions multiples",
                                                 "Autre collision" , "Sans collision")
      ),
      com = dplyr::case_when(
        nchar(com) == 1 ~ paste0("00", com),
        nchar(com) == 2 ~ paste0("0", com),
        nchar(com) == 3 ~ as.character(com),
        TRUE ~ NA_character_
      ),
      gps = factor(gps, levels = c("M", "A", "G", "R", "Y"),
                   labels = c("M\u00e9tropole", "Antilles (Martinique ou Guadeloupe)",
                              "Guyane", "R\u00e9union", "Mayotte")
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
  # Lieux
  lieu <- datalist %>%
    dplyr::filter(grepl(filename, pattern = "lieu")) %>%
    dplyr::pull(url) %>%
    purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1") %>%
    dplyr::mutate(
      Num_Acc = bit64::as.integer64(Num_Acc),
      catr = factor(catr, levels = c(1:6, 9),
                    labels = c("Autoroute", "Route Nationale", "Route D\u00e9partementale", "Voie Communale",
                               "Hors r\u00e9seau public", "Parc de stationnement ouvert \u00e0 la circulation publique",
                               "autre")
      ),
      voie = as.numeric(voie),
      v1 = as.numeric(v1),
      v2 = as.numeric(v2),
      circ = factor(circ, levels = 1:4,
                    labels = c("A sens unique", "Bidirectionnelle", "A chauss\u00e9es s\u00e9par\u00e9es",
                               "Avec voies d\u2019affectation variable")
      ),
      nbv = as.numeric(nbv),
      pr = as.numeric(pr),
      pr1 = as.numeric(pr1),
      vosp = factor(vosp, levels = 1:3, labels = c("Piste cyclable", "Banque cyclable", "Voie r\u00e9serv\u00e9e")),
      prof = factor(prof, levels = 1:4, labels = c("Plat", "Pente", "Sommet de c\u00f4te", "Bas de c\u00f4")),
      plan = factor(plan, levels = 1:4,
                    labels = c("Partie rectiligne", "En courbe \u00e0 gauche", "En courbe \u00e0 droite", "En \u00abS\u00bb")
      ),
      lartpc = as.numeric(lartpc),
      larrout = as.numeric(larrout),
      surf = factor(surf, levels = 1:9,
                    labels = c("normale", "mouill\u00e9e", "flaques", "inond\u00e9e", "enneig\u00e9e", "boue",
                               "verglac\u00e9e", "corps gras - huile", "autre")
      ),
      infra = factor(infra, levels = 1:7,
                     labels = c("Souterrain - tunnel", "Pont - autopont", "Bretelle d\u2019\u00e9changeur ou de raccordement",
                                "Voie ferr\u00e9e", "Carrefour am\u00e9nag\u00e9", "Zone pi\u00e9tonne", "Zone de p\u00e9age")
      ),
      situ = factor(situ, levels = 1:5,
                    labels = c("Sur chauss\u00e9e", "Sur bande d\u2019arr\u00eat d\u2019urgence", "Sur accotement",
                               "Sur trottoir", "Sur piste cyclable")
      ),
      env1 = stringr::str_replace(env1, pattern = "^$", replacement = NA_character_)
    )
  # Usagers
  usager <- datalist %>%
    dplyr::filter(grepl(filename, pattern = "usager")) %>%
    dplyr::pull(url) %>%
    purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1") %>%
    dplyr::mutate(
      Num_Acc = bit64::as.integer64(Num_Acc),
      place = as.numeric(place),
      catu = factor(catu, levels = 1:4, labels = c("Conducteur", "Passager", "Pi\u00e9ton", "Pi\u00e9ton en roller ou en trottinette")),
      grav = factor(grav, levels = 1:4, labels = c("Indemne", "Tu\u00e9", "Bless\u00e9 hospitalis\u00e9", "Bless\u00e9 l\u00e9ger")),
      sexe = factor(sexe, levels = 1:2, labels = c("Homme", "Femme")),
      an_nais = as.numeric(an_nais),
      trajet = factor(trajet, levels = c(1:5, 9),
                      labels = c("Domicile \u2013 travail", "Domicile \u2013 \u00e9cole", "Courses \u2013 achats",
                                 "Utilisation professionnelle", "Promenade \u2013 loisirs", "Autre")),
      secu = factor(secu, levels = paste0(rep(c(1:4, 9), each = 3), rep(1:3, 5)),
                    labels = paste0(rep(c("Ceinture", "Casque", "Dispositif enfants", "Equipement r\u00e9fl\u00e9chissant", "Autre"), each = 3),
                                   rep(c("Oui", "Non", "Non d\u00e9terminable"), 5))
      ),
      locp = factor(locp, levels = 1:8,
                    labels = c("A + 50 m du passage pi\u00e9ton", "A \u2013 50 m du passage pi\u00e9ton", "Sans signalisation lumineuse",
                               "Avec signalisation lumineuse", "Sur trottoir", "Sur accotement",
                               "Sur refuge ou BAU", "Sur contre all\u00e9e")),
      actp = factor(actp, levels = c(0:6, 9),
                    labels = c("non renseign\u00e9 ou sans objet", "Sens v\u00e9hicule heurtant", "Sens inverse du v\u00e9hicule",
                               "Traversant", "Masqu\u00e9", "Jouant \u2013 courant", "Avec animal", "Autre")),
      etatp = factor(etatp, levels = 1:3, labels = c("Seul", "Accompagn\u00e9", "En groupe"))
    )

  # Vehicule
  vehicule <- datalist %>%
    dplyr::filter(grepl(filename, pattern = "vehicule")) %>%
    dplyr::pull(url) %>%
    purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1") %>%
    dplyr::mutate(
      Num_Acc = bit64::as.integer64(Num_Acc),
      senc = factor(senc, levels = 1:2,
                    labels = c("PK ou PR ou num\u00e9ro d\u2019adresse postale croissant", "PK ou PR ou num\u00e9ro d\u2019adresse postale d\u00e9croissant")),
      catv = factor(catv, levels = c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11",
                                     "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "30",
                                     "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "99"),
                    labels = c("Bicyclette", "Cyclomoteur <50cm3", "Voiturette", "scooter immatricul\u00e9", "motocyclette",
                               "side-car", "VL seul", "VL + caravane", "VL + remorque", "VU seul 1,5T <= PTAC <= 3,5T avec ou sans remorque",
                               "VU (10) + caravane", "VU (10) + remorque", "PL seul 3,5T <PTCA <= 7,5T",
                               "PL seul > 7,5T", "PL > 3,5T + remorque", "Tracteur routier seul",
                               "Tracteur routier + semi-remorque", "transport en commun", "tramway",
                               "Engin sp\u00e9cial", "Tracteur agricole", "Scooter < 50 cm3", "Motocyclette > 50 cm3 et <= 125 cm3",
                               "Scooter > 50 cm3 et <= 125 cm3", "Motocyclette > 125 cm3", "Scooter > 125 cm3",
                               "Quad l\u00e9ger <= 50 cm3 (Quadricycle \u00e0 moteur non carross\u00e9)",
                               "Quad lourd > 50 cm3 (Quadricycle \u00e0 moteur non carross\u00e9)", "Autobus",
                               "Autocar", "Train", "Tramway", "Autre v\u00e9hicule")),
      obs = factor(obs, levels = 1:16,
                   labels = c("V\u00e9hicule en stationnement", "Arbre", "Glissi\u00e8re m\u00e9tallique", "Glissi\u00e8re b\u00e9ton",
                              "Autre glissi\u00e8re", "B\u00e2timent, mur, pile de pont", "Support de signalisation verticale ou poste d\u2019appel d\u2019urgence",
                              "Poteau", "Mobilier urbain", "Parapet", "Ilot, refuge, borne haute", "Bordure de trottoir",
                              "Foss\u00e9, talus, paroi rocheuse", "Autre obstacle fixe sur chauss\u00e9e",
                              "Autre obstacle fixe sur trottoir ou accotement", "Sortie de chauss\u00e9e sans obstacle")),
      obsm = factor(obsm, levels = c(1:2, 4:6, 9),
                    labels = c("Pi\u00e9ton", "V\u00e9hicule", "V\u00e9hicule sur rail", "Animal domestique",
                               "Animal sauvage", "Autre")),
      choc = factor(choc, levels = 1:9,
                    labels = c("Avant", "Avant droit", "Avant gauche", "Arri\u00e8re", "Arri\u00e8re droit", "Arri\u00e8re gauche",
                               "C\u00f4t\u00e9 droit", "C\u00f4t\u00e9 gauche", "Chocs multiples (tonneaux)")),
      manv = factor(manv, levels = 1:24,
                    labels = c("Sans changement de direction", "M\u00eame sens, m\u00eame file", "Entre 2 files",
                               "En marche arri\u00e8re", "A contresens", "En franchissant le terre-plein central",
                               "Dans le couloir bus, dans le m\u00eame sens", "Dans le couloir bus, dans le sens inverse",
                               "En s\u2019ins\u00e9rant", "En faisant demi-tour sur la chauss\u00e9e", "Changeant de file - A gauche",
                               "Changeant de file - A droite", "D\u00e9port\u00e9 - A gauche", "D\u00e9port\u00e9 - A droite",
                               "Tournant - A gauche", "Tournant - A droite", "D\u00e9passant - A gauche", "D\u00e9passant - A droite",
                               "Traversant la chauss\u00e9e", "Man\u0153uvre de stationnement", "Man\u0153uvre d\u2019\u00e9vitement",
                               "Ouverture de porte", "Arr\u00eat\u00e9 (hors stationnement)", "En stationnement (avec occupants)"))
    )
  list(carac = carac, lieu = lieu, usager = usager, vehicule = vehicule)
}
