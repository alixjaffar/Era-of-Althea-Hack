repeat wait() until game:GetService("Players").LocalPlayer.Character

--// Codes

spawn(function()
local codes = {"2MVISITS!", "DetestThrewItBackOnMe", "1MVISITS!", "15KLIKES!", "SHUTDOWNADOPTME!", "MaineEOA", "ShutdownForFixes!", "AltheaHype!", "ShutdownForFixesA!", "ShutdownForFixes2!", "4MILVISITS!", "25LIKES!", "MyApologies!", "NewUpdate??"}
local Event = game:GetService("ReplicatedStorage").Remotes.RedeemCode
for i,v in pairs(codes) do
   Event:InvokeServer(v)
end
end)

local tweenspeed = _G.tweenspeed or 150
local mobName = "Wolf"
local questName = "Dangerous Wolves"

--  For Non-Synapse Users (credits to egg salad)
if not pcall(function() return syn.protect_gui end) then
    syn = {}
    syn.protect_gui = function(egg)
        egg.Parent = game.CoreGui
    end
end

local beneathMapPart = Instance.new("Part", workspace)
beneathMapPart.Position = Vector3.new(594,-280,2375)
beneathMapPart.Size = Vector3.new(math.huge,2,math.huge)
beneathMapPart.Transparency = .5
beneathMapPart.Anchored = true

iyflyspeed = 1

local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local LocalPlayer = Players.LocalPlayer
local Mouse = Players.LocalPlayer:GetMouse()

local CONTROL = {F = 0, B = 0, L = 0, R = 0}
local lCONTROL = {F = 0, B = 0, L = 0, R = 0}

local isFlying = false
function sFLY() -- from rocky2u cmdscript
    repeat wait() until LP and LP.Character and LP.Character:FindFirstChild('HumanoidRootPart') and LP.Character:FindFirstChild('Humanoid')
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
    repeat wait() until Mouse
    local T = game.Players.LocalPlayer.Character.HumanoidRootPart
    CONTROL = {F = 0, B = 0, L = 0, R = 0}
    lCONTROL = {F = 0, B = 0, L = 0, R = 0}
    local SPEED = 0
    
    local function FLY()
        FLYING = true
        for i,v in pairs(getconnections(T.ChildAdded)) do
            v:Disable()
        end
        for i,v in pairs(getconnections(T.DescendantAdded)) do
            v:Disable()
        end
        for i,v in pairs(getconnections(T.Parent.DescendantAdded)) do
            v:Disable()
        end
        local BG = Instance.new('BodyGyro', T)
        local BV = Instance.new('BodyVelocity', T)
        BG.P = 9e4
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0.1, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        spawn(function()
            repeat wait()
            if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
                SPEED = 50
            elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
                SPEED = 0
            end
            if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
                BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
            elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
                BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
            else
                BV.velocity = Vector3.new(0, 0.1, 0)
            end
            BG.cframe = workspace.CurrentCamera.CoordinateFrame
            until not FLYING
            CONTROL = {F = 0, B = 0, L = 0, R = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0}
            SPEED = 0
            BG:destroy()
            BV:destroy()
        end)
    end
    Mouse.KeyDown:connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = iyflyspeed
        elseif KEY:lower() == 's' then
            CONTROL.B = -iyflyspeed
        elseif KEY:lower() == 'a' then
            CONTROL.L = -iyflyspeed 
        elseif KEY:lower() == 'd' then 
            CONTROL.R = iyflyspeed
        end
    end)
    Mouse.KeyUp:connect(function(KEY)
        if KEY:lower() == 'w' then
            CONTROL.F = 0
        elseif KEY:lower() == 's' then
            CONTROL.B = 0
        elseif KEY:lower() == 'a' then
            CONTROL.L = 0
        elseif KEY:lower() == 'd' then
            CONTROL.R = 0
        end
    end)
    if WHeld then
    	CONTROL.F = iyflyspeed
    end
    if SHeld then
    	CONTROL.B = -iyflyspeed
    end
    FLY()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end

function NOFLY()
    isFlying = false
    FLYING = false
end

function startflying()
    isFlying = true
    sFLY()
    local Float = Instance.new('Part', game.Players.LocalPlayer.Character)
    Float.Name = 'Float'
    Float.Transparency = 1
    Float.Size = Vector3.new(6,1,6)
    Float.Anchored = true
end
local mobDistance = 8
local changingDistance = false
local walkspeed = 16
local jumppower = 50

local lib = loadstring(game:HttpGet('https://raw.githubusercontent.com/fireztron/uwuware-ui-library/main/ui.lua', true))()
local window = lib:CreateWindow('Era of althea hack')
window:AddLabel({text = "alixjaffar @ github"})
window:AddToggle({text = 'auto quest', state = autoQuest, callback = function(v) 
    if not legitmode then
        autoQuest = v; 
    end
end})
window:AddList({text = 'questchooser', state = questName, values = {"Dangerous Wolves", "Dire Wolf", "Atreyu Labyrinth", "Rocky Attack", "Ronbaru Labyrinth", "Abu Madness", "Rocky Attack", "Insect Mayhem", "Vedalia Raid", "Vanhima Labyrinth"}, callback = function(v) questName = v end})
window:AddToggle({text = 'auto farm', state = farm, callback = function(v) 
    if not legitmode then
        farm = v; 
    end
end})
window:AddList({text = 'mob', state = mobName, values = {"Wolf","Dire Wolf","Orc", "Golem", "Abu", "Stork", "G-Knight", "Vedalia", "Scorpion", "Conjured Skeleton", "Thonk, The Orc Lord", "Hleam Eyes", "Rog, The Bearded One"}, callback = function(v) mobName = v end})
window:AddList({text = 'distance option', state = distanceOption, values = {"Default Distances", "Custom Distance"}, callback = function(v) distanceOption = v end})
window:AddSlider({text = 'distance from mob', flag = "distancefrommob", value = 8, min = 0, max = 20, float = 0.1, callback = function(v) mobDistance = v; changingDistance = true; wait(); changingDistance = false end})
window:AddSlider({text = 'tween speed', flag = "tweenspeeder", value = 150, min = 10, max = 500, callback = function(v) tweenspeed = v end})
window:AddToggle({text = 'auto attack', state = autoAttack, callback = function(v) 
    if not legitmode then
        autoAttack = v 
    end
end})
window:AddToggle({text = 'auto sword', state = autoSword, callback = function(v) 
    if not legitmode then
        autoSword = v 
    end
end})
window:AddToggle({text = 'spam sword', state = spamSword, callback = function(v) 
    if not legitmode then
        spamSword = v 
    end
end})
window:AddToggle({text = 'anti afk', state = antiafk, callback = function(v) antiafk = v end})
window:AddToggle({text = 'anti aggro', state = antiaggro, callback = function(v)
    if not legitmode then
        antiaggro = v 
    end
end})
window:AddToggle({text = 'legit mode', state = legitmode, callback = function(v) legitmode = v end})

