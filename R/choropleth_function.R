#' A Choropleth Function
#'
#' This function allows for the transformation of a long dataframe into a wide dataframe for an EarthTime choropleth.

#' @param dataframe Specify the name of the long data frame you wish to format.
#' @param date Specify the name of the date column.
#' @param value Specify the name of the value you'd like to spread across the wide data frame.
#' @keywords choropleth
#' @export
#' @examples
#' choropleth()

choropleth <- function(dataframe, date, value){
  dataframe |>
    dplyr::group_by(dataframe$date) |>
    dplyr::mutate(idx = dplyr::row_number()) |>
    tidyr::spread(date, value) |>
    dplyr::select(-idx)
}