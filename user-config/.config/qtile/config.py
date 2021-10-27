# -*- coding: utf-8 -*-
from typing import List  # noqa: F401
from libqtile.utils import guess_terminal
from libqtile.config import Key, Match, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, hook, bar, widget
import os
import subprocess
home_folder = os.path.expanduser('~')


mod = "mod4"  # Sets mod key to SUPER/WINDOWS
# mod = "mod1"
# myTerm = guess_terminal()                            # My terminal of choice
myTerm = "kitty"

keys = [
        # Layout hotkeys
        Key([mod], "h", lazy.layout.shrink_main()),
        Key([mod], "l", lazy.layout.grow_main()),
        Key([mod], "j", lazy.layout.down()),
        Key([mod], "k", lazy.layout.up()),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
        Key([mod], "n", lazy.layout.normalize()),
        Key([mod], "o", lazy.layout.maximize()),
        # Key([mod], 'r', lazy.spawncmd()),
        Key(
            [mod, "shift"],
            "space",
            lazy.layout.rotate(),
            lazy.layout.flip(),
            desc="Switch which side main pane occupies (XmonadTall)",
            ),
        ### Switch focus to specific monitor (out of three)
        # Key([mod], "w",
        #    lazy.to_screen(0),
        #    desc='Keyboard focus to monitor 1'
        #    ),
        # Key([mod], "e",
        #   lazy.to_screen(1),
        #    desc='Keyboard focus to monitor 2'
        #    ),
        #Key([mod], "r",
        #   lazy.to_screen(2),
        #   desc='Keyboard focus to monitor 3'
        #   ),
        ### Switch focus of monitors
        Key([mod], "period",
            lazy.next_screen(),
            desc='Move focus to next monitor'
            ),
        Key([mod], "comma",
            lazy.prev_screen(),
            desc='Move focus to prev monitor'
            ),

        # Window hotkeys
        Key([mod], "space", lazy.window.toggle_fullscreen()),
        Key([mod], "q", lazy.window.kill()),

        # Spec hotkeys
        Key([mod, "control"], "r", lazy.restart()),
        Key([mod, "control"], "c", lazy.spawncmd()),
        #Key([mod, "control"], "q", lazy.shutdown()),
        
        # Apps hotkeys
        Key([mod], "Return", lazy.spawn(myTerm), desc="Launch terminal"),
        Key([mod], "w", lazy.spawn("firefox")),
        Key([mod, "shift"], "w", lazy.spawn("firefox-dev -P default")),
        Key([mod], "e", lazy.spawn("pcmanfm")),
        Key([mod], "m", lazy.spawn("flatpak run com.spotify.Client")),
        Key([mod], "p", lazy.spawn("flatpak run com.bitwarden.desktop")),
        
        # ROFI DMENU
        Key([mod, "control"], "s", lazy.spawn(".config/rofi/web-search.sh")),
        Key([mod], "g", lazy.spawn(".config/rofi/github-repos.sh")),
        Key([], "Print", lazy.spawn(".config/rofi/rofi-scrotmenu.sh")),
        Key([mod, "control"], "q", lazy.spawn(".config/rofi/rofi-powermenu.sh")),
        Key([mod], "c", lazy.spawn("rofi  -show calc -modi calc:.config/rofi/rofi-calc.sh")),
        Key([mod], "Tab", lazy.spawn("rofi -show window")),
        Key([mod], "s", lazy.spawn("rofi -show ssh")),
        Key([mod], "r", lazy.spawn("rofi -show drun")),
        Key([mod], "a", lazy.spawn(home_folder+"/.local/bin/rofimoji")),
        Key([mod], "f", lazy.spawn("rofi  -show find -modi find:~/.config/rofi/finder.sh")),
        Key([mod], "o", lazy.spawn(".config/rofi/rofi-configmenu.sh")),
        
        # System hotkeys
        #Key([mod, "shift", "control"], "F11", lazy.spawn("sudo hibernate-reboot")),
        #Key([mod, "shift", "control"], "F12", lazy.spawn("systemctl hibernate")),
        #Key([], "Print", lazy.spawn("scrot -e 'mv $f home_folder/bilder/screenshots/'")),
        
        # Media hotkeys
        Key([], "XF86AudioRaiseVolume", lazy.spawn("pulseaudio-ctl up 5")),
        Key([], "XF86AudioLowerVolume", lazy.spawn("pulseaudio-ctl down 5")),
        Key([], "XF86AudioMute", lazy.spawn("pulseaudio-ctl set 1")),
            Key([mod, "control"], "space", lazy.widget["keyboardlayout"].next_keyboard(), desc="Next keyboard layout."),
]


