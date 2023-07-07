local npcHandles = {}

function CreateNPCs()

    -- loop through npcs to spawn all of them    
    for npcName, npcData in pairs(Config.npcs) do

        -- convert text model to hash
        local hashModel = GetHashKey(npcData.model)

        -- check if model is valid
        if IsModelValid(hashModel) then
            RequestModel(hashModel)
            while not HasModelLoaded(hashModel) do
                Wait(100)
            end
        else
            -- if not valid, print error and continue to next npc
            print('NPC model not valid: ' .. npcData.model)
        end

        -- break down coordinates
        local x, y, z = table.unpack(npcData.coords)

        if Config.debug then
            print('Spawning NPC ' .. npcName .. ' at ' .. x .. ', ' .. y .. ', ' .. z .. ', heading: ' .. npcData.heading)
        end

        -- spawn ped
        local npcPed = CreatePed(hashModel, x, y, z, npcData.heading, false, true, true, true)
        
        -- set ped props
        -- SetEntityAsMissionEntity(npcPed, true, true) -- still dont know what this means.
        Citizen.InvokeNative(0x283978A15512B2FE, npcPed, true) -- set random outfit variation
        SetEntityNoCollisionEntity(PlayerPedId(), npcPed, false) -- no collision with player
        SetEntityCanBeDamaged(npcPed, false) -- cant be damaged
        Wait(1000) -- wait for ped to spawn properly
        FreezeEntityPosition(npcPed, true) -- cant escape
        SetBlockingOfNonTemporaryEvents(npcPed, true) -- cant be scared

        npcHandles[npcName] = npcPed

        if Config.debug then
            print('NPC ' .. npcName .. ' spawned.')
        end
 
    end

end

-- remove npcs
function RemoveNPCs()
        
    for npcName, npcPed in pairs(npcHandles) do
        DeletePed(npcPed)
        if Config.debug then
            print('NPC ' .. npcName .. ' removed.')
        end
    end
    
end

-- check if resource is stopped and remove npcs
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        if Config.debug then
            print('Stopping script...')
            print('Removing NPCs...')
        end
        RemoveNPCs()
    end
end)

CreateNPCs()