Config = {}

Config.Resource = "CHAT";
Config.Prefix = "System";

Config.EnableDiscordLogging = true; --[[ true / false ]]
Config.EnableStaffchat = true; --[[ true / false ]]
Config.EnableReporting = true; --[[ true / false ]]
Config.EnableJoinLeaveMessages = true; --[[ true / false ]]

if Config.EnableDiscordLogging then

    Config.DiscordWebhook = "";

end
if Config.EnableStaffchat then

    --[[ This is for who CAN see Staffchat ]]
    Config.Staffchat_Ace_Permission = "am-chat.STAFFCHAT"; --[[ You need to add this permission into whatever ace group system you're using, or directly via the server.cfg ]]

end
if Config.EnableReporting then

    --[[ This is for who CAN see Reports ]]
    Config.Reports_Ace_Permission = "am-chat.REPORTS"; --[[ You need to add this permission into whatever ace group system you're using, or directly via the server.cfg ]]
    Config.PingStaffRole = false; --[[ If you want @Administrator (or whatever) to be pinged on discord with the report, put true here]]

end

if Config.EnableReporting and Config.PingStaffRole then

    Config.StaffRoleID = ""; --[[ the role id for above ]]
     
end