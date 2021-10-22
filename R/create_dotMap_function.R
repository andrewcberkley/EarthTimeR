#' A Dot Map Creation Function
#'
#' This function splits a dot map from a dataframe. It will output a .bin file in your working directory for you to later upload to your specific EarthTime instance.

#' @param dataframe Specify the name of the dataframe that you'd like to transform into a dot map .bin file.
#' @param latitude_column Specify the column name (in quotes) that contains the latitudinal coordinates.
#' @param longitude_column Specify the column name (in quotes) that contains the longitudinal coordinates.
#' @param value_column Specify the column name (in quotes) that contains the primary value being visualized.
#' @param date_column Specify the column name (in quotes) that contains the date category.
#' @param date_format Specify format of the dates. The full set of format codes supported varies across platforms, because this function draws on Python it will call from the platform's C library's strftime() function, and platform variations are common. The date format codes required are the C standard (1989 version), and these work on all platforms with a standard C implementation. Note that the 1999 version of the C standard added additional format codes. The function defaults to "%Y-%m-%d".
#' @param rgb_color_scheme Specify RGB  tuple of float values in a closed interval between 0 and 255. Defaults to "255,0,0" (i.e. - the color red).
#' @keywords dot map
#' @export
#' @examples
#' \dontrun{
#' create_dotMap <-  function(dataframe, latitude_column, longitude_column, value_column, date_column)
#'}

#suppressWarnings(use_python("C:/ProgramData/Anaconda3/", required = TRUE))
#py_config()
#py_install("pandas")

create_dotMap <-  function(dataframe, latitude_column, longitude_column, value_column, date_column, date_format = "%Y-%m-%d", rgb_color_scheme = "[255,0,0]"){
  
  #####PYTHON HELPERS
  #Delay Loading Python Modules
  #If you write an R package that wraps one or more Python packages, it's likely that you'll be importing Python modules within the .onLoad method of your package so that you can have convenient access to them within the rest of the package source code.
  
  #When you do this, you should use the delay_load flag to the import() function, for example:
  
  # global reference to scipy (will be initialized in .onLoad)
  #scipy <- NULL
  
  #.onLoad <- function(libname, pkgname) {
    # use superassignment to update global reference to scipy
  #  scipy <<- reticulate::import("scipy", delay_load = TRUE)
  #}
  
  #Using the delay_load flag has two important benefits:
    
  #  It allows you to successfully load your package even when Python / Python packages are not installed on the target system (this is particularly important when testing on CRAN build machines).
  
  #It allows users to specify a desired location for Python before interacting with your package.
  
  dotmap_via_reticulate <- NULL
  
  .onLoad <- function(libname, pkgname) {
    the_module <- reticulate::import_from_path(module = "dotmap_via_reticulate", path = system.file("py", package = packageName()))
    dotmap_via_reticulate <<- the_module$dotmap_via_reticulate
  }
  
  #####END PYTHON HELPERS
  
  obj_name = deparse(substitute(dataframe))
  # df <- # code that cleans the df (runs with no errors)
  
  red_green_blue <- stringr::str_extract_all(rgb_color_scheme, "\\d+")
  red <- as.numeric(red_green_blue[[1]][[1]])
  green <- as.numeric(red_green_blue[[1]][[2]])
  blue <- as.numeric(red_green_blue[[1]][[3]])
  
  write.csv(dataframe, paste0(obj_name, ".csv"), row.names = FALSE, na = "")
  
  reticulate::source_python('dotmap_via_reticulate.py')
  create_python_dotmap(obj_name, latitude_column, longitude_column, value_column, date_column, date_format, red, green, blue)
  
  invisible(file.remove(paste0(obj_name, ".csv")))
  
  cat(crayon::green$bold("\nCONGRATULATIONS:" , crayon::reset(" The dataframe for" , crayon::bgYellow(obj_name , crayon::reset(" has been converted into a .BIN file and is ready to be pushed to your EarthTime instance via the terminal!\n\n")))))
  
  }
