/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx = 1; /* border pixel of windows */
static const unsigned int snap = 32;    /* snap pixel */
static const unsigned int gappih = 10;  /* horiz inner gap between windows */
static const unsigned int gappiv = 10;  /* vert inner gap between windows */
static const unsigned int gappoh = 10; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov = 10; /* vert outer gap between windows and screen edge */
static int smartgaps = 0; /* 1 means no outer gap when there is only one window */
static const int showbar = 1; /* 0 means no bar */
static const int topbar = 1;  /* 0 means bottom bar */
static const int user_bh = 7; /* 2 is the default spacing around the bar's font */
static const char *fonts[] = {"Maple Mono:size=10"};
static const char dmenufont[] = "monospace:size=10";
static const char col_gray1[] = "#222222";
static const char col_gray2[] = "#444444";
static const char col_gray3[] = "#bbbbbb";
static const char col_gray4[] = "#eeeeee";
static const char col_cyan[] = "#f38ba8"; /* #cba6f7 #94e2d5 #f38ba8 */
static const char *colors[][3] = {
    /*                  fg         bg         border   */
    [SchemeNorm]     = {col_gray3, col_gray1, col_gray2},
    [SchemeSel]      = {col_gray4, col_cyan,  col_cyan},
    [SchemeStatus]   = {col_gray3, col_gray1, "#000000"}, // Statusbar right {text,background,not used but cannot be empty}
    [SchemeTagsSel]  = {col_gray1, col_cyan,  "#000000"}, // Tagbar left selected {text,background, not used but cannot be empty}
    [SchemeTagsNorm] = {col_gray3, col_gray1, "#000000"}, // Tagbar left unselected {text,background,not used but cannot be empty}
    [SchemeInfoSel]  = {col_gray1, col_cyan,  "#000000"}, // infobar middle  selected {text,background,not used but cannot be empty} org = col_gray4
    [SchemeInfoNorm] = {col_gray3, col_gray1, "#000000"}, // infobar middle  unselected {text,background,not used but cannot be empty}
};

static const char *const autostart[] = {
    "slstatus", NULL,
    "autostart.sh", NULL,
    NULL /* terminate */
};

/* tagging */
static const char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"Gimp", NULL, NULL, 0, 1, -1},
    {"Firefox", NULL, NULL, 1 << 8, 0, -1},
};

