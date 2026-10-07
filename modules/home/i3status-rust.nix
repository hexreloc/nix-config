{
  programs.i3status-rust = {
    enable = true;

    bars.default = {
      blocks = [
        {
          block = "battery";
          format = "bat: $percentage ";
          interval = 10;
        }
        {
          block = "cpu";
          interval = 10;
          format = "cpu: $utilization ";
        }
        {
          block = "temperature";
          format = "tea: $max ";
        }
        {
          block = "sound";
          format = "snd: $volume ";
        }
        {
          block = "backlight";
          format = "bri: $brightness ";
        }
        {
          block = "net";
          format = "ip: $ip ";
        }
        {
          block = "time";
          interval = 60;
          format = "t: $timestamp.datetime(f:'%-I:%M %p') ";
        }
      ];
    };
  };
}
