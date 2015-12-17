-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- show default status bar (iOS)
display.setStatusBar(display.DefaultStatusBar)

local widget = require("widget")
local composer = require("composer")
local things = require("things")

local function SpinThoseThings()
    local spinCount = math.random(15, 20)
    function DelayedSpin()
        spinCount = spinCount - 1
        if spinCount > 0 then
            RandomThing()
            local timerInterval = math.random(100, 150)
            timer.performWithDelay(timerInterval, DelayedSpin, 1)
        end
    end
    DelayedSpin()
end

function RandomThing()
    local currSceneName = composer.getSceneName("current")
    local currScene = composer.getScene(currSceneName)
    local rndThing = things.getRandomFromWheel(currScene.sceneParams.wheelKey)
    currScene:displayThing(rndThing)
    -- TODO: Save currently selected thing so that it can be restored when if the app is suspended
end

-- Do stuff when the user shakes their mobile device
local function accelerometerListener(event)
    if event.isShake then
        --RandomThing()
        SpinThoseThings()
    end

    return true
end
Runtime:addEventListener("accelerometer", accelerometerListener)

-- TODO: Document this function
local function GenSceneChange(sceneName)
    local gotoSceneOptions = {
       effect = "fade",
       time = 500
    }
    return function(event)
        composer.gotoScene(sceneName, gotoSceneOptions)
    end
end

-- TabBar widget
local tabBar = widget.newTabBar {
    height = 50,
    top = display.contentHeight - 50,
    buttons = {
        { label="Day",   defaultFile="icon1.png", overFile="icon1-down.png", width = 32, height = 32, onPress=GenSceneChange("scene-day"), selected=true },
        { label="Night", defaultFile="icon2.png", overFile="icon2-down.png", width = 32, height = 32, onPress=GenSceneChange("scene-night") },
        { label="Food",  defaultFile="icon1.png", overFile="icon1-down.png", width = 32, height = 32, onPress=GenSceneChange("scene-food") },
        { label="Drink", defaultFile="icon2.png", overFile="icon2-down.png", width = 32, height = 32, onPress=GenSceneChange("scene-drink") },
    }
}

GenSceneChange("scene-day")() -- Invoke first tab button's onPress event manually
