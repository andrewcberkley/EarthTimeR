#' A Choropleth Interpolation Function
#'
#' While most interpolation functions are performed on "long" dataframes, this function performs interpolation of missing values on a choropleth style dataframe or any type of "wide" dataframe.

#' @param dataframe Specify the name of the dataframe that you'd like to transform into a dot map .json file.
#' @param start_year  Specify the year the data begins. Due to the nature of the function, it is highly recommended that that date intervals are in years rather than days or months.
#' @param end_year Specify the year the data ends. Due to the nature of the function, it is highly recommended that that date intervals are in years rather than days or months.
#' @param time_intervals A vector of all the dataframe's time intervals that will be used as reference points for the interpolation function. Example: c(2002, 2007, 2011, 2013, 2019)
#' @param interpolation_rule An integer (of length 0 or 1) describing how interpolation is to take place outside the interval (min(x), max(x)). If rule is 0 then NAs are returned for such points and if it is 1, the value at the closest data extreme is used. Defaults to 1.
#' @keywords linear interpolation
#' @export
#' @examples
#' \dontrun{
#' interpolated_df <- interpolate_choropleth(dataframe, start_year, end_year, time_intervals, interpolation_type)
#'}

interpolate_choropleth <- function(dataframe, start_year, end_year, time_intervals, interpolation_rule = 1){

  choropleth_linear_interpolate0 <- function(y1, y2, side) {
  if (side==0) {return(y1)}
  else {return(y2)}
  }
  
  choropleth_linear_interpolate1 <- function(x1, x2, y1, y2, val) {
    slope <- (y2-y1)/(x2-x1)
    return(y1+(val-x1)*slope)
  }
  
  c_names <- c("key", start_year:end_year)
  
  list_edges <- rbind(
    cbind(2002, 2007),
    cbind(2007, 2011),
    cbind(2011, 2013),
    cbind(2013, 2019)
    )
  
  interpolation_function <- function(dataframe, type) {
    
    k <- 2
    
    for (i in 1:nrow(list_edges)) {
      
      x1 <- list_edges[i,1]
      x2 <- list_edges[i,2]
      
      for (j in 1:(x2-x1-1)) {
        
        dataframe <- cbind(dataframe, apply(
          dataframe, 1, 
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
        colnames(dataframe)[ncol(dataframe)] <- as.character(x1+j)
      }
      
      k <- k+1
    }
    
    return(dataframe)
  }

}