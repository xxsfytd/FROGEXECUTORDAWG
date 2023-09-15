-- Create a ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.5, 0, 0.5, 0) -- Size the frame to half of the screen's dimensions
frame.Position = UDim2.new(0.25, 0, 0.25, 0) -- Position the frame in the middle of the screen
frame.BackgroundColor3 = Color3.new(0, 0.4, 0) -- Set the frame's background color to dark green
frame.Parent = screenGui -- The frame is visible by default

-- Create a TextLabel named "Frog Executor"
local executorLabel = Instance.new("TextLabel")
executorLabel.Text = "Frog Executor" -- Change the name of the TextLabel
executorLabel.Size = UDim2.new(0.3, 0, 0.15, 0) -- Increase the size of the label
executorLabel.Position = UDim2.new(0, 0, 0, 0) -- Position the label in the top-left corner
executorLabel.BackgroundColor3 = Color3.new(0, 0.4, 0) -- Set the text background color to dark green
executorLabel.TextColor3 = Color3.new(0, 1, 0) -- Set the text color to lime
executorLabel.Parent = frame

-- Create a TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.96, 0, 0.60, 0) -- Decrease the size of the bottom side of the TextBox
textBox.Position = UDim2.new(0.02, 0, 0.25, 0) -- Position the TextBox with slight margins
textBox.BackgroundColor3 = Color3.new(0, 1, 0) -- Set the background color of the TextBox to lime
textBox.Parent = frame

-- Create a TextButton named "Execute"
local executeButton = Instance.new("TextButton")
executeButton.Text = "Execute"
executeButton.Size = UDim2.new(0.96, 0, 0.1, 0) -- Set the size of the Execute button
executeButton.Position = UDim2.new(0.02, 0, 0.90, 0) -- Position the Execute button below the TextBox
executeButton.BackgroundColor3 = Color3.new(0, 1, 0) -- Set the background color to green
executeButton.Parent = frame

-- Create an "Open / Close" TextButton on the side of the screen
local openButton = Instance.new("TextButton")
openButton.Text = "Open / Close" -- Change the name of the Open button
openButton.Size = UDim2.new(0.1, 0, 0.05, 0) -- Set the size of the Open button
openButton.Position = UDim2.new(0.85, 0, 0.05, 0) -- Position the Open button to the side of the screen
openButton.BackgroundColor3 = Color3.new(0, 0.4, 0) -- Set the background color to dark green
openButton.TextColor3 = Color3.new(0, 1, 0) -- Set the text color to lime
openButton.Parent = screenGui

-- Flag to track whether the frame is open or closed
local isOpen = false

-- Function to tween the frame to the center
local function tweenToMiddle()
    local tweenService = game:GetService("TweenService")
    
    -- Define the goal properties for the tween
    local goalProperties = {
        Position = UDim2.new(0.25, 0, 0.25, 0), -- Move the frame back to the middle of the screen
    }
    
    -- Define the tweening info
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    
    -- Create and play the tween
    local tween = tweenService:Create(frame, tweenInfo, goalProperties)
    tween:Play()
end

-- Function to tween the frame out
local function tweenOut()
    local tweenService = game:GetService("TweenService")
    
    -- Define the goal properties for the tween
    local goalProperties = {
        Position = UDim2.new(1.5, 0, 0.25, 0), -- Move the frame out of the screen
    }
    
    -- Define the tweening info
    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    
    -- Create and play the tween
    local tween = tweenService:Create(frame, tweenInfo, goalProperties)
    tween:Play()
end

-- Function to toggle the frame's visibility and perform the appropriate tween
local function toggleFrameVisibility()
    if isOpen then
        isOpen = false
        tweenOut() -- Tween the frame out
    else
        isOpen = true
        tweenToMiddle() -- Tween the frame to the center
    end
end

-- Function to execute the Lua code in the TextBox
local function executeCode()
    local code = textBox.Text
    local success, result = pcall(loadstring(code))
    
    if success then
        -- Code executed successfully, you can handle the result if needed
    else
        warn("Error executing code:", result) -- Print the error message to the output
    end
end

-- Event handler for clearing the TextBox text when Enter is pressed
textBox.Focused:Connect(function()
    textBox.Text = "" -- Clear the text when the TextBox is focused
end)

-- Set up the click event handler for the Open / Close button
openButton.MouseButton1Click:Connect(function()
    toggleFrameVisibility() -- Toggle the frame's visibility and perform the appropriate tween
end)

-- Set up the click event handler for the Execute button
executeButton.MouseButton1Click:Connect(executeCode)
