local PlayersList = {}
CreateThread(function()
    while true do
        local data = {id = GetPlayerServerId(PlayerId()), playersActive = #GetGHPlayers()}
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


function GetGHPlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end