local window2 = lib:CreateWindow('movement')
window2:AddToggle({text = 'noclip', state = noclip, callback = function(v)
    if not legitmode then
        noclip = v
    end
end})
window2:AddToggle({text = 'no jump cooldown', state = nojumpCooldown, callback = function(v) 
    if not legitmode then
        nojumpCooldown = v
        repeat wait() until LocalPlayer.Character and LocalPlayer.Character.JumpCooldown
        LocalPlayer.Character.JumpCooldown.Disabled = nojumpCooldown 
    end
end})
window2:AddBind({text = 'fly', hold = false, key = "H", callback = function()
    if not legitmode then
        if not isFlying then
            startflying()
        elseif isFlying then
            NOFLY()
            if game.Players.LocalPlayer.Character then
                if game.Players.LocalPlayer.Character:FindFirstChild("Float") then
                    game.Players.LocalPlayer.Character:FindFirstChild("Float"):Destroy()
                end
            end
            local AnimationTracks = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()
            for i, track in pairs (AnimationTracks) do
                track:Stop()
            end
        end
    end
end})
window2:AddSlider({text = 'flyspeed', flag = "slider1", value = 1, min = .45, max = 10, callback = function(v) iyflyspeed = v end})
window2:AddSlider({text = 'WalkSpeed', flag = "slider1", value = 16, min = 16, max = 200, callback = function(v) walkspeed = v end})
window2:AddSlider({text = 'JumpPower', flag = "slider1", value = 50, min = 50, max = 100, callback = function(v) jumppower = v end})

--TELEPORT TO TOWNS BUTTONS NEAR BOTTOM OF SCRIPT

