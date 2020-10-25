test_that("download_raw_datasets return 0 if data have been downloaded", {
  x <- download_raw_datasets(2018, tempdir())
  expect_equal(invisible(0), x)
})

test_that("check if data has been downloaded", {
  filename <- get_datalist(2018)[["filename"]]
  files <- list.files(tempdir())
  expect_true(all(filename %in% files))
})
