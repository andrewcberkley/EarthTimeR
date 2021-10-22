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
  pkg_ns_env <- parent.env(environment())
  dotmap_via_reticulate <- reticulate::import_from_path("dotmap_via_reticulate", system.file("python", "dotmap_via_reticulate", package = pkgname, mustWork = TRUE))
  lapply(names(dotmap_via_reticulate), function(name) assign(name, dotmap_via_reticulate[[name]], pkg_ns_env))
}