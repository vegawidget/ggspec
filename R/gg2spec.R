#' Translate ggplot2 object into a ggspec
#'
#' @param plt A ggplot2 object.
#'
#' @return `list`, a ggspec list.
#' @export
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(data = iris)
#' p <- p + geom_point(aes(x = Petal.Width, y = Petal.Length))
#' gg2spec(p)
gg2spec <- function(plt){
  int_data <- data_int(plt$data, plt$layers)
  int_map <- mapping_spc(plt$mapping)

  list(
    data = data_spc(int_data),
    layers = layer_spc(plt$layers, int_data, int_map),
    scales = scale_spc(plt$scales$scales),
    labels = plt$labels
  )
}