local window3 = lib:CreateWindow('visuals')
local noob
window3:AddToggle({text = 'fullbright', state = fullbright, callback = function(v)
    fullbright = v
    if fullbright then
    game:GetService("Lighting").Brightness = 1
    game:GetService("Lighting").FogEnd = 1000000000
    for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
        if v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
    noob = game.Lighting.Atmosphere.Changed:Connect(function()
        game.Lighting.Atmosphere.Density = 0
        game.Lighting.Atmosphere.Haze = 0
        game.Lighting.Atmosphere.Glare = 0
    end)
    else
        noob = nil
        game:GetService("Lighting").Brightness = 4.38
        game:GetService("Lighting").FogEnd = 100000
        for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
            if (v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect")) and v.Name ~= "MenuBlur" and v.Name ~= "IntroBlur" then
                v.Enabled = true
            end
        end
    end
end})

for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
    if (v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") or v:IsA("BloomEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect")) and v.Name ~= "MenuBlur" and v.Name ~= "IntroBlur" then
        v.Changed:Connect(function()
            if fullbright then
                v.Enabled = false
            end
        end)
    end
end

window3:AddToggle({text = 'player chams', state = playerchams, callback = function(v)
    playerchams = v
    for i,v in pairs(game:GetService("CoreGui"):WaitForChild("PLAYERCHAMS").Folder:GetChildren()) do
        v.Visible = playerchams
    end
end})

window3:AddToggle({text = 'player ESP', state = playeresp, callback = function(v)
    playeresp = v
    for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
        local plrchar = plr.Character
        if plr ~= LP and plrchar and plrchar:FindFirstChild("Head") and plrchar.Head:FindFirstChild("ESP") then
            plrchar.Head.ESP.Enabled = playeresp
            if v then
                plrchar:WaitForChild('Humanoid').DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            else
                plrchar:WaitForChild('Humanoid').DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
            end
        end
    end
end})

window3:AddToggle({text = 'player health ESP', state = playerhealthesp, callback = function(v)
    playerhealthesp = v
    for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
        local plrchar = plr.Character
        if plr ~= LP and plrchar and plrchar.HumanoidRootPart and plrchar.HumanoidRootPart:FindFirstChild("HEALTHESP") then
            plrchar.HumanoidRootPart.HEALTHESP.Enabled = playerhealthesp
        end
    end
end})

window3:AddToggle({text = 'mob ESP', state = mobesp, callback = function(v)
    mobesp = v
    for _,mob in pairs(workspace.NPCS:GetChildren()) do
        for _, hitbox in pairs(mob:GetChildren()) do
            if hitbox.Name == "Hitbox" then
                hitbox.ESP.Enabled = mobesp
            end
        end
    end
end})

window3:AddToggle({text = 'mob health ESP', state = mobhealthesp, callback = function(v)
    mobhealthesp = v
    for _,mob in pairs(workspace.NPCS:GetChildren()) do
        for _, hitbox in pairs(mob:GetChildren()) do
            if hitbox.Name == "Hitbox" then
                hitbox.HEALTHESP.Enabled = mobhealthesp
            end
        end
    end
end})

local areas = {}
for _,area in pairs(workspace.Areas:GetChildren()) do
    if areas[area.Name] == nil then
        areas[area.Name] = area
    end
end

for _, area in pairs(areas) do
    for i,v in pairs(getconnections(area.ChildAdded)) do
        v:Disable()
    end
	local billgui = Instance.new('BillboardGui', area)
	local textlab = Instance.new('TextLabel', billgui)

	billgui.Name = "AREAESP"
	billgui.AlwaysOnTop = true
	billgui.ExtentsOffset = Vector3.new(0, 2, 0)
	billgui.Size = UDim2.new(10, 0, 10, 0)

	textlab.Name = 'area'
	textlab.BackgroundColor3 = Color3.new(0, 0, 0)
	textlab.BackgroundTransparency = 1    
	textlab.BorderSizePixel = 0
	textlab.Position = UDim2.new(0, 0, 0, 0)
	textlab.Size = UDim2.new(1, 0, 1, 0)
	textlab.Visible = true
	textlab.ZIndex = 10
	textlab.Font = 'SciFi'
	textlab.FontSize = 'Size24'
	textlab.Text = area.Name
	textlab.TextTransparency = 0
	textlab.TextStrokeTransparency = 1
	textlab.TextColor3 = Color3.fromRGB(0,255,255)

    billgui.Enabled = false
end

window3:AddToggle({text = 'locations ESP', state = locationsEsp, callback = function(v)
    locationsEsp = v
    for _, area in pairs(areas) do
        area.AREAESP.Enabled = locationsEsp
    end
end})

--"lib:Init()" NEAR BOTTOM OF SCRIPT

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character

local GameMt = getrawmetatable(game)
local OldNameCall = GameMt.__namecall

setreadonly(GameMt, false)

local index = GameMt.__index
local newindex = GameMt.__newindex

local spoofWS = plr.Character.Humanoid.WalkSpeed
local spoofJP = plr.Character.Humanoid.JumpPower

GameMt.__index = newcclosure(function(t,i)
-- index = "WalkSpeed"
-- table = "Humanoid"
    if not checkcaller() then
        if tostring(i) == "WalkSpeed" then
            return spoofWS
        elseif tostring(i) == "JumpPower" then
            return spoofJP
        --elseif tostring(i) == "CanCollide" then
        --    print(tostring(i))
        --    return true
        elseif tostring(i) == "BodyGyro" then
            print("ahhh goo stoopid")
            return false
        elseif tostring(i) == "BodyVelocity" then
            print("ahhh goo stoopidddd")
            return false
        elseif t == statetype and i == "StrafingNoPhysics" then
            print(tostring(i))
            return false
        elseif tostring(i) == "BillboardGui" then
            print(tostring(i))
            return nil
        end
    end
    return index(t,i)
end)
local a = true
GameMt.__namecall = newcclosure(function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()
    if not checkcaller() then
        if (tostring(Self) == "UpdateLocation" or tostring(Self) == "ServerCheck") and NamecallMethod == "FireServer" and Args[1] == nil then
            --print(tostring(Self), NamecallMethod)
            --return wait(9e9)
        elseif (tostring(Self) == "Trigger")and NamecallMethod == "FireServer" and Args[1] == nil then
            if antiaggro then
                return
            end
        elseif (NamecallMethod == "Kick" or NamecallMethod == "kick") then
            return wait(9e9)
        elseif (NamecallMethod == "FindFirstChild" or NamecallMethod == "WaitForChild" or NamecallMethod == "FindFirstChildWhichIsA" or NamecallMethod == "FindFirstColdOfClass") and Args[1] == "BodyVelocity" then
            return
        --elseif NamecallMethod == "GetState" and tostring(Self) == "Humanoid" then
        --    print(tostring(Self))
        --    return "Running"
        elseif NamecallMethod == "Connect" and tostring(Self) == "Strafing" then
            return wait(9e9)
        end
    end
    return OldNameCall(Self, ...)
end)

setreadonly(GameMt, true)

local function espMob(mob)
    for i,v in pairs(getconnections(mob.Hitbox.ChildAdded)) do
        v:Disable()
    end
	local billgui = Instance.new('BillboardGui', mob.Hitbox)
	local textlab = Instance.new('TextLabel', billgui)

	billgui.Name = "ESP"
	billgui.AlwaysOnTop = true
	billgui.ExtentsOffset = Vector3.new(0, 3, 0)
	billgui.Size = UDim2.new(10, 0, 10, 0)

	textlab.Name = 'Mob'
	textlab.BackgroundColor3 = Color3.new(255, 255, 255)
	textlab.BackgroundTransparency = 1    
	textlab.BorderSizePixel = 0
	textlab.Position = UDim2.new(0, 0, 0, 0)
	textlab.Size = UDim2.new(1, 0, 1, 0)
	textlab.Visible = true
	textlab.ZIndex = 10
	textlab.Font = 'SciFi'
	textlab.FontSize = 'Size14'
	textlab.Text = mob.Name
	textlab.TextTransparency = 0
	textlab.TextStrokeTransparency = 1
	textlab.TextColor3 = Color3.fromRGB(42, 163, 255)
	if not mobesp then
        billgui.Enabled = false
    end
end

local function createmobHealthbar(mob)
	--print("healthing " .. player.Name)
	for i,v in pairs(getconnections(mob.Hitbox.ChildAdded)) do
        v:Disable()
    end
	local billgui = Instance.new('BillboardGui', mob.Hitbox)
	local textlab = Instance.new('TextLabel', billgui)

	billgui.Name = "HEALTHESP"
	billgui.AlwaysOnTop = true
	billgui.ExtentsOffset = Vector3.new(0, 2, 0)
	billgui.Size = UDim2.new(10, 0, 10, 0)
    billgui.MaxDistance = 200

	textlab.Name = 'health'
	textlab.BackgroundColor3 = Color3.new(255, 255, 255)
	textlab.BackgroundTransparency = 1    
	textlab.BorderSizePixel = 0
	textlab.Position = UDim2.new(0, 0, 0, 0)
	textlab.Size = UDim2.new(1, 0, 1, 0)
	textlab.Visible = true
	textlab.ZIndex = 10
	textlab.Font = 'SciFi'
	textlab.FontSize = 'Size14'
    --print(mob.Name, "healthing")
	textlab.Text = mob.Health.Value .. "/" .. mob.Health.MaxValue
	textlab.TextTransparency = 0
	textlab.TextStrokeTransparency = 1
	textlab.TextColor3 = Color3.fromRGB(167, 17, 17)
    --player.Character:WaitForChild('Humanoid').DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	if not mobhealthesp then
        billgui.Enabled = false
    end
    mob.Health:GetPropertyChangedSignal("Value"):Connect(function() --//Triggers when any Property changed
        if mob and mob.Health then
            textlab.Text = mob.Health.Value .. "/" .. mob.Health.MaxValue
        end                  
    end)
end


for _,mob in pairs(workspace.NPCS:GetChildren()) do
    if mob and mob:FindFirstChild("Hitbox") then
        espMob(mob)
        createmobHealthbar(mob)
    end
end

workspace.NPCS.ChildAdded:Connect(function(mob)
    if mob then
        mob:WaitForChild("Hitbox")
        mob:WaitForChild("Health")
        espMob(mob)
        createmobHealthbar(mob)
    end
end)


local function espPlayer(player)
    print("esping player", player.Name)
    for i,v in pairs(getconnections(player.Character:WaitForChild("Head").ChildAdded)) do
        v:Disable()
    end
	local billgui = Instance.new('BillboardGui', player.Character.Head)
    
	local textlab = Instance.new('TextLabel', billgui)
	billgui.Name = "ESP"
	billgui.AlwaysOnTop = true
	billgui.ExtentsOffset = Vector3.new(0, 3, 0)
	billgui.Size = UDim2.new(10, 0, 10, 0)

	textlab.Name = 'Player'
	textlab.BackgroundColor3 = Color3.new(255, 255, 255)
	textlab.BackgroundTransparency = 1    
	textlab.BorderSizePixel = 0
	textlab.Position = UDim2.new(0, 0, 0, 0)
	textlab.Size = UDim2.new(1, 0, 1, 0)
	textlab.Visible = true
	textlab.ZIndex = 10
	textlab.Font = 'SciFi'
	textlab.FontSize = 'Size14'
	textlab.Text = player.Name
	textlab.TextTransparency = 0
	textlab.TextStrokeTransparency = 1
	textlab.TextColor3 = Color3.fromRGB(0,255,127)
    --player.Character:WaitForChild('Humanoid').DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	if not playeresp then
        billgui.Enabled = false
    end
end

local function createHealthbar(player)
	--print("healthing " .. player.Name)
	for i,v in pairs(getconnections(player.Character.Head.ChildAdded)) do
        v:Disable()
    end
    local hrp = player.Character:WaitForChild("HumanoidRootPart")
	local billgui = Instance.new('BillboardGui', hrp)
	local textlab = Instance.new('TextLabel', billgui)

	billgui.Name = "HEALTHESP"
	billgui.AlwaysOnTop = true
	billgui.ExtentsOffset = Vector3.new(0, 2, 0)
	billgui.Size = UDim2.new(10, 0, 10, 0)
    billgui.MaxDistance = 200

	textlab.Name = 'health'
	textlab.BackgroundColor3 = Color3.new(0, 0, 0)
	textlab.BackgroundTransparency = 1    
	textlab.BorderSizePixel = 0
	textlab.Position = UDim2.new(0, 0, 0, 0)
	textlab.Size = UDim2.new(1, 0, 1, 0)
	textlab.Visible = true
	textlab.ZIndex = 10
	textlab.Font = 'SciFi'
	textlab.FontSize = 'Size14'
	textlab.Text = player.Character:WaitForChild("Health").Value .. "/" .. player.Character:WaitForChild("Health").MaxValue
	textlab.TextTransparency = 0
	textlab.TextStrokeTransparency = 1
	textlab.TextColor3 = Color3.fromRGB(255,255,255)
    --player.Character:WaitForChild('Humanoid').DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	if not playerhealthesp then
        billgui.Enabled = false
    end
    player.Character.Health:GetPropertyChangedSignal("Value"):Connect(function() --//Triggers when any Property changed
        if hrp and hrp.Parent and hrp.Parent.Health then
            textlab.Text = player.Character.Health.Value .. "/" .. player.Character:WaitForChild("Health").MaxValue
        end                  
    end)
end

for _,player in pairs(game:GetService('Players'):GetPlayers()) do
    if player ~= Players.LocalPlayer then
        local char = player.Character or player.CharacterAdded:Wait()
        if char and char:WaitForChild("Head") then
            espPlayer(player)
            createHealthbar(player)
        end
        player.CharacterAdded:Connect(function(character)
            player.Character:WaitForChild('Head')
            espPlayer(player)
            createHealthbar(player)
        end)
    end
end

game:GetService('Players').PlayerAdded:Connect(function(player)
	if player then
		--print(player, "has joined!")
		local char = player.Character or player.CharacterAdded:Wait()
		if char then
            player.Character:WaitForChild('Head') 
			--print(char, "'s character has been found!")
            espPlayer(player)
			createHealthbar(player)
		end
        player.CharacterAdded:Connect(function(character)
            player.Character:WaitForChild('Head') 
            player.Character:WaitForChild('Humanoid')  
            espPlayer(player)
            createHealthbar(player)
        end)
	end
end)

local ScreenGui = Instance.new("ScreenGui",game:GetService('CoreGui'))
ScreenGui.Name = "PLAYERCHAMS"
local ESPLocation = Instance.new("Folder",ScreenGui)
local targetPlayer = ""

local Targets = {
    "HumanoidRootPart",
    --[["LeftLowerArm",
    "LeftUpperArm",
    "LowerTorso",
    "RightLowerArm",
    "RightUpperArm",
    "RightUpperLeg",
    "LeftLowerLeg",
    "LeftUpperLeg",
    "RightLowerLeg",
    "UpperTorso"--]]
}


function espPart(part,player)
    local esp = Instance.new("BoxHandleAdornment",ESPLocation)
    esp.Adornee = part
    esp.AlwaysOnTop = true
    esp.ZIndex = 1
    esp.Transparency = 0.7
    esp.Size = part.Size / 1.1
	if part.Name == "LeftHand" or part.Name == "RightHand" then
		esp.Size = part.Size - Vector3.new(0,1,0)
	end
    esp.Color3 = Color3.fromRGB(255,0,0)--player.TeamColor.Color
    if player.Name == targetPlayer then
        esp.Size = part.Size + Vector3.new(.1, .1, .1)
        esp.Color3 = Color3.fromRGB(255,255,0)
    end
    esp.MouseEnter:Connect(function()
        if player.Team ~= game:GetService('Players').LocalPlayer.Team then
            local currentFrame = esp
        end
    end)
   
    player.CharacterRemoving:Connect(function()
        esp:Destroy()
    end)
	if player.Team then
	player.Team.PlayerRemoved:Connect(function(RemovedPlayer)
            if RemovedPlayer ~= player and RemovedPlayer ~= game:GetService('Players').LocalPlayer then
                return
            else
                esp.Color3 = player.TeamColor.Color
            end
	    end)
	end
    return esp
end
 
function espPartPlayer(player)
    if player.Character ~= nil then
        for _,part in pairs(player.Character:GetChildren())do
            if part:IsA("BasePart") and part.Name ~= "Head" and part.Name ~= "RightHand" and part.Name ~= "LeftHand" and part.Name ~= "LeftFoot" and part.Name ~= "RightFoot" then
                --print(part)
                local esp = espPart(part,player)
                if not playerchams then
                    esp.Visible = false
                end
            end
        end
    end
end
 
function ESP()
    ESPLocation:ClearAllChildren()
    for _,player in pairs(game:GetService('Players'):GetPlayers())do
        if player ~= game:GetService('Players').LocalPlayer then
            espPartPlayer(player)
        end
    end
end

ESP()
for i,v in pairs(ESPLocation:GetChildren()) do
    v.Visible = false
end

local function WaitUntilCharacterLoaded(Char)
    for _,Part in pairs(Targets)do
        Char:WaitForChild(Part)
    end
end

game:GetService('Players').PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function(Char)
        WaitUntilCharacterLoaded(Char)
        espPartPlayer(Player)
    end)
end)

