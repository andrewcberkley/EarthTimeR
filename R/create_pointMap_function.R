#' A Point Map Creation Function
#'
#' This function creates a point map from a dataframe. It will output a .bin file in your working directory for you to later push to a specific EarthTime instance.

#' @param dataframe Specify the name of the dataframe that you'd like to transform into a point map .bin file.
#' @param latitude_column Specify the column name (in quotes) that contains the latitudinal coordinates.
#' @param longitude_column Specify the column name (in quotes) that contains the longitudinal coordinates.
#' @param value_column Specify the column name (in quotes) that contains the primary value being visualized.
#' @param date_column Specify the column name (in quotes) that contains the date category.
#' @param date_format Specify format of the dates. The full set of format codes supported varies across platforms, because this function draws on Python it will call from the platform's C library's strftime() function, and platform variations are common. The date format codes required are the C standard (1989 version), and these work on all platforms with a standard C implementation. Note that the 1999 version of the C standard added additional format codes. The function defaults to "%Y-%m-%d".
#' @param rgb_color_scheme Specify RGB  tuple of float values in a closed interval between 0 and 255. Defaults to "255,0,0" (i.e. - the color red).
#' @keywords point map
#' @export
#' @examples
#' \dontrun{
#' create_pointMap <-  function(dataframe, latitude_column, longitude_column, value_column, date_column)
#'}

#suppressWarnings(use_python("C:/ProgramData/Anaconda3/", required = TRUE))
#py_config()
#py_install("pandas")

create_pointMap <-  function(dataframe, latitude_column, longitude_column, value_column, date_column, date_format = "%Y-%m-%d", rgb_color_scheme = "[255,0,0]"){
  
  obj_name = deparse(substitute(dataframe))
  # df <- # code that cleans the df (runs with no errors)
  
  red_green_blue <- stringr::str_extract_all(rgb_color_scheme, "\\d+")
  red <- as.numeric(red_green_blue[[1]][[1]])
  green <- as.numeric(red_green_blue[[1]][[2]])
  blue <- as.numeric(red_green_blue[[1]][[3]])
  
  write.csv(dataframe, paste0(obj_name, ".csv"), row.names = FALSE, na = "")
  
  #The moment it clicked: http://www.mjdenny.com/R_Package_Pictorial.html
  path <- paste(system.file("python",package="EarthTimeR"), "pointmap_via_reticulate.py", sep="/")
  
  reticulate::source_python(path)
  create_python_pointmap(obj_name, latitude_column, longitude_column, value_column, date_column, date_format, red, green, blue)
  
  invisible(file.remove(paste0(obj_name, ".csv")))
  
  cat(crayon::green$bold("\nCONGRATULATIONS:" , crayon::reset(" The dataframe for" , crayon::bgYellow(obj_name , crayon::reset(" has been converted into a .BIN file and is ready to be pushed to your EarthTime instance via the terminal!\n\n")))))
  
  }
