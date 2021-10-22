LonLatToPixelXY <- NULL
FormatEpoch <- NULL
PackColor <- NULL
hex2rgb <- NULL
create_python_dotmap <- NULL

.onLoad <- function(libname, pkgname) {
  the_module <- reticulate::import_from_path(module = "dotmap_via_reticulate", path = system.file("python", package = packageName()))
  dotmap_via_reticulate <<- the_module$LonLatToPixelXY
  dotmap_via_reticulate <<- the_module$FormatEpoch
  dotmap_via_reticulate <<- the_module$PackColor
  dotmap_via_reticulate <<- the_module$hex2rgb
  dotmap_via_reticulate <<- the_module$create_python_dotmap
}