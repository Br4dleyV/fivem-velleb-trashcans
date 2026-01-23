local spawnedTrashCans = {}

CreateThread(function()
    while not Config or not Config.Locations do Wait(100) end

    -- Spawn trash cans and set up targets for all locations
    for _, trash in ipairs(Config.Locations) do
        local model = Config.TrashModel or 'prop_bin_01a'
        
        lib.requestModel(model)
        
        -- Create local object (isNetwork = false)
        local obj = CreateObject(GetHashKey(model), trash.coords.x, trash.coords.y, trash.coords.z, false, false, false)
        SetEntityHeading(obj, trash.coords.w)
        FreezeEntityPosition(obj, true)
        PlaceObjectOnGroundProperly(obj)
        
        table.insert(spawnedTrashCans, obj)
        
        exports.ox_target:addLocalEntity(obj, {
            {
                name = trash.id,
                label = locale('open_trashcan'),
                icon = 'fas fa-trash',
                onSelect = function()
                    exports.ox_inventory:openInventory('stash', trash.id)
                end
            }
        })
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    for _, obj in ipairs(spawnedTrashCans) do
        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
end)
