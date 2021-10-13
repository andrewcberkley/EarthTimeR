#' A Choropleth Function
#'
#' This function allows you to format your long data frame for an EarthTime choropleth.

#' @param long_df Specify the name of the long data frame you wish to format.
#' @param date Specify the name of the date column.
#' @param value Specify the name of the value you'd like to spread across the wide data frame.
#' @keywords choropleth
#' @export
#' @examples
#' choropleth()

choropleth <- function(long_df, date, value){
  long_df |>
    dplyr::group_by(long_df$date) |>
    dplyr::mutate(idx = dplyr::row_number()) |>
    tidyr::spread(date, value) |>
    dplyr::select(-idx)
}