-- [[ SUMMONER HUB UI LIBRARY - V2.9 (DARK MUSHROOM RED) ]] --
-- [[ CREATOR: BLUE SIONZ ]] --

local SummonerLib = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

function SummonerLib:CreateWindow(Config)
    local HubName = Config.Name or "SUMMONER HUB"
    
    if CoreGui:FindFirstChild("SummonerHub_Ultimate") then 
        CoreGui.SummonerHub_Ultimate:Destroy() 
    end

    local Gui = Instance.new("ScreenGui")
    Gui.Name = "SummonerHub_Ultimate"
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Gui.ResetOnSpawn = false
    Gui.Parent = CoreGui

    local MainColor = Color3.fromRGB(18, 3, 3)
    local AccentColor = Color3.fromRGB(185, 25, 25)
    local SecColor = Color3.fromRGB(28, 8, 8)
    local StrokeColor = Color3.fromRGB(255, 65, 65)
    local TextColor = Color3.fromRGB(255, 245, 245)

    -- [[ MAIN WINDOW - Ukuran Balanced ]]
    local Main = Instance.new("Frame")
    Main.Name = "MainFrame"
    Main.Size = UDim2.new(0, 420, 0, 310)  -- Kecil & Balanced
    Main.Position = UDim2.new(0.5, -210, 0.5, -155)
    Main.BackgroundColor3 = MainColor
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.Visible = false   -- Mulai tertutup
    Main.Parent = Gui
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = StrokeColor
    MainStroke.Thickness = 1.6

    -- Title Bar
    local TitleBar = Instance.new("Frame", Main)
    TitleBar.Size = UDim2.new(1, 0, 0, 42)
    TitleBar.BackgroundColor3 = SecColor
    Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", TitleBar)
    Title.Size = UDim2.new(1, -50, 1, 0)
    Title.Position = UDim2.new(0, 16, 0, 0)
    Title.Text = HubName
    Title.TextColor3 = TextColor
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.BackgroundTransparency = 1

    -- Minimize Button
    local MinBtn = Instance.new("TextButton", TitleBar)
    MinBtn.Size = UDim2.new(0, 26, 0, 26)
    MinBtn.Position = UDim2.new(1, -34, 0.5, -13)
    MinBtn.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
    MinBtn.Text = "−"
    MinBtn.TextColor3 = TextColor
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 18
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1, 0)

    -- [[ FLOATING ICON - Kecil, No Hover Enlarge, No Red Outline ]]
    local FloatingIcon = Instance.new("ImageButton")
    FloatingIcon.Name = "FloatingIcon"
    FloatingIcon.Size = UDim2.new(0, 48, 0, 48)   -- Kecil
    FloatingIcon.Position = UDim2.new(0.5, -24, 0, 20)
    FloatingIcon.BackgroundColor3 = AccentColor
    FloatingIcon.Image = "rbxassetid://96064857767903"
    FloatingIcon.Visible = true   -- Muncul pertama
    FloatingIcon.Active = true
    FloatingIcon.Draggable = true
    FloatingIcon.Parent = Gui
    Instance.new("UICorner", FloatingIcon).CornerRadius = UDim.new(0, 12)

    -- No Hover Enlarge
    -- No Red Outline

    MinBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
        FloatingIcon.Visible = true
    end)

    FloatingIcon.MouseButton1Click:Connect(function()
        FloatingIcon.Visible = false
        Main.Visible = true
    end)

    -- Sidebar & Container (disesuaikan ukuran)
    local Sidebar = Instance.new("Frame", Main)
    Sidebar.Size = UDim2.new(0, 130, 1, -48)
    Sidebar.Position = UDim2.new(0, 0, 0, 42)
    Sidebar.BackgroundColor3 = SecColor
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

    local Container = Instance.new("Frame", Main)
    Container.Size = UDim2.new(1, -140, 1, -52)
    Container.Position = UDim2.new(0, 135, 0, 48)
    Container.BackgroundTransparency = 1

    local WindowObj = {}
    local FirstTab = true

    function WindowObj:CreateTab(TabName)
        -- ... (sama seperti sebelumnya, CreateButton dengan Toggle support)
        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = FirstTab
        Page.ScrollBarThickness = 4
        Page.ScrollBarImageColor3 = AccentColor
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Parent = Container

        local Layout = Instance.new("UIListLayout", Page)
        Layout.Padding = UDim.new(0, 9)
        Layout.SortOrder = Enum.SortOrder.LayoutOrder

        Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 20)
        end)

        local TabBtn = Instance.new("TextButton", Sidebar)
        TabBtn.Size = UDim2.new(0.92, 0, 0, 36)
        TabBtn.BackgroundColor3 = FirstTab and AccentColor or Color3.fromRGB(35, 10, 10)
        TabBtn.Text = "   " .. TabName
        TabBtn.TextColor3 = TextColor
        TabBtn.Font = Enum.Font.GothamSemibold
        TabBtn.TextSize = 13
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0, 7)

        local BtnStroke = Instance.new("UIStroke", TabBtn)
        BtnStroke.Color = FirstTab and Color3.fromRGB(255, 110, 110) or AccentColor
        BtnStroke.Thickness = 1.4

        TabBtn.MouseButton1Click:Connect(function()
            for _, p in pairs(Container:GetChildren()) do if p:IsA("ScrollingFrame") then p.Visible = false end end
            for _, b in pairs(Sidebar:GetChildren()) do
                if b:IsA("TextButton") then 
                    b.BackgroundColor3 = Color3.fromRGB(35, 10, 10)
                    b.UIStroke.Color = AccentColor
                end 
            end
            Page.Visible = true
            TabBtn.BackgroundColor3 = AccentColor
            TabBtn.UIStroke.Color = Color3.fromRGB(255, 110, 110)
        end)

        FirstTab = false
        local TabObj = {}

        function TabObj:CreateButton(Config)
            local text = Config.Name or "Button"
            local callback = Config.Callback or function() end
            local isToggle = Config.Toggle or false
            local state = Config.Default or false

            local Btn = Instance.new("TextButton", Page)
            Btn.Size = UDim2.new(0.96, 0, 0, 40)
            Btn.BackgroundColor3 = SecColor
            Btn.Text = "   " .. text .. (isToggle and (state and " : ON" or " : OFF") or "")
            Btn.TextColor3 = TextColor
            Btn.Font = Enum.Font.GothamBold
            Btn.TextSize = 13
            Btn.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 8)
            
            local Stroke = Instance.new("UIStroke", Btn)
            Stroke.Color = AccentColor
            Stroke.Thickness = 1.3

            Btn.MouseButton1Click:Connect(function()
                if isToggle then
                    state = not state
                    Btn.Text = "   " .. text .. (state and " : ON" or " : OFF")
                    Btn.BackgroundColor3 = state and AccentColor or SecColor
                end
                callback(state or true)
            end)
        end

        return TabObj
    end

    return WindowObj
end

return SummonerLib
