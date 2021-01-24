function tick(dt)
    --shows material at cursor
    hitpos = raycast()
    hitshape = raycastShape()
    DebugCross(hitpos,1,0,0,1)
    material = GetShapeMaterialAtPosition(hitshape,hitpos)
    DebugWatch("material",material)
end

function raycast()
	local pt = GetPlayerTransform()
	local ct = GetCameraTransform()

	local md = 500
	local f = TransformToParentPoint(ct, Vec(0, 0, md * - 1))
	local d = VecSub(f, ct.pos)
	local d = VecNormalize(d)
    local hit, dist, normal, hs = QueryRaycast(ct.pos, d, md)
    lookAt = TransformToParentPoint(ct, Vec(0, 0, dist * - 1))
    if hit then
        return lookAt
    end
end

function raycastShape()
	local pt = GetPlayerTransform()
	local ct = GetCameraTransform()

	local md = 500
	local f = TransformToParentPoint(ct, Vec(0, 0, md * - 1))
	local d = VecSub(f, ct.pos)
	local d = VecNormalize(d)
    hit, dist, normal, hs = QueryRaycast(ct.pos, d, md)
    if hit then
        return hs
    end
end