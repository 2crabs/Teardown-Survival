function init()
    --WOOD COLLECTION
    tree = FindShape("tree",true)
    treeb = GetShapeBody(tree)
    --gets starting mass
    treeOM = GetBodyMass(treeb)

    --location for spawning wood
    spawnloc = FindLocation("spawnloc",false)
    spawnlocPos = GetLocationTransform(spawnloc).pos

    mined = 0
    minedNotification = 0
    timer = 0
    --WOOD COLLECTION


end

function tick(dt)
    --WOOD COLLECTION
    treeM = GetBodyMass(treeb)
    --difference in mass
    treeMD = treeOM - treeM

    --does this when one wood has been mined
    if treeMD>100 then
        treeOM = treeOM-100
        mined = mined + 1
        minedNotification = minedNotification + 1
        SetString("hud.notification","+" .. minedNotification .. " wood")
        --timer used for when to reset notification
        timer = 100
    end

    if timer < 1 then
        minedNotification = 0
        timer = 0
    end
    timer = timer - 1
    --WOOD COLLECTION
end
