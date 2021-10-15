#' An Overwrite Sheet Function
#'
#' This function allows you to upload and overwrite an EarthTime data layer in Google Sheets.

#' @param dataframe Specify the name of data frame you wish to upload.
#' @param spreadsheetId Specify the spreadsheet ID (workbook ID) of your Google sheet.
#' @param sheetId Specify the sheet that you would like to overwrite. "sheetId" is lso referred to as Google Grid ID, or "gid".
#' @param sheet_name If there is a different sheet name other than "Sheet1", specify it here; otherwise, it will overwrite or create "Sheet1".
#' @param display_sheet_in_browser Option to open browser to see the new data layer in Google Sheets. Defaults to FALSE.
#' @param share_with_anyone Option to grant anyone with the link permission to view this data set. This is necessary for data layers to be read into the EarthTime engine. Defaults to TRUE.

#' @keywords overwrite upload Google sheets
#' @export
#' @examples
#' overwrite_sheet()

overwrite_sheet  <- function(dataframe, spreadsheetId, sheetId, sheet_name = NULL, display_sheet_in_browser=FALSE, share_with_anyone=TRUE){
   if(missing(sheet_name)){
     ss <- googlesheets4::as_sheets_id(paste0("https://docs.google.com/spreadsheets/d/", spreadsheetId, "/edit#gid=", sheetId))
     googlesheets4::sheet_write(dataframe, ss = ss, sheet = "Sheet1")
     }
   else{
   ss <- googlesheets4::as_sheets_id(paste0("https://docs.google.com/spreadsheets/d/", spreadsheetId, "/edit#gid=", sheetId))
   googlesheets4::sheet_write(dataframe, ss = ss, sheet = sheet_name)
   }
   
   place_name_here <- deparse(substitute(dataframe))  # Apply deparse & substitute # Show object name as character string
   
   if(display_sheet_in_browser==FALSE){
     cat(crayon::green$bold("\nCONGRATULATIONS:" , crayon::reset(" The data for " , crayon::bgYellow(place_name_here , crayon::reset(" has been uploaded and is ready to be used in EarthTime!\n\n")))))
   }
   else{
     googlesheets4::gs4_browse(ss)
   }
   if(share_with_anyone==TRUE){
      suppressMessages(googledrive::drive_share_anyone(googledrive::as_id(ss)))
      cat(crayon::yellow$bold("\nATTENTION:" , crayon::reset(" Sharing permissions for data in " , crayon::bgYellow(place_name_here , crayon::reset(" are now set to anyone on the internet with this link can view.\n\n")))))
   }
   else{
      cat(crayon::red$bold$underline("\nWARNING:" , crayon::reset(" You've chosen to not make " , crayon::bgYellow(place_name_here , crayon::reset(" available to anyone with the link. Please keep in mind that you will need to later change permissions to 'anyone with the link' if you want this data layer to be available in EarthTime!\n\n")))))
   }
   GID <- googlesheets4::sheet_properties(ss)[1,3] #Extracts GID of first sheet in the workbook-ideally this should be the only sheet in the workbook
   workbook_id <- read.table(text=gsub("\\ID:", " ", ss))
   
   assign(paste0(place_name_here, "_URL"), paste0("https://docs-proxy.cmucreatelab.org/spreadsheets/d/",workbook_id,"/export?format=csv&gid=",GID), envir = globalenv())
   
   
   cat(crayon::magenta$bold("\nNOTE:" , crayon::reset(" The data for " , crayon::bgYellow(place_name_here , crayon::reset(" has been uploaded in Google Sheets. Its URL is " , crayon::blue$underline(paste0("https://docs-proxy.cmucreatelab.org/spreadsheets/d/", workbook_id, "/export?format=csv&gid=", GID) , crayon::reset(" and can now be copied from the Global Environment!\n\n")))))))
   
}