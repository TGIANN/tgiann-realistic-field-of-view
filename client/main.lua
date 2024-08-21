local functions <const> = require "client.functions"
local config <const> = require "config"

CreateThread(function()
    while true do
        local playerPed <const> = PlayerPedId()
        local playerPos <const> = GetEntityCoords(playerPed)
        local playerForwardVector <const> = GetEntityForwardVector(playerPed)

        -- Handle peds
        local peds <const> = GetGamePool('CPed')
        for _, ped in ipairs(peds) do
            if ped ~= playerPed then
                local pedPos <const> = GetEntityCoords(ped)
                local direction <const> = pedPos - playerPos
                local canSee <const> = functions.CanSeeEntity(direction, playerForwardVector)
                functions.ChangeEntityAlpha(ped, canSee and config.alpha or 255)
            end
        end

        -- Handle vehicles
        local vehicles <const> = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehicles) do
            local vehiclePos <const> = GetEntityCoords(vehicle)
            local direction <const> = vehiclePos - playerPos
            local canSee <const> = functions.CanSeeEntity(direction, playerForwardVector)
            functions.ChangeEntityAlpha(vehicle, canSee and config.alpha or 255)
        end

        Wait(500)
    end
end)
