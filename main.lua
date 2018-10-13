_gameversion = "0.01"
_defaultmenu = "game_menus.lua"
_defaultui = "ui_console.lua"

-- Load stuff
-- TODO choose ui/menu files based on command line input

menufile = _defaultmenu
local uifile = _defaultui

dofile(menufile)
return dofile(uifile)
