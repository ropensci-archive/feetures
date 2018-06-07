#' Feetures
#'
#' @export
#' @format NULL
#' @usage NULL
#' @examples
#' z <- Feetures$new(adapter = AdapterMemory$new())
#' z
#' z$adapter
#' z$features()
#' z$register("foo")
#' z$features()
#' z$enabled("foo")
#' z$enable("foo")
#' z$enabled("foo")
#' z$disable("foo")
#' z$enabled("foo")
#' 
#' # expiration time
#' feat <- Feature$new("bar", expiration = Sys.time() + 30)
#' (z <- Feetures$new(adapter = AdapterMemory$new()))
#' z$register(feat)
#' z$features()
#' z$enable(feat$name)
#' z$enabled(feat$name)
Feetures <- R6::R6Class(
  'Feetures',
  public = list(
    adapter = NULL,
    features_list = NULL,

    initialize = function(adapter) {
      assert(adapter, "FeetureAdapter")
      self$adapter <- adapter
    },

    print = function(x, ...) {
      cat("<feetures config>", sep = "\n")
      cat(paste0("  adapter: ", self$adapter$name), sep = "\n")
    },

    features = function() self$adapter$features,

    register = function(feature) {
      assert(feature, c("character", "Feature"))
      if (inherits(feature, "character")) {
        self$adapter$features[[feature]] <- Feature$new(feature)
      } else {
        self$adapter$features[[feature$name]] <- feature
      }
    },

    enabled = function(feature) {
      assert(feature, "character")
      self$adapter$features[[feature]]$enabled()
    },

    enable = function(feature) {
      assert(feature, "character")
      self$adapter$features[[feature]]$enable()
    },

    disable = function(feature) {
      assert(feature, "character")
      self$adapter$features[[feature]]$disable()
    }
  )
)
