-- [[ SUMMONER HUB UI LIBRARY - V2.7 (DARK MUSHROOM RED) ]] --
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

    -- ==================== DARK MUSHROOM RED THEME ====================
    local MainColor = Color3.fromRGB(18, 3, 3)        -- Dark Mushroom Red
    local AccentColor = Color3.fromRGB(180, 20, 20)   -- Deep Red Accent
    local SecColor = Color3.fromRGB(28, 8, 8)
    local StrokeColor = Color3.fromRGB(255, 60, 60)
    local TextColor = Color3.fromRGB(255, 245, 245)

    -- [[ MAIN WINDOW ]]
    local Main = Instance.new("Frame")
    Main.Name = "MainFrame"
    Main.Size = UDim2.new(0, 580, 0, 420)
    Main.Position = UDim2.new(0.5, -290, 0.5, -210)
    Main.BackgroundColor3 = MainColor
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true          -- Bisa di drag
    Main.Visible = true
    Main.Parent = Gui
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = StrokeColor
    MainStroke.Thickness = 1.8
    MainStroke.Transparency = 0.3

    -- Title Bar (HubName di kiri atas)
    local TitleBar = Instance.new("Frame", Main)
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 50)
    TitleBar.BackgroundColor3 = SecColor
    TitleBar.BorderSizePixel = 0
    Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", TitleBar)
    Title.Size = UDim2.new(1, -60, 1, 0)
    Title.Position = UDim2.new(0, 20, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = HubName
    Title.TextColor3 = TextColor
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Minimize Button
    local MinBtn = Instance.new("TextButton", TitleBar)
    MinBtn.Size = UDim2.new(0, 30, 0, 30)
    MinBtn.Position = UDim2.new(1, -40, 0.5, -15)
    MinBtn.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
    MinBtn.Text = "−"
    MinBtn.TextColor3 = TextColor
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 20
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1, 0)

    local MinStroke = Instance.new("UIStroke", MinBtn)
    MinStroke.Color = AccentColor
    MinStroke.Thickness = 1.5

    -- [[ FLOATING ICON ]]
    local FloatingIcon = Instance.new("ImageButton")
    FloatingIcon.Name = "FloatingIcon"
    FloatingIcon.Size = UDim2.new(0, 60, 0, 60)
    FloatingIcon.Position = UDim2.new(0.5, -30, 0, 30)
    FloatingIcon.BackgroundColor3 = SecColor
    FloatingIcon.BackgroundTransparency = 0.1
    FloatingIcon.Image = "rbxassetid://96064857767903" -- Ganti ID ini kalau mau
    FloatingIcon.Visible = false
    FloatingIcon.Active = true
    FloatingIcon.Draggable = true          -- Bisa di drag
    FloatingIcon.Parent = Gui
    Instance.new("UICorner", FloatingIcon).CornerRadius = UDim.new(1, 0)

    local IconStroke = Instance.new("UIStroke", FloatingIcon)
    IconStroke.Color = StrokeColor
    IconStroke.Thickness = 2.5
    IconStroke.Transparency = 0.2

    -- Hover Effect
    FloatingIcon.MouseEnter:Connect(function()
        FloatingIcon.Size = UDim2.new(0, 68, 0, 68)
    end)
    FloatingIcon.MouseLeave:Connect(function()
        FloatingIcon.Size = UDim2.new(0, 60, 0, 60)
    end)

    -- Minimize & Maximize Logic
    MinBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
        FloatingIcon.Visible = true
    end)

    FloatingIcon.MouseButton1Click:Connect(function()
        FloatingIcon.Visible = false
        Main.Visible = true
    end)

    -- Sidebar
    local Sidebar = Instance.new("Frame", Main)
    Sidebar.Size = UDim2.new(0, 170, 1, -50)
    Sidebar.Position = UDim2.new(0, 0, 0, 50)
    Sidebar.BackgroundColor3 = SecColor
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

    local SideLayout = Instance.new("UIListLayout", Sidebar)
    SideLayout.Padding = UDim.new(0, 8)
    SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    SideLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Container
    local Container = Instance.new("Frame", Main)
    Container.Size = UDim2.new(1, -180, 1, -60)
    Container.Position = UDim2.new(0, 175, 0, 55)
    Container.BackgroundTransparency = 1

    -- [[ PROFILE CARD ]]
    local Profile = Instance.new("Frame", Sidebar)
    Profile.Name = "ProfileCard"
    Profile.Size = UDim2.new(0.9, 0, 0, 55)
    Profile.Position = UDim2.new(0.05, 0, 1, -70)
    Profile.BackgroundColor3 = Color3.fromRGB(35, 10, 10)
    Profile.BorderSizePixel = 0
    Instance.new("UICorner", Profile).CornerRadius = UDim.new(0, 8)

    local ProfileStroke = Instance.new("UIStroke", Profile)
    ProfileStroke.Color = AccentColor
    ProfileStroke.Thickness = 1.2

    local UserText = Instance.new("TextLabel", Profile)
    UserText.Size = UDim2.new(1, -20, 1, 0)
    UserText.Position = UDim2.new(0, 10, 0, 0)
    UserText.BackgroundTransparency = 1
    UserText.Text = LocalPlayer.DisplayName .. "\n@" .. LocalPlayer.Name
    UserText.TextColor3 = TextColor
    UserText.Font = Enum.Font.GothamBold
    UserText.TextSize = 11
    UserText.TextXAlignment = Enum.TextXAlignment.Left
    UserText.TextYAlignment = Enum.TextYAlignment.Center

    -- Window Object
    local WindowObj = {}
    local FirstTab = true

    function WindowObj:CreateTab(TabName)
        local Page = Instance.new("ScrollingFrame")
        Page.Size = UDim2.new(1, 0, 1, 0)
        Page.BackgroundTransparency = 1
        Page.Visible = FirstTab
        Page.ScrollBarThickness = 4
        Page.ScrollBarImageColor3 = AccentColor
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Parent = Container
        
        local Layout = Instance.new("UIListLayout", Page)
        Layout.Padding = UDim.new(0, 10)
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        
        Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 20)
        end)
        
        local Btn = Instance.new("TextButton", Sidebar)
        Btn.Size = UDim2.new(0.9, 0, 0, 40)
        Btn.BackgroundColor3 = FirstTab and AccentColor or Color3.fromRGB(35, 10, 10)
        Btn.Text = "   " .. TabName
        Btn.TextColor3 = TextColor
        Btn.Font = Enum.Font.GothamSemibold
        Btn.TextSize = 13
        Btn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
        
        local BtnStroke = Instance.new("UIStroke", Btn)
        BtnStroke.Color = FirstTab and Color3.fromRGB(255, 100, 100) or AccentColor
        BtnStroke.Thickness = 1.5

        Btn.MouseButton1Click:Connect(function()
            for _, p in pairs(Container:GetChildren()) do
                if p:IsA("ScrollingFrame") then p.Visible = false end
            end
            for _, b in pairs(Sidebar:GetChildren()) do
                if b:IsA("TextButton") then 
                    b.BackgroundColor3 = Color3.fromRGB(35, 10, 10)
                    b.UIStroke.Color = AccentColor
                end 
            end
            Page.Visible = true
            Btn.BackgroundColor3 = AccentColor
            Btn.UIStroke.Color = Color3.fromRGB(255, 100, 100)
        end)

        FirstTab = false
        local TabObj = {}

        function TabObj:CreateButton(Config)
            local text = Config.Name or "Button"
            local callback = Config.Callback or function() end

            local BtnElm = Instance.new("TextButton", Page)
            BtnElm.Size = UDim2.new(0.95, 0, 0, 45)
            BtnElm.BackgroundColor3 = SecColor
            BtnElm.Text = "   " .. text
            BtnElm.TextColor3 = TextColor
            BtnElm.Font = Enum.Font.GothamBold
            BtnElm.TextSize = 13
            BtnElm.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UICorner", BtnElm).CornerRadius = UDim.new(0, 8)
            
            local Stroke = Instance.new("UIStroke", BtnElm)
            Stroke.Color = AccentColor
            Stroke.Thickness = 1.4

            BtnElm.MouseButton1Click:Connect(function()
                BtnElm.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
                callback()
                task.wait(0.12)
                BtnElm.BackgroundColor3 = SecColor
            end)
        end

        return TabObj
    end

    return WindowObj
end

return SummonerLib
