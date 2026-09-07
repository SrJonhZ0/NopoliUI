
-- Service
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Configuration
local Config = {

    -- Title
    Title = "Nopoli Hub",

    -- Caption
    Subtitle = "Universal Script",

    -- Logo image ID
    -- Insert Your image ID Here
    Image = "rbxassetid://1234567890",

    -- Windorw Size
    Width = 570,
    Height = 420,

}

-- Gui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NopoliHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

-- Functions
local function New(Class, Properties, Parent)
    local Object = Instance.new(Class)

    for Property, Value in pairs(Properties or {}) do
        Object[Property] = Value
    end

    if Parent then
        Object.Parent = Parent
    end

    return Object
end

local function Corner(Object, Radius)
    local UI = Instance.new("UICorner")
    UI.CornerRadius = UDim.new(0, Radius or 8)
    UI.Parent = Object
    return UI
end

local function Stroke(Object, Color, Transparency)
    local UI = Instance.new("UIStroke")
    UI.Color = Color or Color3.fromRGB(220, 220, 220)
    UI.Transparency = Transparency or 0
    UI.Thickness = 1
    UI.Parent = Object
    return UI
end

local function Tween(Object, Time, Properties)
    return TweenService:Create(
        Object,
        TweenInfo.new(
            Time,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        Properties
    )
end

-- Shadow
local Shadow = New("Frame", {
    Name = "Shadow",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(
        Config.Width + 12,
        Config.Height + 12
    ),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.75,
    BorderSizePixel = 0,
    ZIndex = 0
}, ScreenGui)

Corner(Shadow, 14)

-- Main
local Main = New("Frame", {
    Name = "Main",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(
        Config.Width,
        Config.Height
    ),
    BackgroundColor3 = Color3.fromRGB(245, 245, 247),
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 1
}, ScreenGui)

Corner(Main, 12)
Stroke(Main, Color3.fromRGB(215, 215, 220), 0.2)

-- Scale Animation
local UIScale = New("UIScale", {
    Scale = 0.94
}, Main)

Tween(
    UIScale,
    0.45,
    {
        Scale = 1
    }
):Play()

-- Top Bar
local TopBar = New("Frame", {
    Name = "TopBar",
    Size = UDim2.new(1, 0, 0, 64),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BorderSizePixel = 0,
    ZIndex = 5
}, Main)

-- Logo / Image Label
local Logo = New("ImageLabel", {

    Name = "Logo",

    Position = UDim2.new(
        0,
        15,
        0.5,
        -18
    ),

    Size = UDim2.fromOffset(
        36,
        36
    ),

    BackgroundTransparency = 1,

    -- 👇 Here it retrieves the config ID.
    Image = Config.Image,

    ScaleType = Enum.ScaleType.Fit,

    ZIndex = 7

}, TopBar)

Corner(Logo, 9)


local Title = New("TextLabel", {
    Name = "Title",

    Position = UDim2.new(
        0,
        61,
        0,
        10
    ),

    Size = UDim2.new(
        1,
        -180,
        0,
        25
    ),

    BackgroundTransparency = 1,

    Text = Config.Title,

    Font = Enum.Font.GothamBold,

    TextSize = 17,

    TextColor3 = Color3.fromRGB(
        35,
        35,
        38
    ),

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 7

}, TopBar)

-- Caption
local Subtitle = New("TextLabel", {
    Name = "Subtitle",

    Position = UDim2.new(
        0,
        61,
        0,
        33
    ),

    Size = UDim2.new(
        1,
        -180,
        0,
        20
    ),

    BackgroundTransparency = 1,

    Text = Config.Subtitle,

    Font = Enum.Font.Gotham,

    TextSize = 11,

    TextColor3 = Color3.fromRGB(
        125,
        125,
        130
    ),

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 7

}, TopBar)

-- Minimize
local Minimize = New("TextButton", {
    Name = "Minimize",

    Position = UDim2.new(
        1,
        -78,
        0.5,
        -16
    ),

    Size = UDim2.fromOffset(
        32,
        32
    ),

    BackgroundColor3 = Color3.fromRGB(
        242,
        242,
        245
    ),

    BorderSizePixel = 0,

    Text = "—",

    Font = Enum.Font.GothamBold,

    TextSize = 16,

    TextColor3 = Color3.fromRGB(
        70,
        70,
        75
    ),

    AutoButtonColor = false,

    ZIndex = 8

}, TopBar)

Corner(Minimize, 8)

-- Close
local Close = New("TextButton", {
    Name = "Close",

    Position = UDim2.new(
        1,
        -40,
        0.5,
        -16
    ),

    Size = UDim2.fromOffset(
        32,
        32
    ),

    BackgroundColor3 = Color3.fromRGB(
        242,
        242,
        245
    ),

    BorderSizePixel = 0,

    Text = "×",

    Font = Enum.Font.GothamBold,

    TextSize = 18,

    TextColor3 = Color3.fromRGB(
        70,
        70,
        75
    ),

    AutoButtonColor = false,

    ZIndex = 8

}, TopBar)

Corner(Close, 8)

-- Button Hover
local function ButtonHover(Button)

    Button.MouseEnter:Connect(function()

        Tween(
            Button,
            0.15,
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        230,
                        230,
                        234
                    )
            }
        ):Play()

    end)

    Button.MouseLeave:Connect(function()

        Tween(
            Button,
            0.15,
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        242,
                        242,
                        245
                    )
            }
        ):Play()

    end)

