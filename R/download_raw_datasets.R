#' Cette fonction permet de télécharger les données csv de data.gouv.fr.
#'
#' @param years Vecteur numérique des années à télécharger
#' @param path  Vecteur de caractères des noms de chemin complets ; la valeur par défaut correspond au répertoire de travail, getwd()
#' @param quiet Si TRUE, supprime les messages et la barre de progression; la valeur par défaut est TRUE.
#'
#' @return Un code entier (invisible), 0 pour le succès et non zéro pour l'échec.
#' @examples
#'\dontrun{
#' download_raw_datasets(2018, tempdir())
#' download_raw_datasets(2016:2018, tempdir())
#' }
#' @export

download_raw_datasets <- function(years, path = getwd(), quiet = TRUE) {
  datalist <- get_datalist(years)
  datalist <- datalist %>%
    dplyr::mutate(path = paste0(path, '/', filename))
  res <- purrr::map2(datalist$url, datalist$path, ~ utils::download.file(url = .x, destfile = .y, quiet = quiet))
  invisible(sum(unlist(res)))
}
