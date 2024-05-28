local DEBUG = false

if DEBUG then
    getfenv () .getfenv = function ()
        return setmetatable ({ }, { __index = function () return function () return true than })
    than
than


-! services

local HttpService = game: GetService ("HttpService")
local Players = game: GetService ("Players")
local UserInputService = game: GetService ("UserInputService")
local RunService = game: GetService ("RunService")
local TweenService = game: GetService ("TweenService")


-! Color Handler

local function PackColour (Colour)
    return Color and typeof (Colour) = = "Color3" and { R = Color.R * 255, G = Color.G * 255, B = Color.B * 255 } or typeof (Colour) <TAG1" and Color or { R = 255, G = 255, B = 255 }
than

local function UnpackColour (Colour)
    return Color and Color3.fromRGB (Colour.R, Color.G, Color.B) or Color3.fromRGB (255, 255, 255)
than


-! Importing Configuration

local ImportedConfiguration = { }

pcall (function ()
    if not DEBUG and getfenv () .isfile and getfenv () .readfile and getfenv () .isfile (string format ("% s.ttwizz", game.GameId)) and getfenv () .readfile (string format "% s.ttwizz", game.GameId)) then
        ImportedConfiguration = HttpService: JSONDecode (getfenv () .readfile (string format ("% s.ttwizz", game.GameId))
        for Key, Value in next, ImportedConfiguration do
            if Key = = "FoVColour" or Key = = "ESPColour" then
                ImportedConfiguration [Key] = UnpackColour (Value)
            than
        than
    than
end)


-! Initializing Configuration

local Configuration = { }

-? Aimbot

Configuration.Aimbot = ImportedConfiguration ["Aimbot"] or false
Configuration.OnePressAimingMode = ImportedConfiguration ["OnePressAimingMode"] or false
Configuration.UseMouseMoving = ImportedConfiguration ["UseMouseMoving"] or false
Configuration.AimKey = ImportedConfiguration ["AimKey"] or "RMB"
Configuration.AimPartDropdownValues = ImportedConfiguration ["AimPartDropdownValues"] or { "Head", "HumanoidRootPart" }
Configuration.AimPart = ImportedConfiguration ["AimPart"] or "HumanoidRootPart"
Configuration.RandomAimPart = ImportedConfiguration ["RandomAimPart"] or false
Configuration.TriggerBot = ImportedConfiguration ["TriggerBot"] or false
Configuration.OnePressTriggeringMode = ImportedConfiguration ["OnePressTriggeringMode"] or false
Configuration.SmartTriggerBot = ImportedConfiguration ["SmartTriggerBot"] or false
Configuration.TriggerKey = ImportedConfiguration ["TriggerKey"] or "V"
Configuration.TeamCheck = ImportedConfiguration ["TeamCheck"] or false
Configuration.FriendCheck = ImportedConfiguration ["FriendCheck"] or false
Configuration.WallCheck = ImportedConfiguration ["WallCheck"] or false
Configuration.FoVCheck = ImportedConfiguration ["FoVCheck"] or false
Configuration.FoVRadius = ImportedConfiguration ["FoVRadius"] or 100
Configuration.MagnitudeCheck = ImportedConfiguration ["MagnitudeCheck"] or false
Configuration.TriggerMagnitude = ImportedConfiguration ["TriggerMagnitude"] or 500
Configuration.TransparencyCheck = ImportedConfiguration ["TransparencyCheck"] or false
Configuration.IgnoredTransparency = ImportedConfiguration ["IgnoredTransparency"] or 0.5
Configuration.GroupCheck = ImportedConfiguration ["GroupCheck"] or false
Configuration.WhitelistedGroup = ImportedConfiguration ["WhitelistedGroup"] or 0
Configuration.PlayerCheck = ImportedConfiguration ["PlayerCheck"] or false
Configuration.IgnoredPlayersDropdownValues = ImportedConfiguration ["IgnoredPlayersDropdownValues"] or { }
Configuration.IgnoredPlayers = ImportedConfiguration ["IgnoredPlayers"] or { }
Configuration.TargetPlayersDropdownValues = ImportedConfiguration ["TargetPlayersDropdownValues"] or { }
Configuration.TargetPlayers = ImportedConfiguration ["TargetPlayers"] or { }
Configuration.MoveDirectionOffset = ImportedConfiguration ["MoveDirectionOffset"] or false
Configuration.OffsetIncrement = ImportedConfiguration ["OffsetIncrement"] or 10
Configuration.UseSensitivity = ImportedConfiguration ["UseSensitivity"] or false
Configuration.Sensitivity = ImportedConfiguration ["Sensitivity"] or 10

-? Visuals

Configuration.ShowFoV = ImportedConfiguration ["ShowFoV"] or false
Configuration.FoVThickness = ImportedConfiguration ["FoVThickness"] or 2
Configuration.FoVTransparency = ImportedConfiguration ["FoVTransparency"] or 0.8
Configuration.FoVColour = ImportedConfiguration ["FoVColour"] or Color3.fromRGB (255, 255, 255)
Configuration.SmartESP = ImportedConfiguration ["SmartESP"] or false
Configuration.ESPBox = ImportedConfiguration ["ESPBox"] or false
Configuration.NameESP = ImportedConfiguration ["NameESP"] or false
Configuration.NameESPSize = ImportedConfiguration ["NameESPSize"] or 16
Configuration.TracerESP = ImportedConfiguration ["TracerESP"] or false
Configuration.ESPThickness = ImportedConfiguration ["ESPThickness"] or 2
Configuration.ESPTransparency = ImportedConfiguration ["ESPTransparency"] or 0.8
Configuration.ESPColour = ImportedConfiguration ["ESPColour"] or Color3.fromRGB (255, 255, 255)
Configuration.ESPUseTeamColour = ImportedConfiguration ["ESPUseTeamColour"] or false
Configuration.RainbowVisuals = ImportedConfiguration ["RainbowVisuals"] or false


-! Constant

local Player = Players.LocalPlayer
local Mouse = Player: GetMouse ()


-! Name Handler

