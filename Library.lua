-- [[ SUMMONER HUB UI LIBRARY - V2.8 (DARK MUSHROOM RED) ]] --
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
    local MainColor = Color3.fromRGB(18, 3, 3)
    local AccentColor = Color3.fromRGB(185, 25, 25)
    local SecColor = Color3.fromRGB(28, 8, 8)
    local StrokeColor = Color3.fromRGB(255, 65, 65)
    local TextColor = Color3.fromRGB(255, 245, 245)

    -- [[ MAIN WINDOW - Diperkecil ]]
    local Main = Instance.new("Frame")
    Main.Name = "MainFrame"
    Main.Size = UDim2.new(0, 460, 0, 340)  -- Ukuran lebih kecil
    Main.Position = UDim2.new(0.5, -230, 0.5, -170)
    Main.BackgroundColor3 = MainColor
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true
    Main.Visible = true
    Main.Parent = Gui
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

    local MainStroke = Instance.new("UIStroke", Main)
    MainStroke.Color = StrokeColor
    MainStroke.Thickness = 1.8
    MainStroke.Transparency = 0.25

    -- Title Bar
    local TitleBar = Instance.new("Frame", Main)
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 45)
    TitleBar.BackgroundColor3 = SecColor
    TitleBar.BorderSizePixel = 0
    Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", TitleBar)
    Title.Size = UDim2.new(1, -60, 1, 0)
    Title.Position = UDim2.new(0, 18, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = HubName
    Title.TextColor3 = TextColor
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 17
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Minimize Button
    local MinBtn = Instance.new("TextButton", TitleBar)
    MinBtn.Size = UDim2.new(0, 28, 0, 28)
    MinBtn.Position = UDim2.new(1, -36, 0.5, -14)
    MinBtn.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
    MinBtn.Text = "−"
    MinBtn.TextColor3 = TextColor
    MinBtn.Font = Enum.Font.GothamBold
    MinBtn.TextSize = 18
    Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(1, 0)

    local MinStroke = Instance.new("UIStroke", MinBtn)
    MinStroke.Color = AccentColor
    MinStroke.Thickness = 1.5

    -- [[ FLOATING ICON - Kotak + Corner Sedang + Merah Pas ]]
    local FloatingIcon = Instance.new("ImageButton")
    FloatingIcon.Name = "FloatingIcon"
    FloatingIcon.Size = UDim2.new(0, 54, 0, 54)
    FloatingIcon.Position = UDim2.new(0.5, -27, 0, 25)
    FloatingIcon.BackgroundColor3 = AccentColor
    FloatingIcon.Image = "rbxassetid://96064857767903"  -- Asset dari repo kamu
    FloatingIcon.Visible = false
    FloatingIcon.Active = true
    FloatingIcon.Draggable = true
    FloatingIcon.Parent = Gui
    Instance.new("UICorner", FloatingIcon).CornerRadius = UDim.new(0, 14)  -- Kotak, tidak terlalu lancip

    local IconStroke = Instance.new("UIStroke", FloatingIcon)
    IconStroke.Color = Color3.fromRGB(255, 255, 255)
    IconStroke.Thickness = 2.2
    IconStroke.Transparency = 0.25

    -- Hover Effect
    FloatingIcon.MouseEnter:Connect(function()
        FloatingIcon.Size = UDim2.new(0, 60, 0, 60)
    end)
    FloatingIcon.MouseLeave:Connect(function()
        FloatingIcon.Size = UDim2.new(0, 54, 0, 54)
    end)

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
    Sidebar.Size = UDim2.new(0, 140, 1, -50)
    Sidebar.Position = UDim2.new(0, 0, 0, 45)
    Sidebar.BackgroundColor3 = SecColor
    Sidebar.BorderSizePixel = 0
    Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

    local SideLayout = Instance.new("UIListLayout", Sidebar)
    SideLayout.Padding = UDim.new(0, 6)
    SideLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    SideLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- Container
    local Container = Instance.new("Frame", Main)
    Container.Size = UDim2.new(1, -150, 1, -55)
    Container.Position = UDim2.new(0, 145, 0, 50)
    Container.BackgroundTransparency = 1

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
        Layout.Padding = UDim.new(0, 9)
        Layout.SortOrder = Enum.SortOrder.LayoutOrder
        
        Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Page.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 20)
        end)
        
        local Btn = Instance.new("TextButton", Sidebar)
        Btn.Size = UDim2.new(0.92, 0, 0, 38)
        Btn.BackgroundColor3 = FirstTab and AccentColor or Color3.fromRGB(35, 10, 10)
        Btn.Text = "   " .. TabName
        Btn.TextColor3 = TextColor
        Btn.Font = Enum.Font.GothamSemibold
        Btn.TextSize = 13
        Btn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 7)
        
        local BtnStroke = Instance.new("UIStroke", Btn)
        BtnStroke.Color = FirstTab and Color3.fromRGB(255, 110, 110) or AccentColor
        BtnStroke.Thickness = 1.4

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
            Btn.UIStroke.Color = Color3.fromRGB(255, 110, 110)
        end)

        FirstTab = false
        local TabObj = {}

        function TabObj:CreateButton(Config)
            local text = Config.Name or "Button"
            local callback = Config.Callback or function() end

            local BtnElm = Instance.new("TextButton", Page)
            BtnElm.Size = UDim2.new(0.96, 0, 0, 42)
            BtnElm.BackgroundColor3 = SecColor
            BtnElm.Text = "   " .. text
            BtnElm.TextColor3 = TextColor
            BtnElm.Font = Enum.Font.GothamBold
            BtnElm.TextSize = 13
            BtnElm.TextXAlignment = Enum.TextXAlignment.Left
            Instance.new("UICorner", BtnElm).CornerRadius = UDim.new(0, 8)
            
            local Stroke = Instance.new("UIStroke", BtnElm)
            Stroke.Color = AccentColor
            Stroke.Thickness = 1.3

            BtnElm.MouseButton1Click:Connect(function()
                BtnElm.BackgroundColor3 = Color3.fromRGB(200, 35, 35)
                callback()
                task.wait(0.1)
                BtnElm.BackgroundColor3 = SecColor
            end)
        end

        return TabObj
    end

    return WindowObj
end

return SummonerLib
