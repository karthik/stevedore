context("docker client: networks")


test_that("create", {
  d <- test_docker_client()
  nm <- rand_str(10, "stevedore_")
  nw <- d$network$create(nm)
  on.exit(try_silent(nw$remove()))
  expect_is(nw, "docker_network")
  expect_is(nw, "stevedore_object")

  expect_equal(nw$name(), nm)
  expect_equal(nw$inspect()$name, nm)
  expect_identical(nw$reload(), nw)

  expect_null(nw$remove())

  e <- get_error(nw$inspect())
  expect_is(e, "docker_error")
  expect_equal(e$code, 404L)
})


test_that("get", {
  d <- test_docker_client()
  nm <- rand_str(10, "stevedore_")
  nw1 <- d$network$create(nm)
  on.exit(try_silent(nw1$remove()))

  nw2 <- d$network$get(nm)
  expect_identical(nw1$inspect(FALSE), nw2$inspect(FALSE))
  d$network$remove(nm)

  e <- get_error(d$network$get(nm))
  expect_is(e, "docker_error")
  expect_equal(e$code, 404L)
})


test_that("list", {
  d <- test_docker_client()
  nm <- rand_str(10, "stevedore_")
  nw <- d$network$create(nm)
  on.exit(nw$remove())

  nwl <- d$network$list()
  expect_is(nwl, "data.frame")
  expect_true("name" %in% names(nwl))
  expect_true(nm %in% nwl$name)
})


test_that("prune", {
  d <- test_docker_client()
  nm <- rand_str(10, "stevedore_")
  nw <- d$network$create(nm)
  ans <- d$network$prune()
  expect_match(ans$networks_deleted, "^stevedore_", all = FALSE)
})


test_that("containers", {
  d <- test_docker_client()
  server <- rand_str(10, "stevedore_")
  network <- rand_str(3, "stevedore_")

  d <- test_docker_client()
  nw <- d$network$create(network)
  on.exit(nw$remove())

  expect_identical(nw$containers(), list())

  x <- d$container$create("nginx", name = server, network = network)
  on.exit({
    x$remove(force = TRUE)
    nw$remove()
  })
  x$start()

  res <- nw$containers()
  expect_is(res, "list")
  expect_equal(length(res), 1L)
  expect_is(res[[1]], "docker_container")
  expect_identical(res[[1]]$id(), x$id())
})


test_that("connect", {
  skip("connect is untested")
})


test_that("disconnect", {
  skip("disconnect is untested")
})


test_that("get (offline)", {
  cl <- null_docker_client()
  x <- cl$network$get(dummy_id())
  expect_is(x, "docker_network")
  expect_equal(x$id(), dummy_id())
})
