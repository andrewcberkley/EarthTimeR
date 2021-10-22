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