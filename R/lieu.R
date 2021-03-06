#' Lieu principal de l'accident
#'
#' Base de données contenant l'endroit qui décrit le lieu principal de l'accident même si l'accident s'est produit à une intersection.
#'
#' @format Un data.frame avec 958469 observations et 18 variables:
#' \describe{
#'   \item{Num_Acc}{Identifiant de l’accident identique à celui du fichier "rubrique CARACTERISTIQUES" repris dans l’accident}
#'   \item{catr}{Catégorie de route (1 = Autoroute, 2 = Route Nationale, 3 = Route Départementale, 4 = Voie Communale, 5 = Hors réseau public, 6 = Parc de stationnement ouvert à la circulation publique, 9 = autre)}
#'   \item{voie}{Numéro de la route}
#'   \item{v1}{Indice numérique du numéro de route (exemple : 2 bis, 3 ter etc.)}
#'   \item{v2}{Lettre indice alphanumérique de la route}
#'   \item{circ}{Régime de circulation (1 = A sens unique, 2 = Bidirectionnelle, 3 = A chaussées séparées, 4 = Avec voies d’affectation variable)}
#'   \item{nbv}{Nombre total de voies de circulation}
#'   \item{pr}{Numéro du PR de rattachement (numéro de la borne amont)}
#'   \item{pr1}{Distance en mètres au PR (par rapport à la borne amont)}
#'   \item{vosp}{Signale l’existence d’une voie réservée, indépendamment du fait que l’accident ait lieu ou non sur cette voie (1 = Piste cyclable, 2 = Banque cyclable, 3 = Voie réservée)}
#'   \item{prof}{Profil en long décrit la déclivité de la route à l'endroit de l'accident (1 = Plat, 2 = Pente, 3 = Sommet de côte, 4 = Bas de côte)}
#'   \item{plan}{Tracé en plan (1 = Partie rectiligne, 2 = En courbe à gauche, 3 = En courbe à droite, 4 = En « S »)}
#'   \item{lartpc}{Largeur du terre plein central (TPC) s'il existe}
#'   \item{larrout}{Largeur de la chaussée affectée à la circulation des véhicules ne sont pas compris les bandes d'arrêt d'urgence, les TPC et les places de stationnement}
#'   \item{surf}{Etat de la surface (1 = normale, 2 = mouillée, 3 = flaques, 4 = inondée, 5 = enneigée, 6 = boue, 7 = verglacée, 8 = corps gras - huile, 9 = autre)}
#'   \item{infra}{Aménagement - Infrastructure (1 = Souterrain - tunnel, 2 = Pont - autopont, 3 = Bretelle d’échangeur ou de raccordement, 4 = Voie ferrée, 5 = Carrefour aménagé, 6 = Zone piétonne, 7 = Zone de péage)}
#'   \item{situ}{Situation de l’accident (1 = Sur chaussée, 2 = Sur bande d’arrêt d’urgence, 3 = Sur accotement, 4 = Sur trottoir, 5 = Sur piste cyclable)}
#'   \item{env1}{point école : proximité d'une école}
#' }
#'
#' @source \url{https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_}
#' @name lieu
#' @rdname lieu
NULL
