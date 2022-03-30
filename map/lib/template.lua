-- Define module
local M = {}

local composer = require("composer")

function M.new(instance)
    if not instance then error("ERROR: Expected display object") end

    -- Get scene and sounds
    local scene = composer.getScene(composer.getSceneName("current"))
    
    -- Get stuff from the scene. For instance, a list of all sounds:
    -- local sounds = scene.sounds

    function instance:collision(event)
        -- Collision handling sample:
        -- local phase, other = event.phase, event.other
        -- if phase == "began" and other.type == "hero" then
        --    audio.play(sounds.coin)
        --    scene.score:add(100)
        --    display.remove(self)
        -- end
    end
    
    -- Add physics and collision detection for the object
    instance._y = instance.y
    physics.addBody(instance, "static", { isSensor = true })
    instance:addEventListener("collision")
    
    -- Transition sample
    -- transition.from(instance, { y = instance._y - 16, transition = easing.outBounce, time = 500, iterations = -1 })

    -- Return back the extended instance
    return instance
end

return M