/* layout(s) */
static const float mfact = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints = 1; /* 1 means respect size hints in tiled resizals */
static const int attachbelow = 1; /* 1 means attach after the currently active window */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT                                                           \
1 /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile}, /* first entry is default */
    {"[@]", spiral},
    {"H[]", deck},
    {"[M]", monocle},
    {"|||", col},
    {"TTT", bstack},
    {"===", bstackhoriz},
    {"HHH", grid},
    {"###", nrowgrid},
    {"---", horizgrid},
    {":::", gaplessgrid},
    {"|M|", centeredmaster},
    {">M>", centeredfloatingmaster},
    {"><>", NULL}, /* no layout function means floating behavior */
    {NULL, NULL},
    {"[\\]", dwindle},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
{MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
    {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
    {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
    {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
{                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
}

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {"rofi",
    "-show",
    "drun",
    "-theme",
    "~/.local/share/rofi/windows11-list-dark.rasi",
    NULL};
// static const char *dmenucmd[] = { "rofi", "-show", "drun", NULL };
static const char *termcmd[] = {"alacritty", NULL};
static const char *termcmd2[] = {"ghostty", NULL};
static const char *bcmd1[] = {"librewolf", NULL};
static const char *browserCmd[] = {"firefox", NULL};
static const char *musicCmd[] = {"alacritty -e ncmpcpp", NULL};
static const char *toggleMusicCmd[] = {"librewolf", NULL};
static const char *powercmd[] = {"powermenu.sh", NULL};
static const char *screenShotCmd[] = {"flameshot", "full", NULL};
static const char *screenShotCmd2[] = {"flameshot", "gui", NULL};
static const char *brightnessUpCmd[] = {"brightness", "-c", "+", "10", NULL};
static const char *brightnessDownCmd[] = {"brightness", "-c", "-", "10", NULL};
static const char *volUpCmd[] = {"pulsemixer", "--change-volume", "+10", NULL};
static const char *volDownCmd[] = {"pulsemixer", "--change-volume", "-10", NULL};
static const char *volMuteCmd[] = {"pulsemixer", "--toggle-mute", NULL};
static const char *musicTogglePlayCmd[] = {"mpc", "toggle", NULL};
static const char *musicPauseCmd[] = {"mpc", "pause", NULL};
static const char *musicNextCmd[] = {"mpc", "next", NULL};
static const char *musicPrevCmd[] = {"mpc", "prev", NULL};
static const char *musicSeekForwardCmd[] = {"mpc", "seek", "+10", NULL};
static const char *musicSeekBackwardCmd[] = {"mpc", "seek", "-10", NULL};
static const char *bitwardenRofiCmd[] = {"custom-rbw-rofi", NULL};
static const char *clipcatCmd[] = {"clipcat-menu", NULL};
static const char *mpdSidebarCmd[] = {"mpd.sh", NULL};
static const char *lockCmd[] = {"betterlockscreen", "-l", NULL};


#include "movestack.c"
// #include "fibonacci.c"

static const Key keys[] = {
    /* modifier                     key        function        argument */
    {MODKEY, XK_Print, spawn, {.v = screenShotCmd2}},
    {0, XK_Print, spawn, {.v = screenShotCmd}},
    /* Function Keys */
    {0, XK_F1, spawn, {.v = mpdSidebarCmd}},
    {0, XK_F2, spawn, {.v = volDownCmd}},
    {0, XK_F3, spawn, {.v = volUpCmd}},
    {0, XK_F4, spawn, {.v = volMuteCmd}},
    {0, XK_F5, spawn, {.v = musicPauseCmd}},
    {0, XK_F6, spawn, {.v = musicPrevCmd}},
    {0, XK_F7, spawn, {.v = musicTogglePlayCmd}},
    {0, XK_F8, spawn, {.v = musicNextCmd}},
    {0, XK_F9, spawn, {.v = clipcatCmd}},
    {0, XK_F10, spawn, {.v = screenShotCmd}},
    {0, XK_F11, spawn, {.v = lockCmd}},
    {0, XK_F12, spawn, {.v = bitwardenRofiCmd}},
    /* Ctrl + Function Keys */
    {ControlMask, XK_F1, spawn, {.v = mpdSidebarCmd}},
    {ControlMask, XK_F2, spawn, {.v = brightnessDownCmd}},
    {ControlMask, XK_F3, spawn, {.v = brightnessUpCmd}},
    {ControlMask, XK_F4, spawn, {.v = screenShotCmd}},
    {ControlMask, XK_F5, spawn, {.v = screenShotCmd}},
    {ControlMask, XK_F6, spawn, {.v = musicSeekBackwardCmd}},
    {ControlMask, XK_F7, spawn, {.v = screenShotCmd}},
    {ControlMask, XK_F8, spawn, {.v = musicSeekForwardCmd}},
    {ControlMask, XK_F9, spawn, {.v = clipcatCmd}},
    {ControlMask, XK_F10, spawn, {.v = screenShotCmd}},
    {ControlMask, XK_F11, spawn, {.v = screenShotCmd}},
    {ControlMask, XK_F12, spawn, {.v = bitwardenRofiCmd}},

    {MODKEY, XK_a, focusstack, {.i = +1}},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY, XK_c, spawn, {.v = clipcatCmd}},
   // {MODKEY, XK_c, setlayout, {.v = &layouts[3]}},
    {MODKEY, XK_d, spawn, {.v = dmenucmd}},
    {MODKEY, XK_e, spawn, {.v = powercmd}},
    {MODKEY, XK_w, spawn, {.v = bcmd1}},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {MODKEY | ShiftMask, XK_Return, spawn, {.v = termcmd2}},            //
    {MODKEY, XK_s, scratchpad_show, {0}},                              // scratchpad toggle
    {MODKEY | ShiftMask, XK_s, scratchpad_hide, {0}},
    {MODKEY, XK_equal, scratchpad_remove, {0}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_p, incnmaster, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | ShiftMask, XK_j, movestack, {.i = +1}},
    {MODKEY, XK_Tab, movestack, {.i = -1}},
    
    {MODKEY | ShiftMask, XK_Return, zoom, {0}},
    {MODKEY | Mod4Mask, XK_u, incrgaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_u, incrgaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_i, incrigaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_i, incrigaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_o, incrogaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_o, incrogaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_6, incrihgaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_6, incrihgaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_7, incrivgaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_7, incrivgaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_8, incrohgaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_8, incrohgaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_9, incrovgaps, {.i = +1}},
    {MODKEY | Mod4Mask | ShiftMask, XK_9, incrovgaps, {.i = -1}},
    {MODKEY | Mod4Mask, XK_0, togglegaps, {0}},
    {MODKEY | Mod4Mask | ShiftMask, XK_0, defaultgaps, {0}},
    
    {MODKEY, XK_v, view, {0}},
    {MODKEY, XK_q, killclient, {0}},
    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY | ShiftMask, XK_f, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_r, setlayout, {.v = &layouts[3]}},
    {MODKEY | ShiftMask, XK_r, setlayout, {.v = &layouts[4]}},
    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},
    {MODKEY, XK_f, togglefullscr, {0}},
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},
    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
    TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
    TAGKEYS(XK_9, 8){MODKEY | ShiftMask, XK_q, quit, {0}},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
