# EarthTimeR

`EarthTimeR` is a package created to make data wrangling easier before ingesting data into the [EarthTime](https://earthtime.org/) project. EarthTime which is a collaboration between Carnegie Mellon University's CREATE Lab and the World Economic Forum allowing individuals to examine major environmental, social, and political phenomenon across time, across space, and between each other.

## Installing and loading the package

Currently, the `EarthTimeR` package can be installed directly from its GitHub repository:

```r
if (!require("devtools")) install.packages("devtools")
devtools::install_github("andrewcberkley/EarthTimeR")
```

Once installed, it can be loaded using the `library` function.

```r
library(EarthTimeR)
```

## Functions

`EarthTimeR` has four groups of functions:

* Sign-in to Google Sheets to push data;
* Wrangling data for use as data layers in EarthTime stories;
* Statistical techniques for handling missing values;
* Python wrappers for creation of special map types.

For a complete overview of those groups, users can check out tutorials [here](https://github.com/andrewcberkley/EarthTimeR/blob/master/vignettes/Introduction.md).

## Auth



## Getting Started

To get started working with `EarthTimeR`, users should be associated with the [CREATE Lab at Carnegie Mellon University] https://cmucreatelab.org/home) for the ability to access specific Google Sheets in EarthTime. First time users are highly recommend to set their EarthTime CSV Layers using the `set_EarhTime_csv_layers` function, which will register your default EarthTime layers sheet information on the current R session as well as your current R environment, so that it can be used to obtain the information to push data using the package without having to set it each time.

 along with the __tidyverse__ package, and set their Census API key.  A key can be obtained from <http://api.census.gov/data/key_signup.html>.  


As noted, the function sets one's default EarthTime `spreadsheetId` and `sheetId` in the current R environment. Thus, users should only repeat this operation if changing R environments in which they intend to use the `EarthTimeR` package or if their default EarthTime spreadsheet changes. *We stress that EarthTime `spreadsheetId` and `sheetId` are personal; therefore, users should be careful when writing and saving them in R scripts, in order to avoid sharing these information*.

## Authors

[Andrew C. Berkley](https://github.com/andrewcberkley), for the [World Economic Forum](https://www.weforum.org/).

## Contributors