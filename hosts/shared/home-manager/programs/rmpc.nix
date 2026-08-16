{ ... }: {
	programs.rmpc = {
		enable = true;

		config = ''
      		#![enable(implicit_some)]
            #![enable(unwrap_newtypes)]
            #![enable(unwrap_variant_newtypes)]
            (
                address: "127.0.0.1:6600",
                password: None,
                theme: Some("rmpc-theme"),
              	enable_config_hot_reload: true,
                cache_dir: None,
                on_song_change: None,
                volume_step: 5,
                max_fps: 30,
                scrolloff: 0,
                wrap_navigation: false,
                enable_mouse: true,
                status_update_interval_ms: 1000,
                select_current_song_on_change: false,
                album_art: (
                    method: Auto,
                    max_size_px: (width: 1000, height: 1000),
                    disabled_protocols: ["http://", "https://"],
                    vertical_align: Center,
                    horizontal_align: Center,
                ),
                keybinds: (
                    global: {
                        ":":       CommandMode,
                        ",":       VolumeDown,
                        "s":       Stop,
                        ".":       VolumeUp,
                        "<Tab>":   NextTab,
                        "<S-Tab>": PreviousTab,
                        "1":       SwitchToTab("Playing"),
                        "4":       SwitchToTab("Find"),
                        "3":       SwitchToTab("Songs"),
                        "2":       SwitchToTab("Albums"),
                        "q":       Quit,
                        ">":       NextTrack,
                        "p":       TogglePause,
                        "<":       PreviousTrack,
                        "f":       SeekForward,
                        "z":       ToggleRepeat,
                        "x":       ToggleRandom,
                        "c":       ToggleConsume,
                        "v":       ToggleSingle,
                        "b":       SeekBack,
                        "~":       ShowHelp,
                        "I":       ShowCurrentSongInfo,
                        "O":       ShowOutputs,
                        "P":       ShowDecoders,
                    },
                    navigation: {
                        "k":         Up,
                        "j":         Down,
                        "h":         Left,
                        "l":         Right,
                        "<Up>":      Up,
                        "<Down>":    Down,
                        "<Left>":    Left,
                        "<Right>":   Right,
                        "<C-k>":     PaneUp,
                        "<C-j>":     PaneDown,
                        "<C-h>":     PaneLeft,
                        "<C-l>":     PaneRight,
                        "<C-u>":     UpHalf,
                        "N":         PreviousResult,
                        "a":         Add,
                        "A":         AddAll,
                        "r":         Rename,
                        "n":         NextResult,
                        "g":         Top,
                        "<Space>":   Select,
                        "<C-Space>": InvertSelection,
                        "G":         Bottom,
                        "<CR>":      Confirm,
                        "i":         FocusInput,
                        "J":         MoveDown,
                        "<C-d>":     DownHalf,
                        "/":         EnterSearch,
                        "<C-c>":     Close,
                        "<Esc>":     Close,
                        "K":         MoveUp,
                        "D":         Delete,
                    },
                    queue: {
                        "D":       DeleteAll,
                        "<CR>":    Play,
                        "<C-s>":   Save,
                        "a":       AddToPlaylist,
                        "d":       Delete,
                        "i":       ShowInfo,
                        "C":       JumpToCurrent,
                    },
                ),
                search: (
                    case_sensitive: false,
                    mode: Contains,
                    tags: [
                        (value: "any",         label: "Any Tag"),
                        (value: "title",       label: "Title"),
                        (value: "album",       label: "Album"),
                        (value: "artist",      label: "Artist"),
                        (value: "filename",    label: "Filename"),
                        (value: "genre",       label: "Genre"),
                    ],
                ),
                artists: (
                    album_display_mode: SplitByDate,
                    album_sort_by: Date,
                ),
                tabs: [
                    (
                        name: "Playing",
                        pane: Split(
                            direction: Horizontal,
                            panes: [(size: "50%", pane: Pane(AlbumArt)), (size: "50%", pane: Pane(Queue))],
                        ),
                    ),
                    (
                        name: "Albums",
                        pane: Pane(Albums),
                    ),
                    (
                        name: "Songs",
                        pane: Pane(Directories),
                    ),
                    (
                        name: "Find",
                        pane: Pane(Search),
                    ),
                ],
            )
    '';
	};

	xdg.configFile."rmpc/themes/rmpc-theme.ron" = {
		enable = true;
		force = true;

		text = ''
      	    #![enable(implicit_some)]
              #![enable(unwrap_newtypes)]
              #![enable(unwrap_variant_newtypes)]
              (
                  default_album_art_path: None,
                  show_song_table_header: true,
                  draw_borders: true,
                  browser_column_widths: [20, 38, 42],
                  background_color: "#140014",
                  text_color: "#ffceff",
                  header_background_color: None,
                  modal_background_color: "#11111b",
                  tab_bar: (
                      enabled: true,
                      active_style: (fg: "black", bg: "#ffceff", modifiers: "Bold"),
                      inactive_style: (),
                  ),
                  highlighted_item_style: (fg: "#ffceff", modifiers: "Bold"),
                  current_item_style: (fg: "#140014", bg: "#ffceff", modifiers: "Bold"),
                  borders_style: (fg: "#ffceff"),
                  highlight_border_style: (fg: "#ffceff"),
                  symbols: (song: "󰎇", dir: "󰉋", marker: " ", ellipsis: "..."),
                  progress_bar: (
                      symbols: ["", "", " "],
                      track_style: (fg: "#1e2030"),
                      elapsed_style: (fg: "#ffceff"),
                      thumb_style: (fg: "#ffceff", bg: "#1e2030"),
                  ),
                  scrollbar: (
                      symbols: ["│", "█", "▲", "▼"],
                      track_style: (),
                      ends_style: (),
                      thumb_style: (fg: "#ffceff"),
                  ),
                  song_table_format: [ // view in the queue
                      (
                          prop: (kind: Property(Artist),
                              default: (kind: Text("Unknown"))
                          ),
                          width: "15%",
                      ),
                      (
                          prop: (kind: Property(Title),
                              default: (kind: Text("Unknown"))
                          ),
                          width: "55%",
                      ),
                      (
                          prop: (kind: Property(Album),
                              default: (kind: Text("Unknown Album"))
                          ),
                          width: "20%",
                      ),
                      (
                          prop: (kind: Sticker("playCount"), default: (kind: Text("0"))),
                          width: "9",
                          alignment: Right,
                          label: "Playcount"
                      ),
                      (
                          prop: (kind: Property(Duration),
                              default: (kind: Text("-"))
                          ),
                          width: "10%",
                          alignment: Right,
                      ),
                  ],
                  layout: Split(
                      direction: Vertical,
                      panes: [
                          (
                              pane: Pane(Header),
                              size: "2",
                          ),
                          (
                              pane: Pane(Tabs),
                              size: "3",
                          ),
                          (
                              pane: Pane(TabContent),
                              size: "100%",
                          ),
                          (
                              pane: Pane(ProgressBar),
                              size: "1",
                          ),
                      ],
                  ),
                  header: (
                      rows: [
                          (
                              left: [
                                  (kind: Text("["), style: (fg: "#ffceff", modifiers: "Bold")),
                                  (kind: Property(Status(StateV2(playing_label: "Playing", paused_label: "Paused", stopped_label: "Stopped"))), style: (fg: "#ffceff", modifiers: "Bold")),
                                  (kind: Text("]"), style: (fg: "#ffceff", modifiers: "Bold"))
                              ],
                              center: [
                                  (kind: Property(Song(Title)), style: (modifiers: "Bold"),
                                      default: (kind: Text("No Song"), style: (modifiers: "Bold"))
                                  )
                              ],
                              right: [
                                  (kind: Property(Widget(Volume)), style: (fg: "#ffceff"))
                              ]
                          ),
                          (
                              left: [
                                  (kind: Property(Status(Elapsed))),
                                  (kind: Text(" / ")),
                                  (kind: Property(Status(Duration))),
                                  (kind: Text(" (")),
                                  (kind: Property(Status(Bitrate))),
                                  (kind: Text(" kbps)"))
                              ],
                              center: [
                                  (kind: Property(Song(Artist)), style: (fg: "#ffceff", modifiers: "Bold"),
                                      default: (kind: Text("Unknown"), style: (fg: "#ffceff", modifiers: "Bold"))
                                  ),
                                  (kind: Text(" - ")),
                                  (kind: Property(Song(Album)),
                                      default: (kind: Text("Unknown Album"))
                                  )
                              ],
                              right: []
                          ),
                      ],
                  ),
                  browser_song_format: [
                      (
                          kind: Group([
                              (kind: Property(Track)), // track #
                              (kind: Text(" ")),
                          ])
                      ),
                      (
                          kind: Group([
                              (kind: Property(Artist)),
                              (kind: Text(" - ")),
                              (kind: Property(Title)),
                          ]),
                          default: (kind: Property(Filename))
                      ),
                  ],
              )
    '';
	};
}
