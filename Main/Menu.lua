local ID = game.PlaceId

local URLs = {
    [6403373529] = "https://raw.githubusercontent.com/NYXosu/Main/main/Main/2380077519/SlapBattlesR3O.lua",
    [9426795465] = "https://raw.githubusercontent.com/NYXosu/Main/main/Main/2380077519/MatchMakingR3O.lua",
    [9015014224] = "https://raw.githubusercontent.com/NYXosu/Main/main/Main/2380077519/SlapRoyaleR3O.lua"
}

local URL = URLs[ID]

if not URL then
    warn("Game Not Supported")
    return
end

local ok, err = pcall(function()
    loadstring(game:HttpGet(URL))()
end)

if not ok then
    warn("Failed to load game script:", err)
end

pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NYXosu/Main/refs/heads/main/Main/IY_LOADER"))()
end)
