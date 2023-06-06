local function focusWindow(direction)
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

return focusWindow
