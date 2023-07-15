#' Play a Coinflip Game
#'
#' An interactive game in the console. The user guesses heads or tials by typing
#' 'H' or 'T'. The maximum run is saved as a high score. THe user can also
#' choose to save their game and return later.
#'
#' @return Nothing.
#'
#' @export
#'
#' @examples \dontrun{play_coinflip()}
play_coinflip <- function() {

  data_dir <- tools::R_user_dir("hiscore", which = "data")
  has_data_dir <- file.exists(data_dir)

  data_file <- file.path(data_dir, "score_table.rds")
  has_data_file <- file.exists(data_file)

  high_score <- NULL

  if (has_data_file) {
    score_table <- readRDS(data_file)
    high_score <- score_table[score_table$game == "coinflip", "high_score"]
    message("Welcome. Your current high score is ", high_score)
  }

  in_play <- TRUE
  score <- 0

  while (in_play) {

    correct <- sample(c("h", "t"), 1)
    guess <- tolower(readline("[H]eads or [T]ails? Answer: "))

    if (!guess %in% c("h", "t")) {
      message("Answer must be 'H' or 'T'.")
      # need to keep looping though readline if user input is bad
    }

    if (guess == correct) {
      score <- score + 1
      message("Correct! Current score: ", score)
    }

    if (guess != correct) {

      message("Incorrect! Final score: ", score)

      in_play = FALSE

      if (is.null(high_score) || score > high_score) {

        message("New high score!")

        score_table <- data.frame(game = "coinflip", high_score = score)

        if (!has_data_dir) {
          dir.create(data_dir, recursive = TRUE)
        }

        saveRDS(score_table, file.path(data_file))

        message("New high score saved.")

      }

    }
  }

}