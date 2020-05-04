
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
[accident](https://github.com/ngsanogo/accident).

## Installation du package

Vous pouvez installer la version stable du package depuis le
[CRAN](https://CRAN.R-project.org) avec :

``` r
install.packages("corpoaccident")
```

et la version en développement depuis [GitHub](https://github.com/) avec
:

``` r
# install.packages("remotes")
remotes::install_github("ngsanogo/corpoaccident")
```

## Utilisation

Le package contient 4 bases de données : `carac`, `lieu`, `usager` et
`vehicule`.

``` r
library(corpoaccident)
```

## Source

Ministère de l’Intérieur (France) :
<https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_>

## Code of Conduct

Please note that the corpoaccident project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
