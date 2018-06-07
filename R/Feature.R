#' Feature
#' @export
Feature <- R6::R6Class(
  'Feature',
  public = list(
    name = NULL,
    turned_on = FALSE,
    description = NULL,
    expiration = NULL,

    initialize = function(name, description = NULL, expiration = NULL) {
      self$name <- name
      self$description <- description
      self$expiration <- expiration
    },
    print = function(x, ...) {
      cat(paste0("<feature>: ", self$name), sep = "\n")
      if (!is.null(self$description)) {
        cat(paste0("  description: ", self$description), sep = "\n")
      }
    },

    enable = function() self$turned_on <- TRUE,
    disable = function() self$turned_on <- FALSE,
    enabled = function() {
      if (!is.null(self$expiration)) {
        assert(self$expiration, c("Date", "POSIXct", "character"))
        if (Sys.time() > self$expiration) {
          message(sprintf("flag %s expired at %s", self$name, self$expiration))
          return(FALSE)
        }
      }
      return(self$turned_on)
    }
  )
)
