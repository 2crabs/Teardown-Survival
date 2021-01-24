function init()
    wood = FindShapes("pickupWood",true)

    for i = 0,#wood do 
        SetTag(wood[i], "interact", "pickup wood")
    end
end

function tick(dt)
    for i = 0,#wood do 
        if IsShapeInteracted(wood[i]) then
            SetInt("game.PlayerWood",GetInt("game.PlayerWood")+1)
            Delete(wood[i])
            SetString("hud.notification","+1 wood")
        end
    end
end

function IsShapeInteracted(shape)
    if (GetPlayerInteractShape() == shape) and InputPressed("e") then
        return true
    else
        return false
    end
end