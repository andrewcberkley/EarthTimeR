#' A Generating Row for CSV Layer Function
#'
#' This function allows for the generation of a new data layer for input into the EarthTime CSV layers sheet.

#' @param Enabled_Share_Link_Identifier Determines if the data layers appears in the Explore view of EarthTime. Defaults to TRUE
#' @param Category Name of the data layer's category
#' @param Name Name of the data layer. Defaults to the dataframe's name

#' @keywords append CSV layers
#' @export
#' @examples
#' append_new_data_layer_to_CSV_layers()

generate_csv_layer_row  <- function(Enabled_Share_Link_Identifier = TRUE,	Category,	Name,	Credits, Base_Layer = NULL, Custom_slider_ticks = NULL,	Start_Date,	End_Date,	Step = 1,	URL = "https://docs-proxy.cmucreatelab.org/spreadsheets/d/xxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxx/export?format=csv&gid=0123456789", Scaling, Color_Scaling = NULL,	Map_Type,	Color,	External_GeoJSON = NULL,	Name_Key = NULL,	Show_Graph = NULL,	Graph_Title = NULL,	Graph_Plot_Colors = NULL,	Graph_Plots_First_Visible = NULL,	Graph_X_Axis_Label = NULL,	Graph_Y_Axis_Label = NULL,	Graph_Y_Axis_Min = NULL,	Graph_Y_Axis_Max = NULL,	Graph_X_Axis_Label_Interval = NULL,	Legend_Content = "auto", Legend_Key, Load_Data_Function = NULL,	Set_Data_Function = NULL,	Number_of_Levels = NULL, Number_of_Attributes = NULL,	Vertex_Shader = NULL,	Fragment_Shader = NULL,	Draw_Function = NULL,	Playback_Rate = 1,	Master_Playback_Rate = 1,	Colormap_Src = "https://tiles.earthtime.org/colormaps/*.png", Layer_Description = NULL, Featured_Themes = NULL,	Draw_Options = NULL, Set_Data_Options = NULL, Extras_Options = NULL,	Draw_Order = NULL, Timeline_Type = NULL, Layer_Constraints = NULL,	Mapbox = NULL, Draw_Layer_Function = NULL){
  write.table(x, file, append = FALSE, sep = ""\t", dec = ".",
              row.names = FALSE, col.names = FALSE)
  }

#print('TRUE\tmaking_a_point_flow_map\tMaking EarthTime Maps\tPoint Flow\tCREATE Lab\t2013\t2018\t1\thttps://aberkley.earthtime.org/misc/making-a-point-flow-map/us-exports.bin\t\t\tpoint-flow\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t8\tWebGLVectorTile2.pointFlowVertexShader\tWebGLVectorTile2.pointFlowFragmentShader\tWebGLVectorTile2.prototype._drawPointFlow\t0.25\t0.5')
