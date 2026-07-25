local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local slapbattles = 6403373529
local slapbattles2 = 124596094333302
local slapbattles3 = 9015014224
local slapbattlesks = 11520107397
local slaproyale = 9431156611
local slaproyalewaiting = 9426795465
local evilbarzil = 80420091630966
local eternalbob = 13833961666
local egglerserver = 129665246576996
local nullzone = 14422118326
local barzil = 7234087065
local suction = 89837553336708
local sfoth = 117232463555132
local bindmaze = 74169485398268
local icetrials = 17290438723
local hexagon = 98726100529621
local shattered = 75803343514634
local slender = 132277598079047
local toh = 115782629143468
local elude = 11828384869
local plate = 106620300132058

local currentPlaceId = game.PlaceId

local function notify(title, text, duration)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = duration or 3
		})
	end)
end

if currentPlaceId == slapbattles or currentPlaceId == slapbattles2 or currentPlaceId == slapbattles3 then

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Juansito385's GUI",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
	ToggledSideBar = true
})

local maintab = win:Tab("Main")
local antitab = win:Tab("Protection")
local exptab = win:Tab("Exploits")
local farmtab = win:Tab("Farms")
local teletab = win:Tab("Map")
local funtab = win:Tab("Fun")
local modetab = win:Tab("Modes")
local misctab = win:Tab("Others")
local helptab = win:Tab("Info")

maintab:Label("Script Made By juansito385 and XaP237!")
exptab:Label("Useful / Game-Breaking Scripts.")
misctab:Label("Other Features.")
antitab:Label("Protection Settings May Be Blatant.")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

misctab:Textbox("Teleport to Glove", function(input)
	local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local function bestMatch(query)
		query = query:lower()
		local best, score = nil, math.huge
		for _, g in pairs(workspace.Lobby:GetChildren()) do
			local name = g.Name:lower()
			local dist = #name:gsub(query, "") + math.abs(#name - #query)
			if name:find(query) and dist < score then
				best, score = g, dist
			end
		end
		return best
	end

	local glove = bestMatch(input)
	if glove then
		local pos = glove.Position
		hrp.CFrame = CFrame.new(pos + glove.CFrame.LookVector * 4 + Vector3.new(0, 3, 0), pos)
	end
end)

misctab:Button("Infinite Yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

misctab:Button("Nameless Admin", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

misctab:Button("Rejoin Server", function()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local jobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
    print("Rejoining current server...")
    print("PlaceId:", placeId)
    print("JobId:", jobId)
    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
else
    print("Failed to get current server info or player.")
end
end)

misctab:Button("Switch Servers", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local currentJobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

local function findDifferentServer()
    local cursor = nil

    while true do
        local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", placeId)
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = {
                    ["User-Agent"] = "Mozilla/5.0"
                }
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            task.wait(2)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Waiting...")
            task.wait(3)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode. Retrying...")
            task.wait(2)
            continue
        end

        for _, server in pairs(data.data) do
            if server.id ~= currentJobId and server.playing < server.maxPlayers then
                print("Found different server:", server.id)
                return server.id
            end
        end

        cursor = data.nextPageCursor
        task.wait(1)

        if not cursor then break end
    end

    return nil
end

local newJobId = findDifferentServer()
if newJobId and player then
    print("Teleporting to different server...")
    TeleportService:TeleportToPlaceInstance(placeId, newJobId, player)
else
    print("No different server found or player missing.")
end
end)

misctab:Button("Join Small Server (Rate Limits Apply.)", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

_G.extracted1 = game.PlaceId
_G.extracted2 = nil

local userAgents = {
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
    "Mozilla/5.0 (X11; Linux x86_64)",
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
    "Mozilla/5.0 (Android 11; Mobile; rv:89.0)",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)",
    "Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/114.0.0.0 Safari/537.36"
}

local function fetchSmartServer()
    local cursor = nil
    local smallestServer = nil
    local minPlayers = math.huge
    local retryCount = 0

    while true do
        local baseUrl = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", _G.extracted1)
        local url = baseUrl
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local headers = {
            ["User-Agent"] = userAgents[math.random(1, #userAgents)],
            ["X-Requested-With"] = "XMLHttpRequest"
        }

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = headers
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 4) + retryCount)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Backing off...")
            retryCount += 1
            task.wait(math.random(3, 6) + retryCount)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode server data. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 5) + retryCount)
            continue
        end

        retryCount = 0

        for _, server in pairs(data.data) do
            print("Checking server:", server.id, "Players:", server.playing, "/", server.maxPlayers)

            if server.playing >= 1 and server.playing <= 2 and server.playing < server.maxPlayers then
                print("Found ideal server with 1–2 players. Joining now.")
                return server
            end

            if server.playing < minPlayers and server.playing < server.maxPlayers then
                minPlayers = server.playing
                smallestServer = server
            end
        end

        cursor = data.nextPageCursor
        task.wait(math.random(1, 2))

        if not cursor then break end
    end

    return smallestServer
end

local server = fetchSmartServer()
if server then
    _G.extracted2 = server.id
    print("Extracted PlaceId:", _G.extracted1)
    print("Extracted JobId:", _G.extracted2)

    local player = Players.LocalPlayer or Players:GetPlayers()[1]

    if typeof(_G.extracted1) == "number" and typeof(_G.extracted2) == "string" and player then
        print("Teleporting to server...")
        TeleportService:TeleportToPlaceInstance(_G.extracted1, _G.extracted2, player)
    else
        print("Invalid data or player not found.")
    end
else
    print("No suitable server found.")
end
end)

misctab:Button("Destroy GUI", function()
    win:Exit()
end)


misctab:Button("Leave Game", function()
    game:Shutdown()
end)

modetab:Label("These Places Can Be Joined Instantly!")

local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer

local function teleportTo(placeId)
    TeleportService:Teleport(placeId, LocalPlayer)
end

modetab:Button("Main Game", function()
    teleportTo(6403373529)
end)

modetab:Button("Killstreak Only", function()
    teleportTo(11520107397)
end)

modetab:Button("No One Shot Gloves", function()
    teleportTo(9015014224)
end)

modetab:Button("Slap Royale Matchmaking", function()
    teleportTo(9426795465)
end)

modetab:Button("Normal Barzil", function()
    teleportTo(7234087065)
end)

modetab:Button("Slap League (Functional, Needs Another Player.)", function()
    teleportTo(18698003301)
end)

modetab:Button("Tower Of Hell (TOH)", function()
    teleportTo(115782629143468)
end)

modetab:Button("Binded Maze", function()
    teleportTo(74169485398268)
end)

modetab:Button("Ice Trials", function()
    teleportTo(17290438723)
end)

modetab:Button("Suction Cup Trials", function()
game:GetService("ReplicatedStorage").Events.suction_obby_tp:FireServer()
end)

modetab:Button("Sword Fight On The Heights", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(316, 40, 197))
wait(0.5)
local args = {[1] = "Ban Hammer"}
game:GetService("ReplicatedStorage"):WaitForChild("RetroAbility"):FireServer(unpack(args))
wait(0.25)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(308, 45, 189))
end)

modetab:Button("Custom Glove Customizer", function()
    teleportTo(9068206286)
end)

modetab:Button("Soft Update Waiting Place", function()
    teleportTo(12712288037)
end)

modetab:Button("?", function()
    teleportTo(12845859004)
end)

modetab:Label("Warning: The Below Places Can't Be Joined Directly.")

modetab:Button("Testing Place", function()
    teleportTo(9020359053)
end)

modetab:Button("Tower Defense", function()
    teleportTo(15228348051)
end)

modetab:Button("Christmas Eve", function()
    teleportTo(15507333474)
end)

modetab:Button("Null Zone", function()
    teleportTo(14422118326)
end)

modetab:Button("Staff Application", function()
    teleportTo(16034567693)
end)

getgenv().lastSliderSet = nil
getgenv().humanoidConnection = nil

getgenv().applySpeed = function()
	if not getgenv().lastSliderSet then return end

	if (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid") then
		if (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").WalkSpeed ~= getgenv().lastSliderSet then
			(game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").WalkSpeed = getgenv().lastSliderSet
		end

		if getgenv().humanoidConnection then
			getgenv().humanoidConnection:Disconnect()
		end

		getgenv().humanoidConnection = (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):Connect(function()
			if (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").WalkSpeed ~= getgenv().lastSliderSet then
				(game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").WalkSpeed = getgenv().lastSliderSet
			end
		end)
	end
end

maintab:Slider("Player Speed", 19.5, 1, 125, 0.5, function(v)
	getgenv().lastSliderSet = (v == 8) and 16 or v
	getgenv().applySpeed()
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(c)
	c:WaitForChild("Humanoid"):GetPropertyChangedSignal("Parent"):Connect(function()
		getgenv().applySpeed()
	end)

	getgenv().applySpeed()
end)

maintab:Toggle("Infinite Jump", function()
	getgenv().infiniteJumpEnabled = not getgenv().infiniteJumpEnabled

	local lp = game:GetService("Players").LocalPlayer
	local uis = game:GetService("UserInputService")

	local hum, root, animTrack

	local function bindCharacter(char)
		hum = char:WaitForChild("Humanoid")
		root = char:WaitForChild("HumanoidRootPart")

		local animate = char:FindFirstChild("Animate")
		if animate and animate:FindFirstChild("jump") and animate.jump:FindFirstChild("JumpAnim") then
			local animId = animate.jump.JumpAnim.AnimationId
			local anim = Instance.new("Animation")
			anim.AnimationId = animId
			animTrack = hum:LoadAnimation(anim)
		end
	end

	bindCharacter(lp.Character or lp.CharacterAdded:Wait())
	lp.CharacterAdded:Connect(bindCharacter)

	if not getgenv()._infiniteJumpBound then
		getgenv()._infiniteJumpBound = true
		uis.InputBegan:Connect(function(input, gp)
			if gp or input.KeyCode ~= Enum.KeyCode.Space then return end
			if not getgenv().infiniteJumpEnabled or not root then return end

			if animTrack then
				animTrack:Stop()
				animTrack:Play()
			end

			root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 50, root.AssemblyLinearVelocity.Z)
		end)
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Infinite Jump",
		Text = getgenv().infiniteJumpEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

funtab:Label("Universal Features.")

getgenv().SpamPropEffectEnabled = false

funtab:Button("Spam Prop Effect", function()
	getgenv().SpamPropEffectEnabled = not getgenv().SpamPropEffectEnabled

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Prop Effect";
		Text = getgenv().SpamPropEffectEnabled and "Enabled." or "Disabled.";
		Duration = 3;
	})

	if getgenv().SpamPropEffectEnabled then
		task.spawn(function()
			while getgenv().SpamPropEffectEnabled do
				game:GetService("ReplicatedStorage").Prop:FireServer(math.huge)
				task.wait(0.05)
			end
		end)
	end
end)

getgenv().SpamErrorSoundEnabled = false

funtab:Button("Spam Error Sound", function()
	getgenv().SpamErrorSoundEnabled = not getgenv().SpamErrorSoundEnabled

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Error Spam";
		Text = getgenv().SpamErrorSoundEnabled and "Enabled." or "Disabled.";
		Duration = 3;
	})

	if getgenv().SpamErrorSoundEnabled then
		task.spawn(function()
			while getgenv().SpamErrorSoundEnabled do
				game:GetService("ReplicatedStorage").ErrorDeath:FireServer()
				task.wait(0.5)
			end
		end)
	end
end)

funtab:Label("Custom Gloves.")

funtab:Button("FE Killerfish (Req. Diamond, R To Use Ability.)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/fe%20killerfish%20(slap%20battles)",true))()
end)

funtab:Button("FE Frost God (Req. Frostbite, R + Y + F To Use Abilities.)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/fe%20frost%20god%20(slap%20battles)",true))()
end)

funtab:Label("These Glove May Cause Lag, Rejoin If It Becomes Laggy.")

funtab:Button("Death Glove (Req. Reaper, Use In Arena.)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/fe%20death%20(slap%20battles)",true))()
end)

funtab:Button("Killstreak V2 (Req. Killstreak, Use In Arena.)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/upgraded%20killstreak%20(slap%20battles)",true))()
end)

funtab:Label("Glove-Specific GUIs.")

funtab:Button("Avatar GUI", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/avatar%20gui",true))()
end)

funtab:Button("Alchemist GUI", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/alchemist%20gui",true))()
end)

funtab:Label("Other Fun Features.")

funtab:Button("Semi-Invisible Run Portal (Req. Run)", function()
	game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(
		Vector3.new(
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position.X,
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position.Y - 7,
			game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position.Z
		)
	)
end)

getgenv().spamAbility = false

spawn(function()
    while task.wait(0.05) do
        if getgenv().spamAbility then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
            end)
        end
    end
end)

funtab:Button("Spam Fan (Req. Fan)", function()
    getgenv().spamAbility = not getgenv().spamAbility

    local status = getgenv().spamAbility and "Enabled." or "Disabled."
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Spam Fan",
        Text = status,
        Duration = 3
    })
end)

getgenv().spamQuake = false

spawn(function()
    local quake = game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake")
    while task.wait() do
        if getgenv().spamQuake then
            pcall(function()
                quake:FireServer({ start = true })
                quake:FireServer({ finished = true })
            end)
        end
    end
end)

getgenv().frostbiteSpamEnabled = false

spawn(function()
    while task.wait(0.05) do
        if getgenv().frostbiteSpamEnabled then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(0.3)
            end)
        end
    end
end)

funtab:Button("Spam Frostbite", function()
    getgenv().frostbiteSpamEnabled = not getgenv().frostbiteSpamEnabled

    local status = getgenv().frostbiteSpamEnabled and "Enabled." or "Disabled."
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Spam Frostbite",
        Text = status,
        Duration = 3
    })
end)

funtab:Button("Spam Quake (Req. Quake)", function()
    getgenv().spamQuake = not getgenv().spamQuake
    local status = getgenv().spamQuake and "Enabled." or "Disabled."
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Spam Quake",
        Text = status,
        Duration = 3
    })
end)

funtab:Textbox("Set Pillows (Req. Pillow)", function(v)
for _=1,v do pcall(function() game.ReplicatedStorage.Events.PillowEvent:FireServer("AddPillow") end) end
end)

getgenv().slapaura_enabled = false
getgenv().slapaura_cachedRemotes = {}
getgenv().slapaura_lastFireTime = 0
getgenv().slapaura_connection = nil
getgenv().lastKnownGloveName = ""

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

local function trackGlove()
	local function update(char)
		char.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then
				getgenv().lastKnownGloveName = child.Name
			end
		end)
		for _, tool in ipairs(char:GetChildren()) do
			if tool:IsA("Tool") then
				getgenv().lastKnownGloveName = tool.Name
			end
		end
	end

	if LocalPlayer.Character then
		update(LocalPlayer.Character)
	end
	LocalPlayer.CharacterAdded:Connect(update)
end

trackGlove()

