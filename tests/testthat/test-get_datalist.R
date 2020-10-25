test_that("get_datalist() works with one year", {
  output <- tibble::tribble(
    ~filename, ~url,  ~year,
    "vehicules-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167", "2018",
    "usagers-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a", "2018",
    "lieux-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9", "2018",
    "caracteristiques-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405", "2018"
  )
  expect_equal(get_datalist(2018), output)
})

test_that("get_datalist() works with multiple years", {
  expected_output <- tibble::tribble(
    ~filename, ~url,  ~year,
    "vehicules-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/b4aaeede-1a80-4d76-8f97-543dad479167", "2018",
    "usagers-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/72b251e1-d5e1-4c46-a1c2-c65f1b26549a", "2018",
    "lieux-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/d9d65ca1-16a3-4ea3-b7c8-2412c92b69d9", "2018",
    "caracteristiques-2018.csv", "https://www.data.gouv.fr/fr/datasets/r/6eee0852-cbd7-447e-bd70-37c433029405", "2018",
    "vehicules-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/d6103d0c-6db5-466f-b724-91cbea521533", "2017",
    "usagers-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/07bfe612-0ad9-48ef-92d3-f5466f8465fe", "2017",
    "lieux-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/9b76a7b6-3eef-4864-b2da-1834417e305c", "2017",
    "caracteristiques-2017.csv", "https://www.data.gouv.fr/fr/datasets/r/9a7d408b-dd72-4959-ae7d-c854ec505354", "2017"
  )
  expect_equal(get_datalist(c(2018,2017)), expected_output)
})

test_that("get_datalist() returns an error if not numeric", {
  expect_error(get_datalist("2018"), label = "Year(s) should be in a numeric vector")
})

test_that("get_datalist() returns an error if data is not available", {
  expect_error(get_datalist(1990))
})
