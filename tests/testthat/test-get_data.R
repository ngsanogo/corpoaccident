
test_that("check if get_data works", {
  tmp <- suppressWarnings(get_data(2018))
  expect_true(all.equal(length(tmp), 4))
  expect_true(all.equal(lapply(tmp, dim),
                        list(carac = c(57783, 16),
                             lieu = c(57783, 18),
                             usager = c(130169, 12),
                             vehicule = c(98876, 9))
  )
  )
})
