assert_scalar_character <- function(x, name = deparse(substitute(x)),
                                    what = "a scalar character (non-NA)") {
  assert_scalar(x, name, what)
  assert_character(x, name, what)
  assert_nonmissing(x, name, what)
  invisible(x)
}


assert_scalar_integer <- function(x, strict = FALSE,
                                  name = deparse(substitute(x)),
                                  what = "a scalar integer (non-NA)") {
  assert_scalar(x, name, what)
  assert_nonmissing(x, name, what)
  assert_integer(x, strict, name, what)
  invisible(x)
}


assert_scalar_numeric <- function(x, name = deparse(substitute(x)),
                                  what = "a scalar numeric (non-NA)") {
  assert_scalar(x, name, what)
  assert_nonmissing(x, name, what)
  assert_numeric(x, name, what)
  invisible(x)
}


assert_scalar_logical <- function(x, name = deparse(substitute(x)),
                                  what = "scalar logical (non-NA)") {
  assert_scalar(x, name, what)
  assert_nonmissing(x, name, what)
  assert_logical(x, name, what)
  invisible(x)
}


assert_scalar <- function(x, name = deparse(substitute(x)), what = "scalar") {
  if (length(x) != 1) {
    stop(sprintf("'%s' must be a %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_nonmissing <- function(x, name = deparse(substitute(x)),
                              what = "non-NA") {
  if (any(is.na(x))) {
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_character <- function(x, name = deparse(substitute(x)),
                             what = "a character") {
  if (!is.character(x)) {
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_raw <- function(x, name = deparse(substitute(x)), what = "raw") {
  if (!is.raw(x)) {
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_logical <- function(x, name = deparse(substitute(x)), what = "logical") {
  if (!is.logical(x)) {
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_numeric <- function(x, name = deparse(substitute(x)), what = "numeric") {
  if (!is.numeric(x)) {
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_is <- function(x, cl, name = deparse(substitute(x)), what = NULL) {
  if (!inherits(x, cl)) {
    if (is.null(what)) {
      what <- paste("a", paste(cl, collapse = " / "))
    }
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_integer <- function(x, strict = FALSE, name = deparse(substitute(x)),
                           what = "integer") {
  if (!(is.integer(x))) {
    usable_as_integer <-
      !strict && is.numeric(x) && (max(abs(round(x) - x)) < 1e-8)
    if (!usable_as_integer) {
      stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
    }
  }
  invisible(x)
}

assert_named <- function(x, unique = FALSE, name = deparse(substitute(x)),
                         what = "named") {
  nms <- names(x)
  if (is.null(nms)) {
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
  if (!all(nzchar(nms))) {
    stop(sprintf("All elements of '%s' must be named", name), call. = FALSE)
  }
  if (unique && any(duplicated(nms))) {
    stop(sprintf("'%s' must have unique names", name), call. = FALSE)
  }
}


assert_directory <- function(x, name = deparse(substitute(x))) {
  if (!is_directory(x)) {
    stop(sprintf("'%s' must be an existing directory", name), call. = FALSE)
  }
}


assert_scalar_logical_or_null <- function(x, name = deparse(substitute(x)),
                                          what = NULL) {
  if (!is.null(x)) {
    assert_scalar_logical(x, name,
                            what %||% "a scalar logical (non-NA), or NULL")
  }
}


assert_scalar_character_or_null <- function(x, name = deparse(substitute(x)),
                                            what = NULL) {
  if (!is.null(x)) {
    assert_scalar_character(x, name,
                            what %||% "a scalar character (non-NA), or NULL")
  }
}


assert_null <- function(x, name = deparse(substitute(x)), what = "NULL") {
  if (!is.null(x)) {
    stop(sprintf("'%s' must be %s", name, what), call. = FALSE)
  }
}


assert_function <- function(x, name = deparse(substitute(x))) {
  if (!is.function(x)) {
    stop(sprintf("'%s' must be a function", name))
  }
}


assert_file_exists <- function(x) {
  msg <- x[!file.exists(x)]
  if (length(msg) > 0L) {
    stop(ngettext(length(msg),
                  "File does not exist: ",
                  "Files do not exist: "),
         paste(msg, collapse = ", "))
  }
}

assert_empty_dots <- function(..., name) {
  nextra <- length(list(...))
  if (nextra > 0L) {
    nms <- names(list(...)) %||% rep("", nextra)
    pos <- !nzchar(nms)
    if (any(pos)) {
      npos <- sum(pos)
      nms <-
        c(nms[!pos],
          paste(npos, "positional", ngettext(npos, "argument", "arguments")))
    }
    stop(sprintf("Unknown %s passed to '%s': %s",
                 ngettext(nextra, "argument", "arguments"),
                 name, paste(unique(nms), collapse = ", ")),
         call. = FALSE)
  }
}


assert_nonempty <- function(x, name = deparse(substitute(x)),
                            what = "nonempty vector") {
  if (length(x) == 0) {
    stop(sprintf("'%s' must be a %s", name, what), call. = FALSE)
  }
  invisible(x)
}


assert_nonempty_character <- function(x, name = deparse(substitute(x)),
                                      what = NULL) {
  what <- what %||% "character vector (non zero length, non-NA)"
  assert_nonempty(x, name, what)
  assert_character(x, name, what)
  assert_nonmissing(x, name, what)
  invisible(x)
}


assert_arg_is_null <- function(.type, ...) {
  args <- list(...)
  ok <- vlapply(args, is.null)
  if (!all(ok)) {
    err <- names(args)[!ok]
    stop(sprintf("Argument %s must be NULL because '%s' was provided",
                 paste(squote(err), collapse = ", "), .type), call. = FALSE)
  }
}


match_value <- function(x, values, name = deparse(substitute(x))) {
  assert_scalar_character(x, name)
  if (is.na(match(x, values))) {
    stop(sprintf("'%s' must be one of %s",
                 name, paste(sprintf("'%s'", values), collapse = ", ")),
         call. = FALSE)
  }
  x
}
