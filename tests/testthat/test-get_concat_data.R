test_that("check if get_concat_data works", {
  x <- suppressWarnings(dim(get_concat_data(2015)))
  expect_true(all.equal(x, c(130378, 51)))
})
