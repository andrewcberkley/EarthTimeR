#' A Long Transform for Special Map Type Function
#'
#' A few special map types in EarthTime (i.e. - line strings, point flows, points, and raster maps) are from "long" dataframes before using create_dotMap() and/or create_flowMap() to generate a .bin  file. This function transforms the dataframe in an appropriate format to successfully utilize the aforementioned functions.

#' @param dataframe Specify the name of the dataframe that you'd like to transform.
#' @param dotMap_latitude
#' @param dotMap_longitude
#' @param flowMap_origin Specify the name (in quotes) of the origin location. You can always specify this again while invoking the create_flowMap() function.
#' @param flowMap_destination Specify the name (in quotes) of the final destination. You can always respecify this while invoking the create_flowMap() function.
#' @param value_name
#' @param value_columns A vector of all the dataframe's time intervals that will be used as reference points for the interpolation function. Use, e.g., value_columns = c(3:223)
#' @keywords transform long dataframe special map
#' @export
#' @examples
#' \dontrun{
#' long_df_dotMap <- longTransform <- function(dataframe, dotMap_latitude, dotMap_longitude, value_name)
#'}
#' \dontrun{
#' long_df_flowMap <- longTransform <- function(dataframe, flowMap_origin, flowMap_destination, value_name)
#'}

longTransform <- function(dataframe, dotMap_latitude = NULL, dotMap_longitude = NULL, flowMap_origin = NULL, flowMap_destination = NULL, value_name, value_columns){
  data_long <- tidyr::gather(dataframe, flowMap_origin, value_name, value_columns, factor_key = TRUE)
  colnames(data_long)[2] <- flowMap_origin
  colnames(data_long)[3] <- flowMap_destination
  colnames(data_long)[4] <- value_name

return(data_long)
}