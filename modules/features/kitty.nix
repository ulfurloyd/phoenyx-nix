{ ... }: {
  flake.homeModules.kitty = {
    programs.kitty = {
      enable = true;

      settings = {
        font_size = "12";
	enable_audio_bell = "no";
	confirm_os_window_close = "0";
	dynamic_background_opacity = "yes";
	background_opacity = "0.4";
	tab_bar_style = "powerline";
      };
      
      keybindings = {
        # layout selection
        "alt+f" = "goto_layout stack";
        "alt+v" = "goto_layout tall";
        "alt+s" = "goto_layout fat";
        
        ## TABS
        # tab selection
        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
        "alt+3" = "goto_tab 3";
        "alt+4" = "goto_tab 4";
        "alt+5" = "goto_tab 5";
        "alt+6" = "goto_tab 6";
        "alt+7" = "goto_tab 7";
        "alt+8" = "goto_tab 8";
        "alt+9" = "goto_tab 9";
        "alt+10" = "goto_tab 10";
        
        # tab management
        "alt+t" = "new_tab";
        "alt+shift+w" = "close_tab";
        "alt+shift+r" = "set_tab_title";
        
        # return to last accessed tab
        "alt+tab" = "goto_tab -1";
        
        ## WINDOWS
        # new window
        "alt+enter" = "new_window";
        
        # window navigation
        "alt+h" = "neighboring_window left";
        "alt+j" = "neighboring_window bottom";
        "alt+k" = "neighboring_window top";
        "alt+l" = "neighboring_window right";
        
        # window movement
        "alt+shift+h" = "move_window left";
        "alt+shift+j" = "move_window bottom";
        "alt+shift+k" = "move_window top";
        "alt+shift+l" = "move_window right";
        
        # window management
        "alt+r" = "set_window_title";
        "alt+w" = "close_window";
        
        # window resizing
        "ctrl+alt+=" = "resize_window wider";
        "ctrl+alt+-" = "resize_window narrower";
        "ctrl+alt+[" = "resize_window shorter";
        "ctrl+alt+]" = "resize_window taller";
        
        # scrolling
        "ctrl+shift+j" = "combine : scroll_line_down : scroll_line_down : scroll_line_down : scroll_line_down : scroll_line_down smooth";
        "ctrl+shift+k" = "combine : scroll_line_up : scroll_line_up : scroll_line_up : scroll_line_up : scroll_line_up smooth";
        
        # opacity
        "alt+y>=" = "set_background_opacity +0.2";
        "alt+y>-" = "set_background_opacity -0.2";
      };

      extraConfig = ''
        include themes/noctalia.conf
      '';
    };
  };
}
