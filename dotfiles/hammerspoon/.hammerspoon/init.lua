function open_or_cycle_app(name)
    return function()
        local focused_window = hs.window.focusedWindow():application():title()
        if focused_window ~= name then
            hs.application.launchOrFocus(name)
        else
            local app = hs.appfinder.appFromName(name)
            local windows = app:allWindows()
            windows[#windows]:focus()
        end
    end
end

hs.hotkey.bind({"control", "alt", "cmd"}, "F", open_or_cycle_app("Firefox"))
hs.hotkey.bind({"control", "alt", "cmd"}, "T", open_or_cycle_app("Alacritty"))

function focusWindow(direction)
    local focusedWindow = hs.window.focusedWindow()
    if direction == "west" then
        return function() focusedWindow:focusWindowWest(nil, true) end
    elseif direction == "south" then
        return function() focusedWindow:focusWindowSouth(nil, true) end
    elseif direction == "north" then
        return function() focusedWindow:focusWindowNorth(nil, true) end
    elseif direction == "east" then
        return function() focusedWindow:focusWindowEast(nil, true) end
    end
end

hs.hotkey.bind({"control", "cmd"}, "Left", focusWindow("west"))
hs.hotkey.bind({"control", "cmd"}, "Down", focusWindow("south"))
hs.hotkey.bind({"control", "cmd"}, "Up", focusWindow("north"))
hs.hotkey.bind({"control", "cmd"}, "Right", focusWindow("east"))
