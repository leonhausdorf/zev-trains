local train = 0

function SpawnTrain()

    local trainHash = 987516329
    local trainWagons = N_0x635423d55ca84fc8(trainHash)

    for wagonIndex = 0, trainWagons - 1 do
        local trainWagonModel = N_0x8df5f6a19f99f0d5(trainHash, wagonIndex)
        RequestModel(trainWagonModel)
    end

    train = N_0xc239dbd9a57d2a71(trainHash, 2673.5674, -1472.8947, 45.7606, 1, 1, 1, 1)
    SetTrainSpeed(train, 10.0)
    N_0x9f29999dfdf2aeb8(train, 29.0)
    N_0x4182c037aa1f0091(train, true)

    trackIndex = N_0x865fec2fa899f29c(train)
    junction = N_0x86afc343cf7f0b34(0, 2657.6414, -1477.0134, 45.8275)

    if Config.debug then
        print('Spawned train with hash ' .. trainHash)
        print('Current Track: ' .. trackIndex)
        print('Junction: ' .. junction)
    end

    Wait(500)
    N_0x9f29999dfdf2aeb8(train, 29.0)

    -- TaskWarpPedIntoVehicle(PlayerPedId(), train, -1)

    if Config.debug then
        print('Spawned train with hash ' .. trainHash)
    end
end

RegisterNetEvent('zev-trains:spawnTrain')
AddEventHandler('zev-trains:spawnTrain', function()
    if Config.debug then
        print('Called: spawnTrain')
    end

    SpawnTrain()
end)

RegisterCommand('deleteTrains', function()
    
    if Config.debug then
        DeleteAllTrains()
        print('Called: deleteTrains')
    end

end, false)

RegisterCommand('spawnTrain', function()
    
    if Config.debug then
        SpawnTrain()
        print('Called: spawnTrain')
    end

end, false)

RegisterCommand('trainSpeed', function(source, args)
    
    if Config.debug then
        SetTrainSpeed(train, tonumber(args[1]))
        print('Called: trainSpeed')
    end

end, false)

RegisterCommand('trainMaxSpeed', function(source, args)
    
    if Config.debug then
        N_0x9f29999dfdf2aeb8(train, tonumber(args[1]))
        print('Called: trainSpeed')
    end

end, false)

RegisterCommand('trainTrack', function()
    
    if Config.debug then
        trackIndex = N_0x865fec2fa899f29c(train)
        print('Current Track: ' .. trackIndex)
    end

end, false)