#' An Initial Ingestion Function
#'
#' This function allows you to create a new EarthTime data layer in Google Sheets.

#' @param dataframe Specify the name of the data frame you wish to upload.
#' @param data_layer_name Specify the name of the new EarthTime data layer.
#' @keywords ingestion upload Google sheets
#' @export
#' @examples
#' initial_ingestion()

initial_ingestion  <- function(dataframe, data_layer_name, display_sheet_in_browser=FALSE, share_with_anyone=TRUE){
  Sheet1 <- dataframe
  new_sheet <- googlesheets4::gs4_create(name = data_layer_name, sheets = Sheet1)
  
  place_name_here <- deparse(substitute(dataframe))  # Apply deparse & substitute # Show object name as character string
  
  if(display_sheet_in_browser==FALSE){
    print(paste0("CONGRATULATIONS: The data for '", place_name_here, "' has been uploaded and is ready to be used in EarthTime!"))
  }
  else{
    googlesheets4::gs4_browse(new_sheet)
  }
  if(share_with_anyone==TRUE){
    googledrive::drive_share_anyone(googledrive::as_id(new_sheet))
  }
  else{
    print(paste0("WARNING: You've chosen to not make  '", place_name_here, "' available to anyone with the link. Please keep in mind that you will need to later change permissions to 'anyone with the link' if you want this data layer to be available in EarthTime!"))
  }
  
  GID <- googlesheets4::sheet_properties(new_sheet)[1,3] #Extracts GID of first sheet in the workbook-ideally this should be the only sheet in the workbook
  workbook_id <- read.table(text=gsub("\\ID:", " ", new_sheet))
  
  assign(paste0(place_name_here, "_URL"), paste0("https://docs-proxy.cmucreatelab.org/spreadsheets/d/",workbook_id,"/export?format=csv&gid=",GID), envir = globalenv())
  
  print(paste0("The data for '", place_name_here, "' has been uploaded as the latest and greatest EarthTime data layer in Google Sheets. Its URL is ", "'https://docs-proxy.cmucreatelab.org/spreadsheets/d/",workbook_id,"/export?format=csv&gid=",GID, "' and can now be copied from the Global Environment."))
}
