local appid = '' 
local image1 = ''
local image2 = ''
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
    SetDiscordAppId(appid)
    SetDiscordRichPresenceAsset(image1)
    SetDiscordRichPresenceAssetSmall(image2)
end

CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) or not NetworkIsSessionStarted() do
        Wait(500)
        prevframes = GetFrameCount()
        prevtime = GetGameTimer()
    end

    local updateInterval = 45000  
    local lastUpdate = GetGameTimer()

    while true do
        Citizen.Wait(1)
        SetRP()
        SetDiscordRichPresenceAssetText('Affinity')

        local currentTime = GetGameTimer()
        if (currentTime - lastUpdate) > updateInterval then
            SetRichPresence("Players: " .. playerCount .. " | FPS: " .. fps .. " | Nick: " .. GetPlayerName(PlayerId()) .. " | ID: " .. GetPlayerServerId(PlayerId()) .. "")

            SetDiscordRichPresenceAction(0, "Discord", 'https://discord.gg/affinitydev')
            SetDiscordRichPresenceAction(1, "FiveM", 'https://discord.gg/affinitydev')

            lastUpdate = currentTime
        end
    end
end)

CreateThread(function()
    while true do
        TriggerServerEvent('affinity-rpc:UpdatePlayerCount')
        Wait(5000)
    end
end)