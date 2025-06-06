local Config = LoadResourceFile(GetCurrentResourceName(), 'config.lua')
assert(load(Config))()

local prevtime = GetGameTimer()
local prevframes = GetFrameCount()
local fps = -1
local playerCount = 0

RegisterNetEvent('affinity-rpc:PlayerCount')
AddEventHandler('affinity-rpc:PlayerCount', function(numberofplayers)
    playerCount = numberofplayers
end)

CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do
        Wait(500)
        prevframes = GetFrameCount()
        prevtime = GetGameTimer()
    end
    while true do
        curtime = GetGameTimer()
        curframes = GetFrameCount()

        if (curtime - prevtime) > 1000 then
            fps = (curframes - prevframes) - 1
            prevtime = curtime
            prevframes = curframes
        end
        Wait(350)
    end
end)

function SetRP()
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    SetDiscordAppId(Config.DiscordAppID)
    SetDiscordRichPresenceAsset(Config.LargeImage)
    SetDiscordRichPresenceAssetSmall(Config.SmallImage)
end

CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do
        Wait(500)
        prevframes = GetFrameCount()
        prevtime = GetGameTimer()
    end

    local lastUpdate = GetGameTimer()

    while true do
        Citizen.Wait(1)
        SetRP()
        SetDiscordRichPresenceAssetText('Affinity')

        local currentTime = GetGameTimer()
        if (currentTime - lastUpdate) > Config.StatusUpdateInterval then
            SetRichPresence(string.format("Players: %d | FPS: %d | Nick: %s | ID: %d", 
                playerCount, 
                fps, 
                GetPlayerName(PlayerId()), 
                GetPlayerServerId(PlayerId())
            ))

            SetDiscordRichPresenceAction(0, "Discord", Config.DiscordInvite)
            SetDiscordRichPresenceAction(1, "FiveM", Config.FiveMInvite)

            lastUpdate = currentTime
        end
    end
end)

CreateThread(function()
    while true do
        TriggerServerEvent('affinity-rpc:UpdatePlayerCount')
        Wait(Config.PlayerCountUpdateInterval)
    end
end)