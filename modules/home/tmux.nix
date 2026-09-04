{
  programs.tmux = {
    enable = true;
    mouse = true;
    shortcut = "a";
    historyLimit = 5000;

    extraConfig = ''
      set -g default-terminal "tmux-256color"

      set -g status-style "bg=default,fg=default"
      set -g status-left " #S "
      set -g status-right " %H:%M "

      setw -g window-status-current-format " #I:#W "

      setw -g window-status-current-format " #I:#W "

      set -g pane-border-style "fg=brightblack"
      set -g pane-active-border-style "fg=white"
    '';
  };
}

