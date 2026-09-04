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
          interval = 60;
          format = " $icon $utilization | ";
        }
        {
          block = "temperature";
          format = " $icon $max | ";
          interval = 60;
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
