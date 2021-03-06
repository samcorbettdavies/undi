#' Summary of optimsens object
#'
#' @param object optimsens object
#' @param ... other stuff
#'
#' @return summary data frame with min/max values of each group term
#'
#' @export
summary.optimsens <- function(object, ...) {
  object$results %>%
    tidyr::separate(tag, into = c("group", "bound"), sep = "_") %>%
    dplyr::select(term, estimate, bound) %>%
    tidyr::spread(bound, estimate) %>%
    dplyr::select(term, min, max)
}
