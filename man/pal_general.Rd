% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hdx_pal.R
\name{hdx_pal_discrete}
\alias{hdx_pal_discrete}
\alias{hdx_pal_sapphire}
\alias{hdx_pal_tomato}
\alias{hdx_pal_mint}
\alias{hdx_pal_gray}
\title{HDX color palette (discrete)}
\usage{
hdx_pal_discrete()

hdx_pal_sapphire()

hdx_pal_tomato()

hdx_pal_mint()

hdx_pal_gray()
}
\value{
A palette function.
}
\description{
The hues in the HDX palette are sapphire, mint, and tomato.
}
\details{
\code{hdx_pal_discrete()} utilizes all hues for up to a 12 element discrete scale.

\code{hdx_pal_mint()}, \code{hdx_pal_tomato()}, and \code{hdx_pal_sapphire()} allow for a
4 element discrete scale using only the specified color. These are color
ramps with a range from dark, normal (HDX standard), light, and ultra light.
}
\examples{
hist(mtcars$mpg, col = hdx_pal_discrete()(5))

}
\seealso{
Other color hdx: 
\code{\link{hdx_color_list}},
\code{\link{hdx_colors}()}
}
\concept{color hdx}
