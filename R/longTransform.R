#' A Long Transform for Special Map Type Function
#'
#' A few special map types in EarthTime (i.e. - line strings, point flows, points, and raster maps) are from "long" dataframes before using create_dotMap() and/or create_flowMap() to generate a .bin  file. This function transforms the dataframe in an appropriate format to successfully utilize the aforementioned functions.

#' @param dataframe Specify the name of the dataframe that you'd like to transform.
#' @param origin_name Specify the name (in quotes) of the origin location.
#' @param destination_name Specify the name (in quotes) of the final destination.
#' @param value_name
#' @param value_columns A vector of all the dataframe's time intervals that will be used as reference points for the interpolation function. Use, e.g., value_columns = c(3:223)
#' @keywords transform long dataframe special map
#' @export
#' @examples
#' \dontrun{
#' long_df <- longTransform <- function(dataframe, origin_name, destination_name, value_name)
#'}

longTransform <- function(dataframe, origin_name, destination_name, value_name, value_columns){
  data_long <- tidyr::gather(dataframe, origin_name, value_name, value_columns, factor_key = TRUE)
  colnames(data_long)[2] <- destination_name

return(data_long)
}