test_that("lead appender", {
  data = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = 1:10
  ) %>%
    as_tsibble(index = datetime)

  expected = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = 1:10,
    next_obs = c(2:10, NA)
  ) %>%
    as_tsibble(index = datetime)

  expect_equal(data %>% append_lead(obs), expected)
})


test_that("cov appender", {
  data = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = 1:10,
    cov = 11:20
  ) %>%
    as_tsibble(index = datetime)

  expected = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = 1:10,
    cov = 11:20,
    next_cov_obs = c(12:20, NA),
    next_target_obs = c(2:10, NA)
  ) %>%
    as_tsibble(index = datetime)

  expect_equal(data %>% append_lead_cov_lead(cov, target_obs_col_name = "obs"), expected)
})


test_that("diff appender", {
  data = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = c(0,1,3,5,8,8,5,3,1,0)
  ) %>%
    as_tsibble(index = datetime)

  expected = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = c(0,1,3,5,8,8,5,3,1,0),
    diff_to_next_obs = c(1,2,2,3,0,-3,-2,-2,-1,NA)
  ) %>%
    as_tsibble(index = datetime)

  expect_equal(data %>% append_diff(obs), expected)
})


test_that("non appender", {
  data = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = c(0,1,3,5,8,8,5,3,1,0)
  ) %>%
    as_tsibble(index = datetime)

  expect_equal(data %>% append_nothing(obs), data)
})


test_that("lag appender", {
  data = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = 1:10
  ) %>%
    as_tsibble(index = datetime)

  expected = tibble(
    datetime = as.Date("2022-03-31") + 0:9,
    obs = 1:10,
    next_obs = c(NA, 1:9)
  ) %>%
    as_tsibble(index = datetime)

  expect_equal(data %>% append_lag(obs), expected)
})


test_that("lag diff appender", {
  data = tsibble::tsibble(date = as.Date("2022-02-02") + 0:4,
                          obs = c(1,3,5,1,10),
                          index = date)

  expected = tibble(
    date = as.Date("2022-02-02") + 0:4,
    obs = c(1,3,5,1,10),
    diff_to_next_obs = c(NA, -2, -2, 4, -9)
  ) %>%
    as_tsibble(index = date)

  expect_equal(data %>% append_lag_diff(obs), expected)
})
