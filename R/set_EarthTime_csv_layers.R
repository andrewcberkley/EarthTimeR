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
#' Sys.getenv("EarthTime_CSV_Layers")
#'}

#'\dontrun{
#'  # If you need to overwrite an existing key:
#'  set_EARTHTIME_CSV_LAYERS("xxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxx", overwrite = TRUE, install = TRUE)
#'  # First time, reload your environment so you can use the key without restarting R.
#'  readRenviron("~/.Renviron")
#'  # You can check it with:
#'  Sys.getenv("EarthTime_CSV_Layers")
#'}
#'}

set_EarthTime_CSV_Layers  <- function (spreadsheetId, sheetId, overwrite = FALSE, install = FALSE) {
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
        oldenv1 = read.table(renv, stringsAsFactors = FALSE)
        newenv1 <- oldenv1[-grep("EarthTime_CSV_Layers_spreadsheetId", oldenv1), ]
        write.table(newenv1, renv, quote = FALSE, sep = "\n", col.names = FALSE, row.names = FALSE)
        oldenv2 = read.table(renv, stringsAsFactors = FALSE)
        newenv2 <- oldenv2[-grep("EarthTime_CSV_Layers_spreadsheetId", oldenv2), ]
        write.table(newenv2, renv, quote = FALSE, sep = "\n", col.names = FALSE, row.names = FALSE)
        }
      else {
        tv <- readLines(renv)
        if (any(grepl("EarthTime_CSV_Layers_spreadsheetId", tv))) {
          stop("An EarthTime CSV Layers spreadsheet entry already exists. You can overwrite it with the argument overwrite=TRUE", call. = FALSE)
        }
      }
      }
    keyconcat1 <- paste0("EarthTime_CSV_Layers_spreadsheetId='", spreadsheetId, "'")
    write(keyconcat1, renv, sep = "\n", append = TRUE)
    keyconcat2 <- paste0("EarthTime_CSV_Layers_sheetId='", sheetId, "'")
    write(keyconcat2, renv, sep = "\n", append = TRUE)
    message("Your EarthTime CSV Layers Sheet has been stored in your .Renviron and can be accessed by Sys.getenv(\"EARTHTIME_CSV_LAYERS\"). \nTo use now, restart R or run `readRenviron(\"~/.Renviron\")`")
    
    confirmation <- paste0("Congratulations! Your EarthTime CSV layers sheet, 'https://docs.google.com/spreadsheets/d/", spreadsheetId, "/edit#gid=", sheetId, "' has been written into your .Renviron")
    
    return(confirmation)
    }
  else {
    message("To install your default EarthTime CSV Layers spreadsheet for use in future sessions, run this function with `install = TRUE`.")
    Sys.setenv(EarthTime_CSV_Layers_spreadsheetId = spreadsheetId)
    Sys.setenv(EarthTime_CSV_Layers_sheetId = sheetId)
  }
}

