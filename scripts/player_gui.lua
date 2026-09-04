-- Player GUI Script
-- Displays the player's current score

local players = game:GetService("Players")
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ScoreGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Create TextLabel for score display
local scoreLabel = Instance.new("TextLabel")
scoreLabel.Name = "ScoreLabel"
scoreLabel.Size = UDim2.new(0, 200, 0, 50)
scoreLabel.Position = UDim2.new(0.5, -100, 0, 20)
scoreLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
scoreLabel.BackgroundTransparency = 0.5
scoreLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
scoreLabel.TextSize = 24
scoreLabel.Font = Enum.Font.GothamBold
scoreLabel.Text = "Score: 0"
scoreLabel.Parent = screenGui

-- Update score display (in a real game, you'd connect this to the actual score)
while true do
    wait(0.5)
    scoreLabel.Text = "Score: Click blocks to earn points!"
end