for _,Player in pairs(game:GetService('Players'):GetPlayers())do
    Player.CharacterAdded:Connect(function(Char)
        WaitUntilCharacterLoaded(Char)
        espPartPlayer(Player)
    end)
end

local function isAlive()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char:FindFirstChild("Client") and char:FindFirstChild("Health") and char.Humanoid:GetState() ~= Enum.HumanoidStateType.PlatformStanding and char.Humanoid:GetState() ~= Enum.HumanoidStateType.Ragdoll then
        local health = char.Health
        local hum = char.Humanoid
        if health.Value > 0 and hum.Health > 0 then
            return true
        end
    end
    return false
end

local isRunning = false
local runAnimPlaying = false
local Animations = char.Client.Animations
local run = char.Humanoid:LoadAnimation(Animations.Run)
if char.Humanoid.WalkSpeed < walkspeed then
    char.Humanoid.WalkSpeed = walkspeed
end
if char.Humanoid.JumpPower < jumppower then
    char.Humanoid.JumpPower = jumppower
end
local cheese
cheese = char.Humanoid.Changed:Connect(function()
    if not legitmode then
        if isAlive() then
            if char.Humanoid.WalkSpeed < walkspeed then
                char.Humanoid.WalkSpeed = walkspeed
            end
            if char.Humanoid.JumpPower < jumppower then
                char.Humanoid.JumpPower = jumppower
            end
        end
    end
end)