getgenv().getClosestPlayer = function()
	local myRoot = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
	if not myRoot then return end

	local closest, dist = nil, math.huge
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (p.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
			if mag < dist then
				dist = mag
				closest = p
			end
		end
	end
	return closest
end

getgenv().findRelevantHitRemotes = function(gloveName)
	if getgenv().slapaura_cachedRemotes[gloveName] then
		return getgenv().slapaura_cachedRemotes[gloveName]
	end

	local hits = {}
	local n = string.lower(gloveName or "")

	local specialCases = {
		killstreak = { "KSHit" },
		zahando = { "zhramt" },
		trap = { "traphi" }
	}

	if specialCases[n] then
		for _, remoteName in ipairs(specialCases[n]) do
			local remote = ReplicatedStorage:FindFirstChild(remoteName)
			if remote and remote:IsA("RemoteEvent") then
				table.insert(hits, remote)
			end
		end
	end

	if #hits == 0 then
		for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
			if obj:IsA("RemoteEvent") then
				local r = string.lower(obj.Name)
				if r == n .. "hi" or (r:find(n) and r:find("hit")) then
					table.insert(hits, obj)
				end
			end
		end
	end

	if #hits == 0 then
		for _, fallback in ipairs({ "GeneralHit", "b", "KSHit" }) do
			local f = ReplicatedStorage:FindFirstChild(fallback)
			if f and f:IsA("RemoteEvent") then
				table.insert(hits, f)
			end
		end
	end

	getgenv().slapaura_cachedRemotes[gloveName] = hits
	return hits
end

maintab:Toggle("Slap Aura", function()
	getgenv().slapaura_enabled = not getgenv().slapaura_enabled

	if getgenv().slapaura_enabled and not getgenv().slapaura_connection then
		getgenv().slapaura_connection = RunService.Heartbeat:Connect(function()
			local now = os.clock()
			if now - getgenv().slapaura_lastFireTime < 0.5 then return end

			local gloveName = getgenv().lastKnownGloveName
			if not gloveName or gloveName == "" then return end

			local target = getgenv().getClosestPlayer()
			if not (target and target.Character) then return end

			local torso = target.Character:FindFirstChild("Torso") or target.Character:FindFirstChild("UpperTorso") or target.Character:FindFirstChild("HumanoidRootPart")
			if not torso then return end

			local remotes = getgenv().findRelevantHitRemotes(gloveName)
			for _, remote in ipairs(remotes) do
				pcall(function()
					remote:FireServer(target.Character:FindFirstChild(torso.Name))
				end)
			end

			getgenv().slapaura_lastFireTime = now
		end)
	elseif not getgenv().slapaura_enabled and getgenv().slapaura_connection then
		getgenv().slapaura_connection:Disconnect()
		getgenv().slapaura_connection = nil
	end

	StarterGui:SetCore("SendNotification", {
		Title = "Slap Aura",
		Text = getgenv().slapaura_enabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

getgenv().legitslapaura = {
	enabled = false,
	connection = nil,
	cachedRemotes = {},
	animationId = "rbxassetid://13526154547",
	slapCount = 0,
	slapWindowStart = 0,
	cooldownActive = false,
	maxSlapsPerWindow = 5,
	windowDuration = 3,
	cooldownTime = 0.7,
	maxDistance = 13,
	yBlockMin = 314,
	yBlockMax = 350
}

local function findLegitRemotes(gloveName)
	if getgenv().legitslapaura.cachedRemotes[gloveName] then
		return getgenv().legitslapaura.cachedRemotes[gloveName]
	end

	local hits = {}
	local rs = game:GetService("ReplicatedStorage")
	local n = string.lower(gloveName or "")

	local specialCases = {
		killstreak = { "KSHit" },
		zahando = { "zhramt" },
		trap = { "traphi" }
	}

	if specialCases[n] then
		for _, remoteName in ipairs(specialCases[n]) do
			local remote = rs:FindFirstChild(remoteName)
			if remote and remote:IsA("RemoteEvent") then
				table.insert(hits, remote)
			end
		end
	end

	if #hits == 0 then
		for _, obj in ipairs(rs:GetDescendants()) do
			if obj:IsA("RemoteEvent") then
				local r = string.lower(obj.Name)
				if r == n .. "hi" or (r:find(n) and r:find("hit")) then
					table.insert(hits, obj)
				end
			end
		end
	end

	if #hits == 0 then
		for _, fallback in ipairs({ "GeneralHit", "b", "KSHit" }) do
			local f = rs:FindFirstChild(fallback)
			if f and f:IsA("RemoteEvent") then
				table.insert(hits, f)
			end
		end
	end

	getgenv().legitslapaura.cachedRemotes[gloveName] = hits
	return hits
end

maintab:Toggle("Slap Aura (Legit)", function()
	getgenv().legitslapaura.enabled = not getgenv().legitslapaura.enabled

	if getgenv().legitslapaura.enabled and not getgenv().legitslapaura.connection then
		getgenv().legitslapaura.connection = game:GetService("RunService").Heartbeat:Connect(function()
			local now = os.clock()
			if now - getgenv().legitslapaura.slapWindowStart > getgenv().legitslapaura.windowDuration then
				getgenv().legitslapaura.slapWindowStart = now
				getgenv().legitslapaura.slapCount = 0
			end
			if getgenv().legitslapaura.slapCount >= getgenv().legitslapaura.maxSlapsPerWindow or getgenv().legitslapaura.cooldownActive then return end

			local char = game:GetService("Players").LocalPlayer.Character
			local glove = char and char:FindFirstChildOfClass("Tool")
			if not glove then return end

			local myRoot = char:FindFirstChild("HumanoidRootPart")
			if not myRoot then return end

			local closest, dist = nil, math.huge
			for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
				if p ~= game:GetService("Players").LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
					local mag = (p.Character.HumanoidRootPart.Position - myRoot.Position).Magnitude
					if mag < dist then
						dist = mag
						closest = p
					end
				end
			end
			if not (closest and closest.Character) then return end

			local torso = closest.Character:FindFirstChild("Torso") or closest.Character:FindFirstChild("UpperTorso") or closest.Character:FindFirstChild("HumanoidRootPart")
			if not torso then return end

			if dist > getgenv().legitslapaura.maxDistance then return end
			local y = myRoot.Position.Y
			if y >= getgenv().legitslapaura.yBlockMin and y <= getgenv().legitslapaura.yBlockMax then return end

			getgenv().legitslapaura.cooldownActive = true
			task.delay(getgenv().legitslapaura.cooldownTime, function()
				getgenv().legitslapaura.cooldownActive = false
			end)

			local remotes = findLegitRemotes(glove.Name)

			myRoot.CFrame = CFrame.new(myRoot.Position) * CFrame.Angles(0, math.atan2(-(torso.Position - myRoot.Position).Unit.Z, (torso.Position - myRoot.Position).Unit.X), 0)
			task.wait(0.05)
			myRoot.CFrame = CFrame.new(myRoot.Position)

			for _, r in ipairs(remotes) do
				r:FireServer(torso)
			end

			local h = char:FindFirstChildOfClass("Humanoid")
			if h and (y < getgenv().legitslapaura.yBlockMin or y > getgenv().legitslapaura.yBlockMax) then
				local a = Instance.new("Animation")
				a.AnimationId = getgenv().legitslapaura.animationId
				h:LoadAnimation(a):Play()
			end

			getgenv().legitslapaura.slapCount += 1
		end)
	elseif not getgenv().legitslapaura.enabled and getgenv().legitslapaura.connection then
		getgenv().legitslapaura.connection:Disconnect()
		getgenv().legitslapaura.connection = nil
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Slap Aura (Legit)",
		Text = getgenv().legitslapaura.enabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

maintab:Button("Godmode (Use In Lobby, Breaks Some Gloves.)", function()
local p = game.Players.LocalPlayer
local log = game:GetService("LogService")
local c = p.Character or p.CharacterAdded:Wait()

firetouchinterest(c.Head, workspace.Lobby.Teleport1, 0) task.wait(0.1) firetouchinterest(c.Head, workspace.Lobby.Teleport1, 1)
repeat task.wait() until c:FindFirstChildWhichIsA("Tool") or p.Backpack:FindFirstChildWhichIsA("Tool")
for _,v in ipairs({c, p.Backpack}) do for _,t in ipairs(v:GetChildren()) do if t:IsA("Tool") then t.Parent = log end end end

task.wait(0.75) c.Humanoid.Health = 0 task.wait(3.75)
local nc = p.Character or p.CharacterAdded:Wait()
for _,t in ipairs(log:GetChildren()) do t.Parent = p.Backpack nc.Humanoid:EquipTool(t) end
nc.HumanoidRootPart.CFrame = workspace.Origo.CFrame * CFrame.new(0, -5, 0)
end)

maintab:Button("Remove Cooldown", function()
	while (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid").Health ~= 0 do
		local tool = (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):FindFirstChildOfClass("Tool")
			or game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool")

		if tool and tool:FindFirstChildOfClass("LocalScript") then
			local cloned = tool:FindFirstChildOfClass("LocalScript"):Clone()
			cloned.Parent = tool
			tool:FindFirstChildOfClass("LocalScript"):Destroy()
		end
		task.wait(0.1)
	end
end)

local enabled = false
local lastClick = 0
local range = 15

game:GetService("RunService").RenderStepped:Connect(function()
	if not enabled then return end
	if tick() - lastClick < 1.45 then return end

	local myHRP = (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

	for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
		if player ~= game:GetService("Players").LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			if (myHRP.Position - player.Character.HumanoidRootPart.Position).Magnitude <= range then
				game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, nil, 0)
				game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, nil, 0)
				lastClick = tick()
				break
			end
		end
	end
end)

maintab:Toggle("Glove Triggerbot", function()
	enabled = not enabled
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Glove Triggerbot",
		Text = enabled and "Enabled." or "Disabled.",
		Duration = 2
	})
end)

local autoRhythmEnabled = false
local barStates = {}

maintab:Toggle("Auto Rhythm", function()
	autoRhythmEnabled = not autoRhythmEnabled
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Auto Rhythm",
		Text = autoRhythmEnabled and "Enabled." or "Disabled.",
		Duration = 2
	})
end)

game:GetService("RunService").RenderStepped:Connect(function()
	if not autoRhythmEnabled then return end

	local player = game:GetService("Players").LocalPlayer
	local gui = player:FindFirstChild("PlayerGui")
	if not gui then return end

	local rhythm = gui:FindFirstChild("Rhythm")
	if not rhythm then return end

	local main = rhythm:FindFirstChild("MainFrame")
	if not main then return end

	local pointer = main:FindFirstChild("Pointer")
	local bars = main:FindFirstChild("Bars")
	if not pointer or not bars then return end

	for _, bar in ipairs(bars:GetChildren()) do
		if bar:IsA("Frame") and bar.Name ~= "BarHit" then
			local id = bar:GetDebugId(5)
			local aPos, aSize = pointer.AbsolutePosition, pointer.AbsoluteSize
			local bPos, bSize = bar.AbsolutePosition, bar.AbsoluteSize

			local nowOverlapping = not (
				aPos.X + aSize.X < bPos.X or
				aPos.X > bPos.X + bSize.X or
				aPos.Y + aSize.Y < bPos.Y or
				aPos.Y > bPos.Y + bSize.Y
			)

			if nowOverlapping and not barStates[id] then
				barStates[id] = true
				local clickPos = aPos + (aSize / 2)
				game:GetService("VirtualInputManager"):SendMouseButtonEvent(clickPos.X, clickPos.Y, 0, true, game, 0)
				game:GetService("VirtualInputManager"):SendMouseButtonEvent(clickPos.X, clickPos.Y, 0, false, game, 0)
			elseif not nowOverlapping then
				barStates[id] = false
			end
		end
	end
end)

maintab:Button("Indestructible Tycoon", function()
(game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame = CFrame.new(Vector3.new(17860, -107, -3536))

game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
wait(0.05)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
task.wait(0.2)
game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
wait(0.05)
game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
end)

maintab:Button("Extra Life (34K Slaps, Use In Lobby.)", function()
local p = game.Players.LocalPlayer
local rs, vim, ws = game:GetService("ReplicatedStorage"), game:GetService("VirtualInputManager"), game:GetService("Workspace")
local cam, char = ws.CurrentCamera, p.Character or p.CharacterAdded:Wait()
local g = p:FindFirstChild("leaderstats") and p.leaderstats:FindFirstChild("Glove")
if g and g.Value == "Guardian Angel" then return rs.GeneralAbility:FireServer(p) end

local hrp, orig, old = char.HumanoidRootPart, char.HumanoidRootPart.CFrame, g.Value
local function click(x)
	local pos = x.Position
	hrp.CFrame = CFrame.new(pos + x.CFrame.LookVector * 4 + Vector3.new(0,3,0), pos)
	cam.CameraType = Enum.CameraType.Scriptable
	cam.CFrame = CFrame.new(pos + Vector3.new(0,3,4), pos)
	task.wait(0.25)
	local s = cam:WorldToViewportPoint(pos)
	vim:SendMouseButtonEvent(s.X,s.Y,0,true,game,1)
	vim:SendMouseButtonEvent(s.X,s.Y,0,false,game,1)
	task.wait(0.25)
end

click(ws.Lobby["Guardian Angel"])
rs.GeneralAbility:FireServer(p)
click(ws.Lobby[old])
hrp.CFrame = orig
cam.CameraType = Enum.CameraType.Custom
game.StarterGui:SetCore("SendNotification", {Title="Extra Life", Text="Extra Life Given.", Duration=3})
end)

getgenv().AutoClickTycoonEnabled = false

maintab:Toggle("Auto Click Tycoon (Must Be Near.)", function()
	getgenv().AutoClickTycoonEnabled = not getgenv().AutoClickTycoonEnabled

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Auto Click Tycoon",
		Text = getgenv().AutoClickTycoonEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})

	if getgenv().AutoClickTycoonEnabled then
		game:GetService("RunService").RenderStepped:Connect(function()
			if not getgenv().AutoClickTycoonEnabled then return end

			local helper = game:GetService("Workspace"):FindFirstChild("ÅTycoon" .. game:GetService("Players").LocalPlayer.Name)
			if not helper then return end

			local clickPart = helper:FindFirstChild("Click")
			if not clickPart then return end

			local screenPoint = game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(clickPart.Position)
			game:GetService("VirtualInputManager"):SendMouseButtonEvent(screenPoint.X, screenPoint.Y, 0, true, game, 0)
			game:GetService("VirtualInputManager"):SendMouseButtonEvent(screenPoint.X, screenPoint.Y, 0, false, game, 0)
		end)
	end
end)

maintab:Button("One Million Buses (Very Blatant, Equip Bus.)", function()
	getgenv().BusSpamStart = tick()
	getgenv().BusSpamLast = 0

	game:GetService("RunService").Heartbeat:Connect(function()
		if tick() - getgenv().BusSpamStart >= 3 then return end
		if tick() - getgenv().BusSpamLast >= 0.0001 then
			getgenv().BusSpamLast = tick()
			game:GetService("ReplicatedStorage"):WaitForChild("busmoment"):FireServer()
		end
	end)

	task.wait(2)

	if typeof(game.PlaceId) == "number" and typeof(game.JobId) == "string" and game:GetService("Players").LocalPlayer then
		print("Rejoining current server...")
		print("PlaceId:", game.PlaceId)
		print("JobId:", game.JobId)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
	else
		print("Failed to get current server info or player.")
	end
end)

maintab:Button("Bind Kinetic (Binds To R, Equip Kinetic.)", function()
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if input.KeyCode == Enum.KeyCode.R then
			if not game:GetService("Players").LocalPlayer:FindFirstChild("leaderstats") or not game:GetService("Players").LocalPlayer.leaderstats:FindFirstChild("Glove") then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Wrong Glove",
					Text = "Equip Kinetic Glove.",
					Duration = 10
				})
				return
			end

			if game:GetService("Players").LocalPlayer.leaderstats.Glove.Value ~= "Kinetic" then
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Wrong Glove",
					Text = "Equip Kinetic Glove.",
					Duration = 10
				})
				return
			end

			if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				for _ = 1, 100 do
					game:GetService("ReplicatedStorage").SelfKnockback:FireServer({
						["Force"] = 0,
						["Direction"] = Vector3.new(0, 0.01, 0)
					})
					task.wait(0.05)
				end
			end
		end
	end)
end)

maintab:Button("Bind Rhythm (Binds To E, Equip Rhythm.)", function()
	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if input.KeyCode == Enum.KeyCode.E then
			game:GetService("ReplicatedStorage"):WaitForChild("rhythmevent"):FireServer("AoeExplosion", 90)
		end
	end)
end)

local muckBindEnabled = false
local muckConnection = nil

maintab:Button("Bind Muck (Binds To Y.)", function()
	muckBindEnabled = not muckBindEnabled

	if muckBindEnabled and not muckConnection then
		muckConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then return end
			if input.KeyCode == Enum.KeyCode.Y then
				local event = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Muck")
				if event then
					event:FireServer()
				end
			end
		end)
	elseif not muckBindEnabled and muckConnection then
		muckConnection:Disconnect()
		muckConnection = nil
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Muck Bind",
		Text = muckBindEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

maintab:Button("Crash / Lag Server (Req. Glovel)", function()
local GlovelFunc = game:GetService("ReplicatedStorage"):WaitForChild("GlovelFunc")
local RunService = game:GetService("RunService")

local startTime = os.clock()
local duration = 30
local connections = {}

for i = 1, 25 do
    task.spawn(function()
        local conn
        conn = RunService.Heartbeat:Connect(function()
            if os.clock() - startTime > duration then
                conn:Disconnect()
                return
            end
            GlovelFunc:InvokeServer()
        end)
        table.insert(connections, conn)
    end)
end
end)

getgenv().AntiFlingEnabled = false
getgenv().RagdolledValue = Instance.new("BoolValue")
getgenv().RagdolledValue.Name = "Ragdolled"
getgenv().RagdolledValue.Value = false
getgenv().RagdolledValue.Parent = game:GetService("Players").LocalPlayer

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(character)
	character:WaitForChild("HumanoidRootPart")

	if workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name) then
		if workspace[game:GetService("Players").LocalPlayer.Name]:FindFirstChild("LastSlappedBy") then
			workspace[game:GetService("Players").LocalPlayer.Name].LastSlappedBy.Changed:Connect(function(v)
				if getgenv().AntiFlingEnabled and v and v ~= "" then
					if character:FindFirstChild("HumanoidRootPart") then
						character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						character.HumanoidRootPart.Anchored = true
						task.delay(2, function()
							if character and character:FindFirstChild("HumanoidRootPart") then
								character.HumanoidRootPart.Anchored = false
							end
						end)
					end
				end
			end)
		end

		if workspace[game:GetService("Players").LocalPlayer.Name]:FindFirstChild("Ragdolled") then
			getgenv().RagdolledValue = workspace[game:GetService("Players").LocalPlayer.Name].Ragdolled
		end
	end
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if getgenv().AntiFlingEnabled and getgenv().RagdolledValue and getgenv().RagdolledValue.Value == true then
		if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
			task.delay(2, function()
				if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
				end
			end)
		end
	end
end)

antitab:Toggle("Anti Knockback", function()
	getgenv().AntiFlingEnabled = not getgenv().AntiFlingEnabled
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti Knockback";
		Text = getgenv().AntiFlingEnabled and "Enabled." or "Disabled.";
		Duration = 3;
	})
end)

local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local antivoidPart = nil

antitab:Toggle("Anti Void", function(v)
	if v then
		if not antivoidPart then
			antivoidPart = Instance.new("Part")
			antivoidPart.Name = "VoidProtection"
			antivoidPart.Size = Vector3.new(99999, 1, 99999)
			antivoidPart.Position = Vector3.new(15, -10, 6)
			antivoidPart.Anchored = true
			antivoidPart.Material = Enum.Material.Grass
			antivoidPart.Transparency = 0.75
			antivoidPart.Color = Color3.fromRGB(0, 255, 45)
			antivoidPart.CastShadow = false
			antivoidPart.Parent = Workspace
		end

		StarterGui:SetCore("SendNotification", {
			Title = "Anti Void",
			Text = "Enabled.",
			Duration = 3
		})
	else
		if antivoidPart then
			antivoidPart:Destroy()
			antivoidPart = nil
		end

		StarterGui:SetCore("SendNotification", {
			Title = "Anti Void",
			Text = "Disabled.",
			Duration = 3
		})
	end
end)

getgenv().AntiAnchorEnabled = false

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
end)

game:GetService("RunService").Heartbeat:Connect(function()
	if not getgenv().AntiAnchorEnabled then return end
	if not game:GetService("Players").LocalPlayer.Character then return end

	if not workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name) then return end
	if workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name):FindFirstChild("Ragdolled") and workspace:FindFirstChild(game:GetService("Players").LocalPlayer.Name):FindFirstChild("Ragdolled").Value then return end

	for _, part in ipairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
		if part:IsA("BasePart") and part.Anchored then
			pcall(function()
				part.Anchored = false
			end)
		end
	end
end)

antitab:Toggle("Anti Time Stop", function()
	getgenv().AntiAnchorEnabled = not getgenv().AntiAnchorEnabled
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti Time Stop";
		Text = getgenv().AntiAnchorEnabled and "Enabled." or "Disabled.";
		Duration = 3;
	})
end)

antitab:Toggle("Anti Knockoff", function()
	_G.AntiKnockoff = not _G.AntiKnockoff

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti Knockoff";
		Text = _G.AntiKnockoff and "Enabled." or "Disabled.";
		Duration = 3;
	})

	if _G.AntiKnockoff then
		task.spawn(function()
			while _G.AntiKnockoff do
				if workspace.CurrentCamera and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and workspace.CurrentCamera.CameraSubject ~= game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and workspace.CurrentCamera.CameraSubject == workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s_falsehead") then
					workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
				end
				task.wait()
			end
		end)
	end
end)

antitab:Toggle("Anti Bus", function()
	_G.AntiBus = not _G.AntiBus

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti Bus";
		Text = _G.AntiBus and "Enabled." or "Disabled.";
		Duration = 3;
	})

	if _G.AntiBus then
		task.spawn(function()
			while _G.AntiBus do
				for _, obj in ipairs(workspace:GetChildren()) do
					if obj:IsA("MeshPart") and obj.Name == "BusModel" then
						obj:Destroy()
					end
				end
				task.wait()
			end
		end)
	end
end)

antitab:Toggle("Anti Pusher", function()
	_G.AntiWall = not _G.AntiWall

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti Pusher";
		Text = _G.AntiWall and "Enabled." or "Disabled.";
		Duration = 3;
	})

	if _G.AntiWall then
		task.spawn(function()
			while _G.AntiWall do
				for _, obj in ipairs(workspace:GetChildren()) do
					if obj:IsA("Part") and obj.Name == "wall" then
						obj:Destroy()
					end
				end
				task.wait()
			end
		end)
	end
end)

getgenv().AntiOneShotEnabled = false

getgenv().HasDangerousTool = function(player)
	if not player:FindFirstChildOfClass("Backpack") and not player.Character then return false end

	for _, tool in ipairs((player:FindFirstChildOfClass("Backpack") or {}):GetChildren()) do
		if ({ Error = true, OVERKILL = true, ["The Flex"] = true, rob = true, Link = true, Leash = true })[tool.Name] then
			return true
		end
	end

	if player.Character then
		for _, tool in ipairs(player.Character:GetChildren()) do
			if tool:IsA("Tool") and ({ Error = true, OVERKILL = true, ["The Flex"] = true, rob = true, Leash = true })[tool.Name] then
				return true
			end
		end
	end

	return false
end

getgenv().AntiOneShotConnection = nil

antitab:Toggle("Anti OneShot", function()
	getgenv().AntiOneShotEnabled = not getgenv().AntiOneShotEnabled

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti OneShot",
		Text = getgenv().AntiOneShotEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})

	if getgenv().AntiOneShotEnabled then
		getgenv().AntiOneShotConnection = game:GetService("RunService").RenderStepped:Connect(function()
			if not game:GetService("Players").LocalPlayer.Character then return end
			if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end

			for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
				if player ~= game:GetService("Players").LocalPlayer and player.Character and getgenv().HasDangerousTool(player) then
					if player.Character:FindFirstChild("HumanoidRootPart") then
						local offset = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position
						if offset.Magnitude < 22 then
							local correctedPosition = player.Character.HumanoidRootPart.Position + offset.Unit * 22 + Vector3.new(0, 0.5, 0)
							game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(correctedPosition)
							break
						end
					end
				end
			end
		end)
	elseif getgenv().AntiOneShotConnection then
		getgenv().AntiOneShotConnection:Disconnect()
		getgenv().AntiOneShotConnection = nil
	end
end)

getgenv().sbeveShieldEnabled = false
getgenv().sbeveDetectionRadius = 15
getgenv().sbevePushDistance = 22
getgenv().sbeveConnection = nil

antitab:Toggle("Anti Sbeve", function()
	getgenv().sbeveShieldEnabled = not getgenv().sbeveShieldEnabled

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti Sbeve",
		Text = getgenv().sbeveShieldEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})

	if getgenv().sbeveShieldEnabled then
		getgenv().sbeveConnection = game:GetService("RunService").RenderStepped:Connect(function()
			local char = game:GetService("Players").LocalPlayer.Character
			if not char then return end

			local root = char:FindFirstChild("HumanoidRootPart")
			if not root then return end

			local threat, closest = nil, math.huge

			for _, model in ipairs(game:GetService("Workspace"):GetChildren()) do
				if model:IsA("Model") and model ~= char then
					local part = model:FindFirstChild("stevebody")
					if part and part:IsA("BasePart") then
						local dist = (part.Position - root.Position).Magnitude
						if dist < getgenv().sbeveDetectionRadius and dist < closest then
							threat = part
							closest = dist
						end
					end
				end
			end

			if threat then
				local offset = root.Position - threat.Position
				local repel = offset.Unit
				local target = threat.Position + repel * getgenv().sbevePushDistance + Vector3.new(0, 0.5, 0)
				root.CFrame = CFrame.new(root.Position:Lerp(target, 0.1))
			end
		end)
	elseif getgenv().sbeveConnection then
		getgenv().sbeveConnection:Disconnect()
		getgenv().sbeveConnection = nil
	end
end)

antitab:Toggle("Anti MegaRock", function()
	getgenv().antimegarocksb = not getgenv().antimegarocksb

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti MegaRock",
		Text = getgenv().antimegarocksb and "Enabled." or "Disabled.",
		Duration = 3
	})

	if getgenv().antimegarocksb then
		task.spawn(function()
			while getgenv().antimegarocksb do
				for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
					if p.Character and p.Character:FindFirstChild("rock") then
						p.Character:FindFirstChild("rock").CanTouch = false
						p.Character:FindFirstChild("rock").CanQuery = false
					end
				end
				task.wait(0.1)
			end
		end)
	end
end)

exptab:Button("Instant Egg Quest (Accept Quest From Hitman First.)", function()
	local index = 0
	local root = (game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")

	for _, part in ipairs(game:GetService("Workspace"):WaitForChild("EasterHuntEggs"):GetDescendants()) do
		if part:IsA("MeshPart") and part.Anchored then
			part.Position = root.Position * index
			index += 0
		end
	end
end)

exptab:Label("Rob Glove Specific Features.")

exptab:Button("Rob Glove Instructions", function()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Instructions";
	Text = "You must be in the arena with the rob glove equipped.";
	Duration = 30;
})
wait(1)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Instructions";
	Text = "In order to keep someone banned, same thing as above. ";
	Duration = 30;
})
end)

