-- start of cwel.vip example ui
-- Replace the URL below with the location where cwel.vip.lua is hosted.
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/bigos-ops/cwel.vip/refs/heads/main/cwel.vip.lua'))()

Library:SetWatermark('CWEL.UI  /  component showcase')

local Window = Library:CreateWindow({
    Title = 'CWEL.UI Component Showcase',
    Center = true,
    AutoShow = true,
    TabPadding = 6,
    MenuFadeTime = 0.2,
    Size = UDim2.fromOffset(620, 560),
})

local Tabs = {
    Overview = Window:AddTab('Overview'),
    Controls = Window:AddTab('Controls'),
    Visuals = Window:AddTab('Visuals'),
    Settings = Window:AddTab('Settings'),
}

-- start of overview tab
local Welcome = Tabs.Overview:AddLeftGroupbox('Welcome')
Welcome:AddLabel('A small, practical showcase of the library components.')
Welcome:AddLabel('Use the tabs above to browse controls and test their callbacks.', true)
Welcome:AddBlank(4)

Welcome:AddButton('Show notification', function()
    Library:Notify('The notification system is working.', 3)
end)

local Status = Tabs.Overview:AddRightGroupbox('Live Status')
Status:AddToggle('DemoEnabled', {
    Text = 'Demo enabled',
    Default = true,
    Tooltip = 'A regular toggle with a live status callback.',
}):OnChanged(function(Value)
    Library:Notify(Value and 'Demo enabled' or 'Demo disabled', 2)
end)

Status:AddDropdown('DemoMode', {
    Text = 'Display mode',
    Values = {'Compact', 'Comfortable', 'Detailed'},
    Default = 'Comfortable',
}):OnChanged(function(Value)
    Library:Notify('Display mode: ' .. tostring(Value), 2)
end)
-- end of overview tab

-- start of controls tab
local Basic = Tabs.Controls:AddLeftGroupbox('Basic Controls')
Basic:AddToggle('Notifications', {
    Text = 'Notifications',
    Default = true,
}):OnChanged(function(Value)
    if Value then
        Library:Notify('Notifications enabled', 2)
    end
end)

Basic:AddSlider('Volume', {
    Text = 'Volume',
    Default = 70,
    Min = 0,
    Max = 100,
    Rounding = 0,
}):OnChanged(function(Value)
    print('Volume changed to', Value)
end)

Basic:AddInput('ProfileName', {
    Text = 'Profile name',
    Default = 'Showcase',
    Placeholder = 'Type a name...',
    Finished = true,
    MaxLength = 24,
}):OnChanged(function(Value)
    print('Profile name:', Value)
end)

local Nested = Tabs.Controls:AddRightTabbox('Nested Tabs')
local General = Nested:AddTab('General')
General:AddLabel('Tabboxes let you group related options inside one panel.')
General:AddButton('Run demo action', function()
    Library:Notify('Demo action completed.', 2)
end)

local Advanced = Nested:AddTab('Advanced')
Advanced:AddToggle('AdvancedMode', {
    Text = 'Advanced mode',
    Default = false,
})
Advanced:AddSlider('Precision', {
    Text = 'Precision',
    Default = 2,
    Min = 0,
    Max = 5,
    Rounding = 0,
    Compact = true,
})
-- end of controls tab

-- start of visuals tab
local Appearance = Tabs.Visuals:AddLeftGroupbox('Appearance')
Appearance:AddToggle('ShowAccent', {
    Text = 'Accent preview',
    Default = true,
}):AddColorPicker('AccentPreviewColor', {
    Title = 'Accent preview color',
    Default = Color3.fromRGB(56, 189, 248),
})

Options.AccentPreviewColor:OnChanged(function(Color)
    print('Preview color:', Color:ToHex())
end)

Appearance:AddDropdown('ThemeStyle', {
    Text = 'Theme style',
    Values = {'Midnight', 'Ocean', 'Graphite'},
    Default = 'Midnight',
    Tooltip = 'A dropdown example. This demo does not change the library theme.',
})

local VisualActions = Tabs.Visuals:AddRightGroupbox('Actions')
VisualActions:AddButton({
    Text = 'Reset preview',
    Func = function()
        Toggles.ShowAccent:SetValue(true)
        Options.ThemeStyle:SetValue('Midnight')
        Library:Notify('Preview reset.', 2)
    end,
    Tooltip = 'Buttons can use either the short or table-based syntax.',
})
-- end of visuals tab

-- start of settings tab
local Menu = Tabs.Settings:AddLeftGroupbox('Menu Settings')
Menu:AddLabel('The default menu key is RightControl or RightShift.')

local MenuKey = Menu:AddToggle('MenuToggle', {
    Text = 'Example keybind',
    Default = false,
}):AddKeyPicker('MenuToggleKey', {
    Default = 'RightAlt',
    Mode = 'Toggle',
    SyncToggleState = true,
    Text = 'Example keybind',
})

Library.ToggleKeybind = Options.MenuToggleKey

local About = Tabs.Settings:AddRightGroupbox('About')
About:AddLabel('CWEL.UI is a lightweight Roblox interface library.')
About:AddButton('Unload example', function()
    Library:Unload()
end)
-- end of settings tab

Library:Notify('Component showcase loaded.', 3)
-- end of cwel.vip example ui
