AddEventHandler('flame_hospitalbeds:bedInteract', function(data)
    print('Bed Interact')
    print(json.encode(data))
end)

if Config.EnableBedInteracts then
    CreateThread(function()
        local ox_target = exports.ox_target

        ox_target:addBoxZone({
            coords = vec3(353.1, -584.6, 43.11),
            size = vec3(2, 2, 2),
            rotation = 45,
            debug = false,
            drawSprite = true,
            options = {
                {
                    name = 'debug_box',
                    event = 'ox_target:debug',
                    icon = 'fa-solid fa-cube',
                    label = 'Bed',
                }
            }
        })
--[[         wsb.target.boxZone('standalone_checkin_' .. id, checkInSpots.Target.coords, checkInSpots.Target.width,
            checkInSpots.Target.length, {
                heading = checkInSpots.Target.heading,
                minZ = checkInSpots.Target.minZ,
                maxZ = checkInSpots.Target.maxZ,
                distance = checkInSpots.Target.distance,
                options = {
                    {
                        name = 'standalone_checkin_' .. id,
                        event = 'wasabi_ambulance:attemptCheckin',
                        icon = 'fa-solid fa-suitcase-medical',
                        distance = checkInSpots.Target.distance,
                        label = checkInSpots.Target.label,
                        hospital = 'standalone',
                        standaloneID = id
                    }
                }
            }) ]]
    end)
end