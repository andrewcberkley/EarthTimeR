#' A Splitting Categories Function
#'
#' This function splits a single dataframe into multiple dataframes when there is more than one category present that would be more beneficial as individual data layers in EarthTime. It assumes that the dataframe is already in a "wide" format. If not, please use the choropleth() function in this package before invoking split_categories().

#' @param dataframe Specify the name of the wide dataframe that should be split..
#' @param categories_column Specify the column name (in quotes) or the column number that contains the various categories.
#' @keywords split categories
#' @export
#' @examples
#' \dontrun{
#' split_categories(dataframe, categories_column)
#'}

split_categories <-  function(dataframe, categories_column){
  
  categoryList <- split(dataframe, dataframe[,categories_column])
  
  for (i in seq_along(categoryList)) {
    try({
      filename = paste0(names(categoryList)[i])
      assign(filename, categoryList[[i]], envir = globalenv())
    })
  }
}
