local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Blind Shot",
   LoadingTitle = "diddy blud",
   LoadingSubtitle = "by Finalelele",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Esp players", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Esp players bruhhhh")
local Keybind = Tab:CreateKeybind({
   	Name = "Create esp",
   	CurrentKeybind = "E",
   	HoldToInteract = false,
   	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   	Callback = function(Keybind)
	for _,v in pairs (workspace:GetDescendants()) do
		if v:IsA("BasePart") and v.Name == "HumanoidRootPart" then
			local lp = game.Players.LocalPlayer
			local lpName = lp.Name
			local PlrPr = v.Parent
			if PlrPr.Name ~= "Character" and PlrPr.Name ~= lpName then
				local PlrBox = Instance.new("BoxHandleAdornment")
				PlrBox.Adornee = v
				PlrBox.Parent = PlrPr
				PlrBox.Size = Vector3.new(4, 5, 1)
				PlrBox.Transparency = 0.5
				PlrBox.Color3 = Color3.fromRGB(255,0,0)
				PlrBox.AlwaysOnTop = true
				PlrBox.Name = "PlayerEsp"
			end
			for _,v in pairs (PlrPr:GetDescendants()) do
				if v.Name == "Right Arm" and v.Parent ~= lpName then
					local GunBox = Instance.new("BoxHandleAdornment")
					GunBox.Adornee = PlrPr["Right Arm"]
					GunBox.Parent = PlrPr
					GunBox.Size = Vector3.new(1, 2, 1)
					GunBox.Transparency = 0.5
					GunBox.Color3 = Color3.fromRGB(255,0,0)
					GunBox.AlwaysOnTop = true
					GunBox.Name = "GunEsp"
				end
			end
		end
	end
end,
})

local Keybind = Tab:CreateKeybind({
   	Name = "Delete esp",
   	CurrentKeybind = "Q",
   	HoldToInteract = false,
   	Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   	Callback = function(Keybind)
		for _,v in pairs (workspace:GetDescendants()) do
			if v.Name == "PlayerEsp" then
				v:Destroy()
			end
		end

		for _,v in pairs (workspace:GetDescendants()) do
			if v.Name == "GunEsp" then
				v:Destroy()
			end
		end
   	end,
})
