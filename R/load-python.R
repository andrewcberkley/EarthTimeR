# Load the module and create dummy objects from it, all of which are NULL
dotmap_via_reticulate <- reticulate::import_from_path(
  "dotmap_via_reticulate",
  file.path("inst", "py")
)
for (obj in names(dotmap_via_reticulate)) {
  assign(obj, NULL)
}
# Clean up
rm(dotmap_via_reticulate)

# Now all those names are in the namespace, and ready to be replaced on load
.onLoad <- function(libname, pkgname) {
  dotmap_via_reticulate <- reticulate::import_from_path(
    "dotmap_via_reticulate",
    system.file("py", package = packageName()),
    delay_load = TRUE
  )
  # assignInMyNamespace(...) is meant for namespace manipulation
  for (obj in names(dotmap_via_reticulate)) {
    assignInMyNamespace(obj, dotmap_via_reticulate[[obj]])
  }
}