#' An Append New Data Layer to CSV Layers Sheet Function
#'
#' This function allows for the appending of a new data layer into your CSV layers sheet. Can be used in conjunction with map functions such as generate_csv_layer_row().

#' @param csv_layer Specify the name of the csv layer output from previous functions.
#' @param ss Something that identifies a Google Sheet: its file ID, a URL from which we can recover the ID, an instance of googlesheets4_spreadsheet (returned by sheets_get()), or a dribble, which is how googledrive represents Drive files. Processed through as_sheets_id().
#' @param sheet Sheet to append to, in the sense of "worksheet" or "tab". You can identify a sheet by name, with a string, or by position, with a number.
#' @keywords append CSV layers
#' @export
#' @examples
#' append_new_data_layer_to_CSV_layers()

append_new_data_layer_to_CSV_layers  <- function(ss, csv_layer, sheet = "CSV Layers"){
  googlesheets4::sheet_append(ss, data = csv_layer, sheet = "CSV Layers")
}
