.onLoad <- function(libname, pkgname) {
  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
  
  if (isTRUE(user_permission)) {
    reticulate::install_miniconda()
  } else {
    message("You should run `reticulate::install_miniconda() before using this package")
  }
}

LonLatToPixelXY <- NULL
FormatEpoch <- NULL
PackColor <- NULL
hex2rgb <- NULL
create_python_dotmap <- NULL

.onLoad <- function(libname, pkgname) {
  the_module <- reticulate::import(
    module = "dotmap_via_reticulate", delay_load = TRUE)
}