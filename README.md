# pantabR  <img src="https://github.com/Btibert3/pantabR/raw/master/logo/pantabR_hexSticker.png" width = "175" height = "200" align="right" />

This is an R wrapper to the excellent python library `pantab`, which allows us to export our dataframes to Tableau Hyper Extract files.  This can have advantages over simply saving out our datasets as csv files.

## Requirements

`pantabR` requires Anaconda python (miniconda recommended) on your system path.  This pacakge uses `reticulate` within R to use environments and manage the necessary python bits for this package to function.

This package implements the following from [`pantab`](https://github.com/innobi/pantab):

- frame_to_hyper


Future work will add other elements, such as hyper to dataframes or frames to hyper as needed.

## Installation

```
devtools::install_github("btibert3/pantabR")
```

or 


```
remotes::install_github("btibert3/pantabR")
```


## Example

```
devtools::install_github("btibert3/pantabR")
library(pantabR)
dat = data.frame(x=1:10, y=letters[1:10])
frame_to_hyper(dat, f="dataset.hyper", tbl="dataset")
````

Above might take a moment or two depending if it is the first time you are using the package or calling the function.

> Behind the scenes, `pantabR` is calling reticulate to configure and use a conda environment with the necessary pacakges.  

## Issues

This is a new package, and one that I want to add to, but I am certain there are bugs and issues that I need to catch.  If you come across an issue, please consider adding an [issue here](https://github.com/Btibert3/pantabR/issues)

> This package requires a data.frame and not a tibble.
