# adapters
## parent class

#' FeetureAdapter
#' @export
FeetureAdapter <- R6::R6Class(
  'FeetureAdapter'
)

## individual adapters

#' AdapterMemory
#' @export
AdapterMemory <- R6::R6Class(
  'AdapterMemory',
  inherit = FeetureAdapter,
  public = list(
    name = "memory",
    features = list(),

    print = function(x, ...) {
      cat(paste0("<feetures adapter>: ", self$name))
    }
  )
)
