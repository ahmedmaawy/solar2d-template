-- Include modules/libraries
local composer = require("composer")
local fx = require("com.ponywolf.ponyfx")
local tiled = require("com.ponywolf.ponytiled")
local physics = require("physics")
local json = require("json")

-- Variables local to scene
local map, hero, shield, parallax

-- Create a new Composer scene
local scene = composer.newScene()

-- This function is called when scene is created
function scene:create(event)
    local sceneGroup = self.view  -- Add scene display objects to this group

    -- start the physics system
    -- physics.start()
    -- physics.setGravity(0, 32)

    -- Load our map
    -- local filename = event.params.map or "map/game_scene.json"
    -- local mapData = json.decodeFile(system.pathForFile(filename, system.ResourceDirectory))
    -- local mapData = require("map.stage_1")
    -- map = tiled.new(mapData, "map")
    -- map.xScale, map.yScale = 1, 1

    -- Implement extensions folder for the map
    -- map.extensions = "map.lib."
    
    -- Do extensions
    -- map:extend("hero")
    -- hero = map:findObject("hero")
    -- hero.filename = filename

    -- Find our enemies and other items
    -- map:extend("blob", "enemy", "exit", "coin", "spikes")

    -- Insert our game items in the correct back-to-front order
    -- sceneGroup:insert(map)
end

-- Function to scroll the map
local function enterFrame(event)
end

-- This function is called when scene comes fully on screen
function scene:show(event)
    local phase = event.phase
    if (phase == "will")then
        -- fx.fadeIn()	-- Fade up from black
        -- If we need to add the enterFrame event
        -- Runtime:addEventListener("enterFrame", enterFrame)
    elseif (phase == "did")then
        -- Scene was just shown
    end
end

-- This function is called when scene goes fully off screen
function scene:hide(event)
    local phase = event.phase
    if (phase == "will")then
        -- audio.fadeOut({ time = 1000 })
    elseif (phase == "did")then
        -- If we need to add the enterFrame event
        -- Runtime:removeEventListener("enterFrame", enterFrame)
    end
end

-- This function is called when scene is destroyed
function scene:destroy(event)
    -- Scene was destroyed
end

scene:addEventListener("create")
scene:addEventListener("show")
scene:addEventListener("hide")
scene:addEventListener("destroy")

return scene
