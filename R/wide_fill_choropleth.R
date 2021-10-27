#' A Choropleth Filling Function
#'
#' Occasionally you'll encounter a dataset that only has a value of interest at a single point in time, but you'd like to maintain that value for the duration of the timeline (e.g., discovery of a rare earth mineral deposit). This function allows you to create a wide dataframe that will maintain the value through the entire timeline. Please note that this is not a substitute for statistical techniques or to handle missing values. For those such instances, use the interpolate_choropleth() function.

#' @param dataframe Specify the name of the dataframe that you'd like to fill.
#' @keywords fill wide dataframe
#' @export
#' @examples
#' \dontrun{
#' filled_df <- fill_choropleth(dataframe)
#'}

fill_choropleth <- function(dataframe){
  dataframe_subset <- dataframe[,-c(1)]
  dataframe_filled <- t(apply(dataframe_subset, 1, function(x) zoo::na.locf(x, fromLast = F, na.rm = F)))
  dataframe_key <- dataframe[,c(1)]
  wide_final <- cbind(dataframe_key, dataframe_filled)

  return(wide_final)
}