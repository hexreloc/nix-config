{
  programs.tmux = {
    enable = true;
    mouse = true;
    shortcut = "a";
    historyLimit = 5000;

    extraConfig = ''
      # display status at top
      set -g status-position bottom
      set -g status-right ""

      # status bar
      set -g set-titles on
      set -g window-status-format "#F#I #W #{=/-20/…:}"

      set -g status-style "bg=black fg=white"
      set -g window-status-last-style "bg=black fg=white"
      set -g window-status-current-style "bg=black fg=white"
      set -g window-status-separator ";;"

      # Fix tmux color
      set -g default-terminal "xterm-256color"
      set -as terminal-features ",xterm*:RGB"

      # enable mouse scroll
      set -g mouse on

      # window index start from 1
      set -g base-index 1
      setw -g pane-base-index 1

      # auto re-number
      set -g renumber-windows on

      # Set new panes/windows to open in current directory
      bind c new-window -c "#{pane_current_path}"
      bind '"' split-window -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Alt-num select window
      bind-key -n M-1 select-window -t 1
      bind-key -n M-2 select-window -t 2
      bind-key -n M-3 select-window -t 3
      bind-key -n M-4 select-window -t 4
      bind-key -n M-5 select-window -t 5
      bind-key -n M-6 select-window -t 6
      bind-key -n M-7 select-window -t 7
      bind-key -n M-8 select-window -t 8
      bind-key -n M-9 select-window -t 9

      # Ctrl-t new window
      bind-key -n C-t new-window -c "#{pane_current_path}"

      # vi key bindings
      set -g mode-keys vi
      set -g status-keys vi

      set -g allow-passthrough on
    '';
  };
}




















































































































