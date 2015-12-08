local things =
{
    {
        english = "Vending machine",
        japanese = "自動販売機",
        anglicised_japanese = "Jidō hanbaiki",
    },
    {
        english = "Beer",
        japanese = "ビール",
        anglicised_japanese = "Bīru",
    },
    {
        english = "Pachinko",
        japanese = "パチンコ",
        anglicised_japanese = "Pachinko",
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
