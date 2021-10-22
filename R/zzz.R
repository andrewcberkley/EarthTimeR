.onLoad <- function(libname, pkgname) {
  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
  
  if (isTRUE(user_permission)) {
    reticulate::install_miniconda()
  } else {
    message("You should run `reticulate::install_miniconda() before using this package")
  }
}

.onLoad <- function(libname, pkgname) {
  the_module <- reticulate::import_from_path(module = "dotmap_via_reticulate", path = system.file("python", package = packageName()))
  LonLatToPixelXY <<- the_module$LonLatToPixelXY
  FormatEpoch <<- the_module$FormatEpoch
  PackColor <<- the_module$PackColor
  hex2rgb <<- the_module$hex2rgb
  create_python_dotmap <<- the_module$create_python_dotmap
}