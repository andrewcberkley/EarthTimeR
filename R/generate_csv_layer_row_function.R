#' A Generating Row for CSV Layer Function
#'
#' This function allows for the generation of a new data layer for input into the EarthTime CSV layers sheet.

#' @param Enabled_Share_Link_Identifier Determines if the data layers appears in the Explore view of EarthTime. Defaults to TRUE
#' @param Category Name of the data layer's category
#' @param Name Name of the data layer. Defaults to the dataframe's name
#' @param Credits Citation for the data layers
#' @param Base_Layer Ties a specific base layer with the data layer. Defaults to NULL.
#' @param Custom_slider_ticks CREATE LAB special use case. Defaults to NULL.
#' @param Start_Date Column number for the first date in the data frame.
#' @param End_Date Column number for the last date in the data frame.
#' @param Step Time period interval to run the data in the timeline. Defaults to 1.
#' @param URL Proxy URL for data layer to be read into the EarthTime engine.
#' @param Scaling d3-scale variables. Scales are a convenient abstraction for a fundamental task in visualization: mapping a dimension of abstract data to a visual representation. Although most often used for position-encoding quantitative data, such as mapping a measurement in meters to a position in pixels for dots or color spectrum in EarthTime; moreover, these scales are meant to represent the quantitative data ingested into EarthTime. Depending on the distribution, one should consider the following scales: "Linear", "Power", "Log", or "SquareRoot". Inputing the aforementioned scale variables will output "d3.scaleSqrt().domain([minValue, maxValue]).range([0,100])", "d3.scalePow().domain([minValue, maxValue]).range([0,100])", "d3.scaleLog().domain([minValue, maxValue]).range([0,100])", "d3.scaleSqrt().domain([minValue, maxValue]).range([0,100])", respectively.
#' @param Color_Scaling CREATE LAB special use case. Defaults to NULL.
#' @param Map_Type Type of map to visualize. Acceptable variables include: "Choropleth", "Bubble", "Bivalent Bubble", "Point", "Point Flow"
#' @param Color RGB color value. Acceptable format is "[0.0, 0.0, 0.0]"
#' @param External_GeoJSON Link to external GeoJSON file. Defaults to NULL.
#' @param Name_Key Data column name for GEOJSON shapes. Defaults to NULL.
#' @param Show_Graph CREATE LAB special use case. Defaults to NULL.
#' @param Graph_Title CREATE LAB special use case. Defaults to NULL.
#' @param Graph_Plot_Colors CREATE LAB special use case. Defaults to NULL.
#' @param Graph_Plots_First_Visible CREATE LAB special use case. Defaults to NULL.
#' @param Graph_X_Axis_Label CREATE LAB special use case. Defaults to NULL.
#' @param Graph_Y_Axis_Label CREATE LAB special use case. Defaults to NULL.
#' @param Graph_Y_Axis_Min CREATE LAB special use case. Defaults to NULL.
#' @param Graph_Y_Axis_Max CREATE LAB special use case. Defaults to NULL.
#' @param Graph_X_Axis_Label_Interval CREATE LAB special use case. Defaults to NULL.
#' @param Legend_Content Legend content displayed in explore view. Defaults to "auto". For other legend types, input HTML here.
#' @param Legend_Key Short description of the data layer for use in the legend.
#' @param Load_Data_Function For use in point map types. Defaults to NULL; otherwise, input function such as: "WebGLVectorTile2.prototype._loadData".
#' @param Set_Data_Function For use in point map types. Defaults to NULL; otherwise, input function such as: "WebGLVectorTile2.prototype._setBufferData".
#' @param Number_of_Levels CREATE LAB special use case. Defaults to NULL.
#' @param Number_of_Attributes For use in point map types. Defaults to NULL; otherwise, input number of attributes such as "5".
#' @param Vertex_Shader For use in point map types. Defaults to NULL; otherwise, input shader such as: "WebGLVectorTile2.PointSizeColorEpochVertexShader".
#' @param Fragment_Shader For use in point map types. Defaults to NULL; otherwise, input shader such as: "WebGLVectorTile2.PointColorFragmentShader".
#' @param Draw_Function For use in point map types. Defaults to NULL; otherwise, input function such as: "WebGLVectorTile2.prototype._drawPointSizeColorEpoch".
#' @param Playback_Rate Natural speed of the data layer timeline. Defaults to 1.
#' @param Master_Playback_Rate Override speed of the data layer timeline. Defaults to 1.
#' @param Colormap_Src URL of the color spectrum for choropleths. Refer to "https://tiles.earthtime.org/colormaps/black-background.html".
#' @param Layer_Description CREATE LAB special use case. Defaults to NULL.
#' @param Featured_Themes CREATE LAB special use case. Defaults to NULL.
#' @param Draw_Options CREATE LAB special use case. Defaults to NULL.
#' @param Set_Data_Options CREATE LAB special use case. Defaults to NULL.
#' @param Extras_Options CREATE LAB special use case. Defaults to NULL.
#' @param Draw_Order CREATE LAB special use case. Defaults to NULL.
#' @param Timeline_Type CREATE LAB special use case. Defaults to NULL.
#' @param Layer_Constraints CREATE LAB special use case. Defaults to NULL.
#' @param Mapbox CREATE LAB special use case. Defaults to NULL.
#' @param Draw_Layer_Function CREATE LAB special use case. Defaults to NULL.

