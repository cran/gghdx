#' HDX color palette (discrete)
#'
#' The hues in the HDX palette are sapphire, mint, and tomato.
#'
#' `hdx_pal_discrete()` utilizes all hues for up to a 12 element discrete scale.
#'
#' `hdx_pal_mint()`, `hdx_pal_tomato()`, and `hdx_pal_sapphire()` allow for a
#' 4 element discrete scale using only the specified color. These are color
#' ramps with a range from dark, normal (HDX standard), light, and ultra light.
#'
#' @family color hdx
#' @rdname pal_general
#'
#' @examples
#' hist(mtcars$mpg, col = hdx_pal_discrete()(5))
#'
#' @return A palette function.
#'
#' @export
hdx_pal_discrete <- function() {
  colors <- hdx_colors(c("sapphire", "tomato", "mint"))

  max_n <- 12
  # TODO: replace manual colors with pattern if possible
  # for now is just generic set to get the package started
  # tomato used only when necessary for odd # of colors
  f <- function(n) {
    check_pal_n(n, max_n)
    if (n == 1L) {
      i <- "mint-hdx"
    } else if (n == 2L) {
      i <- c("mint-hdx", "sapphire-hdx")
    } else if (n == 3L) {
      i <- c("mint-hdx", "sapphire-hdx", "tomato-hdx")
    } else if (n == 4L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light"
      )
    } else if (n == 5L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light"
      )
    } else if (n == 6L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light", "sapphire-light"
      )
    } else if (n == 7L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light", "sapphire-light",
        "tomato-dark"
      )
    } else if (n == 8L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light", "sapphire-light",
        "tomato-dark", "sapphire-dark"
      )
    } else if (n == 9L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light", "sapphire-light",
        "tomato-dark", "sapphire-dark", "mint-dark"
      )
    } else if (n == 10L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light", "sapphire-light",
        "tomato-dark", "sapphire-dark", "mint-dark",
        "mint-ultra-light"
      )
    } else if (n == 11L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light", "sapphire-light",
        "tomato-dark", "sapphire-dark", "mint-dark",
        "mint-ultra-light", "sapphire-ultra-light"
      )
    } else if (n >= 12L) {
      i <- c(
        "sapphire-hdx", "mint-hdx", "tomato-hdx",
        "mint-light", "tomato-light", "sapphire-light",
        "tomato-dark", "sapphire-dark", "mint-dark",
        "mint-ultra-light", "sapphire-ultra-light",
        "tomato-ultra-light"
      )
    }
    unname(colors[i])
  }

  attr(f, "max_n") <- max_n
  f
}

#' Color palette for single color
#'
#' `hdx_pal_general()` is an internal convenience function simply used
#' behind the 3 4-level color palettes for HDX, `hdx_pal_sapphire()`,
#' `hdx_pal_mint()`, and `hdx_pal_tomato()`.
#'
#' @param colors Input of sing
#' @param max_n Maximum colors in the palette
#'
#' @noRd
hdx_pal_general <- function(colors, max_n = 4) {
  f <- function(n) {
    check_pal_n(n, max_n)
    if (n == 1L) {
      i <- 2
    } else if (n == 2L) {
      i <- c(4, 2)
    } else if (n >= 3L) {
      i <- seq(max_n, max_n + 1 - min(n, max_n), -1)
    }
    unname(colors[i])
  }
  attr(f, "max_n") <- max_n
  f
}

#' @rdname pal_general
#' @export
hdx_pal_sapphire <- function() {
  hdx_pal_general(hdx_colors("sapphire"))
}

#' @rdname pal_general
#' @export
hdx_pal_tomato <- function() {
  hdx_pal_general(hdx_colors("tomato"))
}

#' @rdname pal_general
#' @export
hdx_pal_mint <- function() {
  hdx_pal_general(hdx_colors("mint"))
}

#' @rdname pal_general
#' @export
hdx_pal_gray <- function() {
  hdx_pal_general(hdx_colors("gray"), 5)
}

#' Limit palette values
#'
#' Function to check `n` passed to a palette is not above the max. Copied
#' from [ggthemes](https://github.com/jrnold/ggthemes) package for convenience.
#'
#' @param n `n` passed by user
#' @param max_n Max `n` for this specific palette
#'
#' @noRd
check_pal_n <- function(n, max_n) {
  if (n > max_n) {
    warning(
      "This palette can handle a maximum of ",
      max_n,
      " values. ",
      "You have supplied ", n, "."
    )
  } else if (n < 0) {
    stop("`n` must be a non-negative integer.", call. = FALSE)
  }
}