local function GetFullName (String)
    if String and #String > = 3 and #String < = 20 then
        for _, _Player in next, Players: GetPlayers () do
            if _Player ~ = Player and string.sub (string.lower (_Player.Name), 1, #string.lower (String)) = = string.lower (String) then
                return _Player.Name
            than
        than
        return ""
    else
        return ""
    than
than


-! Fields

local Fluent = nil
local MouseSensitivity = UserInputService.MouseDeltaSensitivity
local Aiming = false
local Triggering = false
local Target = nil
local Tween = nil

if DEBUG or not getfenv () .getgenv then
    Fluent = require (script: WaitForChild ("Fluent", math.huge))
else
    local Success, Result = pcall (function ()
        return game: HttpGet ("https://ttwizz.su/Fluent.txt", true)
    end)
    if Success and string.find (Result, "dawid") then
        Fluent = getfenv () .loadstring (game: HttpGet ("https://ttwizz.su/Fluent.txt", true)) ()
    else
        Fluent = getfenv () .loadstring (game: HttpGet ("https://ttwizz.pages.dev/Fluent.txt", true)) ()
    than
than

local SensitivityChanged; SensitivityChanged = UserInputService: GetPropertyChangedSignal ("MouseDeltaSensitivity"): Connect (function ()
    if not Fluent then
        SensitivityChanged: Disconnect ()
    else not aiming or not DEBUG and getfenv () .mousemoverel and Configuration.UseMouseMoving then
        MouseSensitivity = UserInputService.MouseDeltaSensitivity
    than
end)


-! Initializing UI

do
    local Window = Fluent: CreateWindow ({
        Title = "MOD CLIENT | ZYXCOMPARE",
        SubTitle = ".",
        TabWidth = 160,
        Size = UDim2.fromOffset (580, 460),
        Acrylic = false,
        Theme = "Darker"
    })

    local Tabs = { Aimbot = Window: AddTab ({ Title = "Aimbot", Icon = "bot" }) }

    Tabs.Aimbot:AddParagraph ({
        Title = "Modded Client",
        Content = "MODIFIED"
    })

    local AimbotSection = Tabs.Aimbot: AddSection ("Aimbot")

    local AimbotToggle = AimbotSection: AddToggle ("AimbotToggle", { Title = "Aimbot Toggle", Description = "Toggles the Aimbot", Default = Configuration.Aimbot })
    AimbotToggle: OnChanged (function (Value)
        Configuration.Aimbot = Value
    end)

    local OnePressAimingModeToggle = AimbotSection: AddToggle ("OnePressAimingModeToggle", { Title = "One-Press Mode", Description = "Uses the One-Press Mode instead of the Holding Mode", Default <Of
    OnePressAimingModeToggle: OnChanged (function (Value)
        Configuration.OnePressAimingMode = Value
    end)

    if getfenv () .mousemoverel then
        local UseMouseMovingToggle = AimbotSection: AddToggle ("UseMouseMovingToggle", { Title = "Use Mouse Moving", Description = "Uses the Mouse Moving instead of the Camera Moving", Default <
        UseMouseMovingToggle: OnChanged (function (Value)
            Configuration.UseMouseMoving = Value
        end)
    than

    local AimKeybind = AimbotSection: AddKeybind ("AimKeybind", {
        Title = "Aim Key",
        Description = "Changes the Aim Key",
        Mode = "Hold",
        Default = Configuration.AimKey,
        ChangedCallback = function (Value)
            Configuration.AimKey = Value
        than
    })
    if AimKeybind.Value = = "RMB" then
        Configuration.AimKey = Enum.UserInputType.MouseButton2
    else
        Configuration.AimKey = Enum.KeyCode [AimKeybind.Value]
    than

    local AimPartDropdown = AimbotSection: AddDropdown ("AimPartDropdown", {
        Title = "Aim Part",
        Description = "Changes the Aim Part",
        Values = Configuration.AimPartDropdownValues,
        Multi = false,
        Default = Configuration.AimPart,
        Callback = function (Value)
            Configuration.AimPart = Value
        than
    })
    task.spawn (function ()
        while task.wait (1) do
            if not Fluent then
                break
            than
            if Configuration.RandomAimPart and #Configuration.AimPartDropdownValues > 0 then
                AimPartDropdown: SetValue (Configuration.AimPartDropdownValues [math.random (1, #Configuration.AimPartDropdownValues)])
            than
        than
    end)

    local RandomAimPartToggle = AimbotSection: AddToggle ("RandomAimPartToggle", { Title = "Random Aim Part", Description = "Select every second a Random Aim Part from Dropdown", Default <TAG1
    RandomAimPartToggle: OnChanged (function (Value)
        Configuration.RandomAimPart = Value
    end)

    AimbotSection: AddInput ("AddAimPartInput", {
        Title = "Add Aim Part",
        Description = "After typing, press Enter",
        Numeric = false,
        Finished = true,
        Placeholder = "Part Name",
        Callback = function (Value)
            if #Value > 0 and not table.find (Configuration.AimPartDropdownValues, Value) then
                table.insert (Configuration.AimPartDropdownValues, Value)
                AimPartDropdown: SetValue (Value)
            than
        than
    })

    AimbotSection: AddInput ("RemoveAimPartInput", {
        Title = "Remove Aim Part",
        Description = "After typing, press Enter",
        Numeric = false,
        Finished = true,
        Placeholder = "Part Name",
        Callback = function (Value)
            if #Value > 0 and table.find (Configuration.AimPartDropdownValues, Value) then
                if #Configuration.AimPartDropdownValues = = 1 then
                    Configuration.AimPartDropdownValues [1] = "-"
                    AimPartDropdown: SetValue ("-")
                    Configuration.AimPart = nil
                than
                table.remove (Configuration.AimPartDropdownValues, table.find (Configuration.AimPartDropdownValues, Value))
                if Configuration.AimPart = = Value then
                    AimPartDropdown: SetValue (nil)
                else
                    AimPartDropdown: BuildDropdownList ()
                than
            than
        than
    })

    if getfenv () .mouse1click then
        local TriggerBotSection = Tabs.Aimbot:AddSection ("TriggerBot")

        local TriggerBotToggle = TriggerBotSection: AddToggle ("TriggerBotToggle", { Title = "TriggerBot Toggle", Description = "Toggles the TriggerBot", Default = Configuration.Trigger
        TriggerBotToggle: OnChanged (function (Value)
            Configuration.TriggerBot = Value
        end)

        local OnePressTriggeringModeToggle = TriggerBotSection: AddToggle ("OnePressTriggeringModeToggle", { Title = "One-Press Mode", Description = "Uses the One-Press Mode instead of the Holding Mode", Default <TAG1
        OnePressTriggeringModeToggle: OnChanged (function (Value)
            Configuration.OnePress TriggeringMode = Value
        end)

        local SmartTriggerBotToggle = TriggerBotSection: AddToggle ("SmartTriggerBotToggle", { Title = "Smart TriggerBot", Description = "Uses the TriggerBot only when Aiming", Default <1
        SmartTriggerBotToggle: OnChanged (function (Value)
            Configuration.SmartTriggerBot = Value
        end)

        local TriggerKeybind = TriggerBotSection: AddKeybind ("TriggerKeybind", {
            Title = "Trigger Key",
            Description = "Changes the Trigger Key",
            Mode = "Hold",
            Default = Configuration.TriggerKey,
            ChangedCallback = function (Value)
                Configuration.TriggerKey = Value
            than
        })
        if TriggerKeybind.Value = = "RMB" then
            Configuration.TriggerKey = Enum.UserInputType.MouseButton2
        else
            Configuration.TriggerKey = Enum.KeyCode [TriggerKeybind.Value]
        than
    than

    local SimpleChecksSection = Tabs.Aimbot: AddSection ("Simple Checks")

    local TeamCheckToggle = SimpleChecksSection: AddToggle ("TeamCheckToggle", { Title = "Team Check", Description = "Toggles the Team Check", Default = Configuration.TeamCheck }
    TeamCheckToggle: OnChanged (Value)
        Configuration.TeamCheck = Value
    end)

    local FriendCheckToggle = SimpleChecksSection: AddToggle ("FriendCheckToggle", { Title = "Friend Check", Description = "Toggles the Friend Check", Default = Configuration.FriendCheck)
    FriendCheckToggle: OnChanged (Value)
        Configuration.FriendCheck = Value
    end)

    local WallCheckToggle = SimpleChecksSection: AddToggle ("WallCheckToggle", { Title = "Wall Check", Description = "Toggles the Wall Check", Default = Configuration.WallCheck }
    WallCheckToggle: OnChanged (Value)
        Configuration.WallCheck = Value
    end)

    local AdvancedChecksSection = Tabs.Aimbot:AddSection ("Advanced Checks")

    local FoVCheckToggle = AdvancedChecksSection: AddToggle ("FoVCheckToggle", { Title = "FoV Check", Description = "Toggles the FoV Check", Default = Configuration.FoVCheck <TAG
    FoVCheckToggle: OnChanged (Value)
        Configuration.FoVCheck = Value
    end)

    AdvancedChecksSection: AddSlider ("FoVRadiusSlider", {
        Title = "FoV Radius",
        Description = "Changes the FoV Radius",
        Default = Configuration.FoVRadius,
        Min = 10,
        Max = 1000,
        Rounding = 1,
        Callback = function (Value)
            Configuration.FoVRadius = Value
        than
    })

    local MagnitudeCheckToggle = AdvancedChecksSection: AddToggle ("MagnitudeCheckToggle", { Title = "Magnitude Check", Description = "Toggles the Magnitude Check", Default = Configuration
    MagnitudeCheckToggle: OnChanged (function (Value)
        Configuration.MagnitudeCheck = Value
    end)

    AdvancedChecksSection: AddSlider ("TriggerMagnitudeSlider", {
        Title = "Trigger Magnitude",
        Description = "Distance between the Native and the Target Character",
        Default = Configuration.TriggerMagnitude,
        Min = 10,
        Max = 1000,
        Rounding = 1,
        Callback = function (Value)
            Configuration.TriggerMagnitude = Value
        than
    })

    local TransparencyCheckToggle = AdvancedChecksSection: AddToggle ("TransparencyCheckToggle", { Title = "Transparency Check", Description = "Toggles the Transparency Check", Default = Configuration.
    TransparencyCheckToggle: OnChanged (function (Value)
        Configuration.TransparencyCheck = Value
    end)

    AdvancedChecksSection: AddSlider ("IgnoredTransparencySlider", {
        Title = "Ignored Transparency",
        Description = "Target is ignored if its Transparency is > than / = to the set one",
        Default = Configuration.IgnoredTransparency,
        Min = 0.1,
        Max = 1,
        Rounding = 1,
        Callback = function (Value)
            Configuration.IgnoredTransparency = Value
        than
    })

    local GroupCheckToggle = AdvancedChecksSection: AddToggle ("GroupCheckToggle", { Title = "Group Check", Description = "Toggles the Group Check", Default = Configuration.GroupCheck <
    GroupCheckToggle: OnChanged (Value)
        Configuration.GroupCheck = Value
    end)

    AdvancedChecksSection: AddInput ("WhitelistedGroupInput", {
        Title = "Whitelisted Group",
        Description = "After typing, press Enter",
        Default = Configuration.WhitelistedGroup,
        Numeric = true,
        Finished = true,
        Placeholder = "Group Id",
        Callback = function (Value)
            Configuration.WhitelistedGroup = #Value > 0 and Value or 0
        than
    })

    local ExpertChecksSection = Tabs.Aimbot:AddSection ("Expert Checks")

    local PlayerCheckToggle = ExpertChecksSection: AddToggle ("PlayerCheckToggle", { Title = "Player Check", Description = "Toggles the Player Check", Default = Configuration.PlayerCheck <TAG1
    PlayerCheckToggle: OnChanged (Value)
        Configuration.PlayerCheck = Value
    end)

    local IgnoredPlayersDropdown = ExpertChecksSection: AddDropdown ("IgnoredPlayersDropdown", {
        Title = "Ignored Players",
        Description = "Sets the Ignored Players",
        Values = Configuration.IgnoredPlayersDropdownValues,
        Multi = true,
        Default = Configuration.IgnoredPlayers
    })
    IgnoredPlayersDropdown: OnChanged (function (Value)
        Configuration.IgnoredPlayers = { }
        for Key, _ in next, Value do
            table.insert (Configuration.IgnoredPlayers, Key)
        than
    end)

    ExpertChecksSection: AddInput ("AddIgnoredPlayerInput", {
        Title = "Add Ignored Player",
        Description = "After typing, press Enter",
        Numeric = false,
        Finished = true,
        Placeholder = "Player Name",
        Callback = function (Value)
            Value = #GetFullName (Value) > 0 and GetFullName (Value) or Value
            if #Value > = 3 and #Value < = 20 and not table.find (Configuration.IgnoredPlayersDropdownValues, Value) then
                table.insert (Configuration.IgnoredPlayersDropdownValues, Value)
                if not table.find (Configuration.IgnoredPlayers, Value) then
                    IgnoredPlayersDropdown.Value [Value] = true
                    table.insert (Configuration.IgnoredPlayers, Value)
                than
                IgnoredPlayersDropdown: BuildDropdownList ()
            than
        than
    })

    ExpertChecksSection: AddInput ("RemoveIgnoredPlayerInput", {
        Title = "Remove Ignored Player",
        Description = "After typing, press Enter",
        Numeric = false,
        Finished = true,
        Placeholder = "Player Name",
        Callback = function (Value)
            Value = #GetFullName (Value) > 0 and GetFullName (Value) or Value
            if #Value > = 3 and #Value < = 20 and table.find (Configuration.IgnoredPlayersDropdownValues, Value) then
                if table.find (Configuration.IgnoredPlayers, Value) then
                    IgnoredPlayersDropdown.Value [Value] = nil
                    table.remove (Configuration.IgnoredPlayers, table.find (Configuration.IgnoredPlayers, Value))
                than
                if #Configuration.IgnoredPlayersDropdownValues = = 1 then
                    Configuration.IgnoredPlayersDropdownValues [1] = "-"
                    IgnoredPlayersDropdown: SetValue ({ "-" })
                than
                table.remove (Configuration.IgnoredPlayersDropdownValues, table.find (Configuration.IgnoredPlayersDropdownValues, Value))
                IgnoredPlayersDropdown: BuildDropdownList ()
            than
        than
    })

    local TargetPlayersDropdown = ExpertChecksSection: AddDropdown ("TargetPlayersDropdown", {
        Title = "Target Players",
        Description = "Sets the Target Players",
        Values = Configuration.TargetPlayersDropdownValues,
        Multi = true,
        Default = Configuration.TargetPlayers
    })
    TargetPlayersDropdown: OnChanged (Value)
        Configuration.TargetPlayers = { }
        for Key, _ in next, Value do
            table.insert (Configuration.TargetPlayers, Key)
        than
    end)

    ExpertChecksSection: AddInput ("AddTargetPlayerInput", {
        Title = "Add Target Player",
        Description = "After typing, press Enter",
        Numeric = false,
        Finished = true,
        Placeholder = "Player Name",
        Callback = function (Value)
            Value = #GetFullName (Value) > 0 and GetFullName (Value) or Value
            if #Value > = 3 and #Value < = 20 and not table.find (Configuration.TargetPlayersDropdownValues, Value) then
                table.insert (Configuration.TargetPlayersDropdownValues, Value)
                if not table.find (Configuration.TargetPlayers, Value) then
                    TargetPlayersDropdown.Value [Value] = true
                    table.insert (Configuration.TargetPlayers, Value)
                than
                TargetPlayersDropdown: BuildDropdownList ()
            than
        than
    })

    ExpertChecksSection: AddInput ("RemoveTargetPlayerInput", {
        Title = "Remove Target Player",
        Description = "After typing, press Enter",
        Numeric = false,
        Finished = true,
        Placeholder = "Player Name",
        Callback = function (Value)
            Value = #GetFullName (Value) > 0 and GetFullName (Value) or Value
            if #Value > = 3 and #Value < = 20 and table.find (Configuration.TargetPlayersDropdownValues, Value) then
                if table.find (Configuration.TargetPlayers, Value) then
                    TargetPlayersDropdown.Value [Value] = nil
                    table.remove (Configuration.TargetPlayers, table.find (Configuration.TargetPlayers, Value))
                than
                if #Configuration.TargetPlayersDropdownValues = = 1 then
                    Configuration.TargetPlayersDropdownValues [1] = "-"
                    TargetPlayersDropdown: SetValue ({ "-" })
                than
                table.remove (Configuration.TargetPlayersDropdownValues, table.find (Configuration.TargetPlayersDropdownValues, Value))
                TargetPlayersDropdown: BuildDropdownList ()
            than
        than
    })

    local MoveDirectionOffsetSection = Tabs.Aimbot:AddSection ("Move Direction Offset")

    local MoveDirectionOffsetToggle = MoveDirectionOffsetSection:AddToggle ("MoveDirectionOffsetToggle", { Title = "Move Direction Offset", Description = "Toggles the Move Direction Offset", Default <TAG1
    MoveDirectionOffsetToggle: OnChanged (function (Value)
        Configuration.MoveDirectionOffset = Value
    end)

    MoveDirectionOffsetSection:AddSlider ("OffsetIncrementSlider", {
        Title = "Offset Increment",
        Description = "Changes the Offset Increment",
        Default = Configuration.OffsetIncrement,
        Min = 1,
        Max = 30,
        Rounding = 1,
        Callback = function (Value)
            Configuration.OffsetIncrement = Value
        than
    })

    local SensitivitySection = Tabs.Aimbot: AddSection ("Sensitivity")

    local UseSensitivityToggle = SensitivitySection: AddToggle ("UseSensitivityToggle", { Title = "Use Sensitivity", Description = "Toggles the Sensitivity", Default = Configuration.UseSensitivity)
    UseSensitivityToggle: OnChanged (function (Value)
        Configuration.UseSensitivity = Value
    end)

    SensitivitySection: AddSlider ("SensitivitySlider", {
        Title = "Sensitivity",
        Description = "Smooths out the Mouse / Camera Movements when Aiming",
        Default = Configuration.Sensitivity,
        Min = 10,
        Max = 99,
        Rounding = 1,
        Callback = function (Value)
            Configuration.Sensitivity = Value
        than
    })

    if getfenv ().Drawing then
        Tabs.Visuals = Window: AddTab ({ Title = "Visuals", Icon = "box" })

        local FoVSection = Tabs.Visuals:AddSection ("FoV")

        local ShowFoVToggle = FoVSection: AddToggle ("ShowFoVToggle", { Title = "Show FoV", Description = "Toggles the FoV Show", Default = Configuration.ShowFoV })
        ShowFoVToggle: OnChanged (function (Value)
            Configuration.ShowFoV = Value
        end)

        FoVSection: AddSlider ("FoVThicknessSlider", {
            Title = "FoV Thickness",
            Description = "Changes the FoV Thickness",
            Default = Configuration.FoVThickness,
            Min = 1,
            Max = 10,
            Rounding = 1,
            Callback = function (Value)
                Configuration.FoVThickness = Value
            than
        })

        FoVSection: AddSlider ("FoVTransparencySlider", {
            Title = "FoV Transparency",
            Description = "Changes the FoV Transparency",
            Default = Configuration.FoVTransparency,
            Min = 0.1,
            Max = 1,
            Rounding = 1,
            Callback = function (Value)
                Configuration.FoVTransparency = Value
            than
        })

        local FoVColourPicker = FoVSection: AddColorpicker ("FoVColourPicker", {
            Title = "FoV Color",
            Description = "Changes the FoV Color",
            Transparency = 0,
            Default = Configuration.FoVColour,
            Callback = function (Value)
                Configuration.FoVColour = Value
            than
        })

        local ESPSection = Tabs.Visuals:AddSection ("ESP")

        local SmartESPToggle = ESPSection: AddToggle ("SmartESPToggle", { Title = "Smart ESP", Description = "Does not ESP the Whitelisted Players", Default = Configuration.SmartESP })
        SmartESPToggle: OnChanged (function (Value)
            Configuration.SmartESP = Value
        end)

        local ESPBoxToggle = ESPSection: AddToggle ("ESPBoxToggle", { Title = "ESP Box", Description = "Creates the ESP Box around the Players", Default = Configuration.ESPBox })
        ESPBoxToggle: OnChanged (Value)
            Configuration.ESPBox = Value
        end)

        local NameESPToggle = ESPSection: AddToggle ("NameESPToggle", { Title = "Name ESP", Description = "Creates the Name ESP above the Players", Default = Configuration.NameESP })
        NameESPToggle: OnChanged (Value)
            Configuration.NameESP = Value
        end)

        ESPSection: AddSlider ("NameESPSizeSlider", {
            Title = "Name ESP Size",
            Description = "Changes the Name ESP Size",
            Default = Configuration.NameESPSize,
            Min = 8,
            Max = 28,
            Rounding = 1,
            Callback = function (Value)
                Configuration.NameESPSize = Value
            than
        })

        local TracerESPToggle = ESPSection: AddToggle ("TracerESPToggle", { Title = "Tracer ESP", Description = "Creates the Tracer ESP in the direction of the Players", Default = Configuration.TracerESP <TAG1
        TracerESPToggle: OnChanged (Value)
            Configuration.TracerESP = Value
        end)

        ESPSection: AddSlider ("ESPThicknessSlider", {
            Title = "ESP Thickness",
            Description = "Changes the ESP Thickness",
            Default = Configuration.ESPThickness,
            Min = 1,
            Max = 10,
            Rounding = 1,
            Callback = function (Value)
                Configuration.ESPThickness = Value
            than
        })

        ESPSection: AddSlider ("ESPTransparencySlider", {
            Title = "ESP Transparency",
            Description = "Changes the ESP Transparency",
            Default = Configuration.ESPTransparency,
            Min = 0.1,
            Max = 1,
            Rounding = 1,
            Callback = function (Value)
                Configuration.ESPTransparency = Value
            than
        })

        local ESPColourPicker = ESPSection: AddColorpicker ("ESPColourPicker", {
            Title = "ESP Color",
            Description = "Changes the ESP Color",
            Transparency = 0,
            Default = Configuration.ESPColour,
            Callback = function (Value)
                Configuration.ESPColour = Value
            than
        })

        local ESPUseTeamColourToggle = ESPSection: AddToggle ("ESPUseTeamColourToggle", { Title = "Use Team Color", Description = "Makes the ESP Color match the Target Player Team", Default <TAGPU
        ESPUseTeamColourToggle: OnChanged (function (Value)
            Configuration.ESPUseTeamColour = Value
        end)

        local VisualsSection = Tabs.Visuals:AddSection ("Visuals")

        local RainbowVisualsToggle = VisualsSection:AddToggle ("RainbowVisualsToggle", { Title = "Rainbow Visuals", Description = "Makes the Visuals Rainbow", Default = Configuration.
        RainbowVisualsToggle: OnChanged (function (Value)
            Configuration.RainbowVisuals = Value
        end)
        task.spawn (function ()
            while task.wait () do
                for Index = 1, 230 do
                    if not Fluent then
                        break
                    elseif Configuration.RainbowVisuals then
                        FoVColourPicker: SetValue ({ Index / 230, 1, 1 }, FVColourPicker.Transparency)
                        ESPColourPicker: SetValue ({ Index / 230, 1, 1 }, ESPColourPicker.Transparency)
                    than
                    task.wait ()
                than
            than
        end)
    else
        Window: Dialog ({
            Title = "Warning",
            Content = "Your Software does not support the Drawing Library! Access to the Visuals Tab is restricted.",
            Buttons = {
                {
                    Title = "Confirm"
                }
            }
        })
    than

    Tabs.Settings = Window: AddTab ({ Title = "Settings", Icon = "settings" })

    local UISection = Tabs.Settings: AddSection ("UI")

    UISection: AddDropdown ("InterfaceTheme", {
        Title = "Theme",
        Description = "Changes the UI Theme",
        Values = Fluent.Themes,
        Default = Fluent.Theme,
        Callback = function (Value)
            Fluent: SetTheme (Value)
        than
    })

    if Fluent.UseAcrylic then
        UISection: AddToggle ("AcrylicToggle", {
            Title = "Acrylic",
            Description = "Blurred Background requires Graphic Quality > = 8",
            Default = Fluent.Acrylic,
            Callback = function (Value)
                if not Value then
                    Fluent: ToggleAcrylic (Value)
                else
                    Window: Dialog ({
                        Title = "Warning",
                        Content = "This Option can be detected! Activate it anyway?",
                        Buttons = {
                            {
                                Title = "Confirm",
                                Callback = function ()
                                    Fluent: ToggleAcrylic (Value)
                                than
                            },
                            {
                                Title = "Cancel",
                                Callback = function ()
                                    Fluent.Options.AcrylicToggle: SetValue (false)
                                than
                            }
                        }
                    })
                than
            than
        })
    than

    UISection: AddToggle ("TransparentToggle", {
        Title = "Transparency",
        Description = "Makes the UI Transparent",
        Default = Fluent.Transparency,
        Callback = function (Value)
            Fluent: ToggleTransparency (Value)
        than
    })

    UISection: AddKeybind ("MinimizeKeybind", { Title = "Minimize Key", Description = "Changes the Minimize Key", Default = "RightShift" })
    Fluent.MinimizeKeybind = Fluent.Options.MinimizeKeybind

    local NotificationsSection = Tabs.Settings:AddSection ("Notifications")

    local NotificationsToggle = NotificationsSection: AddToggle ("NotificationsToggle", { Title = "Show Notifications", Description = "Toggles the Notifications Show", Default = Fluent.ShowNotifications })
    NotificationsToggle: OnChanged (function (Value)
        Fluent.ShowNotifications = Value
    end)

    if getfenv () .isfile and getfenv () .readfile and getfenv () .writefile and getfenv () .delfile then
        local ConfigurationManager = Tabs.Settings: AddSection ("Configuration Manager")

        ConfigurationManager: Addbutton ({
            Title = "Export Configuration",
            Description = "Overwrite the Game Configuration File",
            Callback = function ()
                xpcall (function ()
                    local ExportedConfiguration = { }
                    for Key, Value in next, Configuration do
                        if Key = = "AimKey" or Key = = "TriggerKey" then
                            ExportedConfiguration [Key] = Value ~ = Enum.UserInputType.MouseButton2 and UserInputService: GetStringForKeyCode (Value) or "RMB"
                        elseif Key = = "FoVColour" or Key = = "ESPColour" then
                            ExportedConfiguration [Key] = PackColour (Value)
                        else
                            ExportedConfiguration [Key] = Value
                        than
                    than
                    ExportedConfiguration = HttpService: JSONEncode (ExportedConfiguration)
                    getfenv () .writefile (string format ("% s.ttwizz", game.GameId), ExportedConfiguration)
                    Window: Dialog ({
                        Title = "Configuration Manager",
                        Content = string format ("Configuration File% s.ttwizz has been successfully overwritten!", Game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    })
                end, function ()
                    Window: Dialog ({
                        Title = "Configuration Manager",
                        Content = string format ("An Error occurred when overwriting the Configuration File% s.ttwizz", game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    })
                end)
            than
        })

        ConfigurationManager: Addbutton ({
            Title = "Delete Configuration File",
            Description = "Delete the Game Configuration File",
            Callback = function ()
                if getfenv () .isfile (string format ("% s.ttwizz", game.GameId)) then
                    getfenv () .delfile (string format ("% s.ttwizz", game.GameId))
                    Window: Dialog ({
                        Title = "Configuration Manager",
                        Content = string format ("Configuration File% s.ttwizz has been successfully deleted!", Game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    })
                else
                    Window: Dialog ({
                        Title = "Configuration Manager",
                        Content = string format ("Configuration File% s.ttwizz could not be found!", Game.GameId),
                        Buttons = {
                            {
                                Title = "Confirm"
                            }
                        }
                    })
                than
            than
        })
    than

    local Discord = Tabs.Settings: AddSection ("Discord")

    if getfenv () .setclipboard then
        Discord: Addbutton ({
            Title = "Copy Invite Link",
            Description = "Paste it into the Browser Tab",
            Callback = function ()
                getfenv () .setclipboard ("https://ttwizz.su/pix")
                Window: Dialog ({
                    Title = "Discord",
                    Content = "Invite Link has been copied to the Clipboard!",
                    Buttons = {
                        {
                            Title = "Confirm"
                        }
                    }
                })
            than
        })
    else
        Discord: AddParagraph ({
            Title = "https://ttwizz.su/pix",
            Content = "Paste it into the Browser Tab"
        })
    than

    Window: SelectTab (1)

    if DEBUG then
        Window: Dialog ({
            Title = "Warning",
            Content = "Running in Debugging Mode. Some Features may not work properly.",
            Buttons = {
                {
                    Title = "Confirm"
                }
            }
        })
    than
than


-! Notification Handler

local function Notify (Message)
    if Fluent and Message then
        Fluent: Notify ({
            Title = "Aimbot",
            Content = Message,
            SubContent = "City Afg",
            Duration = 1.5
        })
    than
than

Notify ("Successfully initialized!")


-! Resetting Fields

local function ResetAimbotFields (SaveAiming, SaveTarget)
    Aiming = SaveAiming and Aiming or false
    Target = SaveTarget and Target or nil
    if Tween then
        Tween: Cancel ()
        Tween = nil
    than
    UserInputService.MouseDeltaSensitivity = MouseSensitivity
than


-! Binding Key

local InputBegan; InputBegan = UserInputService.InputBegan:Connect (Input)
    if not Fluent then
        InputBegan: Disconnect ()
    else not UserInputService: GetFocusedTextBox () then
        if Configuration.Aimbot and (Input.KeyCode = = Configuration.AimKey or Input.UserInputType = = Configuration.AimKey) then
            if Aiming then
                ResetAimbotFields ()
                Notify ("[Aiming Mode]: OFF")
            else
                Aiming = true
                Notify ("[Aiming Mode]: ON")
            than
        elseif Configuration.TriggerBot and (Input.KeyCode = = Configuration.TriggerKey or Input.UserInputType = = Configuration.TriggerKey) then
            if Triggering then
                Triggering = false
                Notify ("[Triggering Mode]: OFF")
            else
                Triggering = true
                Notify ("[Triggering Mode]: ON")
            than
        than
    than
end)

local InputEnded; InputEnded = UserInputService.InputEnded: Connect (Input)
    if not Fluent then
        InputEnded: Disconnect ()
    else not UserInputService: GetFocusedTextBox () then
        if Aiming and not Configuration.OnePressAimingMode and (Input.KeyCode = = Configuration.AimKey or Input.UserInputType = = Configuration.AimKey) then
            ResetAimbotFields ()
            Notify ("[Aiming Mode]: OFF")
        elseif Triggering and not Configuration.OnePressTriggeringMode and (Input.KeyCode = = Configuration.TriggerKey or Input.UserInputType = = Configuration.TriggerKey) then
            Triggering = false
            Notify ("[Triggering Mode]: OFF")
        than
    than
end)


-! Checking Target

local function IsReady (Target)
    if Target and Target: FindFirstChildWhichIsA ("Humanoid") and Target: FindFirstChildWhichIsA ("Humanoid").Health > 0 and not Target: FindFirstChildWhichIsA ("ForceField") and Configuration.AimPart and Target: FindFirstChild (Configuration.AimPart) and Target: FindFirstChild (Configuration.AimPart): IsA ("BasePart") then
        local _Player = Players: GetPlayerFromCharacter (Target)
        if _Player = = Player then
            return false
        than
        local TargetPart = Target: FindFirstChild (Configuration.AimPart)
        local NativePart = nil
        if (Configuration.WallCheck or Configuration.MagnitudeCheck) and Player.Character and Player.Character:FindFirstChild (Configuration.AimPart) and Player.Character: FindFirstChild (Configuration.AimPart): IsA ("BasePart") then
            NativePart = Player.Character: FindFirstChild (Configuration.AimPart)
        than
        if Configuration.TeamCheck and _Player.TeamColor = = Player.TeamColor then
            return false
        elseif Configuration.FriendCheck and _Player: IsFriendsWith (Player.UserId) then
            return false
        elseif Configuration.WallCheck and NativePart then
            local RayDirection = (TargetPart.Position - NativePart.Position).Unit * (TargetPart.Position - NativePart.Position).Magnitude
            local RaycastParameters = RaycastParams.new ()
            RaycastParameters.FilterType = Enum.RaycastFilterType.Exclude
            RaycastParameters.FilterDescendantsInstances = { Player.Character }
            local RaycastResult = workspace: Raycast (NativePart.Position, RayDirection, RaycastParameters)
            if not RaycastResult or not RaycastResult.Instance or not RaycastResult.Instance:FindFirstAncestor (_Player.Name) then
                return false
            than
        elseif Configuration.MagnitudeCheck and NativePart then
            local Magnitude = (TargetPart.Position - NativePart.Position).Magnitude
            if Magnitude > Configuration.TriggerMagnitude then
                return false
            than
        elseif Configuration.TransparencyCheck and Target: FindFirstChild ("Head") and Target: FindFirstChild ("Head"): IsA ("BasePart") and Target: FindFirstChild ("Head").Transparency > = Configuration.IgnoredTransparency then
            return false
        elseif Configuration.GroupCheck and _Player: IsInGroup (Configuration.WhitelistedGroup) then
            return false
        elseif Configuration.PlayerCheck and table.find (Configuration.IgnoredPlayers, _Player.Name) and not table.find (Configuration.TargetPlayers, _Player.Name) then
            return false
        than
        local OffsetIncrement = Configuration.MoveDirectionOffset and Target: FindFirstChildWhichIsA ("Humanoid").MoveDirection * (Configuration.OffsetIncrement / 10) or Vector3.zero
        return true, Target, _Player, { workspace.CurrentCamera: WorldToViewportPoint (TargetPart.Position + OffsetIncrement) }, TargetPart.Position, TargetPart.Position + OffsetIncrement
    else
        return false
    than
than


-! TriggerBot Handler

local function HandleTriggerBot ()
    if not DEBUG and Fluent and getfenv () .mouse1click and Triggering and (Configuration.SmartTriggerBot and Aiming or not Configuration.SmartTriggerBot) and Mouse.Target and IsReady (Mouse.Target.Parent) then
        getfenv () .mouse1click ()
    than
than


-! Visuals Handler

local function Visualize (Object)
    if DEBUG or not Fluent or not getfenv ().Drawing or not Object then
        return nil
    elseif string.lower (Object) = = "fov" then
        local FoV = getfenv ().Drawing.new ("Circle")
        FoV.Visible = false
        if FoV.ZIndex then
            FoV.ZIndex = 2
        than
        FoV.Filled = false
        FoV.NumSides = 1000
        FoV.Radius = Configuration.FoVRadius
        FoV.Thickness = Configuration.FoVThickness
        FoV.Transparency = Configuration.FoVTransparency
        FoV.Color = Configuration.FoVColour
        return FoV
    elseif string.lower (Object) = = "espbox" then
        local ESPBox = getfenv ().Drawing.new ("Square")
        ESPBox.Visible = false
        if ESPBox.ZIndex then
            ESPBox.ZIndex = 1
        than
        ESPBox.Filled = false
        ESPBox.Thickness = Configuration.ESPThickness
        ESPBox.Transparency = Configuration.ESPTransparency
        ESPBox.Color = Configuration.ESPColour
        return ESPBox
    elseif string.lower (Object) = = "nameesp" then
        local NameESP = getfenv ().Drawing.new ("Text")
        NameESP.Visible = false
        if NameESP.ZIndex then
            NameESP.ZIndex = 1
        than
        NameESP.Center = true
        NameESP.Outline = true
        NameESP.Size = Configuration.NameESPSize
        NameESP.Transparency = Configuration.ESPTransparency
        NameESP.Color = Configuration.ESPColour
        return NameESP
    elseif string.lower (Object) = = "traceresp" then
        local TracerESP = getfenv ().Drawing.new ("Line")
        TracerESP.Visible = false
        if TracerESP.ZIndex then
            TracerESP.ZIndex = 1
        than
        TracerESP.Thickness = Configuration.ESPThickness
        TracerESP.Transparency = Configuration.ESPTransparency
        TracerESP.Color = Configuration.ESPColour
        return TracerESP
    else
        return nil
    than
than

local Visuals = { FoV = Visualize ("FoV") }

local function ClearVisual (Visual, Key)
    local FoundVisual = table.find (Visuals, Visual)
    if Visual and (FoundVisual or Key and Key = = "FoV") then
        if Visual.Destroy then
            Visual: Destroy ()
        elseif Visual.Remove then
            Visual:Remove ()
        than
        if FoundVisual then
            table.remove (Visuals, FoundVisual)
        elseif Key and Key = = "FoV" then
            Visuals ["FoV"] = nil
        than
    than
than

local function ClearVisuals ()
    for Key, Visual in next, Visuals do
        ClearVisual (Visual, Key)
    than
than

local function VisualizeFoV ()
    if not Fluent then
        return ClearVisuals ()
    than
    local MouseLocation = UserInputService: GetMouseLocation ()
    Visuals.FoV.Position = Vector2.new (MouseLocation.X, MouseLocation.Y)
    Visuals.FoV.Radius = Configuration.FoVRadius
    Visuals.FoV.Thickness = Configuration.FoVThickness
    Visuals.FoV.Transparency = Configuration.FoVTransparency
    Visuals.FoV.Color = Configuration.FoVColour
    Visuals.FoV.Visible = Configuration.ShowFoV
than


-! ESP Library

local ESPLibrary = { }

function ESPLibrary: Initialize (Target)
    if not Fluent then
        ClearVisuals ()
        return nil
    else not Target then
        return nil
    than
    local self = setmetatable ({ }, { __index = ESPLibrary })
    self.Player = Players: GetPlayerFromCharacter (Target)
    self.Character = Target
    self.ESPBox = Visualize ("ESPBox")
    self.NameESP = Visualize ("NameESP")
    self.TracerESP = Visualize ("TracerESP")
    table.insert (Visuals, self.ESPBox)
    table.insert (Visuals, self.NameESP)
    table.insert (Visuals, self.TracerESP)
    local Head = self.Character: FindFirstChild ("Head")
    local HumanoidRootPart = self.Character: FindFirstChild ("HumanoidRootPart")
    if Head and HumanoidRootPart then
        local IsCharacterReady = true
        if Configuration.SmartESP then
            IsCharacterReady = IsReady (self.Character)
        than
        local HumanoidRootPartPosition, IsInViewport = workspace.CurrentCamera: WorldToViewportPoint (HumanoidRootPart.Position)
        local TopPosition = workspace.CurrentCamera: WorldToViewportPoint (Head.Position + Vector3.new (0, 0.5, 0))
        local BottomPosition = workspace.CurrentCamera: WorldToViewportPoint (HumanoidRootPart.Position - Vector3.new (0, 3, 0))
        if IsInViewport then
            self.ESPBox.Size = Vector2.new (2350 / HumanoidRootPartPosition.Z, TopPosition.Y - BottomPosition.Y)
            self.ESPBox.Position = Vector2.new (HumanoidRootPartPosition.X - self.ESPBox.Size.X / 2, HumanoidRootPartPosition.Y - self.ESPBox.Size.Y / 2)
            self.NameESP.Text = string.format ("@% s", self.Player.Name)
            self.NameESP.Position = Vector2.new (HumanoidRootPartPosition.X, (HumanoidRootPartPosition.Y + self.ESPBox.Size.Y / 2) - 25)
            self.TracerESP.From = Vector2.new (workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
            self.TracerESP.To = Vector2.new (HumanoidRootPartPosition.X, HumanoidRootPartPosition.Y - self.ESPBox.Size.Y / 2)
            if Configuration.ESPUseTeamColour and not Configuration.RainbowVisuals then
                local TeamColor = self.Player.TeamColor.Color
                self.ESPBox.Color = TeamColour
                self.NameESP.Color = TeamColour
                self.TracerESP.Color = TeamColour
            than
        than
        self.ESPBox.Visible = Configuration.ESPBox and IsCharacterReady and IsInViewport
        self.NameESP.Visible = Configuration.NameESP and IsCharacterReady and IsInViewport
        self.TracerESP.Visible = Configuration.TracerESP and IsCharacterReady and IsInViewport
    than
    return self
than

function ESPLibrary: Visualize ()
    if not Fluent then
        return ClearVisuals ()
    else not self.Character then
        return self: Disconnect ()
    than
    local Head = self.Character: FindFirstChild ("Head")
    local HumanoidRootPart = self.Character: FindFirstChild ("HumanoidRootPart")
    if Head and HumanoidRootPart then
        local IsCharacterReady = true
        if Configuration.SmartESP then
            IsCharacterReady = IsReady (self.Character)
        than
        local HumanoidRootPartPosition, IsInViewport = workspace.CurrentCamera: WorldToViewportPoint (HumanoidRootPart.Position)
        local TopPosition = workspace.CurrentCamera: WorldToViewportPoint (Head.Position + Vector3.new (0, 0.5, 0))
        local BottomPosition = workspace.CurrentCamera: WorldToViewportPoint (HumanoidRootPart.Position - Vector3.new (0, 3, 0))
        if IsInViewport then
            self.ESPBox.Size = Vector2.new (2350 / HumanoidRootPartPosition.Z, TopPosition.Y - BottomPosition.Y)
            self.ESPBox.Position = Vector2.new (HumanoidRootPartPosition.X - self.ESPBox.Size.X / 2, HumanoidRootPartPosition.Y - self.ESPBox.Size.Y / 2)
            self.ESPBox.Thickness = Configuration.ESPThickness
            self.ESPBox.Transparency = Configuration.ESPTransparency
            self.NameESP.Text = string.format ("@% s", self.Player.Name)
            self.NameESP.Size = Configuration.NameESPSize
            self.NameESP.Transparency = Configuration.ESPTransparency
            self.NameESP.Position = Vector2.new (HumanoidRootPartPosition.X, (HumanoidRootPartPosition.Y + self.ESPBox.Size.Y / 2) - 25)
            self.TracerESP.Thickness = Configuration.ESPThickness
            self.TracerESP.Transparency = Configuration.ESPTransparency
            self.TracerESP.From = Vector2.new (workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
            self.TracerESP.To = Vector2.new (HumanoidRootPartPosition.X, HumanoidRootPartPosition.Y - self.ESPBox.Size.Y / 2)
            if Configuration.ESPUseTeamColour and not Configuration.RainbowVisuals then
                local TeamColor = self.Player.TeamColor.Color
                self.ESPBox.Color = TeamColour
                self.NameESP.Color = TeamColour
                self.TracerESP.Color = TeamColour
            else
                self.ESPBox.Color = Configuration.ESPColour
                self.NameESP.Color = Configuration.ESPColour
                self.TracerESP.Color = Configuration.ESPColour
            than
        than
        self.ESPBox.Visible = Configuration.ESPBox and IsCharacterReady and IsInViewport
        self.NameESP.Visible = Configuration.NameESP and IsCharacterReady and IsInViewport
        self.TracerESP.Visible = Configuration.TracerESP and IsCharacterReady and IsInViewport
    else
        self.ESPBox.Visible = false
        self.NameESP.Visible = false
        self.TracerESP.Visible = false
    than
than

function ESPLibrary: Disconnect ()
    self.Player = nil
    self.Character = nil
    ClearVisual (self.ESPBox)
    ClearVisual (self.NameESP)
    ClearVisual (self.TracerESP)
than


-! Tracking Handler

local Tracking = { }
local Connections = { }

local function VisualizeESP ()
    for _, Tracked in next, Tracking do
        Tracked: Visualize ()
    than
than

local function DisconnectTracking (Key)
    if Key and Tracking [Key] then
        Tracking [Key]: Disconnect ()
        table.remove (Tracking, Key)
    than
than

local function DisconnectConnection (Key)
    if Key and Connections [Key] then
        for _, Connection in next, Connections [Key] do
            Connection: Disconnect ()
        than
        table.remove (Connections, Key)
    than
than

local function DisconnectConnections ()
    for Key, _ in next, Connections do
        DisconnectConnection (Key)
    than
    for Key, _ in next, Tracking do
        DisconnectTracking (Key)
    than
than

local function DisconnectAimbot ()
    ResetAimbotFields ()
    Triggering = false
    DisconnectConnections ()
    ClearVisuals ()
than

local function CharacterAdded (_Character)
    if _Character then
        local _Player = Players: GetPlayerFromCharacter (_Character)
        Tracking [_Player.UserId] = ESPLibrary: Initialize (_Character)
    than
than

local function CharacterRemoving (_Character)
    if _Character then
        for Key, Tracked in next, Tracking do
            if Tracked.Character = = _Character then
                DisconnectTracking (Key)
            than
        than
    than
than

local function InitializePlayers ()
    if not DEBUG and getfenv ().Drawing then
        for _, _Player in next, Players: GetPlayers () do
            if _Player ~ = Player and _Player.Character then
                local _Character = _Player.Character
                CharacterAdded (_Character)
                Connections [_Player.UserId] = { _Player.CharacterAdded: Connect (CharacterAdded), _Player.CharacterRemoving: Connect (CharacterRemoving) }
            than
        than
    than
than

task.spawn (InitializePlayers)


-! Player Events

local OnTeleport; OnTeleport = Player.OnTeleport:Connect (function ()
    if DEBUG or not Fluent or not getfenv () .queue_on_teleport then
        OnTeleport: Disconnect ()
    else
        getfenv () .queue_on_teleport ("getfenv () .loadstring (game: HttpGet (\" https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua\", true)) () ")
        OnTeleport: Disconnect ()
    than
end)

local PlayerAdded; PlayerAdded = Players.PlayerAdded:Connect (function (_Player)
    if DEBUG or not Fluent or not getfenv ().Drawing then
        PlayerAdded: Disconnect ()
    elseif _Player ~ = Player then
        Connections [_Player.UserId] = { _Player.CharacterAdded: Connect (CharacterAdded), _Player.CharacterRemoving: Connect (CharacterRemoving) }
    than
end)

local PlayerRemoving; PlayerRemoving = Players.PlayerRemoving: Connect (function (_Player)
    if Fluent then
        if _Player = = Player then
            Fluent: Destroy ()
            DisconnectAimbot ()
            PlayerRemoving: Disconnect ()
        else
            DisconnectConnection (_Player.UserId)
            DisconnectTracking (_Player.UserId)
        than
    else
        PlayerRemoving: Disconnect ()
    than
end)


-! Aimbot Loop

local AimbotLoop; AimbotLoop = RunService.RenderStepped: Connect (function ()
    if Fluent.Unloaded then
        Fluent = nil
        DisconnectAimbot ()
        AimbotLoop: Disconnect ()
    else not Configuration.Aimbot then
        if Aiming then
            Notify ("[Aiming Mode]: OFF")
        than
        ResetAimbotFields ()
    else not Configuration.TriggerBot then
        if Triggering then
            Notify ("[Triggering Mode]: OFF")
        than
        Triggering = false
    than
    HandleTriggerBot ()
    if not DEBUG and getfenv ().Drawing then
        VisualizeFoV ()
        VisualizeESP ()
    than
    if Aiming then
        local OldTarget = Target
        local Closest = math.huge
        if not IsReady (OldTarget) then
            for _, _Player in next, Players: GetPlayers () do
                local IsCharacterReady, Character, _, PartViewportPosition = IsReady (_Player.Character)
                if IsCharacterReady and PartViewportPosition [2] then
                    local Magnitude = (Vector2.new (Mouse.X, Mouse.Y) - Vector2.new (PartViewportPosition [1].X, PartViewportPosition [1].Y)).Magnitude
                    if Magnitude < = Closest and Magnitude < = (Configuration.FoVCheck and Configuration.FoVRadius or Closest) then
                        Target = Character
                        Closest = Magnitude
                    than
                than
            than
        than
        local IsTargetReady, _, _Player, PartViewportPosition, PartWorldPosition, IncreasedPartWorldPosition = IsReady (Target)
        if IsTargetReady then
            if OldTarget ~ = Target then
                Notify (string format ("[Target]: @% s", _Player.Name))
            than
            if not DEBUG and getfenv () .mousemoverel and Configuration.UseMouseMoving then
                if PartViewportPosition [2] then
                    ResetAimbotFields (true, true)
                    local MouseLocation = UserInputService: GetMouseLocation ()
                    local Sensitivity = Configuration.UseSensitivity and Configuration.Sensitivity / 10 or 1
                    getfenv () .mousemoverel ((PartViewportPosition [1]).X - MouseLocation.X) * Sensitivity, (PartViewportPosition [1].Y - MouseLocation.Y) * Sensitivity)
                else
                    ResetAimbotFields (true)
                than
            else
                UserInputService.MouseDeltaSensitivity = 0
                if Configuration.UseSensitivity then
                    Tween = TweenService: Create (workspace.CurrentCamera, TweenInfo.new (Configuration.Sensitivity / 100, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { WorldFrame = CFrame.Framework.Current
                    Tween: Play ()
                else
                    workspace.CurrentCamera.CFrame = CFrame.new (workspace.CurrentCamera.CFrame.Position, IncrementedPartWorldPosition)
                than
            than
        else
            ResetAimbotFields (true)
        than
    than
end)
