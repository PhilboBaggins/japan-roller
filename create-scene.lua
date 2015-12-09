local composer = require("composer")

function CreateScene(sceneParams)
    local scene = composer.newScene()

    scene.sceneParams = sceneParams

    local englishText = nil
    local japaneseText = nil
    local anglicisedJapaneseText = nil

    -- Called when the scene's view does not exist.
    function scene:create(event)
        local sceneGroup = self.view

        local background = display.newRect(0, 0, display.contentWidth, display.contentHeight)
        background.anchorX = 0
        background.anchorY = 0
        background:setFillColor(unpack(sceneParams.bgColours))

        englishText = display.newText({
            text = "Shake me",
            x = display.contentWidth * 0.5,
            y = display.contentHeight * 0.4,
            font = native.systemFontBold,
            fontSize = 32,
            align = "center",
        })

        japaneseText = display.newText({
            text = "",
            x = display.contentWidth * 0.5,
            y = display.contentHeight * 0.6,
            font = native.systemFont,
            fontSize = 18,
            align = "center",
        })

        anglicisedJapaneseText = display.newText({
            text = "",
            x = display.contentWidth * 0.5,
            y = display.contentHeight * 0.7,
            font = native.systemFont,
            fontSize = 18,
            align = "center",
        })

        sceneGroup:insert(background)
        sceneGroup:insert(englishText)
        sceneGroup:insert(japaneseText)
        sceneGroup:insert(anglicisedJapaneseText)
    end

    function scene:show(event)
        local sceneGroup = self.view
        local phase = event.phase

        if phase == "will" then
            -- Called when the scene is still off screen and is about to move on screen
        elseif phase == "did" then
            -- Called when the scene is now on screen
            --
            -- INSERT code here to make the scene come alive
            -- e.g. start timers, begin animation, play audio, etc.
        end
    end

    function scene:hide(event)
        local sceneGroup = self.view
        local phase = event.phase

        if phase == "will" then
            -- Called when the scene is on screen and is about to move off screen
            --
            -- INSERT code here to pause the scene
            -- e.g. stop timers, stop animation, unload sounds, etc.)
        elseif phase == "did" then
            -- Called when the scene is now off screen
        end
    end

    function scene:destroy(event)
        local sceneGroup = self.view

        -- Called prior to the removal of scene's "view" (sceneGroup)
        --
        -- INSERT code here to cleanup the scene
        -- e.g. remove display objects, remove touch listeners, save state, etc.
    end

    function scene:displayThing(thing)
        englishText.text = thing.english
        japaneseText.text = thing.japanese
        anglicisedJapaneseText.text = thing.anglicised_japanese
    end

    -- Listener setup
    scene:addEventListener("create", scene)
    scene:addEventListener("show", scene)
    scene:addEventListener("hide", scene)
    scene:addEventListener("destroy", scene)

    return scene
end

return CreateScene
