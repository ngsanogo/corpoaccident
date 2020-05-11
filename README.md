
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

Le package corpoaccident est un package qui contient les jeux de données
sur les accidents corporels de la circulation en France.

Il a pour objectif de faciliter l’utilisation de ces données pour le
logiciel R.

Un dashboard programmé avec le package
[golem](https://github.com/ThinkR-open/golem) est disponible à l’adresse
[corpoaccidentdash](https://github.com/ngsanogo/corpoaccidentdash).

## Installation du package

Vous pouvez installer la
version<!-- stable du package depuis le [CRAN](https://CRAN.R-project.org) avec : -->

<!-- ``` r -->

<!-- install.packages("corpoaccident") -->

<!-- ``` -->

<!-- et la version -->

en développement depuis [GitHub](https://github.com/) avec :

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
que des informations concernant les caractéristiques de l’accident et
son lieu, les véhicules impliqués et leurs victimes.

Le package contient 4 bases de données : `carac`, `lieu`, `usager` et
`vehicule`.

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
library(knitr)
```

Évolution du nombre annuel d’accidents.

``` r
data("carac")
carac %>%
  mutate(an = as.character(2000 + an)) %>%
  count(an) %>%
  kable()
```

| an   |     n |
| :--- | ----: |
| 2005 | 87026 |
| 2006 | 82993 |
| 2007 | 83850 |
| 2008 | 76767 |
| 2009 | 74409 |
| 2010 | 69379 |
| 2011 | 66974 |
| 2012 | 62250 |
| 2013 | 58397 |
| 2014 | 59854 |
| 2015 | 58654 |
| 2016 | 59432 |
| 2017 | 60701 |
| 2018 | 57783 |

``` r
data(usager)
df <- carac %>%
  mutate(an = as.character(2000 + an)) %>%
  filter(an %in% c(2018, 2017)) %>%
  inner_join(usager)
#> Joining, by = "Num_Acc"
#> Warning: Column `Num_Acc` has different attributes on LHS and RHS of join

table(df$an, df$grav) %>%
  kable()
```

|      | Indemne |  Tué | Blessé hospitalisé | Blessé léger |
| ---- | ------: | ---: | -----------------: | -----------: |
| 2017 |   56270 | 3600 |              28993 |        47158 |
| 2018 |   54248 | 3392 |              22169 |        50360 |

## Source

Ministère de l’Intérieur (France) :
<https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_>

## Code of Conduct

Veuillez noter que le projet Corpoaccident est publié avec un [code de
conduite des
contributeurs](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
En contribuant à ce projet, vous acceptez d’en respecter les conditions.
