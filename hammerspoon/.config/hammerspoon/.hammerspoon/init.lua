local openOrCycle = require("functions.openOrCycleApp")
local focusWindow = require("functions.focusWindow")

hs.hotkey.bind({"control", "alt", "cmd"}, "F", openOrCycle("Firefox"))
hs.hotkey.bind({"control", "alt", "cmd"}, "T", openOrCycle("Alacritty"))

hs.hotkey.bind({"control", "cmd"}, "Left", focusWindow("west"))
hs.hotkey.bind({"control", "cmd"}, "Down", focusWindow("south"))
hs.hotkey.bind({"control", "cmd"}, "Up", focusWindow("north"))
hs.hotkey.bind({"control", "cmd"}, "Right", focusWindow("east"))

require("local")
