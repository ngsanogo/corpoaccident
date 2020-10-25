#' Usagers impliqués dans des accidents
#'
#' Base de données contenant des informations sur les usagers impliqués dans des accidents.
#'
#' @format Un data.frame avec 2142195 observations et 12 variables:
#' \describe{
#'   \item{Num_Acc}{Identifiant de l’accident identique à celui du fichier "rubrique CARACTERISTIQUES" repris pour chacun des usagers décrits impliqués dans l’accident}
#'   \item{num_veh}{Identifiant du véhicule repris pour chacun des usagers occupant ce véhicule (y compris les piétons qui sont rattachés aux véhicules qui les ont heurtés) – Code alphanumérique}
#'   \item{place}{Permet de situer la place occupée dans le véhicule par l'usager au moment de l'accident}
#'   \item{catu}{Catégorie d'usager (1 = Conducteur, 2 = Passager, 3 = Piéton, 4 = Piéton en roller ou en trottinette (catégorie déplacée, à partir de l’année 2018, vers le fichier "Véhicules" Catégorie du véhicule : 99 - Autre véhicule. Cette catégorie est désormais considérée comme un véhicule : engin de déplacement personnel))}
#'   \item{grav}{Gravité de l'accident : Les usagers accidentés sont classés en trois catégories de victimes plus les indemnes (1 = Indemne, 2 = Tué, 3 = Blessé hospitalisé, 4 = Blessé léger)}
#'   \item{sexe}{Sexe de l'usager (1 = Masculin, 2 = Féminin)}
#'   \item{an_nais}{Année de naissance de l'usager}
#'   \item{trajet}{Motif du déplacement au moment de l’accident (1 = Domicile – travail, 2 = Domicile – école, 3 = Courses – achats, 4 = Utilisation professionnelle, 5 = Promenade – loisirs, 9 = Autre)}
#'   \item{secu}{sur 2 caractères : le premier concerne l’existence d’un Équipement de sécurité et le second concerne l’utilisation de l’Équipement de sécurité (le premier concerne l’existence d’un Équipement de sécurité : 1 = Ceinture, 2 = Casque, 3 = Dispositif enfants, 4 = Equipement réfléchissant, 9 = Autre, le second concerne l’utilisation de l’Équipement de sécurité: 1 = Oui, 2 = Non, 3 = Non déterminable)}
#'   \item{locp}{Localisation du piéton (Sur chaussée : 1 = A + 50 m du passage piéton, 2 = A – 50 m du passage piéton, Sur passage piéton : 3 = Sans signalisation lumineuse, 4 = Avec signalisation lumineuse, Divers : 5 = Sur trottoir, 6 = Sur accotement, 7 = Sur refuge ou BAU, 8 = Sur contre allée)}
#'   \item{actp}{Action du piéton (Se déplaçant : 0 = non renseigné ou sans objet, 1 = Sens véhicule heurtant, 2 = Sens inverse du véhicule, Divers : 3 = Traversant, 4 = Masqué, 5 = Jouant – courant, 6 = Avec animal, 9 = Autre)}
#'   \item{etatp}{Cette variable permet de préciser si le piéton accidenté était seul ou non (1 = Seul, 2 = Accompagné, 3 = En groupe)}
#' }
#'
#' @source \url{https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_}
#' @name usager
#' @rdname usager
NULL
