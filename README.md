feetures
========



[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/ropenscilabs/feetures.svg?branch=master)](https://travis-ci.org/ropenscilabs/feetures)

`feetures` for feature flags

## Installation


```r
devtools::install_github("ropenscilabs/feetures")
```


```r
library("feetures")
```

## basic usage

initialize object


```r
(z <- Feetures$new(adapter = AdapterMemory$new()))
#> <feetures config>
#>   adapter: memory
```

register a flag


```r
z$register("foo")
```

if/else conditional


```r
if (z$enabled("foo")) {
  message("foo for you :)")
} else {
  message("NO foo for you!")
}
#> NO foo for you!
```

enable the flag


```r
z$enable("foo")
```

now try again


```r
if (z$enabled("foo")) {
  message("foo for you :)")
} else {
  message("NO foo for you!")
}
#> foo for you :)
```

## expiration


```r
feat <- Feature$new("bar", expiration = Sys.time() + 5)
(z <- Feetures$new(adapter = AdapterMemory$new()))
#> <feetures config>
#>   adapter: memory
z$register(feat)
z$features()
#> $bar
#> <feature>: bar
z$enable(feat$name)
z$enabled(feat$name)
#> [1] TRUE
Sys.sleep(5)
z$enabled(feat$name)
#> [1] FALSE
```

## TODO

- ability to ignore all feature flags? i.e., set to `FALSE`?
- possibly a helper to pass code into a method like:

```r
feat_if_else(feature = "foo", code = {
  x <- 5^2
  x / 10 
})
```


## Meta

* Please [report any issues or bugs](https://github.com/ropenscilabs/feetures/issues).
* License: MIT
* Get citation information for `feetures` in R doing `citation(package = 'feetures')`
* Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.
