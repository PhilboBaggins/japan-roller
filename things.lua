local things =
{
    {
        english = "Vending machine",
        japanese = "自動販売機",
        anglicised_japanese = "Jidō hanbaiki",
        weighting = {
            day = 8, night = 5, food = 0, drink = 0,
        }
    },
    {
        english = "Pachinko",
        japanese = "パチンコ",
        anglicised_japanese = "Pachinko",
        weighting = {
            day = 6, night = 6, food = 0, drink = 0,
        }
    },
    {
        english = "Maid cafe",
        japanese = "メイド喫茶",
        anglicised_japanese = "Meido kissa",
        weighting = {
            day = 3, night = 3, food = 0, drink = 0,
        }
    },
    {
        english = "Cuddle cafe",
        japanese = nil,
        anglicised_japanese = nil,
        weighting = {
            day = 3, night = 3, food = 0, drink = 0,
        }
    },
    {
        english = "Arcade games",
        japanese = nil,
        anglicised_japanese = nil,
        weighting = {
            day = 8, night = 4, food = 0, drink = 0,
        }
    },
    {
        english = "Crazy snack food",
        japanese = nil,
        anglicised_japanese = nil,
        weighting = {
            day = 7, night = 3, food = 0, drink = 0,
        }
    },
    {
        english = "Onsen",
        japanese = "温泉",
        anglicised_japanese = "Onsen",
        weighting = {
            day = 3, night = 0, food = 0, drink = 0,
        }
    },
    {
        english = "Darts",
        japanese = "ダーツ",
        anglicised_japanese = "Dātsu",
        weighting = {
            day = 3, night = 7, food = 0, drink = 0,
        }
    },
    {
        english = "Karaoke",
        japanese = "カラオケ",
        anglicised_japanese = "Karaoke",
        weighting = {
            day = 0, night = 1, food = 0, drink = 0,
        }
    },
    {
        english = "Photo booth",
        japanese = nil,
        anglicised_japanese = nil,
        weighting = {
            day = 6, night = 3, food = 0, drink = 0,
        }
    },
    {
        english = "Driving range",
        japanese = nil,
        anglicised_japanese = nil,
        weighting = {
            day = 2, night = 0, food = 0, drink = 0,
        }
    },



    --
    -- Drinks
    --
    {
        english = "Whiskey",
        japanese = "ウィスキー",
        anglicised_japanese = "U~isukī",
        weighting = {
            day = 2, night = 7, food = 3, drink = 9,
        }
    },
    {
        english = "Beer",
        japanese = "ビール",
        anglicised_japanese = "Bīru",
        weighting = {
            day = 2, night = 7, food = 3, drink = 9,
        }
    },



    --
    -- Food
    --
    {
        english = "Sushi",
        japanese = nil,
        anglicised_japanese = nil,
        weighting = {
            day = nil, night = nil, food = 0, drink = 0,
        }
    },
    {
        english = "Karaage",
        japanese = nil,
        anglicised_japanese = nil,
        weighting = {
            day = nil, night = nil, food = 0, drink = 0,
        }
    },



    --{
    --    english = "???",
    --    japanese = nil,
    --    anglicised_japanese = nil,
    --    weighting = {
    --        day = nil, night = nil, food = 0, drink = 0,
    --    }
    --},
}

local wheels = {
    day = {},
    night = {},
    food = {},
    drink = {},
}

-- Process the list of things and generate wheels for each tab
for kThing,vThing in pairs(things) do
    for k,v in pairs(vThing.weighting) do
        for i = 1,v do
            table.insert(wheels[k], kThing)
        end
    end
end

--function PrintWheel(wheelKey)
--    print(wheelKey .. ":")
--    for k,v in pairs(wheels[wheelKey]) do
--        print("    Thing number " .. v .. ", english: " .. things[v].english)
--    end
--    print("")
--end

-- Print all wheels
--for k,v in pairs(wheels) do
--    PrintWheel(k)
--end

return {
    getRandom = function()
        return things[ math.random( #things ) ]
    end,
    getRandomFromWheel = function(wheelKey)
        local desiredWheel = wheels[wheelKey]
        local thingIdx = desiredWheel[ math.random( #desiredWheel ) ]
        return things[thingIdx]
    end,
}