
<!-- README.md is generated from README.Rmd. Please edit that file -->

# corpoaccident <a href='https://github.com/ngsanogo/corpoaccident'><img src='man/figures/corpoaccident.ico' align="right"  /></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub
commit](https://img.shields.io/github/last-commit/ngsanogo/corpoaccident)](https://github.com/ngsanogo/corpoaccident/commit/master)
<!-- badges: end -->

Le package corpoaccident est un package qui permet d’utiliser les jeux
de données sur les accidents corporels de la circulation en France
disponible sur data.gouv.fr.

Il a pour objectif de faciliter l’utilisation de ces données pour le
logiciel R.

Un dashboard programmé avec le package
[golem](https://github.com/ThinkR-open/golem) est disponible à l’adresse
[corpoaccidentdash](https://github.com/ngsanogo/corpoaccidentdash).

## Installation du package

Vous pouvez installer le package depuis [GitHub](https://github.com/)
avec :

``` r
# install.packages("remotes")
remotes::install_github("ngsanogo/corpoaccident")
```

## Description

Pour chaque accident corporel (soit un accident survenu sur une voie
ouverte à la circulation publique, impliquant au moins un véhicule et
ayant fait au moins une victime ayant nécessité des soins), des saisies
d’information décrivant l’accident sont effectuées par l’unité des
forces de l’ordre (police, gendarmerie, etc.) qui est intervenue sur le
lieu de l’accident. Ces saisies sont rassemblées dans une fiche
intitulée bulletin d’analyse des accidents corporels. L’ensemble de ces
fiches constitue le fichier national des accidents corporels de la
circulation dit “Fichier BAAC1” administré par l’Observatoire national
interministériel de la sécurité routière “ONISR”.

Les bases de données, extraites du fichier BAAC, répertorient
l’intégralité des accidents corporels de la circulation intervenus
durant une année précise en France métropolitaine ainsi que les
départements d’Outre-mer (Guadeloupe, Guyane, Martinique, La Réunion et
Mayotte depuis 2012) avec une description simplifiée. Cela comprend des
informations de localisation de l’accident, telles que renseignées ainsi
que des informations concernant les caractéristiques de l’accident
(`carac`) et son lieu (`lieu`), les véhicules impliqués (`vehicule`) et
leurs victimes (`usager`).

Ces bases occultent néanmoins certaines données spécifiques relatives
aux usagers et aux véhicules et à leur comportement dans la mesure où la
divulgation de ces données porterait atteinte à la protection de la vie
privée des personnes physiques aisément identifiables ou ferait
apparaître le comportement de telles personnes alors que la divulgation
de ce comportement pourrait leur porter préjudice (avis de la CADA – 2
janvier 2012).

`Avertissement : Les données sur la qualification de blessé hospitalisé
pour l’année 2018 ne peuvent être comparées aux années précédentes suite
à des modifications de process de saisie des forces de l’ordre`

Pour plus d’information sur les données, merci de [cliquer
ici](https://www.data.gouv.fr/fr/datasets/r/8d4df329-bbbb-434c-9f1f-596d78ad529f).

## Utilisation

``` r
library(corpoaccident)
library(dplyr)
library(ggplot2)
library(knitr)
```

La liste des données disponible sur data.gouv.fr

``` r
get_datalist(2015:2018) %>%
  kable()
```

| filename                   | url                                                                           | year |
| :------------------------- | :---------------------------------------------------------------------------- | :--- |
| vehicules-2018.csv         | <https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167> | 2018 |
| usagers-2018.csv           | <https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a> | 2018 |
| lieux-2018.csv             | <https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9> | 2018 |
| caracteristiques-2018.csv  | <https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405> | 2018 |
| vehicules-2017.csv         | <https://www.data.gouv.fr/fr/datasets/r/d6103d0c-6db5-466f-b724-91cbea521533> | 2017 |
| usagers-2017.csv           | <https://www.data.gouv.fr/fr/datasets/r/07bfe612-0ad9-48ef-92d3-f5466f8465fe> | 2017 |
| lieux-2017.csv             | <https://www.data.gouv.fr/fr/datasets/r/9b76a7b6-3eef-4864-b2da-1834417e305c> | 2017 |
| caracteristiques-2017.csv  | <https://www.data.gouv.fr/fr/datasets/r/9a7d408b-dd72-4959-ae7d-c854ec505354> | 2017 |
| vehicules\_2016.csv        | <https://www.data.gouv.fr/fr/datasets/r/be2191a6-a7cd-446f-a9fc-8d698688eb9e> | 2016 |
| usagers\_2016.csv          | <https://www.data.gouv.fr/fr/datasets/r/e4c6f4fe-7c68-4a1d-9bb6-b0f1f5d45526> | 2016 |
| lieux\_2016.csv            | <https://www.data.gouv.fr/fr/datasets/r/08b77510-39c4-4761-bf02-19457264790f> | 2016 |
| caracteristiques\_2016.csv | <https://www.data.gouv.fr/fr/datasets/r/96aadc9f-0b55-4e9a-a70e-c627ed97e6f7> | 2016 |
| vehicules\_2015.csv        | <https://www.data.gouv.fr/fr/datasets/r/3420157e-7d23-4832-a710-a3a2f2df909c> | 2015 |
| caracteristiques\_2015.csv | <https://www.data.gouv.fr/fr/datasets/r/185fbdc7-d4c5-4522-888e-ac9550718f71> | 2015 |
| lieux\_2015.csv            | <https://www.data.gouv.fr/fr/datasets/r/31db21ef-4328-4c5e-bf3d-66a8fe82e6a2> | 2015 |
| usagers\_2015.csv          | <https://www.data.gouv.fr/fr/datasets/r/b43a4237-9359-4217-b833-8d3dc29a6c24> | 2015 |

Récupération des données de 2018

``` r
df <- suppressWarnings(get_data(2015:2018))
```

``` r
df$carac %>%
  mutate(an = as.character(2000 + an)) %>%
  count(an) %>%
  mutate(diff = n - lag(n)) %>%
  kable(col.names = c("Année", "Nombre d'accidents", "Evolution"),
        align = "l", caption = "Évolution du nombre annuel d'accidents de 2015 à 2018\nSource : https://www.data.gouv.fr/")
```

| Année | Nombre d’accidents | Evolution |
| :---- | :----------------- | :-------- |
| 2015  | 58654              |           |
| 2016  | 59432              | 778       |
| 2017  | 60701              | 1269      |
| 2018  | 57783              | \-2918    |

Évolution du nombre annuel d’accidents de 2015 à 2018 Source :
<https://www.data.gouv.fr/>

``` r
df$carac %>%
  mutate(an = as.character(2000 + an)) %>%
  inner_join(df$usager) %>%
  select(an, grav) %>%
  table() %>%
  kable()
```

|      | Indemne |  Tué | Blessé hospitalisé | Blessé léger |
| :--- | ------: | ---: | -----------------: | -----------: |
| 2015 |   53378 | 3616 |              27717 |        45667 |
| 2016 |   54640 | 3655 |              28376 |        46751 |
| 2017 |   56270 | 3600 |              28993 |        47158 |
| 2018 |   54248 | 3392 |              22169 |        50360 |

## Source

Ministère de l’Intérieur (France) :
<https://www.data.gouv.fr/fr/datasets/base-de-dfs-accidents-corporels-de-la-circulation/#_>

## Code de conduite

Veuillez noter que le projet Corpoaccident est publié avec un [code de
conduite des
contributeurs](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
En contribuant à ce projet, vous acceptez d’en respecter les conditions.
