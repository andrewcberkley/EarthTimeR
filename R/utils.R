linear_interpolate0 <- function(y1, y2, side) {
  if (side==0) {return(y1)}
  else {return(y2)}
}

linear_interpolate1 <- function(x1, x2, y1, y2, val) {
  slope <- (y2-y1)/(x2-x1)
  return(y1+(val-x1)*slope)
}

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
            else {return(linear_interpolate0(y1, y2, 0))}
          } else if (type==1) {
            if (is.na(y1) | is.na(y2)) {return(NA)}
            else {return(linear_interpolate1(x1, x2, y1, y2, x1+j))}
          }
        }))
      colnames(dataframe)[ncol(dataframe)] <- as.character(x1+j)
    }
    
    k <- k+1
  }
  
  return(dataframe)
}