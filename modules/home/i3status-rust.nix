{
  programs.i3status-rust = {
    enable = true;

    bars.default = {
      blocks = [
        {
          block = "battery";
          format = " $icon $percentage | ";
        }
        {
          block = "cpu";
          interval = 10;
          format = " $icon $utilization | ";
        }
        {
          block = "sound";
          format = " $icon $volume | ";
        }
        {
          block = "backlight";
          format = " $icon $brightness | ";
        }
        {
          block = "time";
          interval = 60;
          format = " $timestamp.datetime(f:'%R') ";
        }
      ];

      settings = {
        theme = {};
      };
    };
  };
}
