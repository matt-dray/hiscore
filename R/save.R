#' Delete Saved Game Data
#'
#' @return Nothing.
#'
#' @export
#'
#' @examples \dontrun{delete_save_data()}
delete_save_data <- function() {

  data_dir <- tools::R_user_dir("hiscore", which = "data")
  data_file <- file.path(data_dir, "score_table.rds")
  has_data_file <- file.exists(data_file)

  if (!has_data_file) {
    message("There's no save game file to delete.")
  }

  if (has_data_file) {

    answer <- tolower(readline("Really delete? [Y]es/[N]o: "))

    if (!answer %in% c("y", "yes", "n", "no")) {
      message("Didn't understand your answer. Aborting.")
    }

    if (answer %in% c("y", "yes")) {
      file.remove(data_file)
      message("High score data deleted.")
    }

    if (answer %in% c("n", "no")) {
      message("High score data not deleted.")
    }

  }

}

#' Fetch Saved Game Data
#'
#' @return Nothing.
#'
#' @export
#'
#' @examples \dontrun{get_save_data}
get_save_data <- function() {

  data_dir <- tools::R_user_dir("hiscore", which = "data")
  data_file <- file.path(data_dir, "score_table.rds")
  has_data_file <- file.exists(data_file)

  if (has_data_file) {
    score_table <- readRDS(data_file)
    print(score_table)
  }

}
