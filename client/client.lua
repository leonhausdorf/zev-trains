local prompts = GetRandomIntInRange(0, 0xffffff)
local openTrainMenu = 0

Citizen.CreateThread(function() 
    Citizen.Wait(2500)

    local str = 'Zugverwalter'
    openTrainMenu = PromptRegisterBegin()
    PromptSetControlAction(openTrainMenu, Config.keys['G'])
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(openTrainMenu, str)
    PromptSetEnabled(openTrainMenu, 1)
    PromptSetVisible(openTrainMenu, 1)
    PromptSetStandardMode(openTrainMenu, 1)
    PromptSetHoldMode(openTrainMenu, 1)
    PromptSetGroup(openTrainMenu, prompts)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C, openTrainMenu, true)
    PromptRegisterEnd(openTrainMenu)

    if Config.debug then
        print('Prompt registered: ' .. openTrainMenu)
    end
end)

Citizen.CreateThread(function()
    while true do

        for npcName, npcData in pairs(Config.npcs) do
            local npcCoords = npcData.coords
            local playerCoords = GetEntityCoords(PlayerPedId())

            if Vdist(playerCoords, npcCoords) <= 3.0 then

                label = CreateVarString(10, 'LITERAL_STRING', 'Öffne Zugmenü')
                PromptSetActiveGroupThisFrame(prompts, label)


                if Citizen.InvokeNative(0xC92AC953F0A982AE, openTrainMenu) then
                    TriggerEvent('zev-trains:spawnTrain')

                    if Config.debug then
                        print('Interacted with NPC ' .. npcName)
                    end

                    Wait(500)
                end


            end
        end

        Citizen.Wait(1)
    end
end)

AddEventHandler("onResourceStop",
    function(resourceName)
    if resourceName == GetCurrentResourceName() then
        PromptDelete(prompts)
    end
end)