#' A Python Helper Function
#'
#' This function helps produce  a dot map from a dataframe using reticulate.

#' @param name N/A
#' @keywords dotmap
#' @export
#' @examples


dotmap_via_reticulate <- function(name) {
  path <- paste(system.file(package="EarthTimeR"), "dotmap_via_reticulate.py", sep="/")
  command <- paste("python", path, name)
  response <- system(command, intern=T)
  print(response)
}