#from: https://community.rstudio.com/t/build-package-namespace-dynamically-during-onload/4101/3
#via: https://github.com/rstudio/reticulate/issues/780

# Load the module and create dummy objects from it, all of which are NULL
dotmap_via_reticulate <- reticulate::import_from_path(
  "dotmap_via_reticulate",
  file.path("inst", "python")
)
for (obj in names(dotmap_via_reticulate)) {
  assign(obj, NULL)
}
# Clean up
rm(dotmap_via_reticulate)

LonLatToPixelXY <- NULL
FormatEpoch <- NULL
PackColor <- NULL
hex2rgb <- NULL
create_python_dotmap <- NULL

# Now all those names are in the namespace, and ready to be replaced on load
.onLoad <- function(libname, pkgname) {
  dotmap_via_reticulate <- reticulate::import_from_path(
    "dotmap_via_reticulate",
    system.file("python", package = packageName()),
    delay_load = TRUE
  )
  # assignInMyNamespace(...) is meant for namespace manipulation
  for (obj in names(dotmap_via_reticulate)) {
    assignInMyNamespace(obj, dotmap_via_reticulate[[obj]])
  }
}