local function getClosestPlayer(name)
    for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
        if plr.Name:lower():sub(1, #name) == name:lower() then
            return plr
        end
    end
end

exptab:Textbox("Kill Player", function(v)
    local target = getClosestPlayer(v)
    if target then
        game:GetService("ReplicatedStorage").Events.rob_r:FireServer(
            "throw",
            {
                victim = target,
                cf = CFrame.new(
                    -270.997803, -6.65184021, 0.999665737,
                    0.413466334, 0, -0.910519361,
                    0, 1, 0,
                    0.910519361, 0, 0.413466334
                )
            }
        )
    end
end)

exptab:Textbox("Kick Player (Brazil Portal)", function(v)
    local target = getClosestPlayer(v)
    if target then
        game:GetService("ReplicatedStorage").Events.rob_r:FireServer(
            "throw",
            {
                victim = target,
                cf = CFrame.new(
				-1024.052, 304.538788, -1.89993906, -8.10623169e-05, -1, 8.10623169e-05, 8.10623169e-05, 8.10623169e-05, 1, -1, 8.10623169e-05, 8.10623169e-05
                )
            }
        )
    end
end)

exptab:Textbox("Kick Player (Guide Portal)", function(v)
    local target = getClosestPlayer(v)
    if target then
        game:GetService("ReplicatedStorage").Events.rob_r:FireServer(
            "throw",
            {
                victim = target,
                cf = CFrame.new(
                    17943.7773, -122.255447, -3560.4231,
                    1, 0, 0,
                    0, 1, 0,
                    0, 0, 1
                )
            }
        )
    end
end)

local banned = {}

local function kick(target)
    game:GetService("ReplicatedStorage").Events.rob_r:FireServer("throw", {
        victim = target,
        cf = CFrame.new(
		-1024.052, 304.538788, -1.89993906, -8.10623169e-05, -1, 8.10623169e-05, 8.10623169e-05, 8.10623169e-05, 1, -1, 8.10623169e-05, 8.10623169e-05
        )
    })
end

exptab:Textbox("Server Ban Player (Brazil Portal)", function(v)
    local target = getClosestPlayer(v)
    if target then
        banned[target.Name] = true
        task.spawn(function()
            while banned[target.Name] and game.Players:FindFirstChild(target.Name) do
                kick(target)
                task.wait(0.5)
            end
        end)
    end
end)

game.Players.PlayerAdded:Connect(function(plr)
    if banned[plr.Name] then
        task.spawn(function()
            while banned[plr.Name] and game.Players:FindFirstChild(plr.Name) do
                kick(plr)
                task.wait(0.5)
            end
        end)
    end
end)

exptab:Textbox("Delete Player", function(v)
    local target = getClosestPlayer(v)
    if target then
        game:GetService("ReplicatedStorage").Events.rob_r:FireServer(
            "throw",
            {
                victim = target,
                cf = CFrame.new(1118, -50005, 18258)
            }
        )
    end
end)

exptab:Textbox("Remove Limbs Player", function(v)
    local target = getClosestPlayer(v)
    if target then
        game:GetService("ReplicatedStorage").Events.rob_r:FireServer(
            "throw",
            {
                victim = target,
                cf = CFrame.new(1118, -50000, 18258)
            }
        )
    end
end)

exptab:Textbox("Remove Spectator Godmode", function(v)
    local target = getClosestPlayer(v)
    if target then
        game:GetService("ReplicatedStorage").Events.rob_r:FireServer(
            "throw",
            {
                victim = target,
                cf = CFrame.new(-11, -5, 1)
            }
        )
    end
end)

exptab:Button("Clear Ban List", function()
    table.clear(banned)
end)

exptab:Label("Guardian Angel Glove Exploits.")

exptab:Textbox("Angel Player", function(v)
local args = {
	game:GetService("Players"):WaitForChild(v)
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end)

exptab:Textbox("Loop Angel Player", function(v)
	task.spawn(function()
		while true do
			for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
				if plr.Name:lower():find(v:lower()) or plr.DisplayName:lower():find(v:lower()) then
					local args = { plr }
					game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
					break
				end
			end
			task.wait(2)
		end
	end)
end)

teletab:Button("Main Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3, -5, 16)
end)

teletab:Button("Moyai Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(229, -16, -12)
end)

teletab:Button("Slapple Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381, 51, -12)
end)

teletab:Button("Castle", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 34, 189)
end)

teletab:Button("The Plate", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Arena.Plate.CFrame
end)

teletab:Button("Retro Obby", function()
local p=game.Players.LocalPlayer;p.CharacterAdded:Connect(function(c)c:WaitForChild("Humanoid").Died:Connect(function()game.SoundService:FindFirstChild("ObbyMusic"):Destroy()end)end)local s=game.StarterPlayer.StarterPlayerScripts.LegacyClient.RetroHandler.Handle.ObbyMusic:Clone()s.Parent=game.SoundService;s:Play() if not workspace:FindFirstChild("RetroObbyMap")then game.ReplicatedStorage.Assets.Retro.Map.RetroObbyMap:Clone().Parent=workspace end;(p.Character or p.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame=CFrame.new(-16873,-1,4775)
end)

teletab:Button("Debug Room", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-17922, 60, 3562)
end)

teletab:Button("Baseplate", function()
	if not game:GetService("Workspace"):FindFirstChild("_TargetBaseplate") then
		local p = Instance.new("Part")
		p.Name = "_TargetBaseplate"
		p.Size = Vector3.new(512, 20, 512)
		p.Position = Vector3.new(5000, 228, 5000)
		p.Anchored = true
		p.TopSurface = Enum.SurfaceType.Smooth
		p.BottomSurface = Enum.SurfaceType.Smooth
		p.Material = Enum.Material.SmoothPlastic
		p.Color = Color3.fromRGB(163, 162, 165)
		p.Parent = game:GetService("Workspace")
	end

	(game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait())
		:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(Vector3.new(5000, 228, 5000) + Vector3.new(0, 20 / 2 + 5, 0))
end)

farmtab:Label("Anti AFK: Useful For Certain Farms.")

getgenv().antiAFK = false
local lastInputTime = tick()

game:GetService("UserInputService").InputBegan:Connect(function()
	lastInputTime = tick()
end)

task.spawn(function()
	while true do
		if getgenv().antiAFK and tick() - lastInputTime >= 60 then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Space, false, game)
			task.wait(0.1)
			game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Space, false, game)
			lastInputTime = tick()
		end
		task.wait(1)
	end
end)

farmtab:Button("Anti AFK", function()
	getgenv().antiAFK = not getgenv().antiAFK
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti AFK",
		Text = getgenv().antiAFK and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

farmtab:Label("Slap Farming: Recommended To Teleport To Baseplate.")

farmtab:Button("Slap Farm Info", function()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Slap Farm";
	Text = "Dual: 5K/hour\nDual + 2X: 11K/hour\nDual + 2X + VIP: 22K/hour";
	Duration = 10;
})
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local autoslapenabled = false
local cachedRemotes = {}

local function findEquippedGlove()
    local character = LocalPlayer.Character
    if not character then return nil end
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            return tool
        end
    end
end

local function getClosestPlayer()
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local closest, dist = nil, math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                local mag = (targetRoot.Position - myRoot.Position).Magnitude
                if mag < dist then
                    dist = mag
                    closest = player
                end
            end
        end
    end
    return closest
end

local function findRelevantHitRemotes(gloveName)
    if cachedRemotes[gloveName] then return cachedRemotes[gloveName] end

    local nameLower = string.lower(gloveName or "")
    local hits = {}

    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local remoteLower = string.lower(obj.Name)
            if remoteLower == nameLower .. "hi"
            or (remoteLower:find(nameLower) and remoteLower:find("hit")) then
                table.insert(hits, obj)
            end
        end
    end

    cachedRemotes[gloveName] = hits
    return hits
end

local heartbeatConn
local cooldown = false

farmtab:Button("Auto Slap (Main Account.)", function()
    autoslapenabled = not autoslapenabled

    if autoslapenabled and not heartbeatConn then
        heartbeatConn = RunService.Heartbeat:Connect(function()
            if cooldown then return end

            local glove = findEquippedGlove()
            local targetPlayer = getClosestPlayer()

            if targetPlayer and targetPlayer.Character then
                local torso = targetPlayer.Character:FindFirstChild("Torso")
                    or targetPlayer.Character:FindFirstChild("UpperTorso")
                    or targetPlayer.Character:FindFirstChild("HumanoidRootPart")

                if torso then
                    local remotes = {}

                    if glove then
                        local foundRemotes = findRelevantHitRemotes(glove.Name)
                        if foundRemotes and #foundRemotes > 0 then
                            remotes = foundRemotes
                        end
                    end

                    if #remotes == 0 then
                        for _, fallback in ipairs({"GeneralHit", "b", "KSHit"}) do
                            local remote = ReplicatedStorage:FindFirstChild(fallback)
                            if remote then
                                table.insert(remotes, remote)
                            end
                        end
                    end

                    cooldown = true
                    task.spawn(function()
                        for i = 1, 5 do
                            for _, remote in ipairs(remotes) do
                                remote:FireServer(targetPlayer.Character:FindFirstChild(torso.Name))
                            end
                            task.wait(0.575)
                        end
                        task.wait(2)
                        cooldown = false
                    end)
                end
            end
        end)
    elseif not autoslapenabled and heartbeatConn then
        heartbeatConn:Disconnect()
        heartbeatConn = nil
    end

    StarterGui:SetCore("SendNotification", {
        Title = "Auto Slap",
        Text = autoslapenabled and "Enabled." or "Disabled.",
        Duration = 3
    })
end)

farmtab:Button("Slap Farm (Main Account, Use In Arena.)", function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local GeneralRemote = ReplicatedStorage:WaitForChild("GeneralHit")

local targetPosition = Vector3.new(6500, 760, 4785)
local root = nil

local function updateRoot()
	local character = LocalPlayer.Character
	if character then
		root = character:FindFirstChild("HumanoidRootPart")
	end
end

LocalPlayer.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart")
	updateRoot()
end)

if LocalPlayer.Character then
	updateRoot()
end

local function getClosestPlayer()
	local closest = nil
	local minDist = math.huge

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (player.Character.HumanoidRootPart.Position - root.Position).Magnitude
			if distance < minDist then
				minDist = distance
				closest = player
			end
		end
	end

	return closest
end

RunService.Heartbeat:Connect(function()
	if root then
		root.CFrame = CFrame.new(targetPosition)
	end
end)

task.spawn(function()
	while true do
		if root then
			local target = getClosestPlayer()
			if target and target.Character then
				GeneralRemote:FireServer(target.Character:FindFirstChild("HumanoidRootPart"))
			end
		end
		task.wait(1.25)
	end
end)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local character = nil
local root = nil
local floating = false

local referencePosition = Vector3.new(6500, 760, 4785)

local function floatEffect()
	if root then
		root.Anchored = false
		root.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		root.AssemblyLinearVelocity = Vector3.zero
	end
end

local function getClosestToReference()
	local closestPlayer = nil
	local shortestDistance = math.huge

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (player.Character.HumanoidRootPart.Position - referencePosition).Magnitude
			if dist < shortestDistance then
				shortestDistance = dist
				closestPlayer = player
			end
		end
	end

	return closestPlayer
end

local function teleportInFront()
	if not floating then return end

	local targetPlayer = getClosestToReference()
	if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local targetRoot = targetPlayer.Character.HumanoidRootPart
		local offset = targetRoot.CFrame.LookVector.Unit * 4
		local newPos = targetRoot.Position + offset + Vector3.new(0, 2, 0)
		root.CFrame = CFrame.new(newPos, targetRoot.Position)
		floatEffect()
	end
end

RunService.Heartbeat:Connect(function()
	if floating then
		teleportInFront()
	end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
	character = char
	root = character:WaitForChild("HumanoidRootPart")
end)

if LocalPlayer.Character then
	character = LocalPlayer.Character
	root = character:WaitForChild("HumanoidRootPart")
end

farmtab:Button("Slap Farm (Alt Account, Use In Arena.)", function()
	floating = true
end)

farmtab:Label("Bounty Slap Farm: Recommended To Use In Small Servers.")

farmtab:Button("Bounty Slap Farm (Alt Account.)", function()
while true do
wait()
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
end)

farmtab:Label("Kill Farm: Recommended To Teleport Main To Baseplate.")

farmtab:Textbox("Kill Farm (Set Username To Main, Use In Arena.)", function(v)
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")

	local LocalPlayer = Players.LocalPlayer

	local function onCharacterSpawn(character)
		local rootPart = character:WaitForChild("HumanoidRootPart")

		local teleportPart = Workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")
		rootPart.CFrame = teleportPart.CFrame + Vector3.new(0, 1, 0)
		firetouchinterest(rootPart, teleportPart, 0)
		task.wait(0.1)
		firetouchinterest(rootPart, teleportPart, 1)

		task.wait(0.7)

		local target = Players:FindFirstChild(v)
		if target then
			for i = 1, 25 do
				local targetChar = target.Character
				local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
				if targetRoot then
					local offset = targetRoot.CFrame.LookVector.Unit * 5
					local destination = targetRoot.Position + offset + Vector3.new(0, 1, 0)
					rootPart.CFrame = CFrame.new(destination, targetRoot.Position)
				end
				task.wait(0.05)
			end
		end

		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid.Health = 0
		end
	end

	LocalPlayer.CharacterAdded:Connect(onCharacterSpawn)

	if LocalPlayer.Character then
		onCharacterSpawn(LocalPlayer.Character)
	end
end)

farmtab:Label("Rob Farm: Silent, Teleport To Baseplate.")

farmtab:Button("Rob Absorb Farm (Main Account, Rejoin To Disable.)", function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local targetPosition = Vector3.new(5000, 241, 4999)
local remote = ReplicatedStorage:WaitForChild("rob")
local args = { false }

task.spawn(function()
    while true do
        remote:FireServer(unpack(args))
        task.wait(1.25)
    end
end)

RunService.Heartbeat:Connect(function()
    local character = player.Character
    if character then
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            root.Velocity = Vector3.zero
            root.CFrame = CFrame.new(targetPosition)
        end
    end
end)
end)

farmtab:Button("Semi-Instant Complete Quest #3", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(313, 48, 183))
workspace.Gravity = 0
for _, obj in ipairs({
    workspace:FindFirstChild("AntiDefaultArena"),
    workspace:FindFirstChild("DEATHBARRIER"),
    workspace:FindFirstChild("DEATHBARRIER2"),
    workspace:FindFirstChild("ArenaBarrier"),
}) do
    if obj then obj:Destroy() end
end
wait(0.5)

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local humanoid = char:WaitForChild("Humanoid")

local targetPos = Vector3.new(175000, 48, -10000)
local stepSize = 10
local delay = 0.01

local direction = (targetPos - root.Position).Unit
local distance = (targetPos - root.Position).Magnitude
local steps = math.floor(distance / stepSize)

humanoid:ChangeState(Enum.HumanoidStateType.Physics)
for _, part in ipairs(char:GetDescendants()) do
    if part:IsA("BasePart") then
        part.CanCollide = false
        part.Velocity = Vector3.zero
    end
end

task.spawn(function()
    for i = 1, steps do
        root.CFrame = root.CFrame + direction * stepSize
        task.wait(delay)
    end
    root.CFrame = CFrame.new(targetPos)
    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
end)

local remote = ReplicatedStorage:WaitForChild("rob")
local args = { false }
local alive = true

humanoid.Died:Connect(function()
    alive = false
end)

task.spawn(function()
    while alive do
        remote:FireServer(unpack(args))
        task.wait(3.25)
    end
end)
end)

farmtab:Textbox("Rob Absorb Farm (Set Username To Main.)", function(v)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local function onCharacterSpawn(character)
	local rootPart = character:WaitForChild("HumanoidRootPart")

	local teleportPart = Workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")
	rootPart.CFrame = teleportPart.CFrame + Vector3.new(0, 1, 0)
	firetouchinterest(rootPart, teleportPart, 0)
	task.wait(0.1)
	firetouchinterest(rootPart, teleportPart, 1)

	task.wait(0.7)

	local target = Players:FindFirstChild(v)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		local targetRoot = target.Character.HumanoidRootPart
		local offset = targetRoot.CFrame.LookVector.Unit * 5
		local destination = targetRoot.Position + offset + Vector3.new(0, 1, 0)

		for i = 1, 25 do
			rootPart.CFrame = CFrame.new(destination, targetRoot.Position)
			task.wait(0.05)
		end
	end
end

LocalPlayer.CharacterAdded:Connect(onCharacterSpawn)

if LocalPlayer.Character then
	onCharacterSpawn(LocalPlayer.Character)
end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local targetName = nil
local bringEnabled = false

local function bringTarget(targetPlayer)
	local function loop()
		while bringEnabled and targetPlayer and targetPlayer.Character do
			local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
			local myChar = Players.LocalPlayer.Character
			local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")

			if targetHRP and myHRP then
				targetHRP.CFrame = myHRP.CFrame + Vector3.new(0, 3, 0)
			end

			task.wait(0.1)
		end
	end

	coroutine.wrap(loop)()
end

local function trackTarget(name)
	for _, player in ipairs(Players:GetPlayers()) do
		if player.Name:lower() == name:lower() then
			player.CharacterAdded:Connect(function()
				if bringEnabled then
					bringTarget(player)
				end
			end)
			if player.Character then
				bringTarget(player)
			end
		end
	end

	Players.PlayerAdded:Connect(function(player)
		if player.Name:lower() == name:lower() then
			player.CharacterAdded:Connect(function()
				if bringEnabled then
					bringTarget(player)
				end
			end)
		end
	end)
end

farmtab:Textbox("Loop Bring Player (Username)", function(v)
	targetName = v
	bringEnabled = true
	trackTarget(targetName)
end)

farmtab:Label("Fort Farm: Silent, Teleport To Baseplate.")

farmtab:Button("Spam Build Wall", function()
while true do
game:GetService("ReplicatedStorage").Fortlol:FireServer()
wait(3.33)
end
end)

farmtab:Label("Moyai Farm: Recommended To Join Small Servers.")

farmtab:Button("Moyai Farm Quest #1 (Main Account, Rejoin To Disable.)", function()
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local targetPosition = Vector3.new(280.659210, 21.155642, 240.360291)
local lookDirection = Vector3.new(0.989398, 0.000000, -0.145231)
local targetCFrame = CFrame.new(targetPosition, targetPosition + lookDirection)

root.CFrame = targetCFrame

task.wait(0.15)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
task.wait(0.2)
VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
task.wait(0.05)
VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
task.wait(0.05)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local targetPosition = Vector3.new(272.066437, 13.453131, 245.083008)
local lookDirection = Vector3.new(0.185743, -0.000000, -0.982598)
local targetCFrame = CFrame.new(targetPosition, targetPosition + lookDirection)

root.CFrame = targetCFrame

local VirtualInputManager = game:GetService("VirtualInputManager")

while true do
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
    task.wait(2.3)
end
end)

farmtab:Button("Moyai Farm Quest #1 (Alt Account.)", function()
while true do game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(273, 14, 241) task.wait(0.05) end
end)

farmtab:Button("Moyai Stun Farm (Alt Account.)", function()
	local Players = game:GetService("Players")
	local Workspace = game:GetService("Workspace")
	local LocalPlayer = Players.LocalPlayer

	local function runTeleportSequence(character)
		local rootPart = character:WaitForChild("HumanoidRootPart")
		local teleportPart = Workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")

		rootPart.CFrame = teleportPart.CFrame + Vector3.new(0, 1, 0)
		firetouchinterest(rootPart, teleportPart, 0)
		task.wait(0.1)
		firetouchinterest(rootPart, teleportPart, 1)
		task.wait(0.7)

		for _, otherPlayer in ipairs(Players:GetPlayers()) do
			if otherPlayer ~= LocalPlayer then
				local targetName = "ÅMoyaiStatue" .. otherPlayer.Name
				local model = Workspace:FindFirstChild(targetName, true)
				if model and model:IsA("Model") and model.PrimaryPart then
					for i = 1, 12 do
						rootPart.CFrame = CFrame.new(model.PrimaryPart.Position + Vector3.new(0, 5, 0))
						task.wait(1)

						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if humanoid then
							humanoid.Health = 0
						end
					end
					break
				end
			end
		end
	end

	LocalPlayer.CharacterAdded:Connect(runTeleportSequence)
	if LocalPlayer.Character then runTeleportSequence(LocalPlayer.Character) end
end)

farmtab:Label("Brick Farm: Silent, No Recommendations.")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("lbrick")
local StarterGui = game:GetService("StarterGui")

local brickloop = false
local interval = 0.1
local loopThread

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 3
        })
    end)
end

