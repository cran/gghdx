# gghdx 0.1.1

* Switched base font family from Source Sans Pro to Source Sans 3.
* Fixed links flagged in CRAN checks.
* Revamped all documentation for clarity and ensuring return values and
examples are provided, based on CRAN review.
* First CRAN release, as we have reached some stability!

# gghdx 0.1.0

* Right adjusting y-axis labels in `theme_hdx()`.
* Replace deprecated `size` argument from `ggplot2` calls.
* Move `ultra-light` colors to end of `hdx_pal()` discrete palette.
* Make output of `hdx_hex()` unnamed to avoid errors in `ggplot2` and
allow both grey and gray spellings of colors.
* Change `..._gradient_...` scale functions to have `white` as the low color.
* Add `display_hdx_pal()` function to allow visualizing the HDX color palettes.
* Improved error catching when fonts are not available.
* Added gray color palette, `hdx_pal_gray()`.

# gghdx 0.0.2

* Cleaned `df_covid` for consistent days between dates on x-axis plots.
* Changed `NA` colors from white to gray.

# gghdx 0.0.1

* Added a `NEWS.md` file to track changes to the package.
* Implemented `scale_fill...()` and `scale_color_...()` functions for easy
application of HDX palette to aesthetics and `hdx_colors()`, `hdx_pal()`, and
`hdx_hex()` for user access.
* Released `theme_hdx()`.
* Added `gghdx()` to apply session level defaults for plotting.
* Developed default text plotting through `geom_text_hdx()` and
`geom_label_hdx()`.
* Built vignette and main README.md.
