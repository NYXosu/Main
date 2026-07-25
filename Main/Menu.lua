local ID = game.PlaceId

local URLs = {
    [6403373529] = "https://raw.githubusercontent.com/NYXosu/Main/main/Main/2380077519/SlapBattlesR3O.lua",
    [9426795465] = "https://raw.githubusercontent.com/NYXosu/Main/main/Main/2380077519/MatchMakingR3O.lua",
    [9015014224] = "https://raw.githubusercontent.com/NYXosu/Main/main/Main/2380077519/SlapRoyaleR3O.lua"
}

local URL = URLs[ID]

if URL then
    loadstring(game:HttpGet(URL))()
    
else
    warn("Game Not Supported")
end