farmtab:Button("Spam Brick (Main Account, For Use With Multi-Farm.)", function()
    brickloop = not brickloop

    if brickloop and not loopThread then
        notify("Brick Spam", "Enabled.")
        loopThread = coroutine.create(function()
            while brickloop do
                pcall(function()
                    Remote:FireServer()
                end)
                task.wait(interval)
            end
            loopThread = nil
        end)
        coroutine.resume(loopThread)
    else
        notify("Brick Spam", "Disabled.")
    end
end)

farmtab:Button("Brick Multi-Farm (Main Account.)", function(v)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local targetPosition = Vector3.new(5000, 228, 5000)

RunService.Heartbeat:Connect(function()
    local character = player.Character
    if character then
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(targetPosition)
        end
    end
end)

local VirtualInputManager = game:GetService("VirtualInputManager")

while true do
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.075)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.075)
end
end)

farmtab:Button("Brick Multi-Farm (Alt Account.)", function(v)
local Workspace = game:GetService("Workspace")

local baseplate = Instance.new("Part")
baseplate.Size = Vector3.new(100, 1, 100)
baseplate.Position = Vector3.new(5002, 209, 4996)
baseplate.Anchored = true
baseplate.Name = "tpbaseplate"
baseplate.Parent = Workspace

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local targetPosition = Vector3.new(5002, 214, 4996)

RunService.Heartbeat:Connect(function()
    local character = player.Character
    if character then
        local root = character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(targetPosition)
        end
    end
end)
end)

farmtab:Label("Glovel Farm: Recommended To Join Small Servers.")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local critfarm = {
	enabled = false,
	cachedRemotes = {},
	cooldown = false,
	lastFireTime = 0,
	connection = nil
}

local function findEquippedGlove()
	local character = LocalPlayer.Character
	if not character then return nil end
	for _, tool in ipairs(character:GetChildren()) do
		if tool:IsA("Tool") then
			return tool
		end
	end
end

local function getClosestPlayer()
	local myChar = LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not myRoot then return nil end

	local closest, dist = nil, math.huge
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
			if targetRoot then
				local mag = (targetRoot.Position - myRoot.Position).Magnitude
				if mag < dist then
					dist = mag
					closest = player
				end
			end
		end
	end
	return closest
end

local function findRelevantHitRemotes(gloveName)
	if critfarm.cachedRemotes[gloveName] then return critfarm.cachedRemotes[gloveName] end

	local nameLower = string.lower(gloveName or "")
	local hits = {}

	for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
		if obj:IsA("RemoteEvent") then
			local remoteLower = string.lower(obj.Name)
			if remoteLower == nameLower .. "hi"
			or (remoteLower:find(nameLower) and remoteLower:find("hit")) then
				table.insert(hits, obj)
			end
		end
	end

	critfarm.cachedRemotes[gloveName] = hits
	return hits
end

farmtab:Button("Glovel Crit Farm (Main Account.)", function()
	critfarm.enabled = not critfarm.enabled

	if critfarm.enabled and not critfarm.connection then
		critfarm.connection = RunService.Heartbeat:Connect(function()
			if critfarm.cooldown then return end

			local glove = findEquippedGlove()
			local targetPlayer = getClosestPlayer()

			if targetPlayer and targetPlayer.Character then
				local torso = targetPlayer.Character:FindFirstChild("Torso")
					or targetPlayer.Character:FindFirstChild("UpperTorso")
					or targetPlayer.Character:FindFirstChild("HumanoidRootPart")

				if torso then
					local remotes = {}

					if glove then
						local foundRemotes = findRelevantHitRemotes(glove.Name)
						if foundRemotes and #foundRemotes > 0 then
							remotes = foundRemotes
						end
					end

					if #remotes == 0 then
						for _, fallback in ipairs({"GeneralHit", "b", "KSHit"}) do
							local remote = ReplicatedStorage:FindFirstChild(fallback)
							if remote then
								table.insert(remotes, remote)
							end
						end
					end

					critfarm.cooldown = true
					task.spawn(function()
						for i = 1, 5 do
							for _, remote in ipairs(remotes) do
								remote:FireServer(targetPlayer.Character:FindFirstChild(torso.Name), true)
							end
							task.wait(0.575)
						end
						task.wait(2)
						critfarm.cooldown = false
					end)
				end
			end
		end)
	elseif not critfarm.enabled and critfarm.connection then
		critfarm.connection:Disconnect()
		critfarm.connection = nil
	end

	StarterGui:SetCore("SendNotification", {
		Title = "Crit Farm",
		Text = critfarm.enabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

farmtab:Button("Glovel Instant Quest #1 (Main Account.)", function()
local GlovelFunc = game:GetService("ReplicatedStorage"):WaitForChild("GlovelFunc")
local RunService = game:GetService("RunService")

local startTime = os.clock()
local duration = 3
local connections = {}

for i = 1, 10 do
    task.spawn(function()
        local conn
        conn = RunService.Heartbeat:Connect(function()
            if os.clock() - startTime > duration then
                conn:Disconnect()
                return
            end
            GlovelFunc:InvokeServer()
        end)
        table.insert(connections, conn)
    end)
end
end)

farmtab:Label("Ultra Instinct Farm: Semi-Blatant, Teleport To Baseplate.")

local Services = {
	Players = game:GetService("Players"),
	ReplicatedStorage = game:GetService("ReplicatedStorage"),
	StarterGui = game:GetService("StarterGui"),
	RunService = game:GetService("RunService")
}

local LocalPlayer = Services.Players.LocalPlayer
local ultrainst = {
	enabled = false,
	cachedRemotes = {},
	lastFireTime = 0,
	connection = nil
}

local function findEquippedGlove()
	local char = LocalPlayer.Character
	if not char then return nil end
	for _, tool in ipairs(char:GetChildren()) do
		if tool:IsA("Tool") then
			return tool
		end
	end
end

local function getClosestPlayer()
	local myChar = LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not myRoot then return nil end

	local closest, dist = nil, math.huge
	for _, player in ipairs(Services.Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
			if targetRoot then
				local mag = (targetRoot.Position - myRoot.Position).Magnitude
				if mag < dist then
					dist = mag
					closest = player
				end
			end
		end
	end
	return closest
end

local function findRelevantHitRemotes(gloveName)
	if ultrainst.cachedRemotes[gloveName] then return ultrainst.cachedRemotes[gloveName] end

	local nameLower = string.lower(gloveName or "")
	local hits = {}

	for _, obj in ipairs(Services.ReplicatedStorage:GetDescendants()) do
		if obj:IsA("RemoteEvent") then
			local remoteLower = string.lower(obj.Name)
			if remoteLower == nameLower .. "hi"
			or (remoteLower:find(nameLower) and remoteLower:find("hit")) then
				table.insert(hits, obj)
			end
		end
	end

	ultrainst.cachedRemotes[gloveName] = hits
	return hits
end

local function getTargetTorso(character)
	return character:FindFirstChild("Torso")
		or character:FindFirstChild("UpperTorso")
		or character:FindFirstChild("HumanoidRootPart")
end

local function fireRemotes(remotes, targetPart)
	for _, remote in ipairs(remotes) do
		remote:FireServer(targetPart)
	end
end

farmtab:Button("Auto Slap (Main OR Both Accounts.)", function()
	ultrainst.enabled = not ultrainst.enabled

	if ultrainst.enabled and not ultrainst.connection then
		ultrainst.connection = Services.RunService.Heartbeat:Connect(function()
			if os.clock() - ultrainst.lastFireTime < 1.5 then return end

			local glove = findEquippedGlove()
			local targetPlayer = getClosestPlayer()
			if not (glove and targetPlayer and targetPlayer.Character) then return end

			local torso = getTargetTorso(targetPlayer.Character)
			if not torso then return end

			local remotes = findRelevantHitRemotes(glove.Name)
			if #remotes == 0 then
				for _, fallback in ipairs({"GeneralHit", "b", "KSHit"}) do
					local remote = Services.ReplicatedStorage:FindFirstChild(fallback)
					if remote then
						table.insert(remotes, remote)
					end
				end
			end

			fireRemotes(remotes, torso)
			ultrainst.lastFireTime = os.clock()
		end)
	elseif not ultrainst.enabled and ultrainst.connection then
		ultrainst.connection:Disconnect()
		ultrainst.connection = nil
	end

	Services.StarterGui:SetCore("SendNotification", {
		Title = "Auto Slap",
		Text = ultrainst.enabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

farmtab:Button("Ultra Instinct Multi-Farm (Main Account.)", function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local targetPosition = Vector3.new(5001, 241, 4951)

RunService.Heartbeat:Connect(function()
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character:MoveTo(targetPosition)
    end
end)
end)

farmtab:Button("Ultra Instinct Multi-Farm (Alt Account.)", function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local targetBase = Vector3.new(5001, 241, 4951)
local offset = Vector3.new(0, 0, -4)

local function getClosestPlayer()
    local closest, shortest = nil, math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if dist < shortest then
                shortest = dist
                closest = player
            end
        end
    end
    return closest
end

RunService.Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if not (char and char:FindFirstChild("HumanoidRootPart")) then return end

    local hrp = char.HumanoidRootPart
    local targetPos = targetBase + offset
    local targetPlayer = getClosestPlayer()

    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local lookAt = targetPlayer.Character.HumanoidRootPart.Position
        hrp.CFrame = CFrame.new(targetPos, lookAt)
    else
        hrp.CFrame = CFrame.new(targetPos)
    end
end)
end)

farmtab:Label("Cloud Farm: Semi-Blatant, No Recommendations.")

farmtab:Button("Auto-Complete Quest #3 (Use In Cloud.)", function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")

local waypoints = {
    CFrame.new(-586, 115, 555),
    CFrame.new(485, 115, 558),
    CFrame.new(600, 115, -367),
    CFrame.new(-471, 115, -441)
}

local originalSeat = humanoid.SeatPart
local currentIndex = 1
local active = true

local function moveOverTime(startCFrame, endCFrame, duration)
    local elapsed = 0
    local step = RunService.Heartbeat

    while elapsed < duration and active do
        if humanoid.SeatPart ~= originalSeat then
            active = false
            break
        end

        local alpha = elapsed / duration
        local interpolated = startCFrame:Lerp(endCFrame, alpha)
        hrp.CFrame = interpolated

        elapsed += step:Wait()
    end

    hrp.CFrame = endCFrame
end

task.spawn(function()
    while active do
        if humanoid.SeatPart ~= originalSeat then
            active = false
            break
        end

        local nextIndex = currentIndex % #waypoints + 1
        local start = hrp.CFrame
        local target = waypoints[nextIndex]

        moveOverTime(start, target, 1.25)

        currentIndex = nextIndex
    end
end)
end)

farmtab:Label("Flash Farm: Silent, Teleport To Baseplate.")

farmtab:Button("Spam Flash Ability (Rejoin To Disable.)", function()
while true do
game:GetService("ReplicatedStorage").FlashTeleport:FireServer()
wait(3)
end
end)

farmtab:Button("Auto-Complete Flash Quests #1 & #2", function()
local rs = game:GetService("ReplicatedStorage")
local flashTeleport = rs:WaitForChild("FlashTeleport")

local loopCount = 500

for i = 1, loopCount do
    task.spawn(function()
        while true do
            flashTeleport:FireServer()
            task.wait()
        end
    end)
end
wait(3)
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local jobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
    print("Rejoining current server...")
    print("PlaceId:", placeId)
    print("JobId:", jobId)
    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
else
    print("Failed to get current server info or player.")
end
end)

farmtab:Label("Wormhole Farm: Silent, No Recommendations.")

farmtab:Button("Auto-Jump", function()
local vim = game:GetService("VirtualInputManager")
local player = game:GetService("Players").LocalPlayer

local function startJumpLoop()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:WaitForChild("Humanoid")

	while humanoid.Health > 0 do
		vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
		task.wait(0.05)
		vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
		task.wait(0.5)
	end
end

task.spawn(startJumpLoop)
end)

farmtab:Button("Instant Wormhole Place (Quest #3)", function()
local rs = game:GetService("ReplicatedStorage")
local wormhole = rs:WaitForChild("WormholePlace")

local loopCount = 50

for i = 1, loopCount do
    task.spawn(function()
        while true do
            wormhole:FireServer()
            task.wait()
        end
    end)
end
end)

farmtab:Label("Space Farm: Silent, Teleport To Baseplate.")
farmtab:Button("Spam Space Ability (For Quests #1 & #2)", function()
while true do
wait(0.05)
game:GetService("ReplicatedStorage"):WaitForChild("ZeroGSound"):FireServer()
end
end)

farmtab:Label("Run Farm: Semi-Blatant, Teleport To Baseplate.")

farmtab:Button("Run Farm Instructions", function()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Run Kill Farm";
	Text = "You Must Have Another Player In Your Run Dimension While Farming. Consider Using A Third Alt Account.";
	Duration = 30;
})
wait(0.2)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Run Kill Farm";
	Text = "Periodically Respawn The Portal And Bring The Third Alt In With You.";
	Duration = 30;
})
end)

farmtab:Textbox("Run Kill Farm (Set Username To Main, See Info For Instructions.)", function(v)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local function onCharacterSpawn(character)
	local rootPart = character:WaitForChild("HumanoidRootPart")

	local teleportPart = Workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")
	rootPart.CFrame = teleportPart.CFrame + Vector3.new(0, 1, 0)
	firetouchinterest(rootPart, teleportPart, 0)
	task.wait(0.1)
	firetouchinterest(rootPart, teleportPart, 1)

	task.wait(0.7)

	local target = Players:FindFirstChild(v)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		local targetRoot = target.Character.HumanoidRootPart
		local offset = targetRoot.CFrame.LookVector.Unit * 5
		local destination = targetRoot.Position + offset + Vector3.new(0, 7, 0)

		for i = 1, 100 do
			rootPart.CFrame = CFrame.new(destination, targetRoot.Position)
			task.wait(0.05)
		end
	end
end

LocalPlayer.CharacterAdded:Connect(onCharacterSpawn)

if LocalPlayer.Character then
	onCharacterSpawn(LocalPlayer.Character)
end
end)

farmtab:Button("Auto Run Mastery Quest #2 (Use At Baseplate.)", function()
while true do
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local args = {
	Vector3.new(root.Position.X, root.Position.Y, root.Position.Z)
}

ReplicatedStorage:WaitForChild("GeneralAbility"):FireServer(unpack(args))
wait(4)
end
end)

farmtab:Button("Spam Run Ability (Very Blatant.)", function()
while true do
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local args = {
	Vector3.new(root.Position.X, root.Position.Y - 5, root.Position.Z)
}

ReplicatedStorage:WaitForChild("GeneralAbility"):FireServer(unpack(args))
wait(4)
end
end)

farmtab:Label("Obby Farm: Blatant, Recommended To Join Small Servers.")

farmtab:Button("Place Parts Set-Up (Use Before Auto Place Parts.)", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(270, 13, 252))
end)

farmtab:Button("Auto Place Parts", function()
while true do
local args = {
	CFrame.new(270.023193359375, 16.503047943115234, 245.49522399902344, 0.9999936819076538, -2.8143032348992847e-10, -0.0035624837037175894, 4.036686349767615e-12, 1, -7.786525202391203e-08, 0.0035624837037175894, 7.786474043314229e-08, 0.9999936819076538),
	4
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
wait(2.5)
end
end)

farmtab:Button("Obby Kill Brick Farm", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local function runTeleportSequence(character)
	local rootPart = character:WaitForChild("HumanoidRootPart")

	local teleportPart = Workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")
	rootPart.CFrame = teleportPart.CFrame + Vector3.new(0, 1, 0)
	firetouchinterest(rootPart, teleportPart, 0)
	task.wait(0.1)
	firetouchinterest(rootPart, teleportPart, 1)

	task.wait(0.7)

	for _, otherPlayer in ipairs(Players:GetPlayers()) do
		if otherPlayer ~= LocalPlayer then
			local targetName = "ObbyItem" .. otherPlayer.Name .. "LavaSpinner"
			local obj = Workspace:FindFirstChild(targetName, true)
			if obj and obj:IsA("BasePart") then
				for i = 1, 5 do
					rootPart.CFrame = CFrame.new(obj.Position + Vector3.new(0, 5, 0))
					task.wait(0.05)
				end
				break
			end
		end
	end
end

LocalPlayer.CharacterAdded:Connect(runTeleportSequence)

if LocalPlayer.Character then
	runTeleportSequence(LocalPlayer.Character)
end
end)

farmtab:Label("Bus Farm: Silent, Teleport To Baseplate.")

farmtab:Button("Successful Bus Hit Farm (Main Account.)", function()
while true do
game:GetService("ReplicatedStorage"):WaitForChild("busmoment"):FireServer()
wait(6)
end
end)

farmtab:Button("Successful Bus Hit Farm (Alt Account.)", function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

character.PrimaryPart = character:WaitForChild("HumanoidRootPart")

local targetCFrame = CFrame.new(4999, 241, 5000)

RunService.Heartbeat:Connect(function()
    character:PivotTo(targetCFrame)
end)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local targetUsername = nil

farmtab:Textbox("Successful Bus Hit Farm (Set Username To Main.)", function(v)
	targetUsername = v
end)

RunService.Heartbeat:Connect(function()
	if not targetUsername then return end

	local targetPlayer = Players:FindFirstChild(targetUsername)
	if not targetPlayer or not targetPlayer.Character then return end

	local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	if not targetHRP then return end

	local character = localPlayer.Character
	if not character then return end

	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local forward = targetHRP.CFrame.LookVector.Unit * 20
	local newPos = targetHRP.Position + forward

	hrp.CFrame = CFrame.new(newPos)
end)

farmtab:Button("One Million Buses (VERY BLATANT)", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local remote = ReplicatedStorage:WaitForChild("busmoment")

local startTime = tick()
local lastFire = 0
local interval = 1 / 65

local connection

connection = RunService.Heartbeat:Connect(function()
    local now = tick()
    if now - startTime >= 2 then
        connection:Disconnect()
        return
    end

    if now - lastFire >= interval then
        lastFire = now
        remote:FireServer()
    end
end)
wait(2)
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local jobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
    print("Rejoining current server...")
    print("PlaceId:", placeId)
    print("JobId:", jobId)
    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
else
    print("Failed to get current server info or player.")
end
end)

farmtab:Label("Bonk Farm: Silent, Teleport To Baseplate.")

farmtab:Button("Spam BONK Ability (For Quest #3.) (Rejoin To Disable.)", function()
while true do
game:GetService("ReplicatedStorage").BONK:FireServer()
wait(0.05)
end
end)

farmtab:Button("Bonk Quest #1 (Rejoin To Disable.)", function()
while true do
game:GetService("ReplicatedStorage").BONK:FireServer()
wait(12)
end
end)

farmtab:Label("Bomb Farm: Silent, Teleport To Baseplate.")
farmtab:Button("One Million Bombs (Main Account.)", function()
local bombrem = game:GetService("ReplicatedStorage"):WaitForChild("BombThrow")
local RunService = game:GetService("RunService")
local startTime = os.clock()
local duration = 1
local connections = {}

for i = 1, 25000 do
    task.spawn(function()
        local conn
        conn = RunService.Heartbeat:Connect(function()
            if os.clock() - startTime > duration then
                conn:Disconnect()
                return
            end
            bombrem:FireServer()
        end)
        table.insert(connections, conn)
    end)
end
end)

farmtab:Button("Auto Bomb Sniping (Main Account.)", function()
while true do 
game:GetService("ReplicatedStorage").BombThrow:FireServer()
wait(9.2)
game:GetService("ReplicatedStorage").BombThrow:FireServer()
end
end)

farmtab:Button("Set Up Bomb Snipe (Main Account.)", function()
while true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4788, 241, 5017)
wait(0.05)
end
end)

farmtab:Button("Set Up Bomb Snipe (Alt Account.)", function()
while true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4785, 241, 4812)
wait(0.05)
end
end)

farmtab:Label("Shard Farm: Silent, Teleport To Baseplate.")
farmtab:Button("Spam Shard (Main Account.)", function()
while true do
game:GetService("ReplicatedStorage").Shards:FireServer()
wait(3.75)
end
end)

farmtab:Textbox("Shard Multi-Farm (Set Username To Main.)", function(v)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    local function getTargetCFrame(username)
        local target = Players:FindFirstChild(username)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            return target.Character.HumanoidRootPart.CFrame
        end
        return nil
    end

    local function teleportLoop()
        while true do
            local cf = getTargetCFrame(v)
            if cf and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local offset = cf.LookVector * 7
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(cf.Position + offset)
            end
            task.wait(0.5)
        end
    end

    task.spawn(teleportLoop)
end)

farmtab:Textbox("Shard Snipe Farm (Set Username To Main.)", function(v)
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local LocalPlayer = Players.LocalPlayer

    local function getTargetCFrame(username)
        local target = Players:FindFirstChild(username)
        if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            return target.Character.HumanoidRootPart.CFrame
        end
        return nil
    end

    local function teleportLoop()
        while true do
            local cf = getTargetCFrame(v)
            if cf and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local offset = cf.LookVector * 165
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(cf.Position + offset)
            end
            task.wait(0.5)
        end
    end

    task.spawn(teleportLoop)
end)


farmtab:Label("Voodoo Farm: Silent, Teleport To Baseplate.")

farmtab:Button("Voodoo Multi-Farm (Main Account.)", function()
local VirtualInputManager = game:GetService("VirtualInputManager")

while true do
    for _ = 1, 2 do
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        task.wait(0.1)
    end

    for _ = 1, 2 do
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
        task.wait(0.05)
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0)
        task.wait(0.05)
		wait(1.05)
    end

    task.wait(10)
end
end)

