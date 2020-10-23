# pipe from magrittr
`%>%` <- magrittr::`%>%`

# lieu
lieu <- c("https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9",
          "https://www.data.gouv.fr/fr/datasets/r/9b76a7b6-3eef-4864-b2da-1834417e305c",
          "https://www.data.gouv.fr/fr/datasets/r/08b77510-39c4-4761-bf02-19457264790f",
          "https://www.data.gouv.fr/fr/datasets/r/31db21ef-4328-4c5e-bf3d-66a8fe82e6a2",
          "https://www.data.gouv.fr/fr/datasets/r/617af155-1b7c-41d6-9504-576878c4d9af",
          "https://www.data.gouv.fr/fr/datasets/r/1e00e4dd-e204-4a08-9e10-9b8a02791ba9",
          "https://www.data.gouv.fr/fr/datasets/r/59cc1244-2397-430a-8afb-6a0a071ff4d2",
          "https://www.data.gouv.fr/fr/datasets/r/26d37f6b-3603-42b0-a779-bbeaa19af4a6",
          "https://www.data.gouv.fr/fr/datasets/r/86577e9c-56ab-4673-95cb-3351e804fc03",
          "https://www.data.gouv.fr/fr/datasets/r/0a25081b-89b6-4f7c-9d31-72ec679f0abf",
          "https://www.data.gouv.fr/fr/datasets/r/237a4d23-1b66-43fb-8832-2f89fbbc6beb",
          "https://www.data.gouv.fr/fr/datasets/r/1d967969-c3d2-45c6-adc7-b3b72a8c6e89",
          "https://www.data.gouv.fr/fr/datasets/r/28b1fbdc-f984-40d8-8614-236ee26adc7c",
          "https://www.data.gouv.fr/fr/datasets/r/3a3488e0-86a1-4917-b082-f3bdc25f6922") %>%
  purrr::map_df(data.table::fread, colClasses = "character", encoding = "Latin-1")

# Convert variable
lieu <- lieu %>%
  dplyr::as_tibble() %>%
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
    env1 = stringr::str_replace(lieu$env1, pattern = "^$", replacement = NA_character_)
  )

# Save the data
usethis::use_data(lieu, overwrite = TRUE)
