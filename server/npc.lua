
RegisterNetEvent('zev-trains:spawnTrain')
AddEventHandler('zev-trains:spawnTrain', function(npcName)
    local message = "Du hast mit dem NPC " .. npcName .. " interagiert!"
    TriggerClientEvent("npc_interaction_message", source, message)
end)