farmtab:Button("Voodoo Multi-Farm (Alt Account.)", function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function getClosestPlayer()
    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end

    local hrp = character.HumanoidRootPart
    local closest, shortest = nil, math.huge

    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetHRP = otherPlayer.Character.HumanoidRootPart
            local distance = (hrp.Position - targetHRP.Position).Magnitude
            if distance < shortest then
                shortest = distance
                closest = targetHRP
            end
        end
    end

    return closest
end

while true do
    local targetHRP = getClosestPlayer()
    local character = player.Character
    if targetHRP and character and character:FindFirstChild("HumanoidRootPart") then
        local lookVector = targetHRP.CFrame.LookVector
        local offset = lookVector * 5
        character.HumanoidRootPart.CFrame = targetHRP.CFrame + offset
    end
    task.wait(11.05)
end
end)

farmtab:Label("Useful Scripts, Not Made By Me.")
farmtab:Button("UBH (Badge Obtaining Hub, Use At Your Own Risk.)", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/UltimateBadgeHub/main/main.lua'))()
end)

farmtab:Button("Mastery Farming GUI (Mastery Farming, Use At Your Own Risk.)", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Ekanite-a/Scripts/refs/heads/main/Slap%20battles/Mastery_helper.lua'))()
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)

helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)

elseif currentPlaceId == evilbarzil then

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Evil Barzil)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
	ToggledSideBar = true
})

local maintab = win:Tab("Main")
local steptab = win:Tab("Steps")
local tooltab = win:Tab("Tools")
local modetab = win:Tab("Modes")
local misctab = win:Tab("Others")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
steptab:Label("Click The Steps In Order!")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")
modetab:Label("These Places Can Be Joined Instantly!")

local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer

local function teleportTo(placeId)
    TeleportService:Teleport(placeId, LocalPlayer)
end

modetab:Button("Main Game", function()
    teleportTo(6403373529)
end)

modetab:Button("Killstreak Only", function()
    teleportTo(11520107397)
end)

modetab:Button("No One Shot Gloves", function()
    teleportTo(9015014224)
end)

modetab:Button("Slap Royale Matchmaking", function()
    teleportTo(9426795465)
end)

modetab:Button("Normal Barzil", function()
    teleportTo(7234087065)
end)

modetab:Button("Tower Of Hell (TOH)", function()
    teleportTo(115782629143468)
end)

modetab:Button("Binded Maze", function()
    teleportTo(74169485398268)
end)

modetab:Button("Ice Trials", function()
    teleportTo(17290438723)
end)

modetab:Button("Suction Cup Trials", function()
game:GetService("ReplicatedStorage").Events.suction_obby_tp:FireServer()
end)

modetab:Button("Custom Glove Customizer", function()
    teleportTo(9068206286)
end)

modetab:Button("Slap League", function()
    teleportTo(18698003301)
end)

modetab:Button("Soft Update Waiting Place", function()
    teleportTo(12712288037)
end)

modetab:Button("?", function()
    teleportTo(12845859004)
end)

modetab:Label("Warning: The Below Places Can't Be Joined Directly.")

modetab:Button("Testing Place", function()
    teleportTo(9020359053)
end)

modetab:Button("Tower Defense", function()
    teleportTo(15228348051)
end)

modetab:Button("Christmas Eve", function()
    teleportTo(15507333474)
end)

modetab:Button("Null Zone", function()
    teleportTo(14422118326)
end)

steptab:Button("Grab Key", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

local function hasLocalScript(tool)
    for _, child in ipairs(tool:GetDescendants()) do
        if child:IsA("LocalScript") then
            return true
        end
    end
    return false
end

local targetTool = nil
for _, obj in ipairs(Workspace:GetDescendants()) do
    if obj:IsA("Tool") and obj.Name == "Key" and hasLocalScript(obj) then
        targetTool = obj
        break
    end
end

if not targetTool then return end

local targetPart = targetTool:FindFirstChild("Handle")
if not targetPart then
    for _, child in ipairs(targetTool:GetChildren()) do
        if child:IsA("BasePart") then
            targetPart = child
            break
        end
    end
end

if not targetPart then return end

HRP.CFrame = targetPart.CFrame + Vector3.new(0, 3, 0)
end)

steptab:Button("Unlock Fence", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

local target = Workspace:WaitForChild("GateMechanism"):WaitForChild("Touchpad")
HRP.CFrame = target.CFrame + Vector3.new(0, 3, 0)
end)

steptab:Button("Skip Obby", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(530, 35, -5)
end)

steptab:Button("Skip Fire", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(844, 58, -78)
end)

steptab:Button("Enter Tower", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
Character:WaitForChild("HumanoidRootPart")

local targetPart = Workspace:WaitForChild("TheOutside"):WaitForChild("TowerENT1"):WaitForChild("finish_zone")

Character:SetPrimaryPartCFrame(targetPart.CFrame + Vector3.new(0, 3, 0))
end)

steptab:Button("Skip Tower Steps (Get First Item In Tools!)", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Camera = Workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Backpack = LocalPlayer:WaitForChild("Backpack")

local screwdriver = Backpack:FindFirstChild("Screwdriver") or Character:FindFirstChild("Screwdriver")
if screwdriver and screwdriver:IsA("Tool") then
    Character:WaitForChild("Humanoid"):EquipTool(screwdriver)
end

Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(2202, 73, 41)

local target = Workspace:WaitForChild("Clickable"):WaitForChild("boltClick")
local screenPos = Camera:WorldToScreenPoint(target.Position)

VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 0)
VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 0)
wait(0.5)
Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2203, 61, 40)
end)

steptab:Button("Break Window (Get Second Item In Tools)", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

local targetPos = Vector3.new(4772, 5321, -351)
local lookAt = Workspace.TheOffice.HallwaySection3.BreakableWindow1.Frame.Position

HRP.CFrame = CFrame.new(targetPos, lookAt)

task.wait(1)

local screenPos = Workspace.CurrentCamera:WorldToScreenPoint(targetPos)
VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 0)
VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 0)
end)

steptab:Button("Enter Boss Fight Area", function()
game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(4754, 5549, -306)
end)

tooltab:Button("Screwdriver", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

local screwdriver = Workspace:FindFirstChild("Screwdriver")
if not screwdriver then
    return
end

HRP.CFrame = screwdriver.CFrame + Vector3.new(0, 3, 0)

local prompt = screwdriver:FindFirstChildOfClass("ProximityPrompt")
if prompt then
    fireproximityprompt(prompt)
else
end
end)

tooltab:Button("Large Hammer", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4974, 5321, -194)
fireproximityprompt(workspace.TheOffice.HallwaySection3.LargeHammerBox1["Large Hammer"].ProximityPrompt)
end)

tooltab:Button("Grappling Hook (Optional, If Legit Grinding)", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4975, 5321, -560)
fireproximityprompt(workspace.TheOffice.HallwaySection3:GetChildren()[7].Hook.ProximityPrompt)
end)

maintab:Button("Remove Screenshake", function()
game:GetService("ReplicatedStorage").Remotes.ShakeCamera:Destroy()
end)

maintab:Button("Cursed Dice", function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local cursedDice = workspace:FindFirstChild("Cursed Dice")
if cursedDice then
    hrp.CFrame = cursedDice.CFrame + Vector3.new(0, 3, 0)

    for _, descendant in ipairs(cursedDice:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            descendant.HoldDuration = 0
        end
    end
end
end)

maintab:Button("Auto Slap Hand", function()
	local Services = {
		Players = game:GetService("Players"),
		Workspace = game:GetService("Workspace"),
		VirtualInputManager = game:GetService("VirtualInputManager"),
		StarterGui = game:GetService("StarterGui")
	}

	local Camera = Services.Workspace.CurrentCamera
	local LocalPlayer = Services.Players.LocalPlayer
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local target = Services.Workspace:WaitForChild("bossStorage"):WaitForChild("leftHand"):WaitForChild("PointerMimic")

	local handslap = {
		TOUCH_DISTANCE = 25,
		CLICK_COOLDOWN = 0.45
	}

	_G.autoSlapEnabled = not _G.autoSlapEnabled

	Services.StarterGui:SetCore("SendNotification", {
		Title = "Auto Slap Hand",
		Text = _G.autoSlapEnabled and "Enabled." or "Disabled.",
		Duration = 2
	})

	local function getClosestDistance(modelA, modelB)
		local minDistance = math.huge
		for _, partA in ipairs(modelA:GetDescendants()) do
			if partA:IsA("BasePart") then
				for _, partB in ipairs(modelB:GetDescendants()) do
					if partB:IsA("BasePart") then
						local dist = (partA.Position - partB.Position).Magnitude
						if dist < minDistance then
							minDistance = dist
						end
					end
				end
			end
		end
		return minDistance
	end

	if _G.autoSlapEnabled then
		task.spawn(function()
			while _G.autoSlapEnabled do
				local distance = getClosestDistance(Character, target)
				if distance <= handslap.TOUCH_DISTANCE then
					local screenPos = Camera:WorldToScreenPoint(target.Position)
					Services.VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 0)
					Services.VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 0)
					task.wait(handslap.CLICK_COOLDOWN)
				else
					task.wait(0.1)
				end
			end
		end)
	end
end)

_G.autoSlapEnabled = disabled

maintab:Button("Closest Nail", function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

local nailFolder = Workspace:WaitForChild("bossStorage"):WaitForChild("nail")
local closestObject = nil
local minDist = math.huge

for _, obj in ipairs(nailFolder:GetChildren()) do
    if obj:IsA("BasePart") then
        local dist = (obj.Position - HRP.Position).Magnitude
        if dist < minDist then
            minDist = dist
            closestObject = obj
        end
    end
end

if closestObject then
    HRP.CFrame = CFrame.new(closestObject.Position)
end
end)

misctab:Button("Infinite Yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

misctab:Button("Nameless Admin", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

misctab:Button("Rejoin Server", function()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local jobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
    print("Rejoining current server...")
    print("PlaceId:", placeId)
    print("JobId:", jobId)
    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
else
    print("Failed to get current server info or player.")
end
end)

misctab:Button("Switch Servers", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local currentJobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

local function findDifferentServer()
    local cursor = nil

    while true do
        local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", placeId)
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = {
                    ["User-Agent"] = "Mozilla/5.0"
                }
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            task.wait(2)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Waiting...")
            task.wait(3)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode. Retrying...")
            task.wait(2)
            continue
        end

        for _, server in pairs(data.data) do
            if server.id ~= currentJobId and server.playing < server.maxPlayers then
                print("Found different server:", server.id)
                return server.id
            end
        end

        cursor = data.nextPageCursor
        task.wait(1)

        if not cursor then break end
    end

    return nil
end

local newJobId = findDifferentServer()
if newJobId and player then
    print("Teleporting to different server...")
    TeleportService:TeleportToPlaceInstance(placeId, newJobId, player)
else
    print("No different server found or player missing.")
end
end)

misctab:Button("Join Small Server (MAY GET RATE LIMITED!)", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

_G.extracted1 = game.PlaceId
_G.extracted2 = nil

local userAgents = {
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
    "Mozilla/5.0 (X11; Linux x86_64)",
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
    "Mozilla/5.0 (Android 11; Mobile; rv:89.0)",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)",
    "Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/114.0.0.0 Safari/537.36"
}

local function fetchSmartServer()
    local cursor = nil
    local smallestServer = nil
    local minPlayers = math.huge
    local retryCount = 0

    while true do
        local baseUrl = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", _G.extracted1)
        local url = baseUrl
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local headers = {
            ["User-Agent"] = userAgents[math.random(1, #userAgents)],
            ["X-Requested-With"] = "XMLHttpRequest"
        }

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = headers
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 4) + retryCount)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Backing off...")
            retryCount += 1
            task.wait(math.random(3, 6) + retryCount)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode server data. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 5) + retryCount)
            continue
        end

        retryCount = 0

        for _, server in pairs(data.data) do
            print("Checking server:", server.id, "Players:", server.playing, "/", server.maxPlayers)

            if server.playing >= 1 and server.playing <= 2 and server.playing < server.maxPlayers then
                print("Found ideal server with 1–2 players. Joining now.")
                return server
            end

            if server.playing < minPlayers and server.playing < server.maxPlayers then
                minPlayers = server.playing
                smallestServer = server
            end
        end

        cursor = data.nextPageCursor
        task.wait(math.random(1, 2))

        if not cursor then break end
    end

    return smallestServer
end

local server = fetchSmartServer()
if server then
    _G.extracted2 = server.id
    print("Extracted PlaceId:", _G.extracted1)
    print("Extracted JobId:", _G.extracted2)

    local player = Players.LocalPlayer or Players:GetPlayers()[1]

    if typeof(_G.extracted1) == "number" and typeof(_G.extracted2) == "string" and player then
        print("Teleporting to server...")
        TeleportService:TeleportToPlaceInstance(_G.extracted1, _G.extracted2, player)
    else
        print("Invalid data or player not found.")
    end
else
    print("No suitable server found.")
end
end)

misctab:Button("Destroy GUI", function()
    win:Exit()
end)

misctab:Button("Leave Game", function()
    game:Shutdown()
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)

helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)

elseif currentPlaceId == slaproyale then

for _, obj in ipairs(game:GetDescendants()) do
	if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
		obj:Destroy()
	end
end

local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Slap Royale)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
	ToggledSideBar = true
})

local maintab = win:Tab("Main")
local itemtab = win:Tab("Items")
local modetab = win:Tab("Modes")
local misctab = win:Tab("Others")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
itemtab:Label("Reveal Bunker Code: Reveals The Bunker Code.")
misctab:Label("Other Features.")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")
modetab:Label("These Places Can Be Joined Instantly!")

local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer

local function teleportTo(placeId)
    TeleportService:Teleport(placeId, LocalPlayer)
end

modetab:Button("Main Game", function()
    teleportTo(6403373529)
end)

modetab:Button("Killstreak Only", function()
    teleportTo(11520107397)
end)

modetab:Button("No One Shot Gloves", function()
    teleportTo(9015014224)
end)

modetab:Button("Slap Royale Matchmaking", function()
    teleportTo(9426795465)
end)

modetab:Button("Normal Barzil", function()
    teleportTo(7234087065)
end)

modetab:Button("Tower Of Hell (TOH)", function()
    teleportTo(115782629143468)
end)

modetab:Button("Binded Maze", function()
    teleportTo(74169485398268)
end)

modetab:Button("Ice Trials", function()
    teleportTo(17290438723)
end)

modetab:Button("Suction Cup Trials", function()
game:GetService("ReplicatedStorage").Events.suction_obby_tp:FireServer()
end)

modetab:Button("Custom Glove Customizer", function()
    teleportTo(9068206286)
end)

modetab:Button("Slap League (Functional, Needs Another Player.)", function()
    teleportTo(18698003301)
end)

modetab:Button("Soft Update Waiting Place", function()
    teleportTo(12712288037)
end)

modetab:Button("?", function()
    teleportTo(12845859004)
end)

modetab:Label("Warning: The Below Places Can't Be Joined Directly.")

modetab:Button("Testing Place", function()
    teleportTo(9020359053)
end)

modetab:Button("Tower Defense", function()
    teleportTo(15228348051)
end)

modetab:Button("Christmas Eve", function()
    teleportTo(15507333474)
end)

modetab:Button("Null Zone", function()
    teleportTo(14422118326)
end)

local a = maintab:Folder("Movement Features.", Color3.fromRGB(24, 255, 228), true)
local b = maintab:Folder("Combat Features.", Color3.fromRGB(24, 255, 228), true)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localplayer = Players.LocalPlayer

local function gethrpandhumanoid()
    local char = localplayer.Character
    if not char then return nil, nil end
    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not (humanoid and hrp) then return nil, nil end
    return hrp, humanoid
end

local constantenabled = false
local constantconn = nil
local constantspeed = 20

local function updateconstantspeed()
    if constantconn then
        constantconn:Disconnect()
        constantconn = nil
    end
    if not constantenabled or constantspeed <= 0 then return end
    local hrp, humanoid = gethrpandhumanoid()
    if not (hrp and humanoid) then return end
    constantconn = RunService.Heartbeat:Connect(function()
        if not (hrp and hrp.Parent and humanoid and humanoid.Parent) then return end
        local movedir = humanoid.MoveDirection
        local curvel = hrp.Velocity
        if movedir.Magnitude > 0 then
            local target = movedir.Unit * constantspeed
            hrp.Velocity = Vector3.new(target.X, curvel.Y, target.Z)
        else
            hrp.Velocity = Vector3.new(0, curvel.Y, 0)
        end
    end)
end

local pulseenabled = false
local pulseconn = nil
local pulsespeed = 20
local pulseduration = 1.8
local pulsecooldown = 2.0
local lastpulsetime = 0
local ispulseactive = false

local function updatepulsespeed()
    if pulseconn then
        pulseconn:Disconnect()
        pulseconn = nil
    end
    if not pulseenabled or pulsespeed <= 0 then return end
    local hrp, humanoid = gethrpandhumanoid()
    if not (hrp and humanoid) then return end
    pulseconn = RunService.Heartbeat:Connect(function()
        if not (hrp and hrp.Parent and humanoid and humanoid.Parent) then return end
        local now = tick()
        if ispulseactive then
            local movedir = humanoid.MoveDirection
            if movedir.Magnitude > 0.01 then
                local target = movedir.Unit * pulsespeed
                hrp.AssemblyLinearVelocity = Vector3.new(
                    target.X,
                    hrp.AssemblyLinearVelocity.Y,
                    target.Z
                )
            else
                hrp.AssemblyLinearVelocity = Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
            end
            if now - lastpulsetime >= pulseduration then
                hrp.AssemblyLinearVelocity = Vector3.new(0, hrp.AssemblyLinearVelocity.Y, 0)
                ispulseactive = false
                lastpulsetime = now
            end
        else
            if now - lastpulsetime >= pulsecooldown and humanoid.MoveDirection.Magnitude > 0.01 then
                ispulseactive = true
                lastpulsetime = now
            end
        end
    end)
end

local function disableallspeed()
    constantenabled = false
    pulseenabled = false
    ispulseactive = false
    if constantconn then constantconn:Disconnect() constantconn = nil end
    if pulseconn then pulseconn:Disconnect() pulseconn = nil end
end

a:Dropdown("Speed Method", {"Off", "Constant", "Acceleration"}, function(selected)
    disableallspeed()
    if selected == "Constant" then
        constantenabled = true
        updateconstantspeed()
    elseif selected == "Acceleration" then
        pulseenabled = true
        updatepulsespeed()
    end
end)

a:Slider("Constant Speed", 20, 5, 30, 1, function(v)
    constantspeed = (v == 8) and 16 or v
    if constantenabled then
        updateconstantspeed()
    end
end)

a:Slider("Acceleration Speed", 20, 5, 40, 1, function(v)
    pulsespeed = (v == 8) and 16 or v
    if pulseenabled then
        updatepulsespeed()
    end
end)

local function oncharadded(char)
    task.wait(0.1)
    if constantenabled then
        updateconstantspeed()
    end
    if pulseenabled then
        updatepulsespeed()
    end
end

if localplayer.Character then
    oncharadded(localplayer.Character)
end

localplayer.CharacterAdded:Connect(oncharadded)

localplayer.CharacterRemoving:Connect(function()
    if constantconn then constantconn:Disconnect() constantconn = nil end
    if pulseconn then pulseconn:Disconnect() pulseconn = nil end
end)

a:Toggle("Infinite Jump", function()
	getgenv().infiniteJumpEnabled = not getgenv().infiniteJumpEnabled

	local lp = game:GetService("Players").LocalPlayer
	local uis = game:GetService("UserInputService")

	local hum, root, animTrack

	local function bindCharacter(char)
		hum = char:WaitForChild("Humanoid")
		root = char:WaitForChild("HumanoidRootPart")

		local animate = char:FindFirstChild("Animate")
		if animate and animate:FindFirstChild("jump") and animate.jump:FindFirstChild("JumpAnim") then
			local animId = animate.jump.JumpAnim.AnimationId
			local anim = Instance.new("Animation")
			anim.AnimationId = animId
			animTrack = hum:LoadAnimation(anim)
		end
	end

	bindCharacter(lp.Character or lp.CharacterAdded:Wait())
	lp.CharacterAdded:Connect(bindCharacter)

	if not getgenv()._infiniteJumpBound then
		getgenv()._infiniteJumpBound = true
		uis.InputBegan:Connect(function(input, gp)
			if gp or input.KeyCode ~= Enum.KeyCode.Space then return end
			if not getgenv().infiniteJumpEnabled or not root then return end

			if animTrack then
				animTrack:Stop()
				animTrack:Play()
			end

			root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 50, root.AssemblyLinearVelocity.Z)
		end)
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Infinite Jump",
		Text = getgenv().infiniteJumpEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local SlapRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Slap")

