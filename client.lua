Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/me', 'Characters', {
        {name="local action",help="Send a local character action message"}
    })
    TriggerEvent('chat:addSuggestion', '/gme', 'Characters', {
        {name="global action",help="Send a global character action message"}
    })
    TriggerEvent('chat:addSuggestion', '/do', 'Characters', {
        {name="local action",help="Send a local roleplay action message"}
    })
    TriggerEvent('chat:addSuggestion', '/gdo', 'Characters', {
        {name="global action",help="Send a local roleplay action message"}
    })
    TriggerEvent('chat:addSuggestion', '/local', 'Characters', {
        {name="message",help="Send a local OOC message"}
    })
    TriggerEvent('chat:addSuggestion', '/sc', 'Administration', {
        {name="message",help="Send a message in Staff Chat"}
    })
    TriggerEvent('chat:addSuggestion', '/report', 'Administration', {
        {name="report",help="Sends your report to an Administrator"}
    })
    TriggerEvent('chat:addSuggestion', '/coords', 'Shows your current coordinates.')
end)

RegisterNetEvent('am-chat:me')
AddEventHandler('am-chat:me', function(id, name, message)
    local current = PlayerId()
    local player = GetPlayerFromServerId(id)
    if current == player then
        TriggerEvent('chatMessage', "", {255,0,0}, "^2"..name.." (#"..id.."): ".." "..message)
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(current)), GetEntityCoords(GetPlayerPed(player)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255,0,0}, "^2"..name.." (#"..id.."): ".." "..message)
    end
end)

RegisterNetEvent('am-chat:do')
AddEventHandler('am-chat:do', function(id, name, message)
    local current = PlayerId()
    local player = GetPlayerFromServerId(id)
    if current == player then
        TriggerEvent('chatMessage', "", {255,0,0}, "^3"..name.." (#"..id.."): ".." "..message)
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(current)), GetEntityCoords(GetPlayerPed(player)), true) < 19.999 then
		TriggerEvent('chatMessage', "", {255,0,0}, "^3"..name.." (#"..id.."): ".." "..message)
    end
end)

RegisterNetEvent('am-chat:local')
AddEventHandler('am-chat:local', function(id, name, message)
    local current = PlayerId()
    local player = GetPlayerFromServerId(id)
    if current == player then
        TriggerEvent('chatMessage', "[LOCAL]", {97, 99, 95}, "^7"..name.." (#"..id.."): "..message)
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(current)), GetEntityCoords(GetPlayerPed(player)), true) < 19.999 then
        TriggerEvent('chatMessage', "[LOCAL]", {97, 99, 95}, "^7"..name.." (#"..id.."): "..message)
    end
end)