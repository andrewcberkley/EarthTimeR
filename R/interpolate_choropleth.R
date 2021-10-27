#' A Choropleth Interpolation Function
#'
#' While most interpolation functions are performed on "long" dataframes, this function performs interpolation of missing values on a choropleth style dataframe or any type of "wide" dataframe.

#' @param dataframe Specify the name of the dataframe that you'd like to transform into a dot map .json file.
#' @param start_year  Specify the year the data begins. Due to the nature of the function, it is highly recommended that that date intervals are in years rather than days or months.
#' @param end_year Specify the year the data ends. Due to the nature of the function, it is highly recommended that that date intervals are in years rather than days or months.
#' @param time_intervals A vector of all the dataframe's time intervals that will be used as reference points for the interpolation function. Use, e.g., `time_intervals = c(2002, 2007, 2011, 2013, 2019)
#' @param interpolation_rule An integer (of length 0 or 1) describing how interpolation is to take place outside the interval (min(x), max(x)). If rule is 0 then NAs are returned for such points and if it is 1, the value at the closest data extreme is used. Defaults to 1.
#' @keywords linear interpolation
#' @export
#' @examples
#' \dontrun{
#' interpolated_df <- interpolate_choropleth(dataframe, start_year, end_year, time_intervals, interpolation_rule)
#'}

interpolate_choropleth <- function(dataframe, start_year, end_year, time_intervals, interpolation_rule = 1){

  #source("utils.R")
  
  c_names <- c("key", start_year:end_year)
  
  #list_edges <- rbind(
  #  cbind(2002, 2007),
  #  cbind(2007, 2011),
  #  cbind(2011, 2013),
  #  cbind(2013, 2019)
  #  )
  
  #How Can I Get Adjacent Pairs of Combination Using R?
  #https://stackoverflow.com/questions/7193109/how-can-i-get-adjacent-pairs-of-combination-using-r
  list_edges <- embed(time_intervals, 2)[, 2:1] #This "embeds" the time intervals into a low-dimensional Euclidean space.
  
  interpolated_df <- interpolation_function(dataframe, interpolation_rule)
  
  return(interpolated_df[,c_names])

}