local slapaura = {
	enabled = false,
	connection = nil,
	radius = 20,
	cooldown = 0.5,
	lastFire = 0
}

local function getClosestPlayer(radius)
	local myChar = LocalPlayer.Character
	local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
	if not myRoot then return nil end

	local closest, closestDist = nil, radius

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local root = player.Character:FindFirstChild("HumanoidRootPart")
			if root then
				local dist = (root.Position - myRoot.Position).Magnitude
				if dist <= closestDist then
					closestDist = dist
					closest = player
				end
			end
		end
	end

	return closest
end

b:Toggle("Slap Aura", function()
	slapaura.enabled = not slapaura.enabled

	if slapaura.enabled and not slapaura.connection then
		slapaura.connection = RunService.Heartbeat:Connect(function()
			local now = tick()
			if now - slapaura.lastFire < slapaura.cooldown then
				return
			end

			local targetPlayer = getClosestPlayer(slapaura.radius)
			if not targetPlayer or not targetPlayer.Character then return end

			local limb =
				targetPlayer.Character:FindFirstChild("Right Leg")
				or targetPlayer.Character:FindFirstChild("HumanoidRootPart")

			if limb then
				slapaura.lastFire = now
				SlapRemote:FireServer(limb)
			end
		end)
	elseif not slapaura.enabled and slapaura.connection then
		slapaura.connection:Disconnect()
		slapaura.connection = nil
	end
end)

b:Slider("Slap Aura Radius", 0, 0, 20, 0.5, function(v)
	slapaura.radius = v
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

local hitbox = {
	enabled = false,
	size = 0,
	connection = nil
}

local function getTorso(char)
	return char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
end

local function updateHitboxes()
	if not hitbox.enabled then return end

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local torso = getTorso(plr.Character)
			if torso then
				torso.Size = Vector3.new(hitbox.size, hitbox.size, hitbox.size)
				torso.CanCollide = false
				torso.Massless = true
				torso.Transparency = 0.5
			end
		end
	end
end

b:Toggle("Expand Hitboxes", function(v)
	hitbox.enabled = v

	if v then
		if not hitbox.connection then
			hitbox.connection = RunService.Heartbeat:Connect(updateHitboxes)
		end
	else
		if hitbox.connection then
			hitbox.connection:Disconnect()
			hitbox.connection = nil
		end
	end

	StarterGui:SetCore("SendNotification", {
		Title = "Expand Hitboxes",
		Text = v and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

b:Slider("Hitbox Size", 0, 0, 20, 0.5, function(v)
	hitbox.size = v
end)

maintab:Label("Player ESP: Highlights Other Players.")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local espEnabled = false
local espObjects = {}

local function applyESP(plr)
	if plr == LocalPlayer then return end
	if not plr.Character then return end

	local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
	if not humanoid or humanoid.Health <= 0 then return end

	local highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.new(1, 1, 1)
	highlight.OutlineColor = Color3.new(1, 1, 1)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Adornee = plr.Character
	highlight.Parent = plr.Character

	espObjects[plr] = highlight

	humanoid.HealthChanged:Connect(function(hp)
		if hp <= 0 then
			if espObjects[plr] then
				espObjects[plr]:Destroy()
				espObjects[plr] = nil
			end
		end
	end)
end

local function clearESP()
	for _, h in pairs(espObjects) do
		if h then h:Destroy() end
	end
	table.clear(espObjects)
end

maintab:Toggle("Player ESP", false, function(v)
	espEnabled = v

	if v then
		for _, plr in ipairs(Players:GetPlayers()) do
			applyESP(plr)
		end
	else
		clearESP()
	end
end)

maintab:Label("Exit Bus: Exits The Bus Earlier Than Others.")

maintab:Button("Exit Bus", function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BusJumping"):FireServer()
end)

itemtab:Button("Reveal Bunker Code", function()
	local Players = game:GetService("Players")
	local StarterGui = game:GetService("StarterGui")
	local LocalPlayer = Players.LocalPlayer

	local gui = workspace.Map.CodeBrick.SurfaceGui

	local imageMap = {
		["http://www.roblox.com/asset/?id=9648769161"] = "4",
		["http://www.roblox.com/asset/?id=9648765536"] = "2",
		["http://www.roblox.com/asset/?id=9648762863"] = "3",
		["http://www.roblox.com/asset/?id=9648759883"] = "9",
		["http://www.roblox.com/asset/?id=9648755440"] = "8",
		["http://www.roblox.com/asset/?id=9648752438"] = "2",
		["http://www.roblox.com/asset/?id=9648749145"] = "8",
		["http://www.roblox.com/asset/?id=9648745618"] = "3",
		["http://www.roblox.com/asset/?id=9648742013"] = "7",
		["http://www.roblox.com/asset/?id=9648738553"] = "8",
		["http://www.roblox.com/asset/?id=9648734698"] = "2",
		["http://www.roblox.com/asset/?id=9648730082"] = "6",
		["http://www.roblox.com/asset/?id=9648723237"] = "3",
		["http://www.roblox.com/asset/?id=9648718450"] = "6",
		["http://www.roblox.com/asset/?id=9648715920"] = "6",
		["http://www.roblox.com/asset/?id=9648712563"] = "2"
	}

	local templates = {}
	for _, child in ipairs(gui:GetChildren()) do
		if child:IsA("ImageLabel") and imageMap[child.Image] then
			table.insert(templates, child)
		end
	end

	table.sort(templates, function(a, b)
		return a.AbsolutePosition.Y < b.AbsolutePosition.Y
	end)

	local code = {}
	for i = 1, math.min(4, #templates) do
		local digit = imageMap[templates[i].Image]
		if digit then
			table.insert(code, digit)
		end
	end

	local codeString = table.concat(code)

	StarterGui:SetCore("SendNotification", {
		Title = "Bunker Code",
		Text = codeString ~= "" and ("Code: " .. codeString) or "Failed To Get Code.",
		Duration = 20,
		Button1 = "ok"
	})
end)

local c = itemtab:Folder("Item Based Features.", Color3.fromRGB(24, 255, 228), true)

c:Label("Item ESP: Shows Items Through Walls.")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local itemsFolder = workspace:WaitForChild("Items")

local itemESP = {
	enabled = false,
	objects = {},
	connection = nil
}

local function clearESP()
	for _, obj in pairs(itemESP.objects) do
		if obj.box then obj.box:Destroy() end
		if obj.gui then obj.gui:Destroy() end
	end
	itemESP.objects = {}
end

local function createESP(tool)
	if itemESP.objects[tool] then return end
	if not tool:IsA("Tool") then return end

	local handle = tool:FindFirstChild("Handle")
	if not handle then return end

	local box = Instance.new("BoxHandleAdornment")
	box.Name = "ItemESPBox"
	box.Adornee = handle
	box.Size = handle.Size + Vector3.new(0.2, 0.2, 0.2)
	box.AlwaysOnTop = true
	box.ZIndex = 5
	box.Transparency = 0.6
	box.Color3 = Color3.fromRGB(0, 255, 0)
	box.Parent = handle

	local gui = Instance.new("BillboardGui")
	gui.Name = "ItemESPText"
	gui.Adornee = handle
	gui.Size = UDim2.new(0, 75, 0, 15)
	gui.StudsOffset = Vector3.new(0, handle.Size.Y + 1.5, 0)
	gui.AlwaysOnTop = true

	local text = Instance.new("TextLabel")
	text.Size = UDim2.fromScale(1, 1)
	text.BackgroundTransparency = 1
	text.Text = tool.Name
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.TextStrokeTransparency = 0
	text.TextScaled = true
	text.Font = Enum.Font.GothamBold
	text.Parent = gui

	gui.Parent = handle

	itemESP.objects[tool] = {
		box = box,
		gui = gui
	}
end

local function updateESP()
	for _, tool in ipairs(itemsFolder:GetChildren()) do
		createESP(tool)
	end

	for tool, obj in pairs(itemESP.objects) do
		if not tool.Parent then
			if obj.box then obj.box:Destroy() end
			if obj.gui then obj.gui:Destroy() end
			itemESP.objects[tool] = nil
		end
	end
end

c:Toggle("Item ESP", function()
	itemESP.enabled = not itemESP.enabled

	if itemESP.enabled then
		updateESP()
		itemESP.connection = RunService.Heartbeat:Connect(updateESP)
	else
		if itemESP.connection then
			itemESP.connection:Disconnect()
			itemESP.connection = nil
		end
		clearESP()
	end
end)

c:Label("Item Usage: Recommended To Use Away From Others.")

c:Button("Use Permanent Items", function()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Backpack = LocalPlayer:WaitForChild("Backpack")
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	local keywords = {"speed potion","frog potion","bull's essence","potion of strength","boba"}

	local function matches(name)
		local lower = string.lower(name)
		for _, k in ipairs(keywords) do
			if string.find(lower, k, 1, true) then return true end
		end
		return false
	end

	local tools = {}
	for _, t in Backpack:GetChildren() do
		if t:IsA("Tool") and matches(t.Name) then table.insert(tools, t) end
	end

	for _, tool in ipairs(tools) do
		tool.Parent = Character
		task.defer(tool.Activate, tool)
		task.wait(0.75)
	end
end)

c:Button("Use Strength Items", function()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Backpack = LocalPlayer:WaitForChild("Backpack")
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	local keywords = {"bull's essence","potion of strength","boba"}

	local function matches(name)
		local lower = string.lower(name)
		for _, k in ipairs(keywords) do
			if string.find(lower, k, 1, true) then return true end
		end
		return false
	end

	local tools = {}
	for _, t in Backpack:GetChildren() do
		if t:IsA("Tool") and matches(t.Name) then table.insert(tools, t) end
	end

	for _, tool in ipairs(tools) do
		tool.Parent = Character
		task.defer(tool.Activate, tool)
		task.wait(0.75)
	end
end)

c:Button("Use Speed / Jump Items", function()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Backpack = LocalPlayer:WaitForChild("Backpack")
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	local keywords = {"speed potion","frog potion","boba"}

	local function matches(name)
		local lower = string.lower(name)
		for _, k in ipairs(keywords) do
			if string.find(lower, k, 1, true) then return true end
		end
		return false
	end

	local tools = {}
	for _, t in Backpack:GetChildren() do
		if t:IsA("Tool") and matches(t.Name) then table.insert(tools, t) end
	end

	for _, tool in ipairs(tools) do
		tool.Parent = Character
		task.defer(tool.Activate, tool)
		task.wait(0.75)
	end
end)

c:Button("Use Ice Cubes (Can Combo When Used Correctly.)", function()
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Backpack = LocalPlayer:WaitForChild("Backpack")
	local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

	local keywords = {"cube of ice"}

	local function matches(name)
		local lower = string.lower(name)
		for _, k in ipairs(keywords) do
			if string.find(lower, k, 1, true) then return true end
		end
		return false
	end

	local tools = {}
	for _, t in Backpack:GetChildren() do
		if t:IsA("Tool") and matches(t.Name) then table.insert(tools, t) end
	end

	for _, tool in ipairs(tools) do
		tool.Parent = Character
		task.defer(tool.Activate, tool)
		task.wait(0.75)
	end
end)

c:Label("Item Dropping: Recommended To Use Away From Others.")

c:Button("Drop All Items", function()
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Backpack = LocalPlayer:WaitForChild("Backpack")

local dropDelay = 0.1

local toolstodrop = {
	"speed potion",
	"frog potion",
	"bull's essence",
	"potion of strength",
	"boba",
	"true power",
	"cube of ice",
	"sphere of fury",
	"lightning potion",
	"health potion",
	"bandage",
	"apple",
	"bomb",
	"forcefield crystal",
	"first aid kit"
}

local dropLookup = {}
for _, name in ipairs(toolstodrop) do
	dropLookup[string.lower(name)] = true
end

for _, tool in ipairs(Backpack:GetChildren()) do
	if tool:IsA("Tool") and dropLookup[string.lower(tool.Name)] then
		tool.Parent = LocalPlayer.Character
		task.wait(0.1)

		VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Backspace, false, game)
		task.wait(0.05)
		VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Backspace, false, game)

		task.wait(dropDelay)
	end
end
end)

misctab:Button("Infinite Yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

misctab:Button("Nameless Admin", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

misctab:Button("Rejoin Server", function()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local jobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
    print("Rejoining current server...")
    print("PlaceId:", placeId)
    print("JobId:", jobId)
    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
else
    print("Failed to get current server info or player.")
end
end)

misctab:Button("Switch Servers", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local currentJobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

local function findDifferentServer()
    local cursor = nil

    while true do
        local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", placeId)
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = {
                    ["User-Agent"] = "Mozilla/5.0"
                }
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            task.wait(2)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Waiting...")
            task.wait(3)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode. Retrying...")
            task.wait(2)
            continue
        end

        for _, server in pairs(data.data) do
            if server.id ~= currentJobId and server.playing < server.maxPlayers then
                print("Found different server:", server.id)
                return server.id
            end
        end

        cursor = data.nextPageCursor
        task.wait(1)

        if not cursor then break end
    end

    return nil
end

local newJobId = findDifferentServer()
if newJobId and player then
    print("Teleporting to different server...")
    TeleportService:TeleportToPlaceInstance(placeId, newJobId, player)
else
    print("No different server found or player missing.")
end
end)

misctab:Button("Join Small Server (MAY GET RATE LIMITED!)", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

_G.extracted1 = game.PlaceId
_G.extracted2 = nil

local userAgents = {
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
    "Mozilla/5.0 (X11; Linux x86_64)",
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
    "Mozilla/5.0 (Android 11; Mobile; rv:89.0)",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)",
    "Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/114.0.0.0 Safari/537.36"
}

local function fetchSmartServer()
    local cursor = nil
    local smallestServer = nil
    local minPlayers = math.huge
    local retryCount = 0

    while true do
        local baseUrl = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", _G.extracted1)
        local url = baseUrl
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local headers = {
            ["User-Agent"] = userAgents[math.random(1, #userAgents)],
            ["X-Requested-With"] = "XMLHttpRequest"
        }

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = headers
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 4) + retryCount)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Backing off...")
            retryCount += 1
            task.wait(math.random(3, 6) + retryCount)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode server data. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 5) + retryCount)
            continue
        end

        retryCount = 0

        for _, server in pairs(data.data) do
            print("Checking server:", server.id, "Players:", server.playing, "/", server.maxPlayers)

            if server.playing >= 1 and server.playing <= 2 and server.playing < server.maxPlayers then
                print("Found ideal server with 1–2 players. Joining now.")
                return server
            end

            if server.playing < minPlayers and server.playing < server.maxPlayers then
                minPlayers = server.playing
                smallestServer = server
            end
        end

        cursor = data.nextPageCursor
        task.wait(math.random(1, 2))

        if not cursor then break end
    end

    return smallestServer
end

local server = fetchSmartServer()
if server then
    _G.extracted2 = server.id
    print("Extracted PlaceId:", _G.extracted1)
    print("Extracted JobId:", _G.extracted2)

    local player = Players.LocalPlayer or Players:GetPlayers()[1]

    if typeof(_G.extracted1) == "number" and typeof(_G.extracted2) == "string" and player then
        print("Teleporting to server...")
        TeleportService:TeleportToPlaceInstance(_G.extracted1, _G.extracted2, player)
    else
        print("Invalid data or player not found.")
    end
else
    print("No suitable server found.")
end
end)

misctab:Button("Destroy GUI", function()
    win:Exit()
end)


misctab:Button("Leave Game", function()
    game:Shutdown()
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)

helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)
elseif currentPlaceId == eternalbob then
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Eternal Bob)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
	ToggledSideBar = true
})

local maintab = win:Tab("Main")
local antitab = win:Tab("Protection")
local modetab = win:Tab("Modes")
local misctab = win:Tab("Others")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
antitab:Label("Protection Settings May Be Blatant.")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

misctab:Button("Infinite Yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

misctab:Button("Nameless Admin", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

misctab:Button("Rejoin Server", function()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local jobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
    print("Rejoining current server...")
    print("PlaceId:", placeId)
    print("JobId:", jobId)
    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
else
    print("Failed to get current server info or player.")
end
end)

misctab:Button("Switch Servers", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local currentJobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

local function findDifferentServer()
    local cursor = nil

    while true do
        local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", placeId)
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = {
                    ["User-Agent"] = "Mozilla/5.0"
                }
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            task.wait(2)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Waiting...")
            task.wait(3)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode. Retrying...")
            task.wait(2)
            continue
        end

        for _, server in pairs(data.data) do
            if server.id ~= currentJobId and server.playing < server.maxPlayers then
                print("Found different server:", server.id)
                return server.id
            end
        end

        cursor = data.nextPageCursor
        task.wait(1)

        if not cursor then break end
    end

    return nil
end

local newJobId = findDifferentServer()
if newJobId and player then
    print("Teleporting to different server...")
    TeleportService:TeleportToPlaceInstance(placeId, newJobId, player)
else
    print("No different server found or player missing.")
end
end)

misctab:Button("Join Small Server (MAY GET RATE LIMITED!)", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

_G.extracted1 = game.PlaceId
_G.extracted2 = nil

local userAgents = {
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
    "Mozilla/5.0 (X11; Linux x86_64)",
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
    "Mozilla/5.0 (Android 11; Mobile; rv:89.0)",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)",
    "Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/114.0.0.0 Safari/537.36"
}

local function fetchSmartServer()
    local cursor = nil
    local smallestServer = nil
    local minPlayers = math.huge
    local retryCount = 0

    while true do
        local baseUrl = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", _G.extracted1)
        local url = baseUrl
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local headers = {
            ["User-Agent"] = userAgents[math.random(1, #userAgents)],
            ["X-Requested-With"] = "XMLHttpRequest"
        }

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = headers
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 4) + retryCount)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Backing off...")
            retryCount += 1
            task.wait(math.random(3, 6) + retryCount)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode server data. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 5) + retryCount)
            continue
        end

        retryCount = 0

        for _, server in pairs(data.data) do
            print("Checking server:", server.id, "Players:", server.playing, "/", server.maxPlayers)

            if server.playing >= 1 and server.playing <= 2 and server.playing < server.maxPlayers then
                print("Found ideal server with 1–2 players. Joining now.")
                return server
            end

            if server.playing < minPlayers and server.playing < server.maxPlayers then
                minPlayers = server.playing
                smallestServer = server
            end
        end

        cursor = data.nextPageCursor
        task.wait(math.random(1, 2))

        if not cursor then break end
    end

    return smallestServer
end

local server = fetchSmartServer()
if server then
    _G.extracted2 = server.id
    print("Extracted PlaceId:", _G.extracted1)
    print("Extracted JobId:", _G.extracted2)

    local player = Players.LocalPlayer or Players:GetPlayers()[1]

    if typeof(_G.extracted1) == "number" and typeof(_G.extracted2) == "string" and player then
        print("Teleporting to server...")
        TeleportService:TeleportToPlaceInstance(_G.extracted1, _G.extracted2, player)
    else
        print("Invalid data or player not found.")
    end
else
    print("No suitable server found.")
end
end)

misctab:Button("Destroy GUI", function()
    win:Exit()
end)


misctab:Button("Leave Game", function()
    game:Shutdown()
end)

modetab:Label("These Places Can Be Joined Instantly!")

local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer

local function teleportTo(placeId)
    TeleportService:Teleport(placeId, LocalPlayer)
end

modetab:Button("Main Game", function()
    teleportTo(6403373529)
end)

modetab:Button("Killstreak Only", function()
    teleportTo(11520107397)
end)

modetab:Button("No One Shot Gloves", function()
    teleportTo(9015014224)
end)

modetab:Button("Slap Royale Matchmaking", function()
    teleportTo(9426795465)
end)

modetab:Button("Normal Barzil", function()
    teleportTo(7234087065)
end)

modetab:Button("Slap League (Functional, Needs Another Player.)", function()
    teleportTo(18698003301)
end)

modetab:Button("Tower Of Hell (TOH)", function()
    teleportTo(115782629143468)
end)

modetab:Button("Binded Maze", function()
    teleportTo(74169485398268)
end)

modetab:Button("Ice Trials", function()
    teleportTo(17290438723)
end)

modetab:Button("Custom Glove Customizer", function()
    teleportTo(9068206286)
end)

modetab:Button("Soft Update Waiting Place", function()
    teleportTo(12712288037)
end)

modetab:Button("?", function()
    teleportTo(12845859004)
end)

modetab:Label("Warning: The Below Places Can't Be Joined Directly.")

modetab:Button("Testing Place", function()
    teleportTo(9020359053)
end)

modetab:Button("Tower Defense", function()
    teleportTo(15228348051)
end)

modetab:Button("Christmas Eve", function()
    teleportTo(15507333474)
end)

modetab:Button("Null Zone", function()
    teleportTo(14422118326)
end)

modetab:Button("Staff Application", function()
    teleportTo(16034567693)
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local lastSliderSet = nil
local humanoidConnection = nil

local function applySpeed(humanoid)
	if not humanoid or not lastSliderSet then return end
	if humanoid.WalkSpeed ~= lastSliderSet then
		humanoid.WalkSpeed = lastSliderSet
	end

	if humanoidConnection then
		humanoidConnection:Disconnect()
	end

	humanoidConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if humanoid.WalkSpeed ~= lastSliderSet then
			humanoid.WalkSpeed = lastSliderSet
		end
	end)
