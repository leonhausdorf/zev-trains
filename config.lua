Config = { }

-- set this to true to see debug messages in the console
Config.debug = true

Config.keys = {
    G = 0x760A9C6F, -- G 
}

-- set the locations and models of the NPCs
Config.npcs = {

    SaintDenis = {
        coords = vector3(2734.7053, -1437.6079, 46.1670),
        heading = 209.3450,
        model = 'S_M_M_TrainStationWorker_01'
    },

    Blackwater = {
        coords = vector3(-772.0, -1328.0, 43.0),
        heading = 0.0,
        model = 'S_M_M_TrainStationWorker_01'
    },

}

-- set the trains that can be spawned
-- WARNING: only change the hashes if you know what you are doing!
Config.trains = {
    -1464742217,
    -577630801,
    -1901305252,
    -1719006020,
    519580241,
    1495948496,
    1365127661,
    -1083616881,
    1030903581,
    -2006657222,
    1285344034,
    -156591884,
    987516329,
    -1740474560,
    -651487570,
    -593637311,
    1094934838,
    1054492269,
    1216031719,
}