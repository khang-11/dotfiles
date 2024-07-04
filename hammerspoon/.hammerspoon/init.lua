local openOrCycle = require("functions.openOrCycleApp")
local focusWindow = require("functions.focusWindow")

hs.hotkey.bind({ "control", "alt", "shift" }, "B", openOrCycle("Brave Browser"))
hs.hotkey.bind({ "control", "alt", "shift" }, "T", openOrCycle("WezTerm"))
hs.hotkey.bind({ "control", "alt", "shift" }, "E", openOrCycle("Microsoft Outlook"))
hs.hotkey.bind({ "control", "alt", "shift" }, "V", openOrCycle("Microsoft Teams"))
hs.hotkey.bind({ "control", "alt", "shift" }, "S", openOrCycle("Slack"))

hs.hotkey.bind({ "control", "cmd" }, "Left", focusWindow("west"))
hs.hotkey.bind({ "control", "cmd" }, "Down", focusWindow("south"))
hs.hotkey.bind({ "control", "cmd" }, "Up", focusWindow("north"))
hs.hotkey.bind({ "control", "cmd" }, "Right", focusWindow("east"))

require("local")
