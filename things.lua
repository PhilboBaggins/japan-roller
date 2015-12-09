local things =
{
    {
        english = "Vending machine",
        japanese = "自動販売機",
        anglicised_japanese = "Jidō hanbaiki",
    },
    {
        english = "Pachinko",
        japanese = "パチンコ",
        anglicised_japanese = "Pachinko",
    },
    {
        english = "Maid cafe",
        japanese = "メイド喫茶",
        anglicised_japanese = "Meido kissa",
    },
    {
        english = "Cuddle cafe",
        japanese = nil,
        anglicised_japanese = nil,
    },
    {
        english = "Arcade games",
        japanese = nil,
        anglicised_japanese = nil,
    },
    {
        english = "Crazy snack food",
        japanese = nil,
        anglicised_japanese = nil,
    },
    {
        english = "Onsen",
        japanese = "温泉",
        anglicised_japanese = "Onsen",
    },
    {
        english = "Darts",
        japanese = "ダーツ",
        anglicised_japanese = "Dātsu",
    },
    {
        english = "Karaoke",
        japanese = "カラオケ",
        anglicised_japanese = "Karaoke",
    },
    {
        english = "Photo booth",
        japanese = nil,
        anglicised_japanese = nil,
    },
    {
        english = "Driving range",
        japanese = nil,
        anglicised_japanese = nil,
    },



    --
    -- Drinks
    --
    {
        english = "Whiskey",
        japanese = "ウィスキー",
        anglicised_japanese = "U~isukī",
    },
    {
        english = "Beer",
        japanese = "ビール",
        anglicised_japanese = "Bīru",
    },



    --
    -- Food
    --
    {
        english = "Sushi",
        japanese = nil,
        anglicised_japanese = nil,
    },
    {
        english = "Karaage",
        japanese = nil,
        anglicised_japanese = nil,
    },



    --{
    --    english = "???",
    --    japanese = nil,
    --    anglicised_japanese = nil,
    --},
}

function getRandomThing()
    return things[ math.random( #things ) ]
end

return {
    all = things,
    getRandom = getRandomThing,
}
