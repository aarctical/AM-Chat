![chat banner](https://i.imgur.com/UBOoup0.png)


This chat resource is a standalone project I worked on a while ago, it incorporates all different 'RP' commands with some overlaps into the core chat resource, allowing the resource complete control over the chat. Easily integratable with the [Standalone Character System](https://www.lcpdfr.com/downloads/gta5mods/scripts/47522-standalone-simple-fivem-character-creation/) and the [Standalone Social Media Resource](https://www.lcpdfr.com/downloads/gta5mods/scripts/47537-standalone-simple-fivem-lifeinvader-script/) that I made.
 
[![AGPL License](https://img.shields.io/badge/license-GNU-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)


## Authors

- [aarctical](https://www.github.com/aarctical) ([Discord](https://discord.com/users/423187100264038400))



## LUA MenuAPI Credits

 - CFX forum posts for player referencing functionality ([Between entity coords](https://forum.cfx.re/t/proximity-based-me-script/148167/2))


## Configuration

| Variable             | Outline                                                                |
| ----------------- | ------------------------------------------------------------------ |
| Resource       | For the Discord headers, console and anything NOT to the client   |
| Prefix | How the Resource will appear to the client in chat, such as 'SYSTEM' |
| EnableDiscordLogging | Discord logging settings (http post request) |
| EnableStaffChat | Staff chat + its setting |
| EnableReporting | Reporting System + its settings |


## FAQ

#### Is this Standalone?

Yes, this is a Standalone script that does not have any external dependencies (After replacing core sv_chat.lua).

#### Can I contribute to the project?

Yes, if you would like to contribute onto the project, you can do so by forking the project on GitHub, or by contacting me for assistance.

#### Can I make some changes and sell this script?

No, in pursuance with the AGPL License, you may edit and redistribute for free (by means of GitHub) but you do not have the permission to sell this resource in any capacity.

#### How do I set this up?

- (1) - Extract the resource
- (2) - Drag & Drop the 'AM-Chat' folder into your resources folder
- (3) - Copy the 'sv_chat.lua' file from /dependency and replace it into \[gameplay]/chat/sv_chat.lua
- (4) - Write 'ensure AM-Chat' in your server.cfg file

#### I have an issue, it isn't working?

If you have followed the Documentation for installation, or have found a bug/exploit you can submit an issue on the repository, or you can contact me for support, my discord support server is [here](https://discord.gg/RsRr2J8wws).