#' @keywords append CSV layers
#' @export
#' @examples
#' append_new_data_layer_to_CSV_layers()

generate_csv_layer_row  <- function(Enabled_Share_Link_Identifier = TRUE,	Category,	Name,	Credits, Base_Layer = NULL, Custom_slider_ticks = NULL,	Start_Date,	End_Date,	Step = 1,	URL = "https://docs-proxy.cmucreatelab.org/spreadsheets/d/xxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-xxx/export?format=csv&gid=0123456789", Scaling, Color_Scaling = NULL,	Map_Type,	Color,	External_GeoJSON = NULL,	Name_Key = NULL,	Show_Graph = NULL,	Graph_Title = NULL,	Graph_Plot_Colors = NULL,	Graph_Plots_First_Visible = NULL,	Graph_X_Axis_Label = NULL,	Graph_Y_Axis_Label = NULL,	Graph_Y_Axis_Min = NULL,	Graph_Y_Axis_Max = NULL,	Graph_X_Axis_Label_Interval = NULL,	Legend_Content = "auto", Legend_Key, Load_Data_Function = NULL,	Set_Data_Function = NULL,	Number_of_Levels = NULL, Number_of_Attributes = NULL,	Vertex_Shader = NULL,	Fragment_Shader = NULL,	Draw_Function = NULL,	Playback_Rate = 1,	Master_Playback_Rate = 1,	Colormap_Src = "https://tiles.earthtime.org/colormaps/*.png", Layer_Description = NULL, Featured_Themes = NULL,	Draw_Options = NULL, Set_Data_Options = NULL, Extras_Options = NULL,	Draw_Order = NULL, Timeline_Type = NULL, Layer_Constraints = NULL,	Mapbox = NULL, Draw_Layer_Function = NULL){
  write.table(x, file, append = FALSE, sep = "\t", dec = ".",
              row.names = FALSE, col.names = FALSE)
  }

#print('TRUE\tmaking_a_point_flow_map\tMaking EarthTime Maps\tPoint Flow\tCREATE Lab\t2013\t2018\t1\thttps://aberkley.earthtime.org/misc/making-a-point-flow-map/us-exports.bin\t\t\tpoint-flow\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t8\tWebGLVectorTile2.pointFlowVertexShader\tWebGLVectorTile2.pointFlowFragmentShader\tWebGLVectorTile2.prototype._drawPointFlow\t0.25\t0.5')
