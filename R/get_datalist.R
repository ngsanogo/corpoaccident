#' Récupère la liste des données disponibles sur data.gouv.fr.
#'
#' @param years Vecteur numérique des années à télécharger; la valeur par défaut est NA_integer_
#' @return Renvoie un data.frame correspondant à la liste de l'ensemble des données disponibles.
#' @examples
#' \dontrun{
#' get_datalist()
#' get_datalist(2018)
#' get_datalist(2016:2018)
#' }
#' @export

get_datalist <- function(years = NA_integer_) {

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

  attempt::stop_if_not(length(filenames) == length(urls), msg = "Le nombre de descriptif est diff\u00e9rent du nombre de lien")

  # Construit le data.frame
  datalist <- dplyr::tibble(filename = filenames, url = urls) %>%
    dplyr::filter(grepl(".csv", filename)) %>% # filter non CSV files
    dplyr::mutate(year = stringr::str_sub(filename, start = -8, end = -5)) # extract year

  if (all(is.na(years)) & length(years) == 1) {
    return(datalist)
  }

  attempt::stop_if_not(all(years %in% datalist$year), msg = paste0("Year(s) should beetween ", min(datalist$year), " and ", max(datalist$year)))

  if (all(!is.na(years))) {
    years <- attempt::try_catch(expr = as.numeric(years),
                       .e = ~ paste0("There is an error: ", .x),
                       .w = ~ paste0("This is a warning: ", .x))
    datalist %>%
      dplyr::filter(year %in% years) %>%
      return()
  }
}
