-- Register stashes on startup
CreateThread(function()
    for _, trash in ipairs(Config.Locations) do
        exports.ox_inventory:RegisterStash(trash.id, trash.label, Config.MaxSlots, Config.MaxWeight, nil, nil, trash.coords.xyz)
    end
end)

-- Auto clear loop
CreateThread(function()
    while true do
        Wait(Config.ClearInterval * 1000)
        
        for _, trash in ipairs(Config.Locations) do
            exports.ox_inventory:ClearInventory(trash.id)
        end
    end
end)
