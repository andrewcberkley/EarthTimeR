#' An Initial Ingestion Function
#'
#' This function allows you to create a new EarthTime data layer in Google Sheets.

#' @param dataframe Specify the name of the data frame you wish to upload.
#' @param data_layer_name Specify the name of the new EarthTime data layer.
#' @keywords ingestion upload Google sheets
#' @export
#' @examples
#' initial_ingestion()

initial_ingestion  <- function(dataframe, data_layer_name){
  Sheet1 <- dataframe
  googlesheets4::gs4_create(name = data_layer_name, sheets = Sheet1)
}
