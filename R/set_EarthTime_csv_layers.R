#' An Install the Default CSV Layers EarthTime Sheet in Your \code{.Renviron} File for Repeated Use Function
#'
#' This function will add your EarthTime CSV Layers sheet to your \code{.Renviron} file so it can be called securely without being stored in your code. After you have installed your sheet, it can be called any time by typing \code{Sys.getenv("EarthTime_csv_layers")} and can be used in package functions by simply typing set_EarthTime_csv_layers() If you do not have an \code{.Renviron} file, the function will create on for you. If you already have an \code{.Renviron} file, the function will append the key to your existing file, while making a backup of your original file for disaster recovery purposes.

#' @param spreadsheet_id Specify the name of the csv layer output from previous functions.
#' @param GID Something that identifies a Google Sheet: its file ID, a URL from which we can recover the ID, an instance of googlesheets4_spreadsheet (returned by sheets_get()), or a dribble, which is how googledrive represents Drive files. Processed through as_sheets_id().
#' @param sheet_name Sheet to append to, in the sense of "worksheet" or "tab". You can identify a sheet by name, with a string, or by position, with a number.
#' @keywords authroize
#' @export
#' @examples
#' \dontrun{
#' set_EarthTime_csv_layers("xxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxx", install = TRUE)
#' # First time, reload your environment so you can use the key without restarting R.
#' readRenviron("~/.Renviron")
#' You can check it with:
#' Sys.getenv("EarthTime_csv_layers")
#'}

#'\dontrun{
#'  # If you need to overwrite an existing key:
#'  set_EarthTime_csv_layers("xxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxx", overwrite = TRUE, install = TRUE)
#'  # First time, relead your environment so you can use the key without restarting R.
#'  readRenviron("~/.Renviron")
#'  # You can check it with:
#'  Sys.getenv("EarthTime_csv_layers")
#'}
#'}

append_new_data_layer_to_CSV_layers  <- function(ss, csv_layer, sheet = "CSV Layers"){
  googlesheets4::sheet_append(ss, data = csv_layer, sheet = "CSV Layers")
}

