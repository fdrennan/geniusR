#' Form of genius_album that can handle errors
#' @importFrom purrr possibly
#' @importFrom tibble as_tibble
#' @export
possible_album <- possibly(genius_album, otherwise = as_tibble())

#' Form of genius_lyrics that can handle errors
#' @importFrom purrr possibly
#' @importFrom tibble as_tibble
#' @export
possible_lyrics <- possibly(genius_lyrics, otherwise = as_tibble())


#' Prepares input strings for `gen_song_url()`
#'
#' Applies a number of regular expressions to prepare the input to match Genius url format
#'
#' @param input Either artist, song, or album, function input.
#' @export
prep_info <- function(input) {
  str_replace_all(input,
                  c("\\s*\\(Ft.[^\\)]+\\)" = "",
                    "&" = "and",
                    #"-" = " ",
                    #"\\+" = " ",
                    "\\$" = " ",
                    #"/" = " ",
                    #":" = " ",
                    #"'" = "",
                    #"," = "",
                    "é" = "e",
                    "ö" = "o",
                    "[[:punct:]]" = " ",
                    "[[:blank:]]+" = " ")) %>%
    str_trim() #%>%
  # str_replace_all("[[:punct:]]", "")
}
