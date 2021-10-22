LonLatToPixelXY <- NULL
FormatEpoch <- NULL
PackColor <- NULL
hex2rgb <- NULL
create_python_dotmap <- NULL

.onLoad <- function(libname, pkgname) {
  the_module <- reticulate::import_from_path(module = "dotmap_via_reticulate", path = system.file("python", package = packageName()))
  LonLatToPixelXY <<- the_module$LonLatToPixelXY
  FormatEpoch <<- the_module$FormatEpoch
  PackColor <<- the_module$PackColor
  hex2rgb <<- the_module$hex2rgb
  create_python_dotmap <<- the_module$create_python_dotmap
}