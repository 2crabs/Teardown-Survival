function init()
    trigger = FindTrigger("material",true)
    triggerPos = GetTriggerTransform(trigger).pos

    wood = 0
end

function tick(dt)
    if GetPlayerGrabShape() ~= nil and IsPlayerClose() then
        grabShape = raycast()
    end
    if IsPlayerClose() then
        for i = -5, 5 do
            for o = -5, 5 do
                for p = -5, 5 do
                    x = (i/10) + triggerPos[1]
                    y = (o/10) + triggerPos[2]
                    z = (p/10) + triggerPos[3]
                    point = Vec(x,y,z)
                    --DebugCross(point,1,0,0,1)
                    if GetShapeMaterialAtPosition(grabShape,point) == "wood" then
                        --DebugCross(point,1,0,0,1)
                        MakeHole(point,0.05,0,0,true)
                    end
                end
            end
        end
    end
end

-- does a grid of raycasts by the trigger
function raycast()
    for i = -5, 5 do
        for n = -5, 5 do
            local x = (i/10) + triggerPos[1]
            local z = (n/10) + triggerPos[3]

            hit, dist, normal, shape = QueryRaycast(Vec(x,triggerPos[2],z), Vec(0,-1,0), 0.45)

            if hit then
                local point = VecScale(Vec(0,-1,0),dist)
                point = VecAdd(point,Vec(x,triggerPos[2],z))
                if shape ~= 27 then
                    return shape
                end
            end
        end
    end
end

--used so I don't have to do 100 raycasts when you're not by the trigger.
function IsPlayerClose()
    local diff = VecSub(GetPlayerTransform().pos,triggerPos)
    local length = VecLength(diff)
    if length < 5 then
        return true
    else
        return false
    end
end