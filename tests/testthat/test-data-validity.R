db <- suppressWarnings(get_data(2018))

test_that("Test nrow carac and lieu", {
  expect_true(nrow(db$carac) == nrow(db$lieu))
})

test_that("Test years", {
  expect_true(all(unique(db$carac$an) == 18))
})

test_that("Test months", {
  expect_true(all(unique(db$carac$mois) %in% 1:12))
})

test_that("Test days", {
  expect_true(all(unique(db$carac$jour) %in% 1:31))
})

test_that("Test hours", {
  x <- range(as.difftime(db$carac$hrmn, "%H:%M", units = "secs"))
  y <- as.difftime(c("0:01", "23:59"), format = "%H:%M", units = "secs")
  expect_true(all(x == y))
})

test_that("Test birth year", {
  expect_true(all(range(db$usager$an_nais, na.rm = TRUE) == c(1911, 2018)))
})
