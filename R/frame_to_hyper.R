#' frame_to_hyper
#' @title Converting a data.frame to a Tableau hyper extract file

#' @aliases frame_to_hyper
#' @keywords frame_to_hyper

#' @description Use this function for to save a data.frame to a Tableau hyper file.
#' @export 
#' @param d data.frame input
#' @param f the filename, with a .hyper extension.  This is required.
#' @param tbl The name of the table for the Tableau extract.

#' @details
#' See example below.

#' @return The file is saved



#' @author Tibert, Brock, \email{btibert3@gmail.com}


#' @references \url{https://github.com/jooyoungseo/mboxr/blob/master/R/read_mbox.R}
#' @references \url{https://www.anaconda.com/download/}


frame_to_hyper = function(d = NULL, f=NULL, tbl="test") {
  # ensure we have proper params
  if(!is.data.frame(d) || tools::file_ext(f) != "hyper" ) {
    stop("Please use a data.frame and profile a filename that uses .hyper as it's extension")
  }
  
  # setup the environment
  envnm = "pantabr"
  tryCatch({
    if (!(envnm %in% reticulate::conda_list()$name)) {
      reticulate::conda_create(envnm, packages = c("python=3.7.3", "pandas"), conda = "auto")
    }
  },
  error = function(e) {
    stop("Need to install Anaconda or miniconda from https://www.anaconda.com/download/.")
  },
  finally = {
    reticulate::use_condaenv(envnm, required = TRUE)
    if (!reticulate::py_module_available("pandas")) {
      reticulate::conda_install(envnm, packages = c('pandas'))
    }
    
    if (!reticulate::py_module_available("pantab")) {
      reticulate::conda_install(envnm, packages = c('pantab'), pip = TRUE)
    }
    
  })
  
  # remove factors
  d = dplyr::mutate_if(d, is.factor, as.character)
  
  ## write the file  -- context is now python
  pantab = reticulate::import("pantab")
  df = reticulate::r_to_py(d)
  pantab$frame_to_hyper(df, f, table=tbl)
  
  ## check to ensure in the local directory
  check = f %in% list.files()
  
  # return
  return(check)

}



