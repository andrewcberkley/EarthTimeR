#' A Dot Map Creation Function
#'
#' This function splits a dotmap from a dataframe. It will output a .bin file in your working directory for you to later updload to your specific EarthTime instance.

#' @param dataframe Specify the name of the wide dataframe that should be split
#' @param categories_column Specify the column name (in quotes) or the column number that contains the various categories.
#' @keywords split categories
#' @export
#' @examples
#' \dontrun{
#' split_categories(dataframe, categories_column)
#'}

#suppressWarnings(use_python("C:/ProgramData/Anaconda3/", required = TRUE))
#py_config()
#py_install("pandas")

split_categories <-  function(dataframe, latitude_column, longitude_column, value_column, date_column, date_format, rgb_color_scheme){
  
  write.csv(dataframe, paste0(dataframe, ".csv"), row.names = FALSE, na = "")
  
  reticulate::source_python('dotmap_via_reticulate.py')
  create_dotmap(dataframe, latitude_column, longitude_column, value_column, date_column, date_format, rgb_color_scheme)
  
  file.remove()
  
  }
