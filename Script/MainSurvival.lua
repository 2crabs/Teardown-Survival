function init()
    SetInt("game.PlayerWood",0)
end

function tick(dt)
    DebugWatch("wood",GetInt("game.PlayerWood"))
end