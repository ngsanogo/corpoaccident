#' get_datalist
#' Récupère la liste des données disponibles sur data.gouv.fr
#'
#' @param years Vecteur numérique des années à télécharger
#' @return Liste de tous les ensembles de données disponibles s'ils sont vides ou filtrés sur les années dans un tableau numérique
#' @examples
#' get_datalist()
#' get_datalist(2018)
#' get_datalist(2016:2018)
#' @export

get_datalist <- function(years = NA) {

  attempt::stop_if_not(is.numeric(years), msg = "Year(s) should be in a numeric vector")

  link <- xml2::read_html("https://www.data.gouv.fr/fr/datasets/base-de-donnees-accidents-corporels-de-la-circulation/#_")

  # Noms des fichiers
  filenames <- link %>%
    rvest::html_nodes(".ellipsis") %>%
    rvest::html_text()

  # urls des fichiers
  urls <- link %>%
    rvest::html_nodes("a.btn-primary") %>%
    rvest::html_attr("href")

  ## Supprime les NAs
  urls <- urls[!is.na(urls)]

  attempt::stop_if_not(length(filenames) == length(urls), msg = "Le nombre de descriptif est différent du nombre de lien")

  # Construit le data.frame
  datalist <- dplyr::tibble(filename = filenames, url = urls) %>%
    dplyr::filter(grepl(".csv", filename)) %>% # filter non CSV files
    dplyr::mutate(year = stringr::str_sub(filename, start = -8, end = -5)) # extract year

  attempt::stop_if_not(all(years %in% datalist$year), msg = paste0("Year(s) should beetween ", min(datalist$year), " and ", max(datalist$year)))

  if (is.na(years) && length(years) == 1) {
    return(datalist)
  }

  if (all(!is.na(years))) {
    years <- attempt::try_catch(expr = as.numeric(years),
                       .e = ~ paste0("There is an error: ", .x),
                       .w = ~ paste0("This is a warning: ", .x))
    datalist %>%
      dplyr::filter(year %in% years) %>%
      return()
  }
}
