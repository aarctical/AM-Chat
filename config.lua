Config = {

    Resource = "AM-Chat",
    Prefix = "System",

    EnableDiscordLogging = true,
    EnableStaffchat = true,
    EnableReporting = true,
}

if Config.EnableDiscordLogging then

    Config.DiscordWebhook = "https://discord.com/api/webhooks/paste-here"

end
if Config.EnableStaffchat then

    Config.Staffchat_Ace_Permission = "am-chat.STAFFCHAT" --[[ You need to add this permission into whatever ace group system you're using, or directly via the server.cfg ]]

end
if Config.EnableReporting then

    Config.Reports_Ace_Permission = "am-chat.REPORTS" --[[ You need to add this permission into whatever ace group system you're using, or directly via the server.cfg ]]
    Config.PingStaffRole = true, --[[ If you want @Administrator (or whatever) to be pinged on discord with the report, put true here]]

    if Config.PingStaffRole then

        Config.StaffRoleID = "000000000000" --[[ the role id for above ]]
        
    end
end