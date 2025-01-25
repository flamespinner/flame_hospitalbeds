local function LoadAnimDict(d)
    while not HasAnimDictLoaded(d) do
        RequestAnimDict(d)
        Citizen.Wait(5)
    end
end

AddEventHandler('flame_hospitalbeds:bedInteract', function(data)
    local ped = PlayerPedId()

    LoadAnimDict(Config.animation.anim)

    local playerOffset = GetOffsetFromEntityInWorldCoords(ped, 0, 0, 0)
    SetEntityCoordsNoOffset(ped, data.coords.x, data.coords.y, data.coords.z + 0.8, true, true, true)
    SetEntityHeading(ped, data.data.heading)

    TaskPlayAnim(ped, Config.animation.anim, Config.animation.lib, 3.0, 3.0, -1, 1, 0, false, false, false)

end)


if Config.EnableBedInteracts then
    CreateThread(function()
        Citizen.Wait(1)
        local ox_target = exports.ox_target
        for _, bed in ipairs(Config.bedLocations) do
            ox_target:addBoxZone({
                coords = bed.coords,
                size = vec3(2, 2, 2),
                rotation = 45,
                debug = false,
                drawSprite = true,
                options = {
                    {
                        name = 'debug_box',
                        event = 'flame_hospitalbeds:bedInteract',
                        icon = 'fa-solid fa-bed',
                        label = 'Lay Down',
                        data = {
                            heading = bed.heading,
                        }
                    }
                }
            })
        end
    end)
end