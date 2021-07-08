test_that("my_median works properly and show error if needed", {
  test.data <- generate_eg_data()
  expect_equal(c("x", "response", "truth"), names(test.data))
})