end

maintab:Slider("Player Speed", 19.5, 5, 85, 0.5, function(v)
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	lastSliderSet = (v == 8) and 16 or v
	applySpeed(humanoid)
end)

LocalPlayer.CharacterAdded:Connect(function(character)
	character:WaitForChild("Humanoid"):GetPropertyChangedSignal("Parent"):Connect(function()
		local newHumanoid = character:FindFirstChildOfClass("Humanoid")
		if newHumanoid then
			applySpeed(newHumanoid)
		end
	end)

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		applySpeed(humanoid)
	end
end)

local autoSlapBob = false
local slapLoop = nil

local autoSlapBob = false
local slapLoop = nil

maintab:Button("Auto Slap Bob", function()
    autoSlapBob = not autoSlapBob

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Auto Slap Bob",
        Text = autoSlapBob and "Enabled." or "Disabled.",
        Duration = 5
    })

    if autoSlapBob then
        slapLoop = task.spawn(function()
            while autoSlapBob do
                local boss = workspace:FindFirstChild("bobBoss")
                if boss then
                    local damageEvent = boss:FindFirstChild("DamageEvent")
                    if damageEvent then
                        damageEvent:FireServer()
                    end
                end
                task.wait(0.05)
            end
        end)
    else
        if slapLoop then
            task.cancel(slapLoop)
            slapLoop = nil
        end
    end
end)

local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local spamClick = false
local clickLoop = nil

maintab:Button("Auto Tycoon", function()
    spamClick = not spamClick

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Auto Tycoon",
        Text = spamClick and "Enabled." or "Disabled.",
        Duration = 5
    })

    if spamClick then
        if clickLoop then
            task.cancel(clickLoop)
            clickLoop = nil
        end

        clickLoop = task.spawn(function()
            while spamClick do
                for _, player in ipairs(Players:GetPlayers()) do
                    local tycoonName = "ÅTycoon" .. player.Name
                    local tycoonModel = Workspace:FindFirstChild(tycoonName)

                    if tycoonModel and tycoonModel:FindFirstChild("Click") then
                        local clickDetector = tycoonModel.Click:FindFirstChildOfClass("ClickDetector")
                        if clickDetector and clickDetector.Parent:IsA("BasePart") then
                            local screenPos = Workspace.CurrentCamera:WorldToViewportPoint(clickDetector.Parent.Position)
                            VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 0)
                            VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 0)
                        end
                    end
                end
                task.wait(0.2)
            end
        end)
    else
        if clickLoop then
            task.cancel(clickLoop)
            clickLoop = nil
        end
    end
end)

maintab:Label("You Can Slap Farm Using The Mini Bobs!")

local autoAttackBob = false
local attackLoop = nil

maintab:Toggle("Slap Aura (Players / Mini Bob)", function()
    autoAttackBob = not autoAttackBob

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Slap Aura",
        Text = autoAttackBob and "Enabled." or "Disabled.",
        Duration = 5
    })

    if autoAttackBob then
        attackLoop = task.spawn(function()
            while autoAttackBob do
                local glove = game.Players.LocalPlayer.leaderstats.Glove.Value
                if glove == "Reaper" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").ReaperHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif glove == "Killstreak" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").KSHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif glove == "God's Hand" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").Godshand:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif glove == "Tycoon" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").GeneralHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif glove == "Default" then
                    for _, v in ipairs(game.Players:GetPlayers()) do
                        if v ~= game.Players.LocalPlayer and v.Character then
                            if v.Character:FindFirstChild("Ragdolled") and v.Character.Ragdolled.Value == false then
                                game:GetService("ReplicatedStorage").b:FireServer(v.Character:FindFirstChild("HumanoidRootPart"))
                            end
                        end
                    end
                end
                task.wait(0.25)
            end
        end)
    else
        if attackLoop then
            task.cancel(attackLoop)
            attackLoop = nil
        end
    end
end)

antitab:Button("Remove Screenshake", function()
local player = game:GetService("Players").LocalPlayer
local screenshake = player:WaitForChild("PlayerScripts"):FindFirstChild("Screenshake")

if screenshake then
    screenshake:Destroy()
else
    warn("screenshake already removed")
end
end)

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local playerName = LocalPlayer.Name

local root = nil
local slappedValue = nil
local ragdolledValue = Instance.new("BoolValue")
ragdolledValue.Name = "Ragdolled"
ragdolledValue.Value = false
ragdolledValue.Parent = LocalPlayer

local antiFlingEnabled = false

local function notify(title, text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title;
			Text = text;
			Duration = 3,
		})
	end)
end

local function freezePlayer(source)
	if not antiFlingEnabled or not root then return end

	root.AssemblyLinearVelocity = Vector3.zero
	root.AssemblyAngularVelocity = Vector3.zero
	root.Anchored = true

	task.delay(2, function()
		if root then
			root.Anchored = false
		end
	end)
end

RunService.Heartbeat:Connect(function()
	if antiFlingEnabled and ragdolledValue and ragdolledValue.Value == true then
		freezePlayer("Ragdolled")
	end
end)

local function setupCharacter(character)
	root = character:WaitForChild("HumanoidRootPart")

	local localFolder = Workspace:FindFirstChild(playerName)
	if localFolder then
		slappedValue = localFolder:FindFirstChild("LastSlappedBy")
		ragdolledValue = localFolder:FindFirstChild("Ragdolled") or ragdolledValue
	end

	if slappedValue then
		slappedValue.Changed:Connect(function(newValue)
			if antiFlingEnabled and newValue and newValue ~= "" then
				freezePlayer("Slapped")
			end
		end)
	end
end

if LocalPlayer.Character then
	setupCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(setupCharacter)

antitab:Toggle("Anti Knockback", function()
	antiFlingEnabled = not antiFlingEnabled
	local status = antiFlingEnabled and "Enabled." or "Disabled."
	notify("Anti Knockback", status)
end)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local antiRingEnabled = false
local antiRingLoop = nil

antitab:Toggle("Anti Ring", function()
	antiRingEnabled = not antiRingEnabled

	if antiRingEnabled then
		StarterGui:SetCore("SendNotification", {
			Title = "Anti Ring",
			Text = "Enabled.",
			Duration = 2
		})

		antiRingLoop = RunService.RenderStepped:Connect(function()
			local ring = workspace:FindFirstChild("Ring")
			if ring then
				ring:Destroy()
			end
		end)
	else
		StarterGui:SetCore("SendNotification", {
			Title = "Anti Ring",
			Text = "Disabled.",
			Duration = 2
		})

		if antiRingLoop then
			antiRingLoop:Disconnect()
			antiRingLoop = nil
		end
	end
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)

helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)

elseif currentPlaceId == slapbattlesks then
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Killstreak Only)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
	ToggledSideBar = true
})

local maintab = win:Tab("Main")
local antitab = win:Tab("Protection")
local farmtab = win:Tab("Farms")
local teletab = win:Tab("Map")
local modetab = win:Tab("Modes")
local misctab = win:Tab("Others")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
antitab:Label("Protection Settings May Be Blatant.")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

misctab:Button("Infinite Yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

misctab:Button("Nameless Admin", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

misctab:Button("Rejoin Server", function()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local jobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
    print("Rejoining current server...")
    print("PlaceId:", placeId)
    print("JobId:", jobId)
    TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
else
    print("Failed to get current server info or player.")
end
end)

misctab:Button("Switch Servers", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId
local currentJobId = game.JobId
local player = Players.LocalPlayer or Players:GetPlayers()[1]

local function findDifferentServer()
    local cursor = nil

    while true do
        local url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", placeId)
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = {
                    ["User-Agent"] = "Mozilla/5.0"
                }
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            task.wait(2)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Waiting...")
            task.wait(3)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode. Retrying...")
            task.wait(2)
            continue
        end

        for _, server in pairs(data.data) do
            if server.id ~= currentJobId and server.playing < server.maxPlayers then
                print("Found different server:", server.id)
                return server.id
            end
        end

        cursor = data.nextPageCursor
        task.wait(1)

        if not cursor then break end
    end

    return nil
end

local newJobId = findDifferentServer()
if newJobId and player then
    print("Teleporting to different server...")
    TeleportService:TeleportToPlaceInstance(placeId, newJobId, player)
else
    print("No different server found or player missing.")
end
end)

misctab:Button("Join Small Server (MAY GET RATE LIMITED!)", function()
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

_G.extracted1 = game.PlaceId
_G.extracted2 = nil

local userAgents = {
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64)",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)",
    "Mozilla/5.0 (X11; Linux x86_64)",
    "Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X)",
    "Mozilla/5.0 (Android 11; Mobile; rv:89.0)",
    "Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)",
    "Mozilla/5.0 (Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko)",
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/114.0.0.0 Safari/537.36"
}

local function fetchSmartServer()
    local cursor = nil
    local smallestServer = nil
    local minPlayers = math.huge
    local retryCount = 0

    while true do
        local baseUrl = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100", _G.extracted1)
        local url = baseUrl
        if cursor then
            url = url .. "&cursor=" .. cursor
        end

        local headers = {
            ["User-Agent"] = userAgents[math.random(1, #userAgents)],
            ["X-Requested-With"] = "XMLHttpRequest"
        }

        local success, response = pcall(function()
            return http_request({
                Url = url,
                Method = "GET",
                Headers = headers
            })
        end)

        if not success or not response or not response.Body then
            print("Request failed. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 4) + retryCount)
            continue
        end

        if string.find(response.Body, "Too many requests") then
            print("Rate limited. Backing off...")
            retryCount += 1
            task.wait(math.random(3, 6) + retryCount)
            continue
        end

        local successDecode, data = pcall(function()
            return HttpService:JSONDecode(response.Body)
        end)

        if not successDecode or not data or not data.data then
            print("Failed to decode server data. Retrying...")
            retryCount += 1
            task.wait(math.random(2, 5) + retryCount)
            continue
        end

        retryCount = 0

        for _, server in pairs(data.data) do
            print("Checking server:", server.id, "Players:", server.playing, "/", server.maxPlayers)

            if server.playing >= 1 and server.playing <= 2 and server.playing < server.maxPlayers then
                print("Found ideal server with 1–2 players. Joining now.")
                return server
            end

            if server.playing < minPlayers and server.playing < server.maxPlayers then
                minPlayers = server.playing
                smallestServer = server
            end
        end

        cursor = data.nextPageCursor
        task.wait(math.random(1, 2))

        if not cursor then break end
    end

    return smallestServer
end

local server = fetchSmartServer()
if server then
    _G.extracted2 = server.id
    print("Extracted PlaceId:", _G.extracted1)
    print("Extracted JobId:", _G.extracted2)

    local player = Players.LocalPlayer or Players:GetPlayers()[1]

    if typeof(_G.extracted1) == "number" and typeof(_G.extracted2) == "string" and player then
        print("Teleporting to server...")
        TeleportService:TeleportToPlaceInstance(_G.extracted1, _G.extracted2, player)
    else
        print("Invalid data or player not found.")
    end
else
    print("No suitable server found.")
end
end)

misctab:Button("Destroy GUI", function()
    win:Exit()
end)


misctab:Button("Leave Game", function()
    game:Shutdown()
end)

modetab:Label("These Places Can Be Joined Instantly!")

local TeleportService = game:GetService("TeleportService")
local LocalPlayer = game.Players.LocalPlayer

local function teleportTo(placeId)
    TeleportService:Teleport(placeId, LocalPlayer)
end

modetab:Button("Main Game", function()
    teleportTo(6403373529)
end)

modetab:Button("Killstreak Only", function()
    teleportTo(11520107397)
end)

modetab:Button("No One Shot Gloves", function()
    teleportTo(9015014224)
end)

modetab:Button("Slap Royale Matchmaking", function()
    teleportTo(9426795465)
end)

modetab:Button("Normal Barzil", function()
    teleportTo(7234087065)
end)

modetab:Button("Slap League (Functional, Needs Another Player.)", function()
    teleportTo(18698003301)
end)

modetab:Button("Tower Of Hell (TOH)", function()
    teleportTo(115782629143468)
end)

modetab:Button("Binded Maze", function()
    teleportTo(74169485398268)
end)

modetab:Button("Ice Trials", function()
    teleportTo(17290438723)
end)

modetab:Button("Suction Cup Trials", function()
game:GetService("ReplicatedStorage").Events.suction_obby_tp:FireServer()
end)

modetab:Button("Custom Glove Customizer", function()
    teleportTo(9068206286)
end)

modetab:Button("Soft Update Waiting Place", function()
    teleportTo(12712288037)
end)

modetab:Button("?", function()
    teleportTo(12845859004)
end)

modetab:Label("Warning: The Below Places Can't Be Joined Directly.")

modetab:Button("Testing Place", function()
    teleportTo(9020359053)
end)

modetab:Button("Tower Defense", function()
    teleportTo(15228348051)
end)

modetab:Button("Christmas Eve", function()
    teleportTo(15507333474)
end)

modetab:Button("Null Zone", function()
    teleportTo(14422118326)
end)

modetab:Button("Staff Application", function()
    teleportTo(16034567693)
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local lastSliderSet = nil
local humanoidConnection = nil

local function applySpeed(humanoid)
	if not humanoid or not lastSliderSet then return end
	if humanoid.WalkSpeed ~= lastSliderSet then
		humanoid.WalkSpeed = lastSliderSet
	end

	if humanoidConnection then
		humanoidConnection:Disconnect()
	end

	humanoidConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if humanoid.WalkSpeed ~= lastSliderSet then
			humanoid.WalkSpeed = lastSliderSet
		end
	end)
end

maintab:Slider("Player Speed", 19.5, 5, 225, 0.5, function(v)
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	lastSliderSet = (v == 8) and 16 or v
	applySpeed(humanoid)
end)

LocalPlayer.CharacterAdded:Connect(function(character)
	character:WaitForChild("Humanoid"):GetPropertyChangedSignal("Parent"):Connect(function()
		local newHumanoid = character:FindFirstChildOfClass("Humanoid")
		if newHumanoid then
			applySpeed(newHumanoid)
		end
	end)

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		applySpeed(humanoid)
	end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local root = nil
local auraEnabled = false
local connection = nil
local slapCount = 0
local slapWindowStart = 0
local cooldownActive = false
local maxSlapsPerWindow = 5
local windowDuration = 3
local cooldownTime = 0.7

local KSHit = ReplicatedStorage:FindFirstChild("KSHit")

local function notify(title, text, duration)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = duration or 3
		})
	end)
end

local function updateRoot()
	local character = LocalPlayer.Character
	if character then
		root = character:FindFirstChild("HumanoidRootPart")
	end
end

LocalPlayer.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart")
	updateRoot()
end)

if LocalPlayer.Character then
	updateRoot()
end

local function getClosestPlayer()
	local myRoot = root
	if not myRoot then return nil end

	local closest, dist = nil, math.huge
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
			if targetRoot then
				local mag = (targetRoot.Position - myRoot.Position).Magnitude
				if mag < dist then
					dist = mag
					closest = player
				end
			end
		end
	end
	return closest
end

maintab:Toggle("Slap Aura", function()
	auraEnabled = not auraEnabled

	if auraEnabled and not connection then
		connection = RunService.Heartbeat:Connect(function()
			local now = os.clock()
			if now - slapWindowStart > windowDuration then
				slapWindowStart = now
				slapCount = 0
			end
			if slapCount >= maxSlapsPerWindow or cooldownActive then return end

			local char = LocalPlayer.Character
			local glove = char and char:FindFirstChildOfClass("Tool")
			if not glove then return end

			local myRoot = char:FindFirstChild("HumanoidRootPart")
			if not myRoot then return end

			local targetPlayer = getClosestPlayer()
			if not (targetPlayer and targetPlayer.Character) then return end

			local torso = targetPlayer.Character:FindFirstChild("Torso")
				or targetPlayer.Character:FindFirstChild("UpperTorso")
				or targetPlayer.Character:FindFirstChild("HumanoidRootPart")
			if not torso then return end

			cooldownActive = true
			task.delay(cooldownTime, function()
				cooldownActive = false
			end)

			if KSHit then
				KSHit:FireServer(torso)
			end

			slapCount += 1
		end)
	elseif not auraEnabled and connection then
		connection:Disconnect()
		connection = nil
	end

	notify("Slap Aura", auraEnabled and "Enabled." or "Disabled.")
end)

maintab:Toggle("Infinite Jump", function()
	getgenv().infiniteJumpEnabled = not getgenv().infiniteJumpEnabled

	local lp = game:GetService("Players").LocalPlayer
	local uis = game:GetService("UserInputService")

	local hum, root, animTrack

	local function bindCharacter(char)
		hum = char:WaitForChild("Humanoid")
		root = char:WaitForChild("HumanoidRootPart")

		local animate = char:FindFirstChild("Animate")
		if animate and animate:FindFirstChild("jump") and animate.jump:FindFirstChild("JumpAnim") then
			local animId = animate.jump.JumpAnim.AnimationId
			local anim = Instance.new("Animation")
			anim.AnimationId = animId
			animTrack = hum:LoadAnimation(anim)
		end
	end

	bindCharacter(lp.Character or lp.CharacterAdded:Wait())
	lp.CharacterAdded:Connect(bindCharacter)

	if not getgenv()._infiniteJumpBound then
		getgenv()._infiniteJumpBound = true
		uis.InputBegan:Connect(function(input, gp)
			if gp or input.KeyCode ~= Enum.KeyCode.Space then return end
			if not getgenv().infiniteJumpEnabled or not root then return end

			if animTrack then
				animTrack:Stop()
				animTrack:Play()
			end

			root.AssemblyLinearVelocity = Vector3.new(root.AssemblyLinearVelocity.X, 50, root.AssemblyLinearVelocity.Z)
		end)
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Infinite Jump",
		Text = getgenv().infiniteJumpEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

maintab:Button("Spam Orb (75-249 KS)", function()
	_G.SpamOrb = not _G.SpamOrb

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Spam Orb";
		Text = _G.SpamOrb and "Enabled." or "Disabled.";
		Duration = 3;
	})

	if _G.SpamOrb then
		task.spawn(function()
			while _G.SpamOrb do
				game:GetService("ReplicatedStorage").KSABILI:FireServer()
				task.wait(6.1)
			end
		end)
	end
end)

maintab:Button("Spam Force (250-999 KS)", function()
	_G.SpamForce = not _G.SpamForce

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Spam Force";
		Text = _G.SpamForce and "Enabled." or "Disabled.";
		Duration = 3;
	})

	if _G.SpamForce then
		task.spawn(function()
			while _G.SpamForce do
				game:GetService("ReplicatedStorage"):WaitForChild("TheForce"):FireServer()
				task.wait()
			end
		end)
	end
end)

local muckBindEnabled = false
local muckConnection = nil

maintab:Button("Bind Muck (Binds To T.)", function()
	muckBindEnabled = not muckBindEnabled

	if muckBindEnabled and not muckConnection then
		muckConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then return end
			if input.KeyCode == Enum.KeyCode.T then
				local event = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Muck")
				if event then
					event:FireServer()
				end
			end
		end)
	elseif not muckBindEnabled and muckConnection then
		muckConnection:Disconnect()
		muckConnection = nil
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Muck Bind",
		Text = muckBindEnabled and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

maintab:Label("These Glove May Cause Lag, Rejoin If It Becomes Laggy.")

maintab:Button("Killstreak V2 (Req. Killstreak, Use In Arena.)", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Celeron/refs/heads/main/upgraded%20killstreak%20(slap%20battles)",true))()
end)

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local playerName = LocalPlayer.Name

local root = nil
local slappedValue = nil
local ragdolledValue = Instance.new("BoolValue")
ragdolledValue.Name = "Ragdolled"
ragdolledValue.Value = false
ragdolledValue.Parent = LocalPlayer

local antiFlingEnabled = false

local function notify(title, text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title;
			Text = text;
			Duration = 3,
		})
	end)
end

local function freezePlayer(source)
	if not antiFlingEnabled or not root then return end

	root.AssemblyLinearVelocity = Vector3.zero
	root.AssemblyAngularVelocity = Vector3.zero
	root.Anchored = true

	task.delay(2, function()
		if root then
			root.Anchored = false
		end
	end)
end

RunService.Heartbeat:Connect(function()
	if antiFlingEnabled and ragdolledValue and ragdolledValue.Value == true then
		freezePlayer("Ragdolled")
	end
end)

local function setupCharacter(character)
	root = character:WaitForChild("HumanoidRootPart")

	local localFolder = Workspace:FindFirstChild(playerName)
	if localFolder then
		slappedValue = localFolder:FindFirstChild("LastSlappedBy")
		ragdolledValue = localFolder:FindFirstChild("Ragdolled") or ragdolledValue
	end

	if slappedValue then
		slappedValue.Changed:Connect(function(newValue)
			if antiFlingEnabled and newValue and newValue ~= "" then
				freezePlayer("Slapped")
			end
		end)
	end
end

if LocalPlayer.Character then
	setupCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(setupCharacter)

