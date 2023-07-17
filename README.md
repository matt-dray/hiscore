
# hiscore

<!-- badges: start -->
[![Project Status: Concept – Minimal or no implementation has been done
yet, or the repository is only intended to be a limited example, demo,
or
proof-of-concept.](https://www.repostatus.org/badges/latest/concept.svg)](https://www.repostatus.org/#concept)
[![Blog post](https://img.shields.io/badge/rostrum.blog-post-008900?labelColor=000000&logo=data%3Aimage%2Fgif%3Bbase64%2CR0lGODlhEAAQAPEAAAAAABWCBAAAAAAAACH5BAlkAAIAIf8LTkVUU0NBUEUyLjADAQAAACwAAAAAEAAQAAAC55QkISIiEoQQQgghRBBCiCAIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAAh%2BQQJZAACACwAAAAAEAAQAAAC55QkIiESIoQQQgghhAhCBCEIgiAIgiAIQiAIgSAIgiAIQiAIgRAEQiAQBAQCgUAQEAQEgYAgIAgIBAKBQBAQCAKBQEAgCAgEAoFAIAgEBAKBIBAQCAQCgUAgEAgCgUBAICAgICAgIBAgEBAgEBAgEBAgECAgICAgECAQIBAQIBAgECAgICAgICAgECAQECAQICAgICAgICAgEBAgEBAgEBAgICAgICAgECAQIBAQIBAgECAgICAgIBAgECAQECAQIBAgICAgIBAgIBAgEBAgECAgECAgICAgICAgECAgECAgQIAAAQIKAAA7)](https://www.rostrum.blog/2023/07/15/hiscore/)
<!-- badges: end -->

Work in progress proof of concept: an R package with a system for saving high scores persistently.

You can install from GitHub.

``` r
install.packages("remotes")  # if not yet installed
remotes::install_github("matt-dray/hiscore")
```

The simplest possible game is included for demonstration purposes. Try to guess as many coinflips in a row as possible.

``` r
play_coinflip()
```
```
[H]eads or [T]ails? Answer: H
Correct! Current score: 1
[H]eads or [T]ails? Answer: H
Incorrect! Final score: 1
New high score!
New high score saved.
```

You can then retrieve your current high score, which is saved to your machine at the location given by [`tools::R_user_dir()`](https://rdrr.io/r/tools/userdir.html). The data persists even if you restart your session.

``` r
hiscore::get_save_data()
```
```
      game high_score
1 coinflip          1
```

You can retry to try and beat your score.

``` r
play_coinflip()
```
```
Welcome. Your current high score is 1
[H]eads or [T]ails? Answer: h
Correct! Current score: 1
[H]eads or [T]ails? Answer: t
Correct! Current score: 2
[H]eads or [T]ails? Answer: h
Incorrect! Final score: 2
New high score!
New high score saved.
```

And let's check that high score again.

``` r
hiscore::get_save_data()
```
```
      game high_score
1 coinflip          2
```

You can delete the saved game data.

``` r
hiscore::delete_save_data()
```
```
Really delete? [Y]es/[N]o: Y
High score data deleted.`
```
