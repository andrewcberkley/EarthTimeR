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

To access specific Google Sheets in EarthTime, users should be associated with the [CREATE Lab at Carnegie Mellon University](https://cmucreatelab.org/home). `authenticate_EarthTime_sheet` function registers these information on the current R session, so that it can be used to obtain the token to push data using the package.

As noted, the function sets one's Google credientials in the current R environment. Thus, users should repeat this operation on every new R session in which they intend to use the `EarthTimeR` package. *We stress that user and password are personal. Therefore, users should be careful when writing and saving them in R scripts, in order to avoid sharing these information*.

## Authors

[Andrew C. Berkley](https://github.com/andrewcberkley), for the [World Economic Forum](https://www.weforum.org/).

## Contributors