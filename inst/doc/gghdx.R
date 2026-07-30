## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.showtext = TRUE,
  warning = FALSE,
  dpi = 300,
  fig.retina = 1,
  fig.align = "center"
)

## ----intro-plot, out.width = "90%", out.height = "10%", fig.height = 4, fig.width = 6----
library(ggplot2)

p <- ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    color = Species
  )
) +
  geom_point() +
  labs(
    title = "Iris species distributed by sepal and petal lengths",
    y = "Petal length",
    x = "Sepal length"
  )

p

## ----intro-hdx, out.width = "90%", out.height = "10%", fig.height = 4, fig.width = 6----
library(gghdx)

p + theme_hdx(base_family = "sans", title_family = "sans")

## ----intro-ramp, out.width = "90%", out.height = "10%", fig.height = 4, fig.width = 6----
p +
  theme_hdx(base_family = "sans", title_family = "sans") +
  scale_color_hdx_discrete()

## ----extrafont, out.width = "90%", out.height = "10%", fig.height = 4, fig.width = 6----
library(showtext)

# fall back to sans if Google Fonts can't be reached while building this
# vignette (e.g. no internet connection)
fonts_ok <- tryCatch(
  {
    font_add_google("Merriweather")
    font_add_google("Roboto")
    TRUE
  },
  error = function(cond) FALSE
)
showtext_auto()

p +
  theme_hdx(
    base_family = if (fonts_ok) "Roboto" else "sans",
    title_family = if (fonts_ok) "Merriweather" else "sans"
  ) +
  scale_color_hdx_discrete()

## ----gghdx, out.width = "90%", out.height = "10%", fig.height = 4, fig.width = 6----
# fall back to sans if Google Fonts can't be reached while building this
# vignette (e.g. no internet connection)
fonts_ok <- tryCatch(
  {
    gghdx()
    TRUE
  },
  error = function(cond) FALSE
)
if (!fonts_ok) {
  gghdx(showtext = FALSE, base_family = "sans", title_family = "sans")
}
p

## ----example-plots, echo = FALSE, out.width = "45%", out.height = "20%", fig.show = "hold", fig.align = "default"----

knitr::include_graphics(
  c(
    here::here("man", "figures", "covid_blue.png"),
    here::here("man", "figures", "covid_red.png")
  )
)

## ----covid-match, fig.height = 5, fig.width = 6, out.width = "45%", fig.show = "hold", fig.align = "default"----
# fall back to sans if Google Fonts can't be reached while building this
# vignette (e.g. no internet connection)
fonts_ok <- tryCatch(
  {
    load_source_sans_3()
    TRUE
  },
  error = function(cond) FALSE
)
legacy_family <- if (fonts_ok) "Source Sans 3" else "sans"

p_blue <- ggplot(
  df_covid,
  aes(
    x = date,
    y = cases_monthly
  )
) +
  geom_bar(
    stat = "identity",
    width = 6,
    fill = hdx_hex("sapphire-hdx") # use sapphire for fill
  ) +
  scale_y_continuous_hdx(
    labels = label_number_hdx()
  ) +
  scale_x_date(
    date_breaks = "1 month",
    labels = function(x) toupper(strftime(x, "%b"))
  ) +
  theme_hdx(design = "legacy", base_family = legacy_family) +
  labs(
    title = "Monthly global COVID-19 confirmed cases in 2020",
    subtitle = "DATA | JUL 2022 | World Health Organization",
    x = "",
    y = ""
  )

p_blue

# create red plot
p_blue +
  geom_bar(
    aes(
      fill = flag
    ),
    width = 6,
    stat = "identity"
  ) +
  scale_fill_hdx_tomato() +
  theme(
    legend.position = "none"
  ) +
  labs(
    title = "Monthly COVID-19 # of cases surpasses 8 million"
  )