plr.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    char:WaitForChild("JumpCooldown")
    if nojumpCooldown then
        char.JumpCooldown.Disabled = true
    end
    if not legitmode then
        if char.Humanoid.WalkSpeed < walkspeed then
            char.Humanoid.WalkSpeed = walkspeed
        end
        if char.Humanoid.JumpPower < jumppower then
            char.Humanoid.JumpPower = jumppower
        end
        cheese = nil
        char.Humanoid.Changed:Connect(function()
            if isAlive() then
                if char.Humanoid.WalkSpeed < walkspeed then
                    char.Humanoid.WalkSpeed = walkspeed
                end
                if char.Humanoid.JumpPower < jumppower then
                    char.Humanoid.JumpPower = jumppower
                end
            end
        end)
    end
end)

local isTweening = false;

cheese = char.Humanoid.StateChanged:Connect(function(oldState, newState)
    if (isFlying or isTweening) and newState == Enum.HumanoidStateType.Freefall then
        --dsschar.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
    end
end)

plr.CharacterAdded:Connect(function(char)
    cheese = nil
    char:WaitForChild("Humanoid").StateChanged:Connect(function(oldState, newState)
        if (isFlying or isTweening) and newState == Enum.HumanoidStateType.Freefall then
            --char.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
end)

local WHeld = false
local SHeld = false
local AHeld = false
local DHeld = false

Mouse.KeyDown:Connect(function(key)
    if key == "w" then
        WHeld = true
    end
end)

Mouse.KeyUp:Connect(function(key)
    if key == "w" then
        WHeld = false
    end
end)

Mouse.KeyDown:Connect(function(key)
    if key == "s" then
        SHeld = true
    end
end)

Mouse.KeyUp:Connect(function(key)
    if key == "s" then
        SHeld = false
    end
end)

Mouse.KeyDown:Connect(function(key)
    if key == "a" then
        AHeld = true
    end
end)

Mouse.KeyUp:Connect(function(key)
    if key == "a" then
        AHeld = false
    end
end)


Mouse.KeyDown:Connect(function(key)
    if key == "d" then
        DHeld = true
    end
end)

Mouse.KeyUp:Connect(function(key)
    if key == "d" then
        DHeld = false
    end
end)


local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(Input, GameProcessedEvent)
	if not GameProcessedEvent then
        if Input.KeyCode == Enum.KeyCode.LeftShift then
            isRunning = true
            walkspeed = walkspeed + 16
            iyflyspeed = iyflyspeed + .3
            if WHeld then
                CONTROL.F = iyflyspeed
            elseif SHeld then
                CONTROL.B = -iyflyspeed
            elseif AHeld then
                CONTROL.L = -iyflyspeed 
            elseif DHeld then 
                CONTROL.R = iyflyspeed
            end
        end
	end
end)

