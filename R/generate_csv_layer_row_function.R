#' A Generating Row for CSV Layer Function
#'
#' This function allows for the appending of a new data layer into your CSV layers sheet. Can be used in conjunction with map functions such generate_csv_layer_row().

#' @param csv_layer Specify the name of the csv layer output from previous functions.
#' @param ss Something that identifies a Google Sheet: its file ID, a URL from which we can recover the ID, an instance of googlesheets4_spreadsheet (returned by sheets_get()), or a dribble, which is how googledrive represents Drive files. Processed through as_sheets_id().
#' @param sheet Sheet to append to, in the sense of "worksheet" or "tab". You can identify a sheet by name, with a string, or by position, with a number.
#' @keywords append CSV layers
#' @export
#' @examples
#' append_new_data_layer_to_CSV_layers()

generate_csv_layer_row  <- function(dataframe, start_date_column, end_date_column,  sheet = "CSV Layers"){
  write.table(x, file, append = FALSE, sep = ""\t", dec = ".",
              row.names = FALSE, col.names = FALSE)
  }

#print 'TRUE\tmaking_a_point_flow_map\tMaking EarthTime Maps\tPoint Flow\tCREATE Lab\t2013\t2018\t1\thttps://aberkley.earthtime.org/misc/making-a-point-flow-map/us-exports.bin\t\t\tpoint-flow\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t8\tWebGLVectorTile2.pointFlowVertexShader\tWebGLVectorTile2.pointFlowFragmentShader\tWebGLVectorTile2.prototype._drawPointFlow\t0.25\t0.5'