# GROUPS
#
group_names = [
        ("", {"layout": "monadtall"}),
        ("", {"layout": "monadtall"}),
        ("", {"layout": "monadtall"}),
        ("", {"layout": "zoomy"}),
        ("", {"layout": "zoomy"}),
        ("", {"layout": "monadtall"}),
        ("", {"layout": "verticaltile"}),
        ]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

colors = []

cache=home_folder+'/.cache/wal/colors'
if os.path.isfile(cache):
    def load_colors(cache):
        with open(cache, 'r') as file:
            for i in range(8):
                colors.append(file.readline().strip())
        colors.append('#ffffff')
        colors.append('#282a36')
        lazy.reload()
    load_colors(cache)
else :
    colors =[
"#0F1223",
"#645990",
"#927399",
"#C27685",
"#6B8BD3",
"#A88CAB",
"#DCA6A5",
"#f5dec8",
"#ab9b8c",
"#645990",
"#927399",
"#C27685",
"#6B8BD3",
"#A88CAB",
"#DCA6A5",
"#f5dec8",
"#ffffff","#282a36"
            ]


panel_color =colors[9]

wg_bg=colors[1]
wg_fg=colors[9]

gray=colors[9]
gray_light=colors[7]

tray_bg=colors[3]
tray_fg=colors[8]

notify_bg=colors[3]
notify_fg=colors[8]

state_bg=colors[6]
state_fg=colors[9]

sys_bg=colors[9]
sys_fg=colors[2]

layout_bg=colors[9]
layout_fg=colors[5]

white=colors[8]

layout_theme = {
        "border_width": 2,
        "margin": 0,
        "border_focus": wg_fg,
        "border_normal": wg_bg,
        }

layouts = [
        # layout.MonadWide(**layout_theme),
        # layout.Bsp(**layout_theme),
        # layout.Stack(stacks=2, **layout_theme),
        # layout.Columns(**layout_theme),
        # layout.RatioTile(**laout_theme),
        # layout.MonadTall(**layout_theme),
        # layout.Matrix(**layout_theme),
        layout.Zoomy(**layout_theme),
        layout.VerticalTile(**layout_theme),
        layout.MonadTall(shift_windows=True, **layout_theme),
        layout.Max(**layout_theme),
        layout.Tile(shift_windows=True, **layout_theme),
        layout.Stack(num_stacks=2),
        layout.TreeTab(
            font="Fira Code",
            fontsize=14,
            sections=["FIRST", "SECOND"],
            section_fontsize=11,
            bg_color=panel_color,
            active_bg=white,
            active_fg=wg_fg,
            inactive_bg=panel_color,
            inactive_fg=white,
            section_top=10,
            panel_width=250,
            ),
        layout.Floating(**layout_theme),
        ]


##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(font="FiraMono",margin=0, borderwidth=0, fontsize=14, linewidth=0, padding=15, background=panel_color)