UIS.InputEnded:Connect(function(Input, GameProcessedEvent)
	if Input.KeyCode == Enum.KeyCode.LeftShift then
        isRunning = false
		walkspeed = walkspeed - 16
        iyflyspeed = iyflyspeed - .3
        if WHeld then
            CONTROL.F = iyflyspeed
        elseif SHeld then
            CONTROL.B = -iyflyspeed
        elseif AHeld then
            CONTROL.L = -iyflyspeed 
        elseif DHeld then 
            CONTROL.R = iyflyspeed
        end
	end
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function findNearestMob(mobname)
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then return end
    local TargetDistance = math.huge
    local Target    
    for i,v in pairs(workspace.NPCS:GetChildren()) do
        if v.Name == mobname then
            if v:FindFirstChild("Hitbox") then
                local mag = (HumanoidRootPart.Position - v.Hitbox.Position).Magnitude
                if mag < TargetDistance then
                    TargetDistance = mag
                    Target = v.Hitbox
                end
            end
        end
    end
    --Target.Size = Target.Size + Vector3.new(2,2,2)
    return Target
end


local function tweenplayer(cframe,speed, waitTrue)
    repeat wait() until LocalPlayer.Character
    and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
    and LocalPlayer.Character:FindFirstChild("Humanoid")
    and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0
    and LocalPlayer.Character:FindFirstChild("Torso")
    isTweening = true
    local TweenInfo = TweenInfo.new(((cframe.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)/speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false)
    local Objective = {CFrame = cframe}
    local TweenPlayer = game:GetService("TweenService"):Create(LocalPlayer.Character.HumanoidRootPart, TweenInfo, Objective)
    --game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
    TweenPlayer:Play()
    game:GetService("RunService").RenderStepped:Wait()
    if waitTrue then
        TweenPlayer.Completed:Wait()
    end
    --wait(.1);
    --game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false
    isTweening = false;
    return TweenPlayer
end

local function checkValid(mob)
    local char = LocalPlayer.Character
    local HumanoidRootPart = char:FindFirstChild("HumanoidRootPart")
    if not (char or HumanoidRootPart) then return true end
    return not mob or not mob.Parent or mob.Parent.Health.Value <= 0 or char.Humanoid.Health <= 0
end

local doingQuest = false

local function findNearestQuest()
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then return end
    local TargetDistance = math.huge
    local Target    
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "Papers" then
            for a,b in pairs(v:GetDescendants()) do
                if b.Name == "QuestName" and b.Text == questName then
                    local part = b.Parent.Parent.Parent
                    local mag = (HumanoidRootPart.Position - part.Position).Magnitude
                    if mag < TargetDistance then
                        TargetDistance = mag
                        Target = part
                    end
                end
            end
        end
    end
    return Target
end

--RAYCAST TELEPORT PLAYER
local stopTweening = false
local isRayCastTweening = false
local function raycastTweenPlayer(part)
    if typeof(part) == "Vector3" then
        temppart = Instance.new("Part", workspace)
        temppart.Position = part
        temppart.Anchored = true
        temppart.CanCollide = false
        part = temppart
    end
    if isAlive() and isRayCastTweening == false then
        isRayCastTweening = true
        local char = LocalPlayer.Character
        local hrp = char:WaitForChild("HumanoidRootPart")
        local currentTween
        local height = 3 + hrp.Position.Y
        if isAlive() and char:FindFirstChild("HumanoidRootPart") then
            local dist = (char.HumanoidRootPart.Position-part.Position).Magnitude
            local secondTween
            repeat
                game:GetService("RunService").RenderStepped:Wait()
                while math.sqrt((part.Position.X-hrp.Position.X)^2+(part.Position.Z-hrp.Position.Z)^2) > 10 and isAlive() and not stopTweening do
                    local rayParams = RaycastParams.new()
                    rayParams.FilterDescendantsInstances = {hrp.Parent, workspace.IgnoreList, workspace.LOWL, workspace.NPCS}
                    local lookvec = (Vector3.new(part.Position.X, part.Position.Y, part.Position.Z) - hrp.Position).Unit*10
                    local raycastResult = workspace:Raycast(hrp.Position, lookvec, rayParams)
                    if raycastResult and raycastResult.Instance.Name ~= "LOWL" then
                        height = height + 5
                        if currentTween then currentTween:Cancel() end
                        if isAlive() and not stopTweening then tweenplayer(CFrame.new(hrp.Position.X, height, hrp.Position.Z),tweenspeed) end
                    end
                    local partPos = part.Position
                    local hrpPos = hrp.Position
                    if isAlive() and not stopTweening then currentTween = tweenplayer(CFrame.new(partPos.X, height, partPos.Z),tweenspeed) end
                end
            until math.sqrt((part.Position.X-hrp.Position.X)^2+(part.Position.Z-hrp.Position.Z)^2) <= 10 or not isAlive() or stopTweening
            if currentTween then currentTween:Cancel() end
            if secondTween then secondTween:Cancel() end
            repeat 
                if not isAlive() or stopTweening then break end
                tweenplayer(part.CFrame+Vector3.new(0,6,0),tweenspeed)
            until (char.HumanoidRootPart.Position-part.Position).Magnitude < 10 
            wait(1)
        end
        isRayCastTweening = false
    end
end

window2:AddButton({text = 'TWEEN TO TOWN 1', callback = function()
    if isAlive() and not legitmode then
        local pos = Vector3.new(-2768.84863, -91.7610626, 2346.71216)
        local hrp = LocalPlayer.Character.HumanoidRootPart
        raycastTweenPlayer(pos)
    end
end})

window2:AddButton({text = 'TWEEN TO TOWN 2', callback = function()
    if isAlive() and not legitmode then
        local pos = Vector3.new(-5252.22656, 170.033829, 2402.03809)
        local hrp = LocalPlayer.Character.HumanoidRootPart
        raycastTweenPlayer(pos)
    end
end})

window2:AddButton({text = 'TWEEN TO TOWN 3', callback = function() 
    if isAlive() and not legitmode then
        local pos = Vector3.new(-5727.87402, 276.396912, 5878.82813)
        local hrp = LocalPlayer.Character.HumanoidRootPart
        raycastTweenPlayer(pos)
    end
end})

window2:AddButton({text = 'TWEEN TO TOWN 4', callback = function() 
    if isAlive() and not legitmode then
        local pos = Vector3.new(-10188.8535, -109.471252, 218.569336)
        local hrp = LocalPlayer.Character.HumanoidRootPart
        raycastTweenPlayer(pos)
    end
end})

window2:AddButton({text = 'STOP TWEENING', callback = function() 
    stopTweening = true
    wait(.5)
    stopTweening = false
end})

lib:Init()

local function doQuest()
    if not LocalPlayer.PlayerGui:FindFirstChild("Quest") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local questPart = findNearestQuest()
        if questPart and not doingQuest then
            doingQuest = true
            if autoQuest and isAlive() then
                local currentTween
                local char = LocalPlayer.Character
                local hrp = char:WaitForChild("HumanoidRootPart")
                local height = 3 + hrp.Position.Y
                if isAlive() and char:FindFirstChild("HumanoidRootPart") then
                    local dist = (char.HumanoidRootPart.Position-questPart.Position).Magnitude
                    local secondTween
                    repeat
                        game:GetService("RunService").RenderStepped:Wait()
                        while math.sqrt((questPart.Position.X-hrp.Position.X)^2+(questPart.Position.Z-hrp.Position.Z)^2) > 10 and isAlive() do
                            local rayParams = RaycastParams.new()
                            rayParams.FilterDescendantsInstances = {hrp.Parent, workspace.IgnoreList, workspace.LOWL, workspace.NPCS}
                            local lookvec = (Vector3.new(questPart.Position.X, questPart.Position.Y, questPart.Position.Z) - hrp.Position).Unit*10
                            local raycastResult = workspace:Raycast(hrp.Position, lookvec, rayParams)
                            if raycastResult and raycastResult.Instance.Name ~= "LOWL" then
                                height = height + 5
                                if currentTween then currentTween:Cancel() end
                                if isAlive() then tweenplayer(CFrame.new(hrp.Position.X, height, hrp.Position.Z),tweenspeed) end
                            end
                            local questPartPos = questPart.Position
                            local hrpPos = hrp.Position
                            if isAlive() then currentTween = tweenplayer(CFrame.new(questPartPos.X, height, questPartPos.Z),tweenspeed) end
                        end
                    until math.sqrt((questPart.Position.X-hrp.Position.X)^2+(questPart.Position.Z-hrp.Position.Z)^2) <= 10 or not autoQuest or not isAlive()
                    if currentTween then currentTween:Cancel() end
                    if secondTween then secondTween:Cancel() end
                    repeat 
                        if not isAlive() then break end
                        tweenplayer(questPart.CFrame+Vector3.new(0,6,0),tweenspeed)
                    until (char.HumanoidRootPart.Position-questPart.Position).Magnitude < 10 
                    wait(.5)
                    fireclickdetector(questPart.ClickDetector)
                    wait(.5)
                    doingQuest = false
                end
            end
        end
    else
        if noclip == false then
            collideParts()
        elseif baseplatecollideOn == false then
            baseplateCollideParts()
        end
    end
end

local function isQuestAvailable()
    if not LocalPlayer.PlayerGui:FindFirstChild("Quest") and autoQuest then
        return true
    end
    return false
end



spawn(function()
    while wait() do
        if farm and not isQuestAvailable() then
            --local success, result = pcall(function()
                LocalPlayer.DevCameraOcclusionMode = 1
                if isAlive() then
                    local char = LocalPlayer.Character
                    local hrp = char.HumanoidRootPart
                    --char.Client.Events.LightAttack:FireServer("SecretCode")
                    local mob = findNearestMob(mobName)
                    if mob then
                        local dist = (char.HumanoidRootPart.Position-mob.Position).Magnitude
                        local secondTween
                        local thirdTween
                        local height = 3 + hrp.Position.Y
                        repeat
                            if thirdTween then thirdTween:Cancel() end
                            game:GetService("RunService").RenderStepped:Wait()
                            if farm and isAlive()then
                                local currentTween
                                while math.sqrt((mob.Position.X-hrp.Position.X)^2+(mob.Position.Z-hrp.Position.Z)^2) > 15 and not isQuestAvailable() and isAlive() do
                                    local rayParams = RaycastParams.new()
                                    rayParams.FilterDescendantsInstances = {hrp.Parent, workspace.IgnoreList, workspace.LOWL, workspace.NPCS}
                                    local lookvec = (Vector3.new(mob.Position.X, mob.Position.Y, mob.Position.Z) - hrp.Position).Unit*15
                                    local raycastResult = workspace:Raycast(hrp.Position, lookvec, rayParams)
                                    if raycastResult and raycastResult.Instance.Name ~= "LOWL" then
                                        height = height + 5
                                        if currentTween then
                                            currentTween:Cancel()
                                        end
                                        if not isQuestAvailable() and isAlive() then tweenplayer(CFrame.new(hrp.Position.X, height, hrp.Position.Z),tweenspeed) end
                                    end
                                    local mobPos = mob.Position
                                    local hrpPos = hrp.Position
                                    if not isQuestAvailable() and isAlive() then currentTween = tweenplayer(CFrame.new(mobPos.X, height, mobPos.Z),tweenspeed) end
                                end
                            end
                        until math.sqrt((mob.Position.X-hrp.Position.X)^2+(mob.Position.Z-hrp.Position.Z)^2) <= 15 or checkValid(mob) or not farm or not isQuestAvailable() or isAlive()
                        if currentTween then currentTween:Cancel() end
                        if secondTween then secondTween:Cancel() end
                        if isAlive() then
                            dist = (char.HumanoidRootPart.Position-mob.Position).Magnitude
                            if not isQuestAvailable() and dist > 30 and isAlive() then tweenplayer(mob.CFrame+Vector3.new(0,3,0),tweenspeed,true) end
                            local hrp = LocalPlayer.Character.HumanoidRootPart
                            local distanceFrom = CFrame.new(0,0,math.random(10,10.1))
                            local angle = CFrame.Angles(0, math.rad(90), 0)
                            mob.Transparency = .5
                            if mob.Parent and not string.match(mob.Parent.Name:lower(), "wolf") then
                                angle = CFrame.Angles(0,0,0)
                                distanceFrom = CFrame.new(0,0,math.random(11,11.1))
                            end
                            if mob.Parent and (mob.Parent.Name == "Golem" or mob.Parent.Name == "Orc") then
                                angle = CFrame.Angles(0, math.rad(180), 0)
                            end
                            if distanceOption == "Custom Distance" then
                                distanceFrom = CFrame.new(0,0,math.random(mobDistance,mobDistance+.1))
                            end
                            spawn(function()
                                while not(checkValid(mob) or not farm or isQuestAvailable() or not isAlive()) and not changingDistance do 
                                    thirdTween = tweenplayer(CFrame.new((mob.CFrame*angle*distanceFrom).Position, hrp.Position + (mob.Position-hrp.Position).Unit),math.huge)
                                end
                            end)
                        end
                    end
                    if autoQuest and not doingQuest then
                        while isTweening == true do wait() end
                        repeat doQuest() until isQuestAvailable() == false
                    end
                end
            --end)
            --if not success then
            --    warn(result)
            --end
        elseif isQuestAvailable() and not doingQuest then
            doQuest()
        end
    end
end)

local function findNearestEntity()
    local Character = LocalPlayer.Character
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    if not (Character or HumanoidRootPart) then return end
    local TargetDistance = math.huge
    local Target    
    for i,v in pairs(workspace.NPCS:GetChildren()) do
        if (v:FindFirstChild("Hitbox") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0) then
            local mag = (HumanoidRootPart.Position - v.Hitbox.Position).Magnitude
            if mag < TargetDistance then
                TargetDistance = mag
                Target = v.Hitbox
            end
        end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer then
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local mag = (HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                if mag < TargetDistance then
                    TargetDistance = mag
                    Target = v.Character.HumanoidRootPart
                end
            end
        end
    end
    return Target
end


spawn(function()
    while wait(_G.attackspeed or .1) do
        if autoAttack or farm then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Client") and LocalPlayer.Character.Client:FindFirstChild("Events")then
                local entity = findNearestEntity()
                local hrp = LocalPlayer.Character.HumanoidRootPart
                if entity and (hrp.Position - entity.Position).Magnitude < 50 then
                    local char = LocalPlayer.Character
                    char.Client.Events.LightAttack:FireServer("SecretCode")
                    print("attacking")
                end
            end
        end
    end
end)

spawn(function()
    while wait() do
        if autoSword then
            if isAlive() then
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and string.match(v.Name:lower(), "sword") then
                        v:Activate()
                    end
                end
            end
        end
    end
end)

spawn(function()
    while wait(.3) do
        if spamSword then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Client") and LocalPlayer.Character.Client:FindFirstChild("Events")then
                local char = LocalPlayer.Character
                char.Client.Events.ActivateWeapon:FireServer()
                for i,v in pairs(char:GetChildren()) do
                    if v:IsA("Tool") and string.match(v.Name:lower(), "sword") and not autoAttack then
                        v:Activate()
                    end
                end
            end
        end
    end
end)
spawn(function()
    while wait() do
        local cheese
        if antiafk then
            local VirtualUser=game:GetService('VirtualUser')
            cheese = game:service('Players').LocalPlayer.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        else
            cheese = nil
        end
    end
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if noclip or farm or autoQuest then
                LocalPlayer.Character.Head.CanCollide = false
                LocalPlayer.Character.Torso.CanCollide = false
            end
        end)
    end)
end)

local W = Instance.new("Part", workspace)
W.Size = Vector3.new(5, 2, 5)
W.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -4, 0)
W.Transparency = 1
W.Anchored = true
W.Name = "LOWL"
game:GetService("RunService"):BindToRenderStep("",0,function()
    if not LocalPlayer.Character or not LocalPlayer.Character:findFirstChildOfClass("Humanoid") then
        return
    end
    if (farm or autoQuest or isFlying or isRayCastTweening) and LocalPlayer.Character and LocalPlayer.Character.HumanoidRootPart then
        pcall(function()
            W.CanCollide = true
            W.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, -4, 0)
        end)
    else
        W.CanCollide = false
    end
end)
