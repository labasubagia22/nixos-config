{ pkgs, ... }: {

  home.packages = with pkgs; [
    pavucontrol
  ];

  programs.waybar = {
    enable = true;
    style = ''
      ${builtins.readFile "${pkgs.waybar}/etc/xdg/waybar/style.css"}

      window#waybar {
        background: transparent;
        border-bottom: none;
      }

      #workspaces button.focused {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
      }
    '';
    settings = [
      {
        layer = "top";
        # width = 1280; # Waybar width
        # position ="bottom"; # Waybar position (top|bottom|left|right)
        height = 30; # Waybar height (to be removed for auto height)
        spacing = 4; # Gaps between modules (4px)
        modules-center = [ "hyprland/window" ];
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [
          "pulseaudio"
          "network"
          "cpu"
          "memory"
          "temperature"
          "backlight"
          "keyboard-state"
          "battery"
          "clock"
          "tray"
        ];

        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          formaticons = {
            locked = "";
            unlocked = "";
          };
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray = {
          # icon-size = 21;
          spacing = 10;
        };
        clock = {
          # timezone = "America/New_York";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory = {
          format = "{}% ";
        };
        temperature = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [ "" "" "" ];
        };
        backlight = {
          # "device"= "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          # format-good = ""; # An empty format will hide the module
          # format-full = "";
          format-icons = [ "" "" "" "" "" ];
        };
        network = {
          # interface= "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}= {ipaddr}/{cidr}";
        };
        pulseaudio = {
          # scroll-step = 1; # %; can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };
      }
    ];
  };
}
