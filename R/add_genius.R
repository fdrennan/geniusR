add_genius <- function(data, artist, type_group, type = "album") {
    genius_funcs <- list(album = possible_album, lyrics = possible_lyrics)
    artist <- enquo(artist)
    type_group <- enquo(type_group)

    data %>%
        distinct(!!artist, !!type_group) %>%
        mutate(lyrics = map2(!!artist, !!type_group,  genius_funcs[[type]])) %>%
        return()
}




# Example with 2 different artists and albums
# artist_albums <- tribble(
#     ~artist, ~album,
#     "J. Cole", "KOD",
#     "Sampha", "Process"
# )


# artist_albums %>%
#     add_genius(artist, album)


# Example with 2 different artists and songs
# artist_songs <- tribble(
#     ~artist, ~track,
#     "J. Cole", "Motiv8",
#     "Andrew Bird", "Anonanimal"
# )
#
# artist_songs %>%
#     add_genius(artist, track, type = "lyrics")

andrew <- get_artist_albums("Andrew Bird")

xxx <- andrew_filt %>%
    get_album_tracks() %>%
    get_track_audio_features() %>%
    add_genius(artist_name, track_name, type = "lyrics")


cole <- get_artist_albums("J. Cole") %>%
    filter(album_name %in% c("KOD"))

cole %>%
    add_genius(artist_name, album_name)

andrew_filt <- andrew %>% filter(album_name %in% c("Noble Beast", "Armchair Apocrypha"))

test <- andrew_filt %>%
    add_genius(artist_name, album_name)


test %>% unnest(lyrics) %>%
    get_album_tracks()
    get_track_audio_features()
