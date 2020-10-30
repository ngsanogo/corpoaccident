#' Renvoie la table unique des données des années specifiées.
#'
#' @param years Vecteur numérique des années à télécharger; la valeur par défaut est NA_integer_
#'
#' @return Un data.frame correspondant la jointure des différentes tables
#' @examples
#' \dontrun{
#' get_concat_data(2018)
#' }
#' @export

get_concat_data <- function(years = NA_integer_) {
  corpo_data <- get_data(years)
  corpo_data %>%
    purrr::reduce(dplyr::inner_join)
}
