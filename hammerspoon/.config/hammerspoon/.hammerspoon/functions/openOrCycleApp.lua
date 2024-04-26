local function openOrCycleApp(name)
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

return openOrCycleApp
