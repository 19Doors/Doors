# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import subprocess
import os
from datetime import datetime

from libqtile import bar, layout, widget, hook, extension, qtile
from libqtile.config import Click, Drag, Group, Key, Match, ScratchPad, Screen, DropDown
from libqtile.lazy import lazy
from libqtile.core.manager import Qtile
from libqtile.utils import send_notification
from libqtile.group import _Group


mod = "mod4"
terminal = "termite" 
browser = "qutebrowser"
browser_clg = "qutebrowser --basedir .config/qute_college -C .config/qute_college/config.py"

home = os.path.expanduser('~')

# ===== HOOKS =====

@hook.subscribe.startup_once
def start_once():
    subprocess.call([home + '/.config/qtile/auto.sh'])

# NEW: Auto-float dialog and transient windows (like Firefox popups)
@hook.subscribe.client_new
def auto_float_dialogs(window):
    """Automatically float dialog windows and transient windows (subprocesses)"""
    wm_type = window.window.get_wm_type()
    wm_transient = window.window.get_wm_transient_for()
    
    # Float if it's a dialog or transient window (subprocess)
    if wm_type == 'dialog' or wm_transient:
        window.floating = True
        window.center()  # Center the dialog on screen

# ===== CUSTOM FUNCTIONS =====

# NEW: Custom function to toggle floating and center window
@lazy.function
def float_to_center(qtile):
    """Toggle floating and center the window on screen"""
    window = qtile.current_window
    if window:
        window.toggle_floating()
        if window.floating:
            window.center()

# ===== WALLPAPER SETUP =====

wallpapers = ["wallpapers/altitude.png"]
j = 0
for i in wallpapers:
    initial = "~/.config/qtile/"
    i = initial+i
    wallpapers[j] = i
    j += 1

# ===== KEYBINDINGS =====

keys = [
    
    # =====APPLICATIONS======
        
    Key([mod], "w", lazy.spawn(browser), desc="Launch browser"),
    Key([mod, "shift"], "w", lazy.spawn(browser_clg), desc="Launch college browser"),
    Key([mod, "shift"], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # =====MEDIA CONTROLS======
    
    # Brightness controls - Use brightnessctl (install with: sudo pacman -S brightnessctl)
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%"), desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-"), desc="Decrease brightness"),
    
    # Alternative brightness controls with F keys
    Key([], "F6", lazy.spawn("brightnessctl set 5%-"), desc="Decrease brightness (F6)"),
    Key([], "F7", lazy.spawn("brightnessctl set +5%"), desc="Increase brightness (F7)"),
    
    # Volume controls - Using pactl (PulseAudio/PipeWire)
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%"), desc="Increase volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%"), desc="Decrease volume"),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle"), desc="Mute/Unmute audio"),
    
    # Media player controls
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Play/Pause media"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Next track"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Previous track"),
 
    # =====WINDOW NAVIGATION======
    
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    
    # =====WINDOW MOVEMENT======
    
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    
    # =====WINDOW RESIZING======
    
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    
    # =====LAYOUT CONTROLS======
    
    Key([mod, "control"], "Return", lazy.layout.toggle_split(), 
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "Tab", lazy.prev_layout(), desc="Toggle to previous layout"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
    Key([mod, "shift"], "f", float_to_center, desc="Toggle floating and center"),  # MODIFIED
    
    # =====QTILE CONTROLS======
    
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    
    # =====LAUNCHERS======
    
    Key([mod], "r", lazy.spawn("dmenu_run -h 28"), desc="Spawn dmenu"),
    Key([mod, "control"], "p", lazy.spawn("rofi -show drun"), desc="Spawn rofi"),
    
    # =====SCREENSHOTS======
    
    Key(["mod1"], "c", lazy.spawn("screenshot"), desc="Take screenshot"),
    
    # =====SYSTEM CONTROLS======
    
    Key(["control"], "p", lazy.spawn("powermenu"), desc="Open power menu"),
    Key([mod], "p", lazy.spawn("dm-tool lock"), desc="Lock screen"),
    
    # =====EWW WIDGETS======
    
    Key(["control"], "n", lazy.spawn("eww open --toggle noti"), desc="Toggle notifications widget"),
    Key(["control"], "o", lazy.spawn("eww open --toggle colorpalette"), desc="Toggle color palette widget"),
]

# ===== GROUP CONFIGURATION =====

wallpapers = ["wallpapers/altitude.png"]
j = 0
for i in wallpapers:
    initial = "feh --bg-fill ~/.config/qtile/"
    i = initial+i
    wallpapers[j] = i 
    j += 1 

print(wallpapers)

groups = [
    Group("1", label=""),
    Group("2", label=""),
    Group("3", label=""),
    Group("4", label=""),
    Group("5"),
    Group("0", label=""),
]

for i in groups:
    keys.extend([
        # Switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),
        # Move focused window to group and switch
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])

# ===== SCRATCHPAD CONFIGURATION =====

groups.append(ScratchPad('scratchpad', [
    DropDown('ranger', 'termite -e ranger', width=0.5, height=0.5, x=0.25, y=0.2),
    DropDown('removables', 'termite --exec="ranger /run/media/sakaar"', width=0.5, height=0.5, x=0.25, y=0.2),
    DropDown('alsa', 'termite -e alsamixer', width=0.5, height=0.5, x=0.25, y=0.2),
    DropDown('terminal', 'termite', width=0.5, height=0.5, x=0.25, y=0.2),
    DropDown('music', 'termite --exec="cmus"', width=0.5, height=0.5, x=0.25, y=0.2),
    DropDown('btop', 'termite --exec="btop"', width=0.5, height=0.5, x=0.25, y=0.2),
]))

scratchkeys = [
    Key(['control'], '1', lazy.group['scratchpad'].dropdown_toggle('terminal'), desc="Toggle terminal scratchpad"),
    Key(['control'], '2', lazy.group['scratchpad'].dropdown_toggle('alsa'), desc="Toggle alsa mixer"),
    Key(['control'], '3', lazy.group['scratchpad'].dropdown_toggle('ranger'), desc="Toggle ranger"),
    Key(['control'], '4', lazy.group['scratchpad'].dropdown_toggle('music'), desc="Toggle music player"),
    Key(['control'], '0', lazy.group['scratchpad'].dropdown_toggle('removables'), desc="Toggle removables"),
    Key(['control'], '5', lazy.group['scratchpad'].dropdown_toggle('btop'), desc="Toggle btop"),
]

keys.extend(scratchkeys)

# ===== THEME =====

colors = ['#010206', '#F1EDEE', '#7A6563', '#36C9C6', '#56667A']

# ===== LAYOUTS =====

layouts = [
    layout.Columns(
        margin=[7, 6, 7, 6],
        border_focus="#21262e",
        border_width=0,
        border_on_single=True,
        border_normal='21262e'
    ),
    layout.Max(),
    layout.Floating(
        border_focus="red",
        border_on_single=True,
        border_width=0,
        border_normal='orange',
    ),
]

# ===== WIDGET DEFAULTS =====

widget_defaults = dict(
    font="Iosevka Nerd Font",
    fontsize=14,
    padding=3
)
extension_defaults = widget_defaults.copy()

col = {'active': "#010206", 'inactive': "#7A6563"}

# ===== SCREENS =====

screens = [Screen()]

# ===== MOUSE =====

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# ===== OTHER SETTINGS =====

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="Thunar"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
    border_focus='#F1EDEE',
    border_normal=colors[4],
    border_width=0
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