def init_widgets_list():
    widgets_list = [
            widget.GroupBox(
                font="Fira Code Bold",
                fontsize=24,
                active=colors[8],
                inactive=colors[9],
                rounded=False,
                highlight_color=wg_fg,
                urgent_text=notify_bg,
                urgent_alert_method="border",
                disable_drag=True,
                highlight_method="block",
                this_current_screen_border=notify_bg,
                this_screen_border=wg_fg,
                other_current_screen_border=notify_fg,
                other_screen_border=wg_fg,
                foreground=wg_fg,
                background=wg_bg,
                ),
            widget.Sep(
                foreground=panel_color,
                background=panel_color,
                ),
            widget.Prompt(),
            widget.Notify(
                foreground=notify_fg,
                background=notify_bg
                ),
            widget.WindowName(
                foreground=notify_fg,
                background=notify_bg, 
                ),
            widget.Sep(
                foreground=panel_color,
                background=panel_color,
                ),
        widget.Clock(
                foreground=state_fg,
                background=state_bg,
                format="%A, %B %d  [ %H:%M ]",
                ),
        widget.Memory(
                foreground=state_fg, 
                background=state_bg
                ),
        widget.Net(
                interface="enp27s0",
                format="{down} ↓↑ {up}",
                foreground=state_fg,
                background=state_bg,
                padding=5,
                ),
        widget.TextBox(
                text=" Vol:", 
                foreground=state_fg, 
                background=state_bg, 
                padding=0
                ),
        widget.Volume(
                foreground=state_fg, 
                background=state_bg, 
                padding=5
                ),
        widget.Sep(
                padding=10,
                foreground=state_bg,
                background=state_bg,
                ),
        widget.Sep(
                foreground=panel_color, 
                background=panel_color
                ),
        widget.CurrentLayoutIcon(
                custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                foreground=notify_fg,
                background=notify_bg,
                scale=0.7,
                ),
        widget.Sep(
                foreground=notify_bg,  
                background=notify_bg
                ),
        widget.Sep(
                foreground=panel_color, 
                background=panel_color
                ),
        widget.Sep(
                foreground=panel_color,
                background=panel_color,
                ),
        widget.KeyboardLayout(
                foreground=white,
                font="Fira Code Bold",
                background=sys_bg,
                configured_keyboards=['de','us']
                ),
        widget.Systray(
                font="Fira Code Bold",
                foreground=sys_fg, 
                background=sys_bg, 
                padding=10,
                opacity=1.0
                ),
        widget.Sep(
                padding=30,
                foreground=sys_bg,
                background=sys_bg,
                ),
    ]
    return widgets_list

def init_widgets_list_alt():
    widgets_list = [
            widget.GroupBox(
                font="Fira Code Bold",
                fontsize=24,
                active=colors[8],
                inactive=colors[9],
                rounded=False,
                highlight_color=wg_fg,
                urgent_text=notify_bg,
                urgent_alert_method="border",
                disable_drag=True,
                highlight_method="block",
                this_current_screen_border=notify_bg,
                this_screen_border=wg_fg,
                other_current_screen_border=notify_fg,
                other_screen_border=wg_fg,
                foreground=wg_fg,
                background=wg_bg,
                ),
            widget.Sep(
                foreground=panel_color,
                background=panel_color,
                ),
            widget.Prompt(),
            widget.Notify(
                foreground=notify_fg,
                background=notify_bg
                ),
            widget.WindowName(
                foreground=notify_fg,
                background=notify_bg, 
                ),
            widget.Sep(
                foreground=panel_color,
                background=panel_color,
                ),
        widget.Sep(
                foreground=panel_color, 
                background=panel_color
                ),
        widget.CurrentLayoutIcon(
                custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                foreground=notify_fg,
                background=notify_bg,
                scale=0.7,
                ),
        widget.Sep(
                foreground=notify_bg,  
                background=notify_bg
                ),
        widget.Sep(
                foreground=panel_color, 
                background=panel_color
                ),
        widget.Sep(
                foreground=panel_color,
                background=panel_color,
                )
            ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1  # Slicing removes unwanted widgets on Monitors 1,3


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list_alt()
    return widgets_screen2

def init_widgets_screen3():
    widgets_screen3 = init_widgets_list_alt()
    return widgets_screen3

def init_screens():
    return [
            Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=0.9, size=35)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=0.9, size=35)),
            Screen(top=bar.Bar(widgets=init_widgets_screen3(), opacity=1.0, size=25)),
            ]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()
    widgets_screen3 = init_widgets_screen3()


# Drag floating layouts.
mouse = [
        Drag(
            [mod],
            "Button1",
            lazy.window.set_position_floating(),
            start=lazy.window.get_position(),
            ),
        Drag(
            [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
            ),
        Click([mod], "Button2", lazy.window.bring_to_front()),
        ]

auto_fullscreen = True
focus_on_window_activation = "smart"
dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
extentions = []
wmname = "LG3D"

#

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # default_float_rules include: utility, notification, toolbar, splash, dialog,
    # file_progress, confirm, download and error.
    *layout.Floating.default_float_rules,
    Match(title='Confirmation'),  # tastyworks exit box
    Match(title='Qalculate!'),  # qalculate-gtk
    Match(wm_class='kdenlive'),  # kdenlive
    Match(wm_class='pinentry-gtk-2'),  # GPG key password entry
    ])


@lazy.function
def float_to_front(qtile):
    logging.info("bring floating windows to front")
    for group in qtile.groups:
        for window in group.windows:
            if window.floating:
                window.cmd_bring_to_front()

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.call([home])
