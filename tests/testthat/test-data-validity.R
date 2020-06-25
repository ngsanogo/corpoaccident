test_that("Test nrow carac and lieu", {
  expect_equal(base::nrow(carac) == base::nrow(lieu), TRUE)
})

test_that("Test years", {
  expect_equal(base::all(base::unique(carac$an) %in% 5:18), TRUE)
})

test_that("Test months", {
  expect_equal(base::all(base::unique(carac$mois) %in% 1:12), TRUE)
})

test_that("Test days", {
  expect_equal(base::all(base::unique(carac$jour) %in% 1:31), TRUE)
})

test_that("Test hours", {
  expect_equal(base::all(base::range(base::as.numeric(lubridate::hm(carac$hrmn))) == c(60, 86340)), TRUE)
})

test_that("Test birth year", {
  expect_equal(base::all(base::range(usager$an_nais, na.rm = TRUE) == c(1896, 2018)), TRUE)
})
