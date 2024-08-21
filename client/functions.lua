local config <const>        = require "config"
local functions             = {}

functions.ChangeEntityAlpha = function(entity, alpha)
    local entityAlpha <const> = GetEntityAlpha(entity)
    if entityAlpha == 0 then return end
    if entityAlpha == alpha then return end
    SetEntityAlpha(entity, alpha)
end

functions.CanSeeEntity      = function(direction, playerForwardVector)
    return (direction.x * playerForwardVector.x + direction.y * playerForwardVector.y) < math.cos(math.rad(config.viewAngle))
end

return functions
