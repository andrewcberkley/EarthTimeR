#' A Flow Map Creation Function
#'
#' This function creates a flow map from a dataframe. It will output a .json file in your working directory for you to later push to a specific EarthTime instance.

#' @param dataframe Specify the name of the dataframe that you'd like to transform into a dot map .json file.
#' @param origin  Specify the column name (in quotes) that contains the latitudinal coordinates.
#' @param destination Specify the column name (in quotes) that contains the longitudinal coordinates.
#' @param centroids_geojson Defaults to "country-centroids.geojson" included with the package.
#' @param centroids_json Defaults to "centroids_by_iso_alpha_3.json" included with the package.
#' @param value_column Specify the column name (in quotes) that contains the primary value being visualized.
#' @param date_column Specify the column name (in quotes) that contains the date category.
#' @param projected_coordinate_system A flat, two-dimensional representation of the Earth based on a sphere or spheroid geographic coordinate system, but it uses linear units of measure for coordinates, so that calculations of distance and area are easily done in terms of those same units. Defaults to EPSG:3857 (WGS 84 / Pseudo-Mercator) used for rendering maps in Spherical Mercator, Google Maps, OpenStreetMap, Bing, ArcGIS, ESRI, etc.
#' @param output_dir Output director for .json file. Defaults to current working directory.
#' @keywords flow map
#' @export
#' @examples
#' \dontrun{
#' create_flowMap <-  function(dataframe, origin, destination, value_column, date_column)
#'}

#suppressWarnings(use_python("C:/ProgramData/Anaconda3/", required = TRUE))
#py_config()
#py_install("pandas")

create_flowMap <-  function(dataframe, origin, destination, value_column, date_column, projected_coordinate_system = "epsg_3857", centroids_geojson = "country-centroids.geojson", centroids_json = "centroids_by_iso_alpha_3.json", output_dir = getwd()){
  
  obj_name = deparse(substitute(dataframe))
  
  write.csv(dataframe, paste0(obj_name, ".csv"), row.names = FALSE, na = "")
  
  #The moment it clicked: http://www.mjdenny.com/R_Package_Pictorial.html
  #path <- paste(system.file("python",package="EarthTimeR"), "flowmap_via_reticulate.py", sep="/")
  
  reticulate::source_python("flowmap_via_reticulate.py")
  create_python_flowmap(obj_name, origin, destination, value_column, date_column, projected_coordinate_system, centroids_geojson, centroids_json, output_dir)
  
  invisible(file.remove(paste0(obj_name, ".csv")))
  
  cat(crayon::green$bold("\nCONGRATULATIONS:" , crayon::reset(" The dataframe for" , crayon::bgYellow(obj_name , crayon::reset(" has been converted into a .json file and is ready to be pushed to your EarthTime instance via the terminal!\n\n")))))
  
}