antitab:Toggle("Anti Knockback", function()
	antiFlingEnabled = not antiFlingEnabled
	local status = antiFlingEnabled and "Enabled." or "Disabled."
	notify("Anti Knockback", status)
end)

local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local antivoidPart = nil

antitab:Toggle("Anti Void", function(v)
	if v then
		if not antivoidPart then
			antivoidPart = Instance.new("Part")
			antivoidPart.Name = "VoidProtection"
			antivoidPart.Size = Vector3.new(99999, 1, 99999)
			antivoidPart.Position = Vector3.new(15, -10, 6)
			antivoidPart.Anchored = true
			antivoidPart.Material = Enum.Material.Grass
			antivoidPart.Transparency = 0.75
			antivoidPart.Color = Color3.fromRGB(0, 255, 45)
			antivoidPart.CastShadow = false
			antivoidPart.Parent = Workspace
		end

		StarterGui:SetCore("SendNotification", {
			Title = "Anti Void",
			Text = "Enabled.",
			Duration = 3
		})
	else
		if antivoidPart then
			antivoidPart:Destroy()
			antivoidPart = nil
		end

		StarterGui:SetCore("SendNotification", {
			Title = "Anti Void",
			Text = "Disabled.",
			Duration = 3
		})
	end
end)

teletab:Button("Main Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3, -5, 16)
end)

teletab:Button("Moyai Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(229, -16, -12)
end)

teletab:Button("Slapple Island", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-381, 51, -12)
end)

teletab:Button("Castle", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(250, 34, 189)
end)

teletab:Button("The Plate", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Arena.Plate.CFrame
end)

teletab:Button("Retro Obby", function()
local p=game.Players.LocalPlayer;p.CharacterAdded:Connect(function(c)c:WaitForChild("Humanoid").Died:Connect(function()game.SoundService:FindFirstChild("ObbyMusic"):Destroy()end)end)local s=game.StarterPlayer.StarterPlayerScripts.LegacyClient.RetroHandler.Handle.ObbyMusic:Clone()s.Parent=game.SoundService;s:Play() if not workspace:FindFirstChild("RetroObbyMap")then game.ReplicatedStorage.Assets.Retro.Map.RetroObbyMap:Clone().Parent=workspace end;(p.Character or p.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart").CFrame=CFrame.new(-16873,-1,4775)
end)

teletab:Button("Baseplate", function()
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local baseplateName = "_TargetBaseplate"
local targetPosition = Vector3.new(5000, 228, 5000)
local baseplateSize = Vector3.new(512, 20, 512)

local function ensureBaseplate()
	local existing = Workspace:FindFirstChild(baseplateName)
	if not existing then
		local part = Instance.new("Part")
		part.Name = baseplateName
		part.Size = baseplateSize
		part.Position = targetPosition
		part.Anchored = true
		part.TopSurface = Enum.SurfaceType.Smooth
		part.BottomSurface = Enum.SurfaceType.Smooth
		part.Material = Enum.Material.SmoothPlastic
		part.Color = Color3.fromRGB(163, 162, 165)
		part.Parent = Workspace
	end
end

local function teleportToBaseplate()
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local root = character:WaitForChild("HumanoidRootPart")
	root.CFrame = CFrame.new(targetPosition + Vector3.new(0, baseplateSize.Y / 2 + 5, 0))
end

ensureBaseplate()
teleportToBaseplate()
end)

farmtab:Label("Anti AFK: Useful For Certain Farms.")

farmtab:Button("Anti AFK", function()
	getgenv().antiAFK = not getgenv().antiAFK
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Anti AFK",
		Text = getgenv().antiAFK and "Enabled." or "Disabled.",
		Duration = 3
	})
end)

farmtab:Label("Slap Farming: Recommended To Teleport To Baseplate.")

farmtab:Button("Slap Farm Info", function()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Slap Farm";
	Text = "Dual: 5K/hour\nDual + 2X: 11K/hour\nDual + 2X + VIP: 22K/hour";
	Duration = 10;
})
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local autoslapenabled = false
local cachedRemotes = {}

local function findEquippedGlove()
    local character = LocalPlayer.Character
    if not character then return nil end
    for _, tool in ipairs(character:GetChildren()) do
        if tool:IsA("Tool") then
            return tool
        end
    end
end

local function getClosestPlayer()
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    local closest, dist = nil, math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                local mag = (targetRoot.Position - myRoot.Position).Magnitude
                if mag < dist then
                    dist = mag
                    closest = player
                end
            end
        end
    end
    return closest
end

local function findRelevantHitRemotes(gloveName)
    if cachedRemotes[gloveName] then return cachedRemotes[gloveName] end

    local nameLower = string.lower(gloveName or "")
    local hits = {}

    for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local remoteLower = string.lower(obj.Name)
            if remoteLower == nameLower .. "hi"
            or (remoteLower:find(nameLower) and remoteLower:find("hit")) then
                table.insert(hits, obj)
            end
        end
    end

    cachedRemotes[gloveName] = hits
    return hits
end

local heartbeatConn
local cooldown = false

farmtab:Button("Slap Farm (Main Account, Use In Arena.)", function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local GeneralRemote = ReplicatedStorage:WaitForChild("GeneralHit")

local targetPosition = Vector3.new(6500, 760, 4785)
local root = nil

local function updateRoot()
	local character = LocalPlayer.Character
	if character then
		root = character:FindFirstChild("HumanoidRootPart")
	end
end

LocalPlayer.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart")
	updateRoot()
end)

if LocalPlayer.Character then
	updateRoot()
end

local function getClosestPlayer()
	local closest = nil
	local minDist = math.huge

	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (player.Character.HumanoidRootPart.Position - root.Position).Magnitude
			if distance < minDist then
				minDist = distance
				closest = player
			end
		end
	end

	return closest
end

RunService.Heartbeat:Connect(function()
	if root then
		root.CFrame = CFrame.new(targetPosition)
	end
end)

task.spawn(function()
	while true do
		if root then
			local target = getClosestPlayer()
			if target and target.Character then
				GeneralRemote:FireServer(target.Character:FindFirstChild("HumanoidRootPart"))
			end
		end
		task.wait(1.25)
	end
end)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local character = nil
local root = nil
local floating = false

local referencePosition = Vector3.new(6500, 760, 4785)

local function floatEffect()
	if root then
		root.Anchored = false
		root.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		root.AssemblyLinearVelocity = Vector3.zero
	end
end

local function getClosestToReference()
	local closestPlayer = nil
	local shortestDistance = math.huge

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local dist = (player.Character.HumanoidRootPart.Position - referencePosition).Magnitude
			if dist < shortestDistance then
				shortestDistance = dist
				closestPlayer = player
			end
		end
	end

	return closestPlayer
end

local function teleportInFront()
	if not floating then return end

	local targetPlayer = getClosestToReference()
	if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local targetRoot = targetPlayer.Character.HumanoidRootPart
		local offset = targetRoot.CFrame.LookVector.Unit * 4
		local newPos = targetRoot.Position + offset + Vector3.new(0, 2, 0)
		root.CFrame = CFrame.new(newPos, targetRoot.Position)
		floatEffect()
	end
end

RunService.Heartbeat:Connect(function()
	if floating then
		teleportInFront()
	end
end)

LocalPlayer.CharacterAdded:Connect(function(char)
	character = char
	root = character:WaitForChild("HumanoidRootPart")
end)

if LocalPlayer.Character then
	character = LocalPlayer.Character
	root = character:WaitForChild("HumanoidRootPart")
end

farmtab:Button("Slap Farm (Alt Account, Use In Arena.)", function()
	floating = true
end)

farmtab:Label("Kill Farm: Recommended To Teleport Main To Baseplate.")

farmtab:Textbox("Kill Farm (Set Username To Main, Use In Arena.)", function(v)
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local function onCharacterSpawn(character)
	local rootPart = character:WaitForChild("HumanoidRootPart")

	local teleportPart = Workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")
	rootPart.CFrame = teleportPart.CFrame + Vector3.new(0, 1, 0)
	firetouchinterest(rootPart, teleportPart, 0)
	task.wait(0.1)
	firetouchinterest(rootPart, teleportPart, 1)

	task.wait(0.7)

	local target = Players:FindFirstChild(v)
	if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
		local targetRoot = target.Character.HumanoidRootPart
		local offset = targetRoot.CFrame.LookVector.Unit * 5
		local destination = targetRoot.Position + offset + Vector3.new(0, 1, 0)

		for i = 1, 25 do
			rootPart.CFrame = CFrame.new(destination, targetRoot.Position)
			task.wait(0.05)
		end
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.Health = 0
	end
end

LocalPlayer.CharacterAdded:Connect(onCharacterSpawn)

if LocalPlayer.Character then
	onCharacterSpawn(LocalPlayer.Character)
end
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)

helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)
elseif currentPlaceId == slaproyalewaiting then
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Execute In Match",
    Text = "Execute the script when the match starts.",
    Duration = 3,
    Button1 = "alright fella",
})
elseif currentPlaceId == nullzone then
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Null Zone)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
	ToggledSideBar = true
})

local maintab = win:Tab("Main")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

local antinull = false
local loopThread = nil

maintab:Button("Anti Null", function()
	antinull = not antinull

	if antinull then
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Anti Null";
			Text = "Enabled.";
			Duration = 3;
		})

		loopThread = coroutine.create(function()
			while antinull do
				for _, v in pairs(game.Workspace.Mobs:GetChildren()) do
					if v.Name == "Imp" and v:FindFirstChild("Body") then
						game:GetService("ReplicatedStorage").b:FireServer(v.Body)
					end
				end
				task.wait()
			end
		end)
		coroutine.resume(loopThread)
	else
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Anti Null";
			Text = "Disabled.";
			Duration = 3;
		})
	end
end)

maintab:Button("Remove Cooldown", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    while character.Humanoid.Health ~= 0 do
    local localscript = tool:FindFirstChildOfClass("LocalScript")
    local localscriptclone = localscript:Clone()
    localscriptclone = localscript:Clone()
    localscriptclone:Clone()
    localscript:Destroy()
    localscriptclone.Parent = tool
    wait(0.1)
    end
end)

maintab:Button("TP To Null Glove", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(5454, -189, 1837))
end)

maintab:Button("TP To Tinkerer Glove", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(4842, -214, 801))
end)

maintab:Button("TP To Rob Plush Artifact", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(5254, -139, 860))
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)

helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)
elseif currentPlaceId == egglerserver then
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Eggler)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
    ToggledSideBar = true
})

local maintab = win:Tab("Main")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

maintab:Label("Become An Egg Before Obtaining Golden Eggs!")

maintab:Button("First Golden Egg", function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local target = workspace.TrialCompletedPoints["Trial 1"].root

firetouchinterest(root, target, 0)
firetouchinterest(root, target, 1)
end)

maintab:Button("Second Golden Egg", function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local target = workspace.TrialCompletedPoints["Trial 2"].root

firetouchinterest(root, target, 0)
firetouchinterest(root, target, 1)
end)

maintab:Button("Third Golden Egg", function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local target = workspace.TrialCompletedPoints["Trial 3"].root

firetouchinterest(root, target, 0)
firetouchinterest(root, target, 1)
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)

helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)
elseif currentPlaceId == barzil then
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Barzil)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
    ToggledSideBar = true
})

local maintab = win:Tab("Main")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

maintab:Button("Instant Boxer Glove", function()
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

root.CFrame = CFrame.new(4233, 3505, 265)

local target = workspace:FindFirstChild("BoxingGloves")
if target then
	local pos = target.Position
	local screenPos = workspace.CurrentCamera:WorldToViewportPoint(pos)
	VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, true, game, 0)
	VirtualInputManager:SendMouseButtonEvent(screenPos.X, screenPos.Y, 0, false, game, 0)
end
end)

maintab:Button("Enter Metaverse Portal", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(250, 98, -62823))
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)
helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)
elseif currentPlaceId == suction then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Suction Trials",
    Text = "Click The Suction Glove To Obtain The Glove.",
    Duration = 5,
    Button1 = "alright fella",
})
workspace["plunger glove"]:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 5)
elseif currentPlaceId == sfoth then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Swordfighter Glove",
    Text = "Obtaining Glove...",
    Duration = 5,
    Button1 = "alright fella",
})
workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChildOfClass("Humanoid").Health = 0
wait(1)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-7, 846, 66))
wait(5)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-6, 845, 282))
wait(3.5)
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Swordfighter Glove",
    Text = "Interact with the swords to get the glove.",
    Duration = 20,
    Button1 = "alright fella",
})
elseif currentPlaceId == bindmaze then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Bind Glove",
    Text = "Interact with the statue to get the glove.",
    Duration = 20,
    Button1 = "alright fella",
})
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-153, 5, -170))
elseif currentPlaceId == icetrials then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Frostbite Glove",
    Text = "Interact with the essence to get the glove.",
    Duration = 20,
    Button1 = "alright fella",
})
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-552, 177, 57))
elseif currentPlaceId == hexagon then
local plr = game.Players.LocalPlayer
local hrp = plr.Character:WaitForChild("HumanoidRootPart")
local StarterGui = game:GetService("StarterGui")

local function touch(part)
    firetouchinterest(hrp, part, 0)
    firetouchinterest(hrp, part, 1)
end

local function waitFor(partPath)
    local target
    repeat
        target = partPath()
        task.wait()
    until target
    return target
end

StarterGui:SetCore("SendNotification", {
    Title = "Hexa Glove",
    Text = "Obtaining Glove...",
    Duration = 10,
    Button1 = "alright fella",
})

task.wait(5)

local partI = waitFor(function()
    return workspace:FindFirstChild("Part I") and workspace["Part I"].Obby:FindFirstChild("end")
end)
touch(partI)
task.wait(10)

local subtitle = waitFor(function()
    return workspace:FindFirstChild("Part 2") and workspace["Part 2"]:FindFirstChild("SubtitleActivation")
end)
touch(subtitle)

local portalActivator = waitFor(function()
    return workspace["Part 2"]["Adjacent Island"]:FindFirstChild("PortalActivator")
end)
hrp.CFrame = portalActivator.CFrame + Vector3.new(0, 3, 0)

local portal = waitFor(function()
    return workspace["Part 2"]:FindFirstChild("Portal")
end)
task.wait(3)
touch(portal)
task.wait(10)

local tpHandle = waitFor(function()
    return workspace:FindFirstChild("Part 3") and workspace["Part 3"].TpToNext:FindFirstChild("Handle")
end)
hrp.CFrame = tpHandle.CFrame

StarterGui:SetCore("SendNotification", {
    Title = "Hexa Glove",
    Text = "Click The Glove To Continue.",
    Duration = 10,
    Button1 = "alright fella",
})

local tpPart = waitFor(function()
    return workspace:FindFirstChild("Part 4") and workspace["Part 4"]:FindFirstChild("TPPart")
end)
task.wait(5)
touch(tpPart)

local gloveHandle = waitFor(function()
    return workspace:FindFirstChild("Part 5") and workspace["Part 5"].Glove:FindFirstChild("Handle")
end)
task.wait(5)
hrp.CFrame = gloveHandle.CFrame

StarterGui:SetCore("SendNotification", {
    Title = "Hexa Glove",
    Text = "Click on the default glove in front of you to finish the challenge.",
    Duration = 10,
    Button1 = "alright fella",
})

local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

repeat task.wait() until workspace:FindFirstChild("Finale") and workspace.Finale:FindFirstChild("Reward")

StarterGui:SetCore("SendNotification", {
    Title = "Hexa Glove",
    Text = "Walk to the glove and click / tap on it to obtain the glove.",
    Duration = 120,
    Button1 = "alright fella",
})
elseif currentPlaceId == shattered then
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Shattered Mirror)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
    ToggledSideBar = true
})

local maintab = win:Tab("Main")
local misctab = win:Tab("Others")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

maintab:Label("Phase One Features Below.")

maintab:Button("Start Phase 1", function()
local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
firetouchinterest(workspace.Stage1.Lobby.Portals.normal.Teleport1, hrp, 0)
firetouchinterest(workspace.Stage1.Lobby.Portals.normal.Teleport1, hrp, 1)
task.wait(0.2)
firetouchinterest(workspace.Stage1.glove.Touch, hrp, 0)
firetouchinterest(workspace.Stage1.glove.Touch, hrp, 1)
end)

maintab:Button("Kill Shadows", function()
for _,v in ipairs(workspace:GetDescendants())do if v.Name=="shadow_npc"then local h=v:FindFirstChildOfClass("Humanoid")if h then h.Health=0 end end end
end)

maintab:Label("Phase Two Features Below.")

maintab:Button("Start Phase 2", function()
local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
firetouchinterest(workspace.Stage2.Lobby.Portals.normal.Teleport1, hrp, 0)
firetouchinterest(workspace.Stage2.Lobby.Portals.normal.Teleport1, hrp, 1)
end)

maintab:Button("Safezone", function()
local p=Instance.new("Part",workspace)p.Size=Vector3.new(50,1,50)p.Position=Vector3.new(290,81,981)p.Anchored=true;game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame=CFrame.new(290,82,981)
end)

maintab:Label("Phase Three Features Below.")

maintab:Button("Start Phase 3", function()
local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
firetouchinterest(workspace.Stage3.Lobby.Portals.default.Teleport2, hrp, 0)
firetouchinterest(workspace.Stage3.Lobby.Portals.default.Teleport2, hrp, 1)
wait(0.5)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(222, 502, -1543))
wait(0.5)
fireproximityprompt(workspace.Stage3.HunterHatch.Model.Union.ProximityPrompt)
end)

maintab:Button("Kill Boss", function()
local lp = game.Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local rig = workspace:FindFirstChild("Rig")
local head = rig and rig:FindFirstChild("Head")
local hum = rig and rig:FindFirstChildOfClass("Humanoid")

if head and hum then
	hrp.CFrame = head.CFrame + Vector3.new(0, 2, 0)
	hum.Health = 0
end
end)

misctab:Button("Infinite Yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)
helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)
elseif currentPlaceId == slender then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Slender Auto-Complete",
    Text = "Turn Your Camera To Look Fully Down.",
    Duration = 3,
    Button1 = "alright fella",
})
wait(3)
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local vim = game:GetService("VirtualInputManager")

for _, model in ipairs(workspace.Pages:GetChildren()) do
    for _, obj in ipairs(model:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            pcall(function()
                obj.HoldDuration = 0

                local target = obj.Parent
                if target:IsA("BasePart") then
                    hrp.CFrame = target.CFrame + Vector3.new(0, 3, 0)
                    local lookAt = CFrame.new(hrp.Position, target.Position)
                    hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, lookAt.LookVector:Angle(Vector3.new(0, 0, -1)), 0)
                    task.wait(0.2)
                    vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                    task.wait(0.1)
                    vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                    task.wait(0.2)
                end
            end)
        end
    end
end
elseif currentPlaceId == toh then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Untitled Tag Glove",
    Text = "Obtaining...",
    Duration = 3,
    Button1 = "alright fella",
})
wait(1)
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-23, 225, -2))
elseif currentPlaceId == elude then
local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Daffy734/code/refs/heads/main/yep"))()

local win = ui:Create({
    Name = "Celeron's GUI (SB: Elude)",
    ThemeColor = Color3.fromRGB(111, 111, 111),
    ThemeGradient = Color3.fromRGB(13, 13, 13),
    StartupSound = "rbxassetid://6958727243",
    ThemeFont = Enum.Font.FredokaOne,
	ToggledSideBar = true
})

local maintab = win:Tab("Main")
local misctab = win:Tab("Others")
local helptab = win:Tab("Info")

maintab:Label("Script Made By Celeron + Daffy!")
helptab:Label("GUI Controls Are Below, Script Credits Are At The Bottom!")
helptab:Label("Show / Hide GUI: Right Alt")

maintab:Button("Obtain Elude", function()
for _,v in pairs(workspace.Collectable:GetChildren()) do v.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end
end)

misctab:Button("Infinite Yield", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

helptab:Button("Copy Owner Discord Username", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Username",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("ghostofcelleron")
end)
helptab:Button("Copy Discord Server Invite", function()
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Discord Invite",
    Text = "Copied to your clipboard!",
    Duration = 3,
    Button1 = "alright fella",
})
setclipboard("https://discord.gg/mFusYUmyry")
end)
elseif currentPlaceId == plate then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Plate Glove",
    Text = "Obtaining... Please Wait.",
    Duration = 240
})
workspace:FindFirstChild("Obstacles"):Destroy()
local lp = game.Players.LocalPlayer
local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
local hand = workspace:FindFirstChild("Glove Model") and workspace["Glove Model"]:FindFirstChild("Hand")

if hand and hrp then
    while hand:IsDescendantOf(workspace) do
        firetouchinterest(hand, hrp, 0)
        firetouchinterest(hand, hrp, 1)
        task.wait(0.25)
    end
end
else
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Not Supported",
    Text = "This Game / Mode Is Not Supported, Please Try Again Later.",
    Duration = 3,
    Button1 = "alright fella",
})
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/ghostofcelleron/Scripts/refs/heads/main/oldthingyep",true))()
loadstring(game:HttpGet("https://pastebin.com/raw/rQMS2B9R",true))()