end

ButtonHover(Minimize)
ButtonHover(Close)

-- Side Bar
local Sidebar = New("Frame", {
    Name = "Sidebar",

    Position = UDim2.new(
        0,
        0,
        0,
        64
    ),

    Size = UDim2.new(
        0,
        150,
        1,
        -64
    ),

    BackgroundColor3 = Color3.fromRGB(
        239,
        239,
        242
    ),

    BorderSizePixel = 0,

    ZIndex = 3

}, Main)

-- Menu Text
local MenuTitle = New("TextLabel", {

    Name = "MenuTitle",

    Position = UDim2.new(
        0,
        18,
        0,
        18
    ),

    Size = UDim2.new(
        1,
        -36,
        0,
        20
    ),

    BackgroundTransparency = 1,

    Text = "MENU",

    Font = Enum.Font.GothamBold,

    TextSize = 10,

    TextColor3 = Color3.fromRGB(
        130,
        130,
        135
    ),

    TextXAlignment = Enum.TextXAlignment.Left,

    ZIndex = 5

}, Sidebar)

-- Tab Holder
local TabHolder = New("ScrollingFrame", {

    Name = "TabHolder",

    Position = UDim2.new(
        0,
        10,
        0,
        48
    ),

    Size = UDim2.new(
        1,
        -20,
        1,
        -58
    ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 0,

    CanvasSize = UDim2.new(
        0,
        0,
        0,
        0
    ),

    AutomaticCanvasSize =
        Enum.AutomaticSize.Y,

    ZIndex = 5

}, Sidebar)

local TabLayout = New("UIListLayout", {

    Padding = UDim.new(
        0,
        5
    ),

    SortOrder =
        Enum.SortOrder.LayoutOrder

}, TabHolder)

-- Content
local Content = New("Frame", {

    Name = "Content",

    Position = UDim2.new(
        0,
        150,
        0,
        64
    ),

    Size = UDim2.new(
        1,
        -150,
        1,
        -64
    ),

    BackgroundColor3 = Color3.fromRGB(
        250,
        250,
        252
    ),

    BorderSizePixel = 0,

    ZIndex = 2

}, Main)

-- Page Title
local PageTitle = New("TextLabel", {

    Name = "PageTitle",

    Position = UDim2.new(
        0,
        25,
        0,
        20
    ),

    Size = UDim2.new(
        1,
        -50,
        0,
        30
    ),

    BackgroundTransparency = 1,

    Text = "Main",

    Font = Enum.Font.GothamBold,

    TextSize = 21,

    TextColor3 = Color3.fromRGB(
        35,
        35,
        40
    ),

    TextXAlignment =
        Enum.TextXAlignment.Left,

    ZIndex = 5

}, Content)

-- Page Container
local PageContainer = New("ScrollingFrame", {

    Name = "PageContainer",

    Position = UDim2.new(
        0,
        20,
        0,
        60
    ),

    Size = UDim2.new(
        1,
        -40,
        1,
        -75
    ),

    BackgroundTransparency = 1,

    BorderSizePixel = 0,

    ScrollBarThickness = 3,

    CanvasSize = UDim2.new(
        0,
        0,
        0,
        0
    ),

    AutomaticCanvasSize =
        Enum.AutomaticSize.Y,

    ZIndex = 5

}, Content)

local PageLayout = New("UIListLayout", {

    Padding = UDim.new(
        0,
        8
    ),

    SortOrder =
        Enum.SortOrder.LayoutOrder

}, PageContainer)

-- UI Library
local UI = {}

UI.Tabs = {}
UI.CurrentTab = nil

-- Add Tab
function UI:AddTab(Name)

    local TabButton = New("TextButton", {

        Name = Name .. "Tab",

        Size = UDim2.new(
            1,
            0,
            0,
            38
        ),

        BackgroundColor3 =
            Color3.fromRGB(
                239,
                239,
                242
            ),

        BorderSizePixel = 0,

        Text = Name,

        Font = Enum.Font.GothamMedium,

        TextSize = 13,

        TextColor3 =
            Color3.fromRGB(
                100,
                100,
                105
            ),

        TextXAlignment =
            Enum.TextXAlignment.Left,

        AutoButtonColor = false,

        ZIndex = 6

    }, TabHolder)

    New("UIPadding", {

        PaddingLeft = UDim.new(
            0,
            12
        )

    }, TabButton)

    Corner(TabButton, 8)

    local Page = New("Frame", {

        Name = Name .. "Page",

        Size = UDim2.new(
            1,
            0,
            0,
            0
        ),

        BackgroundTransparency = 1,

        Visible = false,

        AutomaticSize =
            Enum.AutomaticSize.Y,

        ZIndex = 5

    }, PageContainer)

    local Layout = New("UIListLayout", {

        Padding = UDim.new(
            0,
            8
        ),

        SortOrder =
            Enum.SortOrder.LayoutOrder

    }, Page)

    local Tab = {}

    Tab.Page = Page
    Tab.Button = TabButton

-- Tab
    local function Select()

        for _, Other in pairs(UI.Tabs) do

            Other.Page.Visible = false

            Tween(
                Other.Button,
                0.2,
                {
                    BackgroundColor3 =
                        Color3.fromRGB(
                            239,
                            239,
                            242
                        ),

                    TextColor3 =
                        Color3.fromRGB(
                            100,
                            100,
                            105
                        )
                }
            ):Play()

        end

        Page.Visible = true

        Tween(
            TabButton,
            0.2,
            {
                BackgroundColor3 =
                    Color3.fromRGB(
                        225,
                        225,
                        230
                    ),

                TextColor3 =
                    Color3.fromRGB(
                        35,
                        35,
                        40
                    )
            }
        ):Play()

        PageTitle.Text = Name

        UI.CurrentTab = Tab

    end

    TabButton.MouseButton1Click:Connect(
        Select
    )

-- Button
    function Tab:AddButton(Text, Callback)

        local Button = New("TextButton", {

            Size = UDim2.new(
                1,
                0,
                0,
                42
            ),

            BackgroundColor3 =
                Color3.fromRGB(
                    255,
                    255,
                    255
                ),

            BorderSizePixel = 0,

            Text = Text,

            Font = Enum.Font.GothamMedium,

            TextSize = 13,

            TextColor3 =
                Color3.fromRGB(
                    45,
                    45,
                    50
                ),

            AutoButtonColor = false,

            ZIndex = 7

        }, Page)

        Corner(Button, 8)
        Stroke(
            Button,
            Color3.fromRGB(
                225,
                225,
                230
            ),
            0.4
        )

        Button.MouseEnter:Connect(
            function()

                Tween(
                    Button,
                    0.15,
                    {
                        BackgroundColor3 =
                            Color3.fromRGB(
                                245,
                                245,
                                248
                            )
                    }
                ):Play()

            end
        )

        Button.MouseLeave:Connect(
            function()

                Tween(
                    Button,
                    0.15,
                    {
                        BackgroundColor3 =
                            Color3.fromRGB(
                                255,
                                255,
                                255
                            )
                    }
                ):Play()

            end
        )

        Button.MouseButton1Click:Connect(
            function()

                if Callback then
                    Callback()
                end

            end
        )

        return Button

    end

-- Label
    function Tab:AddLabel(Text)

        local Label = New("TextLabel", {

            Size = UDim2.new(
                1,
                0,
                0,
                32
            ),

            BackgroundTransparency = 1,

            Text = Text,

            Font = Enum.Font.Gotham,

            TextSize = 13,

            TextColor3 =
                Color3.fromRGB(
                    100,
                    100,
                    105
                ),

            TextXAlignment =
                Enum.TextXAlignment.Left,

            ZIndex = 7

        }, Page)

        return Label

    end

-- Toggle
    function Tab:AddToggle(Text, Default, Callback)

        local Enabled = Default or false

        local Toggle = New("TextButton", {

            Size = UDim2.new(
                1,
                0,
                0,
                42
            ),

            BackgroundColor3 =
                Color3.fromRGB(
                    255,
                    255,
                    255
                ),

            BorderSizePixel = 0,

            Text = "",

            AutoButtonColor = false,

            ZIndex = 7

        }, Page)

        Corner(Toggle, 8)

        Stroke(
            Toggle,
            Color3.fromRGB(
                225,
                225,
                230
            ),
            0.4
        )

        local ToggleText = New("TextLabel", {

            Position = UDim2.new(
                0,
                12,
                0,
                0
            ),

            Size = UDim2.new(
                1,
                -70,
                1,
                0
            ),

            BackgroundTransparency = 1,

            Text = Text,

            Font = Enum.Font.GothamMedium,

            TextSize = 13,

            TextColor3 =
                Color3.fromRGB(
                    45,
                    45,
                    50
                ),

            TextXAlignment =
                Enum.TextXAlignment.Left,

            ZIndex = 8

        }, Toggle)

        local Switch = New("Frame", {

            Position = UDim2.new(
                1,
                -48,
                0.5,
                -9
            ),

            Size = UDim2.fromOffset(
                36,
                18
            ),

            BackgroundColor3 =
                Color3.fromRGB(
                    205,
                    205,
                    210
                ),

            BorderSizePixel = 0,

            ZIndex = 8

        }, Toggle)

        Corner(Switch, 20)

        local Knob = New("Frame", {

            Position = UDim2.new(
                0,
                2,
                0.5,
                -7
            ),

            Size = UDim2.fromOffset(
                14,
                14
            ),

            BackgroundColor3 =
                Color3.fromRGB(
                    255,
                    255,
                    255
                ),

            BorderSizePixel = 0,

            ZIndex = 9

        }, Switch)

        Corner(Knob, 20)

        local function Update()

            if Enabled then

                Tween(
                    Switch,
                    0.2,
                    {
                        BackgroundColor3 =
                            Color3.fromRGB(
                                80,
                                120,
                                255
                            )
                    }
                ):Play()

                Tween(
                    Knob,
                    0.2,
                    {
                        Position =
                            UDim2.new(
                                1,
                                -16,
                                0.5,
                                -7
                            )
                    }
                ):Play()

            else

                Tween(
                    Switch,
                    0.2,
                    {
                        BackgroundColor3 =
                            Color3.fromRGB(
                                205,
                                205,
                                210
                            )
                    }
                ):Play()

                Tween(
                    Knob,
                    0.2,
                    {
                        Position =
                            UDim2.new(
                                0,
                                2,
                                0.5,
                                -7
                            )
                    }
                ):Play()

            end

        end

        Toggle.MouseButton1Click:Connect(
            function()

                Enabled = not Enabled

                Update()

                if Callback then
                    Callback(Enabled)
                end

            end
        )

        Update()

        return Toggle

    end

    table.insert(
        UI.Tabs,
        Tab
    )

    -- Primeira aba automaticamente
    if #UI.Tabs == 1 then
        Select()
    end

    return Tab

end

-- Exemple
local MainTab = UI:AddTab("Main")

MainTab:AddLabel(
    "Welcome to Nopoli Hub!"
)

MainTab:AddButton(
    "Test Button",
    function()
        print("Botão clicado!")
    end
)

MainTab:AddToggle(
    "Example Toggle",
    false,
    function(Value)
        print("Toggle:", Value)
    end
)

--==================================================

local PlayerTab = UI:AddTab("Player")

PlayerTab:AddLabel(
    "Player Settings"
)

PlayerTab:AddButton(
    "Test Player Button",
    function()
        print("Player button!")
    end
)

--==================================================

local SettingsTab = UI:AddTab("Settings")

SettingsTab:AddLabel(
    "UI Settings"
)

SettingsTab:AddToggle(
    "Example Setting",
    true,
    function(Value)
        print("Setting:", Value)
    end
)

-- Drag
local Dragging = false
local DragStart
local StartPosition

TopBar.InputBegan:Connect(
    function(Input)

        if
            Input.UserInputType ==
            Enum.UserInputType.MouseButton1
        then

            Dragging = true
            DragStart = Input.Position
            StartPosition = Main.Position

        end

    end
)

TopBar.InputEnded:Connect(
    function(Input)

        if
            Input.UserInputType ==
            Enum.UserInputType.MouseButton1
        then

            Dragging = false

        end

    end
)

UserInputService.InputChanged:Connect(
    function(Input)

        if
            Dragging and
            Input.UserInputType ==
            Enum.UserInputType.MouseMovement
        then

            local Delta =
                Input.Position - DragStart

            local NewPosition =
                UDim2.new(
                    StartPosition.X.Scale,
                    StartPosition.X.Offset + Delta.X,
                    StartPosition.Y.Scale,
                    StartPosition.Y.Offset + Delta.Y
                )

            Main.Position = NewPosition

            Shadow.Position = NewPosition

        end

    end
)

-- Minimize
local Minimized = false

Minimize.MouseButton1Click:Connect(
    function()

        Minimized = not Minimized

        if Minimized then

            Tween(
                Main,
                0.35,
                {
                    Size =
                        UDim2.fromOffset(
                            Config.Width,
                            62
                        )
                }
            ):Play()

            Tween(
                Shadow,
                0.35,
                {
                    Size =
                        UDim2.fromOffset(
                            Config.Width + 12,
                            74
                        )
                }
            ):Play()

            Sidebar.Visible = false
            Content.Visible = false

        else

            Sidebar.Visible = true
            Content.Visible = true

            Tween(
                Main,
                0.35,
                {
                    Size =
                        UDim2.fromOffset(
                            Config.Width,
                            Config.Height
                        )
                }
            ):Play()

            Tween(
                Shadow,
                0.35,
                {
                    Size =
                        UDim2.fromOffset(
                            Config.Width + 12,
                            Config.Height + 12
                        )
                }
            ):Play()

        end

    end
)

-- Close UI
Close.MouseButton1Click:Connect(
    function()

        Tween(
            UIScale,
            0.3,
            {
                Scale = 0.9
            }
        ):Play()

        Tween(
            Main,
            0.3,
            {
                BackgroundTransparency = 1
            }
        ):Play()

        Tween(
            Shadow,
            0.3,
            {
                BackgroundTransparency = 1
            }
        ):Play()

        task.wait(0.3)

        ScreenGui:Destroy()

    end
)

-- End 
_G.NopoliUI = UI

print(
    "Nopoli Hub UI Loaded!"
)
