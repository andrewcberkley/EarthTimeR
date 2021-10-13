#' An Overwrite Sheet Function
#'
#' This function allows you to upload and overwrite an EarthTime data layer in Google Sheets.

#' @param dataframe Specify the name of data frame you wish to upload.
#' @param spreadsheetId Specify the spreadsheet ID (workbook ID) of your Google sheet.
#' @param sheetId Specify the sheet that you would like to overwrite. "sheetId" is lso referred to as Google Grid ID, or "gid".
#' @param sheet_name If there is a different sheet name other than "Sheet1", specify it here; otherwise, it will automatically default to "Sheet1".
#' @keywords overwrite upload Google sheets
#' @export
#' @examples
#' overwrite_sheet()

overwrite_sheet  <- function(dataframe, spreadsheetId, sheetId){
  ss <- googlesheets4::as_sheets_id(paste0("https://docs.google.com/spreadsheets/d/", spreadsheetId, "/edit#gid=", sheetId))
  googlesheets4::sheet_write(dataframe, ss = ss, sheet = sheet_name)
}
