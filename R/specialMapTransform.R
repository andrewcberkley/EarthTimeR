#' A Long Transform for Special Map Type Function
#'
#' While most cases required a choropleth or bubble style "wide" dataframe for ingestion into EarthTime, a few special map types in EarthTime (i.e. - line strings, point flows, points, and raster maps) need to be formatted as "long" dataframes types before using create_pointMap() and/or create_flowMap() to generate a .bin  file. This function transforms the dataframe in an appropriate format to successfully utilize the aforementioned functions. Use the pointMap_... and flowMap_... parameters to transform the data for Dot Maps and Flow Maps, respectively. 

#' @param dataframe Specify the name of the dataframe that you'd like to transform.
#' @param pointMap_latitude Specify the name (in quotes) of the latitude column. You can always specify this again while invoking the create_pointMap() function. This parameter is best used when dealing with a normal "wide" style dataframe in instances where both the location values as columns.
#' @param pointMap_longitude Specify the name (in quotes) of the longitude column. You can always specify this again while invoking the create_pointMap() function. This parameter is best used when dealing with a normal "wide" style dataframe in instances where  both the location values as columns..
#' @param flowMap_origin Specify the name (in quotes) of the origin location. You can always specify this again while invoking the create_pointMap() function. This parameter is best used when dealing with a matrix style dataframe in instances where one location value is a single column (down) and the other location value are the column headers (across).
#' @param flowMap_destination Specify the name (in quotes) of the final destination. You can always specify this again while invoking the create_flowMap() function. This parameter is best used when dealing with a matrix style dataframe in instances where one location value is a single column (down) and the other location value are the column headers (across).
#' @param pointMap_dateName Specify the name (in quotes) of what you would like to call the date column in the transformed dataframe.
#' @param flowMap_valueName Specify the name (in quotes) of what you would like to call the value column in the transformed dataframe.
#' @param value_columns A concatenated vector of the pre-transformed dataframe's date columns. Use, e.g., value_columns = c(3:223)
#' @keywords transform long dataframe special dot map flow map
#' @export
#' @examples
#' \dontrun{
#' long_df_pointMap <- specialMapTransform(dataframe, pointMap_latitude, pointMap_longitude, pointMap_dateName)
#'}
#' \dontrun{
#' long_df_flowMap <- specialMapTransform(dataframe, flowMap_origin, flowMap_destination, flowMap_valueName, flowMap_valueColumns)
#'}

specialMapTransform <- function(dataframe, pointMap_latitude = NULL, pointMap_longitude = NULL, pointMap_dateName = NULL, flowMap_origin = NULL, flowMap_destination = NULL, flowMap_valueName = NULL, flowMap_valueColumns = NULL){
  
  if(!is.null(pointMap_latitude) && !is.null(pointMap_longitude)){
    
    dataTable_long_pointMap <- data.table::melt(
      data.table::setDT(dataframe), id.vars = c(pointMap_latitude,pointMap_longitude), variable.name = pointMap_dateName
      )
    
    data_long_pointMap <- as.data.frame(dataTable_long_pointMap)

    return(data_long_pointMap)
  }
  else{
    
    data_long_flowMap <- tidyr::gather(dataframe, flowMap_origin, flowMap_valueName, all_of(flowMap_valueColumns), factor_key = TRUE)
    colnames(data_long_flowMap)[2] <- flowMap_origin
    colnames(data_long_flowMap)[3] <- flowMap_destination
    colnames(data_long_flowMap)[4] <- flowMap_valueName
    
    return(data_long_flowMap)
  }

}