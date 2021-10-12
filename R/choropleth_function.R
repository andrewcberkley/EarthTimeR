#' A Choropleth Function
#'
#' This function allows you to format your long dataframe for an EarthTime choropleth.
#' @param new_df_name Set the name of the new dataframe..
#' @param long_df Specify the name of the long dataframe you wish to format..
#' @param date Specify the name of the date column.
#' @param value Specify the name of the value you'd like to spread across the wide dataframe.
#' @keywords choropleth
#' @export
#' @examples
#' choropleth()

choropleth <- function(new_df_name, long_df, date, value){
  new_df_name <- tidyverse::long_df %>%
    group_by(date) %>%
    mutate(idx = row_number()) %>%
    spread(date, value) %>%
    select(-idx)
}