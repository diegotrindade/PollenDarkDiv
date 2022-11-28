decompSpace <- function (x = NULL) {
  if (class(x) == "TPDcomm") {
    TPDType <- "Communities"
    TPDc <- x
  }
  else {
    if (class(x) == "TPDsp") {
      TPDType <- "Populations"
      TPDs <- x
    }
    else {
      stop("x must be an object of class TPDcomm or TPDsp")
    }
  }
  results <- list()
  Calc_dissim <- function(x) {
    results_samp <- list()
    if (TPDType == "Communities") {
      TPD <- x$TPDc$TPDc
      names_aux <- names(x$TPDc$TPDc)
    }
    if (TPDType == "Populations") {
      TPD <- x$TPDs
      names_aux <- names(x$TPDs)
    }
    results_samp$Overlap <- matrix(NA, ncol = length(TPD), 
                                         nrow = length(TPD), dimnames = list(names_aux, names_aux))
    results_samp$Unique <- matrix(NA, ncol = length(TPD), 
                                    nrow = length(TPD), 
                             dimnames = list(paste0("uniqueIN_", names_aux) , 
                                             paste0("comparedTO_", names_aux)))

    for (i in 1:length(TPD)) {
      TPD_i <- TPD[[i]]
      TPD_i <- replace(TPD_i, TPD_i > 0, 1)
      for (j in 1:length(TPD)) {
        if (i < j) {
          TPD_j <- TPD[[j]]
          TPD_j <- replace(TPD_j, TPD_j > 0, 1)
          
          shared_aux <- length(which(TPD_i > 0 & TPD_j > 0)) * x$data$cell_volume
          A_aux <- length(which(TPD_i > 0 & TPD_j == 0)) * x$data$cell_volume
          results_samp$Overlap[i, j] <- results_samp$Overlap[j, i] <- shared_aux
          results_samp$Unique[i, j] <- A_aux + shared_aux
          B_aux <- length(which(TPD_i == 0 & TPD_j > 0)) * x$data$cell_volume
          results_samp$Unique[j, i] <- B_aux
        }
      }
    }
    return(results_samp)
  }
  if (TPDType == "Communities") {
    results$communities <- Calc_dissim(TPDc)
  }
  if (TPDType == "Populations") {
    results$populations <- Calc_dissim(TPDs)
  }
  class(results) <- "OverlapDiss"
  return(results)
}

