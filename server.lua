if Config.EnableDiscordLogging then
    function discordLog (h,b)
        if string.len(tostring(h)) < 1 or string.len(tostring(b)) < 1 then print(Config.Resource .. "Invalid header or body for Discord Log"); return; end
        PerformHttpRequest(type, function(err, text, headers) end, 'POST', json.encode({username = h, content = "`"..b.."`"}), { ['Content-Type'] = 'application/json' })
    end

    RegisterServerEvent('am-chat:toDiscord')
    AddEventHandler('am-chat:toDiscord', function(header, body)
        discordLog(header,body)
    end)
end

function consoleLog (h, b)
    print("^1"..Config.Resource..": ("..h..") "..b)
end

RegisterServerEvent('am-chat:toConsole')
AddEventHandler('am-chat:toConsole', function(header, body)
    consoleLog(header,body)
end)

RegisterCommand('me', function(source, args, user)
    if source == 0 then return end
    local text = table.concat(args, " ")
    if string.len(text) == 0 then return end
    TriggerClientEvent("am-chat:me", -1, source, GetPlayerName(source), table.concat(args, " "))
    if not Config.EnableDiscordLogging then return end
    message = "`[ME] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args, " ").."`"
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
end,false)

RegisterCommand('do', function(source, args, user)
    if source == 0 then return end
    local text = table.concat(args, " ")
    if string.len(text) == 0 then return end
    TriggerClientEvent("am-chat:do", -1, source, GetPlayerName(source), table.concat(args, " "))
    if not Config.EnableDiscordLogging then return end
    message = "`[DO] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args, " ").."`"
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
end,false)

RegisterCommand('local', function(source, args, user)
    if source == 0 then return end
    local text = table.concat(args, " ")
    if string.len(text) == 0 then return end
    TriggerClientEvent("am-chat:local", -1, source, GetPlayerName(source), table.concat(args, " "))
    if not Config.EnableDiscordLogging then return end
    message = "`[LOCAL] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args, " ").."`"
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
end,false)

RegisterCommand('gme', function(source, args)
    if source == 0 then return end
    local text = table.concat(args, " ")
    if string.len(text) == 0 then return end
    TriggerClientEvent('chat:addMessage', -1, {
        color = nil,
        args = {"^2*", "^2"..GetPlayerName(source).." "..table.concat(args, " ")}
    })
    if not Config.EnableDiscordLogging then return end
    message = "`[GME] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args, " ").."`"
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
end)
RegisterCommand('gdo', function(source, args)
    if source == 0 then return end
    local text = table.concat(args, " ")
    if string.len(text) == 0 then return end
    TriggerClientEvent('chat:addMessage', -1, {
        color = nil,
        args = {"^3*", "^3"..GetPlayerName(source).." "..table.concat(args, " ")}
    })
    if not Config.EnableDiscordLogging then return end
    message = "`[GDO] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args, " ").."`"
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
end)
if Config.EnableStaffchat then
    RegisterCommand('sc', function(source, args)
        if source == 0 then return end
        local text = table.concat(args, " ")
        if string.len(text) == 0 then return end
        if not IsPlayerAceAllowed(source, Config.Staffchat_Ace_Permission) then
            TriggerClientEvent('chat:addMessage', source, {
                color = {255,0,0},
                args = {Config.Prefix, "You are not authorised for this command."}
            })
            return
        end
        staff_ids = {}
        for _, playerId in ipairs(GetPlayers()) do
            if IsPlayerAceAllowed(playerId, Config.Staffchat_Ace_Permission) then
                table.insert(staff_ids, playerId)
            end
        end
        for i=1, #staff_ids do
            TriggerClientEvent('chat:addMessage', staff_ids[i], {
                color = nil,
                args = {"", "^1[SC] ^7"..GetPlayerName(source).." [#"..source.."]: "..table.concat(args," ")}
            })
        end
        if not Config.EnableDiscordLogging then return end
        message = "`[STAFFCHAT] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args, " ").."`"
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
    end)
