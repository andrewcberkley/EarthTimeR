# EarthTimeR

`EarthTimeR` is a package to help facilitate data wrangling through a suite of functions that transforms data into the specific format required prior to ingesting it into the [EarthTime](https://earthtime.org/) project. EarthTime—a collaboration between the CREATE Lab at Carnegie Mellon University and the World Economic Forum—allows individuals to examine major environmental, social, and political phenomenon across time, across space, and between each other. The project brings together the fact-based narratives of experts with visually compelling images that break through every language and culture barrier, forging common ground across diverse viewpoints, helping to create the sense of unity we need to have meaningful discourse about how to steward our future more meaningfully.


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

* Convenience functions for pushing data Google Sheets;
* Data wrangling functions for creating and formatting EarthTime data layers;
* Functions for invoking statistical techniques for handling missing values;
* Python wrapper functions to aid in the generation of special map types.

For a complete overview of the aforementioned function groups, users can check out tutorials coming soon.

## Getting Started

To get started working with `EarthTimeR`, users should be associated with the [CREATE Lab at Carnegie Mellon University](https://cmucreatelab.org/home) for the ability to access specific Google Sheets in EarthTime. First time users are highly recommend to set their EarthTime CSV Layers using the `set_EarthTime_csv_layers` function, which will register your default EarthTime layers sheet information on the current R session as well as your current R environment, so that it can be used to obtain the information to push data using the package without having to set it each time.

As noted, the function sets one's default EarthTime `spreadsheetId` and `sheetId` in the current R environment. Thus, users should only repeat this operation if changing R environments in which they intend to use the `EarthTimeR` package or if their default EarthTime spreadsheet changes. *We stress that EarthTime `spreadsheetId` and `sheetId` are personal; therefore, users should be careful when writing and saving them in R scripts, in order to avoid sharing these information*.

## Authorization

It is highly recommend that users install the [`tidyverse`](https://www.tidyverse.org/) opinionated collection of R packages designed for data science as these packages provide the foundation for the `EarthTimeR` package and thus share an underlying approach design philosophy, grammar, and data structures; moreover, to interact with your EarthTime layers sheet, the `EarthTimeR` package draws specifically on functions found in the `googledrive` and `googlesheets4` packages.

`googlesheets4` wraps the Sheets API v4, which lets you read, write, and format data in Sheets. The Sheets API is very focused on spreadsheet-oriented data and metadata, i.e. (work)sheets and cells; moreover, the Sheets API offers practically no support for file-level operations, other than basic spreadsheet creation. There is no way to delete, copy, or rename a Sheet or to place it in a folder or to change its sharing permissions; therefore, the `EarthTimeR` package relies on the `tidyverse`, and specifically its wrapped [`googledrive`](https://googledrive.tidyverse.org) to use the Drive API for all of this.

Another reason `EarthTimeR` was built on top of the `googlesheets4` and `googledrive` packages together is for ease of file (Sheet) identification. The `googlesheets4` package requires you to specify the target Sheet by its ID, not by its name. That’s because the underlying APIs only accept file IDs. But the `googledrive package` offers lots of support for navigating between human-friendly file names and their associated IDs. This support applies to all files on Drive and, specifically, to Sheets.

Therefore, it was only natural to use both `googledrive` and `googlesheets4` together when building the `EarthTimeR' package.

After getting started with establishing your EarthTime layers sheet using the `set_EarhTime_csv_layers` function, it is recommend that you first attach both aforementioned packages.

```r
library(googlesheets4)
library(googledrive)
```

Do auth first with `googledrive`. Remember `googledrive::drive_auth()` accepts additional arguments, e.g. to specify a Google identity via `email =` or to use a service account via `path =`. Then direct `googlesheets4` to use the same token as `googledrive`.

```r
drive_auth()
gs4_auth(token = drive_token())
```

Within `googlesheets4`, the `gs4_auth()` function is used to authorize, view, and manage your Google Sheets. This function is a wrapper around `gargle::token_fetch()`. By default, you are directed to a web browser, asked to sign in to your Google account, and to grant googlesheets4 permission to operate on your behalf with Google Sheets. By default, with your permission, these user credentials are cached in a folder below your home directory, from where they can be automatically refreshed, as necessary. Storage at the user level means the same token can be used across multiple projects and tokens are less likely to be synced to the cloud by accident.

If you are interacting with R within a browser (applies to RStudio Server, RStudio Workbench, and RStudio Cloud), you need a variant of this flow, known as out-of-band auth ("oob"). If this does not happen automatically, you can request it yourself with `use_oob = TRUE` or, more persistently, by setting an `option via options(gargle_oob_default = TRUE)`.

```r
gs4_auth(
  email = gargle::gargle_oauth_email(),
  path = NULL,
  scopes = "https://www.googleapis.com/auth/spreadsheets",
  cache = gargle::gargle_oauth_cache(),
  use_oob = gargle::gargle_oob_default(),
  token = NULL
)
```

More details for invoking the `gs4_auth()` function can be found in the official Tidyverse documentation [here](https://googlesheets4.tidyverse.org/reference/gs4_auth.html).

Once you have directed `googlesheets4` to use the same token as `googledrive`, you will then be able to successfully use `EarthTimeR` functions to do spreadsheet-specific tasks related to your default EarthTime layers sheet. outside the scope of using `EarthTimeR`, you will also be able to use the `googledrive` suite of functions, like `googledrive::drive_find()` or `googledrive::drive_get()`, to list files or find them by name, path, or other property. Then, once you’ve identified the target file, use can use `googlesheets4` to do more general spreadsheet-specific tasks.

## Python

A few special map types in EarthTime (i.e. - line strings, point flows, points, and raster maps) are created using Python; therefore, if you plan on generating these map types without leaving R, you must install the [`reticulate`](https://rstudio.github.io/reticulate/) R package, which provides a comprehensive set of tools for interoperability between Python and R.

You can install the `reticulate` package from CRAN as follows:

```r
install.packages("reticulate")
```

By default, reticulate uses the version of Python found on your `PATH` (i.e. `Sys.which("python")`).

The `use_python()` function enables you to specify an alternate version, for example:

```r
library(reticulate)
use_python("/usr/local/bin/python")
```

The `use_virtualenv()` and `use_condaenv()` functions enable you to specify versions of Python in virtual or Conda environments, for example:

```r
library(reticulate)
use_virtualenv("myenv")
```

You can also refer to the article on [Python Version Configuration](https://rstudio.github.io/reticulate/articles/versions.html) for additional information.

## Authors

[Andrew C. Berkley](https://github.com/andrewcberkley), for the [World Economic Forum](https://www.weforum.org/).

## Contributors

## Code of conduct

Please note that the `EarthTimeR` project is released with a Contributor Code of Conduct (available in `CODE_OF_CONDUCT.md`). By contributing to this project, you agree to abide by its terms.