{ config, pkgs, ... }:
{
  programs.ncmpcpp = {
    enable = true;
    mpdMusicDir = "~/music";
    package = (pkgs.ncmpcpp.override { visualizerSupport = true; });
    settings = {
      allow_for_physical_item_deletion = "yes";
      jump_to_now_playing_song_at_start = "yes";
      display_volume_level = "yes";
      ignore_leading_the = "yes";
      ncmpcpp_directory = "~/.config/ncmpcpp";
      mpd_host = "localhost";
      mpd_port = "6600";
      message_delay_time = "1";

      progressbar_look = "▃▃▃";
      media_library_primary_tag = "album_artist";
      media_library_albums_split_by_date = "no";
      startup_screen = "playlist";

      external_editor = "nvim";
      use_console_editor = "yes";

      mouse_support = "yes";
      mpd_crossfade_time = 3;

      lyrics_fetchers = "azlyrics, genius, musixmatch, sing365, metrolyrics, justsomelyrics, jahlyrics, plyrics, tekstowo, zeneszoveg, internet";
      follow_now_playing_lyrics = "yes";
      fetch_lyrics_for_current_song_in_background = "yes";
      store_lyrics_in_song_dir = "yes";


      browser_sort_mode = "name";
      user_interface = "alternative";
      playlist_display_mode = "columns";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      playlist_editor_display_mode = "columns";

      now_playing_prefix = "$b$3=$3 ";
      now_playing_suffix = "  $/b$8";
      current_item_prefix = "$b$4$/b$4 ";
      current_item_suffix = "  $8";
      browser_sort_format = "{%a - }{%t}|{%f} {%l}";
      song_columns_list_format = "(50)[]{t|fr:Title} (0)[red]{a}";
      song_list_format = " {%t $R   $8%a$8}|{%f $R   $8%l$8} $8";
      song_status_format = "$b$2󰣐 $7 {$b$6$8 %t $6} $7 $8";
      song_window_title_format = "Now Playing ..";
      alternative_header_first_line_format = "󰎇  $b%t   ";
      alternative_header_second_line_format = "$3%a$3 - %b - %l$8";

      colors_enabled = "yes";
      color1 = "magenta";
      color2 = "magenta";
      volume_color = "magenta";
      state_line_color = "magenta";
      state_flags_color = "magenta:b";
      main_window_color = "magenta";
      window_border_color = "magenta";
      progressbar_color = "black:b";
      progressbar_elapsed_color = "magenta:b";
      statusbar_color = "magenta";
      statusbar_time_color = "magenta:b";
      player_state_color = "magenta:b";
      alternative_ui_separator_color = "black:b";
      active_window_border = "magenta";
      # song title color';
      header_window_color = "green";
      empty_tag_color = "magenta";

    };

    bindings = [
      { key = "0"; command = ["show_clock"];}
      { key = "1"; command = ["toggle_repeat"];}
      { key = "2"; command = ["toggle_random"];}
      #{ key = "3"; command = [];}
      #{ key = "4"; command = [];}
      { key = "5"; command = ["toggle_crossfade"];}
      #{ key = "6"; command = [];}
      #{ key = "7"; command = [];}
      #{ key = "8"; command = [];}
      #{ key = "9"; command = [];}
      #
      # -------------------------------------------- #
      # -- function keys
      # -------------------------------------------- #
      #
      { key = "f1"; command = ["show_help"];}
      { key = "f2"; command = ["volume_down"];}
      { key = "f3"; command = ["volume_up"];}
      { key = "f4"; command = ["volume_up"];}
      { key = "f5"; command = ["stop"];}
      { key = "f6"; command = ["previous"];}
      { key = "f7"; command = ["pause"];}
      { key = "f8"; command = ["next"];}
      { key = "f9"; command = ["show_visualizer"];}
      { key = "f10"; command = ["show_browser"];}
      { key = "f11"; command = ["toggle_screen_lock"];}
      { key = "f12"; command = ["show_lyrics"];}
      #
      # -------------------------------------------- #
      # -- alphabet keys
      # -------------------------------------------- #
      #
      { key = "a"; command = ["toggle_add_mode"];}
      #{ key = "b"; command = [];}
      #{ key = "c"; command = [];}
      #{ key = "d"; command = [];}
      { key = "e"; command = ["edit_song"];}
      { key = "e"; command = ["edit_library_tag"];}
      { key = "e"; command = ["edit_library_album"];}
      { key = "e"; command = ["edit_directory_name"];}
      { key = "e"; command = ["edit_playlist_name"];}
      { key = "e"; command = ["edit_lyrics"];}
      { key = "f"; command = ["show_browser"];}
      { key = "f"; command = ["change_browse_mode"];}
      { key = "g"; command = ["move_home"];}
      { key = "h"; command = ["previous_column"];}
      #{ key = "i"; command = [];}
      { key = "j"; command = "scroll_down"; }
      #{ key = "J"; command = [ "select_item" "scroll_down" ]; }
      { key = "k"; command = "scroll_up"; }
      #{ key = "K"; command = [ "select_item" "scroll_up" ]; }
      { key = "l"; command = ["next_column"];}
      { key = "m"; command = ["show_media_library"];}
      { key = "m"; command = ["toggle_media_library_columns_mode"];}
      { key = "n"; command = ["next_found_item"];}
      #{ key = "o"; command = [];}
      { key = "p"; command = ["show_playlist"];}
      { key = "q"; command = ["quit"];}
      #{ key = "r"; command = [];}
      { key = "s"; command = ["reset_search_engine"];}
      { key = "s"; command = ["show_search_engine"];}
      { key = "t"; command = ["show_tag_editor"];}
      { key = "u"; command = ["update_database"];}
      #{ key = "v"; command = [];}
      #{ key = "w"; command = [];}
      { key = "x"; command = ["delete_playlist_items"];}
      #{ key = "y"; command = [];}
      #{ key = "z"; command = [];}
      #
      # -------------------------------------------- #
      # -- ctrl + alphabet keys
      # -------------------------------------------- #
      #
      #{ key = "q"; command = [];}
      { key = "ctrl-r"; command = ["refetch_lyrics"];}
          #{ key = "q"; command = [];}
      #{ key = "q"; command = [];}
      #{ key = "q"; command = [];}
      #{ key = "q"; command = [];}
      #{ key = "q"; command = [];}
      #{ key = "q"; command = [];}
      #{ key = "q"; command = [];}
      #{ key = "q"; command = [];}
      #
      # -------------------------------------------- #
      # -- misc keys
      # -------------------------------------------- #
      #
      { key = "enter"; command = ["enter_directory"];}
      { key = "enter"; command = ["toggle_output"];}
      { key = "enter"; command = ["run_action"];}
      { key = "enter"; command = ["play_item"];}
      { key = "delete"; command = ["delete_playlist_items"];}
      { key = "delete"; command = ["delete_browser_items"];}
      { key = "delete"; command = ["delete_stored_playlist"];}
      { key = "page_up"; command = ["page_up"];}
      { key = "page_down"; command = ["page_down"];}
      { key = "home"; command = ["move_home"];}
      { key = "end"; command = ["quit"];}
      { key = "insert"; command = ["add_item_to_playlist"];}
    ];
  };
}