end
if Config.EnableReporting then
    RegisterCommand('report', function(source, args)
        if source == 0 then return end
        local text = table.concat(args, " ")
        if string.len(text) == 0 then return end
        staff_ids = {}
        for _, playerId in ipairs(GetPlayers()) do
            if IsPlayerAceAllowed(playerId, Config.Reports_Ace_Permission) then
                table.insert(staff_ids, playerId)
            end
        end
        for i=1, #staff_ids do
            TriggerClientEvent('chat:addMessage', staff_ids[i], {
                color = nil,
                args = {"", "^1[REPORT] ^7"..GetPlayerName(source).." [#"..source.."]: "..table.concat(args," ")}
            })
        end
        TriggerClientEvent('chat:addMessage', source, {
            color = {255,0,0},
            args = {Config.Prefix, "Your report has been sent to an Administrator."}
        })
        if not Config.EnableDiscordLogging then return end
        if Config.PingStaffRole then message = "<@&"..Config.StaffRoleID.."> `[REPORT] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args," ").."`" end
        if not Config.PingStaffRole then message = "`[REPORT] "..GetPlayerName(source).." (#"..source.."): "..table.concat(args," ").."`" end
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
    end)
end


AddEventHandler('chatMessage', function(source, author, text)
    if source == 0 then return; end
    if string.sub(text, 1, string.len("/")) ~= "/" and string.len(text) ~= 0 then
        TriggerClientEvent('chat:addMessage', -1, {
            color = {97, 99, 95},
            args = {"[OOC]", "^7"..GetPlayerName(source).." [#"..source.."]: "..text}
        })
        if not Config.EnableDiscordLogging then return end
        message = "`[OOC] "..GetPlayerName(source).." (#"..source.."): "..text.."`"
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
    end
    if string.sub(text, 1, string.len("/")) == "/" and string.sub(text,1,3) ~= "/sc" and string.sub(text,1,7) ~= "/report" then
        if not Config.EnableDiscordLogging then return end
        message = "`[CMD] "..GetPlayerName(source).." (#"..source.."): "..text.."`"
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
    end
end)

if Config.EnableJoinLeaveMessages then
    AddEventHandler('playerJoining', function()
        consoleLog("Join", GetPlayerName(source).." has joined the server.")
        TriggerClientEvent('chatMessage', -1, "", {255,0,0}, "^5^*"..GetPlayerName(source).." has joined the server.")
        if not Config.EnableDiscordLogging then return end
        message = "`[JOIN] "..GetPlayerName(source).." (#"..source..") is joining the server`"
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
    end)

    AddEventHandler('playerDropped', function(reason) 
        consoleLog("Leave", GetPlayerName(source).." has left the server.")
        TriggerClientEvent('chatMessage', -1, "", {255,0,0}, "^5^*"..GetPlayerName(source).." has left the server ("..reason..")")
        if not Config.EnableDiscordLogging then return end
        message = "`[LEAVE] "..GetPlayerName(source).." (#"..source..") left the server ("..reason..")`"
        PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
    end)
end

RegisterCommand('coords', function(source)
    if source == 0 then return end
    local coords = GetEntityCoords(GetPlayerPed(source))
    local heading = GetEntityHeading(GetPlayerPed(source))
    TriggerClientEvent('chat:addMessage', source, {
      color = nil,
      args = {"", "^5[COORDS] ^7X: " .. string.format("%.2f",coords.x) .. " Y: " .. string.format("%.2f",coords.y) .. " Z: " .. string.format("%.2f",coords.z) .. " H: " .. string.format("%.2f", heading)}
    })
    if not Config.EnableDiscordLogging then return end
    message = "`[CMD] "..GetPlayerName(source).." (#"..source..") requested their Coordinates (X: " .. string.format("%.2f",coords.x) .. " Y: " .. string.format("%.2f",coords.y) .. " Z: " .. string.format("%.2f",coords.z).. " H: "..string.format("%.2f",heading)..")`"
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = Config.Resource, content = message}), { ['Content-Type'] = 'application/json' })
  end)
  