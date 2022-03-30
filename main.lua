-- Include the Composer library
local composer = require("composer")

-- Removes status bar on iOS
-- https://docs.coronalabs.com/api/library/display/setStatusBar.html
display.setStatusBar(display.HiddenStatusBar)

-- Removes bottom bar on Android 
if system.getInfo("androidApiLevel") and system.getInfo("androidApiLevel") < 19 then
    native.setProperty("androidSystemUiVisibility", "lowProfile")
else
    native.setProperty("androidSystemUiVisibility", "immersiveSticky")
end

-- Are we running on the Corona Simulator?
-- https://docs.coronalabs.com/api/library/system/getInfo.html
local isSimulator = "simulator" == system.getInfo("environment")
local isMobile = ("ios" == system.getInfo("platform")) or ("android" == system.getInfo("platform"))

-- If we are running in the Corona Simulator, enable debugging keys
-- "F" key shows a visual monitor of our frame rate and memory usage
if isSimulator then 
    -- Show FPS
    local visualMonitor = require("com.ponywolf.visualMonitor")
    local visMon = visualMonitor:new()
    visMon.isVisible = false

    local function debugKeys(event)
        local phase = event.phase
        local key = event.keyName
        if phase == "up" then
            if key == "f" then
                visMon.isVisible = not visMon.isVisible 
            end
        end
    end
    -- Listen for key events in Runtime
    -- See the "key" event documentation for more details:
    -- https://docs.coronalabs.com/api/event/key/index.html
    Runtime:addEventListener("key", debugKeys)
end

-- This module turns gamepad axis events and mobile accelerometer events into keyboard
-- events so we don't have to write separate code for joystick, tilt, and keyboard control
-- require("com.ponywolf.joykey").start()

-- add virtual joysticks to mobile 
system.activate("multitouch")
if isMobile or isSimulator then
--    local vjoy = require("com.ponywolf.vjoy")
--    local stick = vjoy.newStick()
--    stick.x, stick.y = 128, display.contentHeight - 128
--    local button = vjoy.newButton()
--    button.x, button.y = display.contentWidth - 128, display.contentHeight - 128
end

-- reserve music channel
audio.reserveChannels(1)

composer.gotoScene("scene.game", { params={}})