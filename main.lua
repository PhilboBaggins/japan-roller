-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- GLOBALS: math, timer, pairs

-- show default status bar (iOS)
display.setStatusBar(display.DefaultStatusBar)

local widget = require("widget")
local composer = require("composer")
local things = require("things")

local CHANGE_SCENE_OPTIONS = {
    effect = "fade",
    time = 100
}

local function RandomThing()
    local currSceneName = composer.getSceneName("current")
    local currScene = composer.getScene(currSceneName)
    local rndThing = things.getRandomFromWheel(currScene.sceneParams.wheelKey)
    currScene:displayThing(rndThing)
    -- TODO: Save currently selected thing so that it can be restored when if the app is suspended
end

local function SpinThoseThings()
    local spinCount = math.random(15, 20)
    local function DelayedSpin()
        spinCount = spinCount - 1
        if spinCount > 0 then
            RandomThing()
            local timerInterval = math.random(100, 150)
            timer.performWithDelay(timerInterval, DelayedSpin, 1)
        end
    end
    DelayedSpin()
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
    return function(event)
        composer.gotoScene(sceneName, CHANGE_SCENE_OPTIONS)
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

local sceneNames = {
    "scene-day",
    "scene-night",
    "scene-food",
    "scene-drink",
}

local function getCurrentSceneIndex()
        local currSceneName = composer.getSceneName("current")
        for k,v in pairs(sceneNames) do
            if (v == currSceneName) then
                return k
            end
        end
        return -1 -- Unable to find scene. This should never happen, please update the sceneNames list
end

local swipeBeginX = 0
local function touchListener(event)
    if event.phase == "began" then
        swipeBeginX = event.x
    elseif event.phase == "ended" then
        local curSceneIdx = getCurrentSceneIndex()
        local nextSceneIdx = (event.x < swipeBeginX) and (curSceneIdx + 1) --[[Left swipe]] or (curSceneIdx - 1) --[[Right swipe]]

        if (nextSceneIdx >= 1) and (nextSceneIdx <= #sceneNames) then
            local nextSceneName = sceneNames[nextSceneIdx]
            composer.gotoScene(nextSceneName, CHANGE_SCENE_OPTIONS)
            tabBar:setSelected(nextSceneIdx)
            --print("Swiping to " .. nextSceneName)
        end
    end
    return true
end
Runtime:addEventListener("touch", touchListener)

GenSceneChange("scene-day")() -- Invoke first tab button's onPress event manually
