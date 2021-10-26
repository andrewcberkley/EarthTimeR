#' A Choropleth Interpolation Function
#'
#' While most interpolation functions are performed on "long" dataframes, this function performs linear interpolation of missing values on a choropleth style dataframe or any type of "wide" dataframe.

#' @param dataframe Specify the name of the dataframe that you'd like to transform into a dot map .json file.
#' @param start_year  Specify the year the data begins. Due to the nature of the function, it is highly recommended that that date intervals are in years rather than days or months..
#' @param end_year Specify the year the data ends. Due to the nature of the function, it is highly recommended that that date intervals are in years rather than days or months.
#' @keywords linear interpolation
#' @export
#' @examples
#' \dontrun{
#' new_df <- interpolate_choropleth(dataframe, 1)
#'}
#'



choropleth_linear_interpolate0 <- function(y1, y2, side) {
if (side==0) {return(y1)}
else {return(y2)}
}

choropleth_linear_interpolate1 <- function(x1, x2, y1, y2, val) {
  slope <- (y2-y1)/(x2-x1)
  return(y1+(val-x1)*slope)
}

c_names <- c("key_name", start_year:end_year)

list_edges <- rbind(
  cbind(2002, 2007),
  cbind(2007, 2011),
  cbind(2011, 2013),
  cbind(2013, 2019))

interpolate_choropleth <- function(my.df, type) {
  
  k <- 2
  
  for (i in 1:nrow(list_edges)) {
    
    x1 <- list_edges[i,1]
    x2 <- list_edges[i,2]
    
    for (j in 1:(x2-x1-1)) {
      
      my.df <- cbind(my.df, apply(
        my.df, 1, 
        function(x) {
          y1 <- as.numeric(x[k])
          y2 <- as.numeric(x[k+1])
          if (type==0) {
            if (is.na(y1) | is.na(y2)) {return(NA)}
            else {return(choropleth_linear_interpolate0(y1, y2, 0))}
          } else if (type==1) {
            if (is.na(y1) | is.na(y2)) {return(NA)}
            else {return(choropleth_linear_interpolate1(x1, x2, y1, y2, x1+j))}
          }
        }))
      colnames(my.df)[ncol(my.df)] <- as.character(x1+j)
    }
    
    k <- k+1
  }
  
  return(my.df)
}