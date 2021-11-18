#' A Generating Row for CSV Layer Function
#'
#' Generally used after the overwrite_sheet_function(), the generate_csv_layer_row() function allows for the generation of a new data layer for input into the EarthTime CSV layers sheet. This function is usually followed up by append_new_data_layer_to_CSV_layers().

#' @param Enabled_Share_Link_Identifier Determines if the data layers appears in the Explore view of EarthTime. Defaults to TRUE.
#' @param Category Name of the data layer's category
#' @param Name Name of the data layer. Defaults to the dataframe's name
#' @param Credits Citation for the data layers
#' @param Base_Layer Ties a specific base layer with the data layer. Defaults to NULL.
#' @param Custom_slider_ticks CREATE LAB special use case. Defaults to NULL.
#' @param Start_Date Column number for the first date in the data frame.
#' @param End_Date Column number for the last date in the data frame.
#' @param Step Time period interval to run the data in the timeline. Defaults to 1.
#' @param URL Proxy URL for data layer to be read into the EarthTime engine.
#' @param Scaling d3-scale variables. Scales are a convenient abstraction for a fundamental task in visualization: mapping a dimension of abstract data to a visual representation. Although most often used for position-encoding quantitative data, such as mapping a measurement in meters to a position in pixels for dots or color spectrum in EarthTime; moreover, these scales are meant to represent the quantitative data ingested into EarthTime. Depending on the distribution, one should consider the following scales: "Linear", "Power", "Log", or "SquareRoot". Inputting the aforementioned scale variables will output a domain of "minValue, maxValue" with a range of "O,100" for the d3 function.
#' @param Color_Scaling CREATE LAB special use case. Defaults to NULL.
#' @param Map_Type Type of map to visualize. Acceptable variables include: "Choropleth", "Bubble", "Bivalent Bubble", "Point", "Point Flow"
#' @param Color RGB color value. Acceptable format is "0.0, 0.0, 0.0"
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

generate_csv_layer_row  <- function(Enabled_Share_Link_Identifier = TRUE, Share_Link_Identifier, Category,	Name,	Credits, Base_Layer = NA, Custom_slider_ticks = NA,	Start_Date,	End_Date,	Step = 1,	URL, Scaling, Color_Scaling = NA,	Map_Type,	Color,	External_GeoJSON = NA,	Name_Key = NA,	Show_Graph = NA,	Graph_Title = NA,	Graph_Plot_Colors = NA,	Graph_Plots_First_Visible = NA,	Graph_X_Axis_Label = NA,	Graph_Y_Axis_Label = NA,	Graph_Y_Axis_Min = NA,	Graph_Y_Axis_Max = NA,	Graph_X_Axis_Label_Interval = NA,	Legend_Content = "auto", Legend_Key, Load_Data_Function = NA,	Set_Data_Function = NA,	Number_of_Levels = NA, Number_of_Attributes = NA,	Vertex_Shader = NA,	Fragment_Shader = NA,	Draw_Function = NA,	Playback_Rate = 1,	Master_Playback_Rate = 1,	Colormap_Src, Layer_Description = NA, Featured_Themes = NA,	Draw_Options = NA, Set_Data_Options = NA, Extras_Options = NA,	Draw_Order = NA, Timeline_Type = NA, Layer_Constraints = NA,	Mapbox = NA, Draw_Layer_Function = NA){
  
  dat <- as.data.frame(matrix(ncol=46, nrow=1))
  
  dat <- data.frame(Enabled_Share_Link_Identifier,
                    Share_Link_Identifier,
                    Category,	
                    Name,	
                    Credits, 
                    Base_Layer, 
                    Custom_slider_ticks,	
                    as.numeric(Start_Date),	
                    as.numeric(End_Date),	
                    as.numeric(Step),	
                    URL,
                    #Start of Scaling Options 
                    if(Scaling=="linear" || Scaling=="Linear" || Scaling=="LINEAR"){
                      paste0("d3.scaleLinear().domain([minValue, maxValue]).range([0,1])")
                    }
                    else if(Scaling=="log" || Scaling=="Log" || Scaling=="LOG " || Scaling=="logarithmic" || Scaling=="Logarithmic" || Scaling=="LOGARTITHMIC"){
                      paste0("d3.scaleLOG().domain([minValue, maxValue]).range([0,1])")
                    }
                    else if(Scaling=="pow" || Scaling=="POW" || Scaling=="power" || Scaling=="POWER"){
                      paste0("d3.scalePow().domain([minValue, maxValue]).range([0,1])")
                    }
                    else if(Scaling=="sqrt" || Scaling=="SQRT" || Scaling=="square root" || Scaling=="Square Root" || Scaling=="SQUARE ROOT" || Scaling=="squareroot" || Scaling=="SQUAREROOT"){
                      paste0("d3.scaleSqrt().domain([minValue, maxValue]).range([0,1])")
                    }
                    else{
                      stop("Invalid scaling option. Please input one of the following scales: 'linear' ('linear'), 'logarithmic' ('log'), 'power' ('pow'), or 'square root' ('sqrt')", call. = FALSE)
                    },
                    #End of Scaling Options
                    Color_Scaling,	
                    Map_Type,	
                    Color,	
                    External_GeoJSON,	
                    Name_Key, 
                    Show_Graph,
                    Graph_Title,	
                    Graph_Plot_Colors,	
                    Graph_Plots_First_Visible,	
                    Graph_X_Axis_Label,	
                    Graph_Y_Axis_Label,	
                    Graph_Y_Axis_Min,	
                    Graph_Y_Axis_Max,	
                    Graph_X_Axis_Label_Interval,	
                    Legend_Content, 
                    Legend_Key, 
                    Load_Data_Function,	
                    Set_Data_Function,	
                    Number_of_Levels, 
                    Number_of_Attributes,	
                    Vertex_Shader,	
                    Fragment_Shader,	
                    Draw_Function,	
                    Playback_Rate,	
                    Master_Playback_Rate,	
                    Colormap_Src = paste0("https://tiles.earthtime.org/colormaps/", Colormap_Src, ".png"),
                    Layer_Description, 
                    Featured_Themes,	
                    Draw_Options, 
                    Set_Data_Options, 
                    Extras_Options,	
                    Draw_Order, 
                    Timeline_Type, 
                    Layer_Constraints,	
                    Mapbox, 
                    Draw_Layer_Function)
  
  dat[is.na(dat)] <- ""
  
  assign(paste0("csv_sheet_row-", Share_Link_Identifier), dat, envir = globalenv())
  
}

