# pantabR

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

