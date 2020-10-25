#' Caractéristiques de l'accident
#'
#' Base de données contenant les caractéristiques qui décrivent les circonstances générales de l'accident.
#'
#' @format Un data.frame avec 958469 observations et 16 variables:
#' \describe{
#'   \item{Num_Acc}{Numéro d'identifiant de l’accident}
#'   \item{jour}{Jour de l'accident}
#'   \item{mois}{Mois de l'accident}
#'   \item{an}{Année de l'accident}
#'   \item{hrmn}{Heure et minutes de l'accident}
#'   \item{lum}{Lumière : conditions d’éclairage dans lesquelles l'accident s'est produit (1 = Plein jour, 2 = Crépuscule ou aube, 3 = Nuit sans éclairage public, 4 = Nuit avec éclairage public non allumé, 5 = Nuit avec éclairage public allumé)}
#'   \item{dep}{Département : Code INSEE (Institut National de la Statistique et des Etudes Economiques) du département suivi d'un 0 (201 = Corse-du-Sud, 202 = Haute-Corse)}
#'   \item{agg}{Localisation (1 = Hors agglomération, 2 = agglomération)}
#'   \item{int}{Intersection (1 = Hors intersection, 2 = Intersection en X, 3 = Intersection en T, 4 = Intersection en Y, 5 = Intersection à plus de 4 branches, 6 = Giratoire, 7 = Place, 8 = Passage à niveau, 9 = Autre intersection)}
#'   \item{atm}{Conditions atmosphériques (1 = Normale, 2 = Pluie légère, 3 = Pluie forte, 4 = Neige - grêle, 5 = Brouillard - fumée, 6 = Vent fort - tempête, 7 = Temps éblouissant, 8 = Temps couvert, 9 = Autre)}
#'   \item{col}{Type de collision (1 = Deux véhicules - frontale, 2 = Deux véhicules - par l’arrière, 3 = Deux véhicules - par le coté, 4 = Trois véhicules et plus - en chaîne, 5 = Trois véhicules et plus - collisions multiples, 6 = Autre collision, 7 = Sans collision)}
#'   \item{com}{Commune : Le numéro de commune est un code donné par l‘INSEE. Le code comporte 3 chiffres calés à droite.}
#'   \item{adr}{Adresse postale : variable renseignée pour les accidents survenus en agglomération}
#'   \item{gps}{Codage GPS (M = Métropole, A = Antilles (Martinique ou Guadeloupe), G = Guyane, R = Réunion, Y = Mayotte )}
#'   \item{lat}{Latitude}
#'   \item{long}{Longitude}
#' }
#'
#' @source \url{https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_}
#' @name carac
#' @rdname carac
NULL
