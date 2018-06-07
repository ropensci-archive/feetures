context("Feetures")

test_that("Feetures works", {
  expect_is(Feetures, "R6ClassGenerator")
  expect_is(Feetures$new, "function")
  expect_is(Feetures$new(AdapterMemory$new()), "Feetures")
})

test_that("Feetures fails well", {
  expect_error(Feetures$new(), "argument \"adapter\" is missing")
  expect_error(Feetures$new("foo"), "adapter must be of class FeetureAdapter")
})
