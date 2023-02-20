local PlayersList = {}
CreateThread(function()
    while true do
        local data = {id = GetPlayerServerId(PlayerId()), playersActive = #GetAcPlayers()}
        table.insert(PlayersList, data)
        SendNUIMessage({
            type = "update",
            data = data
        })
        Wait(5 * 1000)
    end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    SendNUIMessage({
        type = "show",
        data = PlayersList
    })
end)


function GetAcPlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end


-- local PlayersList = {}
-- -- CreateThread(function()
-- --     while true do
-- --         local data = {id = GetPlayerServerId(PlayerPedId()), playersActive = #GetAcPlayers()}
-- --         table.insert(PlayersList, data)
-- --         SendNUIMessage({
-- --             type = "update",
-- --             data = data
-- --         })
-- --         Wait(5 * 1000)
-- --     end
-- -- end)

-- RegisterNetEvent("cz-logo:client:updatePlayers", function(p)
--     PlayersList = p
--     SendNUIMessage({
--         type = "update",
--         data = p
--     })
-- end)

-- RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
--     SendNUIMessage({
--         type = "show",
--         data = PlayersList
--     })
-- end)

