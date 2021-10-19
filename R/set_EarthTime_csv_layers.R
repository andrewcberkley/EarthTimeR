#' An Install the Default CSV Layers EarthTime Sheet in Your \code{.Renviron} File for Repeated Use Function
#'
#' This function will add your EarthTime CSV Layers sheet to your \code{.Renviron} file so it can be called securely without being stored in your code. After you have installed your sheet, it can be called any time by typing \code{Sys.getenv("EARTHTIME_CSV_LAYERS")} and can be used in package functions by simply typing set_EarthTime_csv_layers() If you do not have an \code{.Renviron} file, the function will create on for you. If you already have an \code{.Renviron} file, the function will append the key to your existing file, while making a backup of your original file for disaster recovery purposes.

#' @param spreadsheet_id Specify the name of the csv layer output from previous functions.
#' @param GID Something that identifies a Google Sheet: its file ID, a URL from which we can recover the ID, an instance of googlesheets4_spreadsheet (returned by sheets_get()), or a dribble, which is how googledrive represents Drive files. Processed through as_sheets_id().
#' @param sheet_name Sheet to append to, in the sense of "worksheet" or "tab". You can identify a sheet by name, with a string, or by position, with a number.
#' @keywords authorize
#' @export
#' @examples
#' \dontrun{
#' set_EARTHTIME_CSV_LAYERS("xxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxx", install = TRUE)
#' # First time, reload your environment so you can use the key without restarting R.
#' readRenviron("~/.Renviron")
#' You can check it with:
#' Sys.getenv("EARTHTIME_CSV_LAYERS")
#'}

#'\dontrun{
#'  # If you need to overwrite an existing key:
#'  set_EARTHTIME_CSV_LAYERS("xxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxx", overwrite = TRUE, install = TRUE)
#'  # First time, reload your environment so you can use the key without restarting R.
#'  readRenviron("~/.Renviron")
#'  # You can check it with:
#'  Sys.getenv("EARTHTIME_CSV_LAYERS")
#'}
#'}

set_EARTHTIME_CSV_LAYERS  <- function (key1, key2, overwrite = FALSE, install = FALSE) {
  if (install) {
    home <- Sys.getenv("HOME")
    renv <- file.path(home, ".Renviron")
    if (file.exists(renv)) {
      file.copy(renv, file.path(home, ".Renviron_backup"))
      }
    if (!file.exists(renv)) {
      file.create(renv)
      }
    else {
      if (isTRUE(overwrite)) {
        message("Your original .Renviron will be backed up and stored in your R HOME directory if needed.")
        oldenv = read.table(renv, stringsAsFactors = FALSE)
        newenv <- oldenv[-grep("EARTHTIME_CSV_LAYERS", oldenv), ]
        write.table(newenv, renv, quote = FALSE, sep = "\n", col.names = FALSE, row.names = FALSE)
        }
      else {
        tv <- readLines(renv)
        if (any(grepl("EARTHTIME_CSV_LAYERS", tv))) {
          stop("A EARTHTIME_CSV_LAYERS already exists. You can overwrite it with the argument overwrite=TRUE", call. = FALSE)
        }
      }
      }
    keyconcat1 <- paste0("EarthTime_CSV_layers_spreadsheet='", key2, "'")
    write(keyconcat1, renv, sep = "\n", append = TRUE)
    keyconcat2 <- paste0("EarthTime_CSV_layers_gid='", key2, "'")
    write(keyconcat2, renv, sep = "\n", append = TRUE)
    message("Your EarthTime CSV Layers Sheet has been stored in your .Renviron and can be accessed by Sys.getenv(\"EARTHTIME_CSV_LAYERS\"). \nTo use now, restart R or run `readRenviron(\"~/.Renviron\")`")
    return(key1)
    return(key2)
    }
  else {
    message("To install your API key for use in future sessions, run this function with `install = TRUE`.")
    Sys.setenv(EARTHTIME_CSV_LAYERS = key)
  }
}

