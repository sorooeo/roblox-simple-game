-- Block Click Handler
-- Detects when a block is clicked and updates the score

local players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

-- Create a way to track scores
local scores = {}

local function onBlockClicked(clickDetector)
    local player = players:GetPlayerFromCharacter(clickDetector.Parent.Parent)
    
    if not player then
        return
    end
    
    -- Initialize score if new player
    if not scores[player.UserId] then
        scores[player.UserId] = 0
    end
    
    -- Add 1 point
    scores[player.UserId] = scores[player.UserId] + 1
    
    -- Remove the block
    clickDetector.Parent:Destroy()
    
    print(player.Name .. " clicked a block! Score: " .. scores[player.UserId])
end

-- Listen for all blocks being clicked
while true do
    wait(0.1)
    for _, part in pairs(workspace:GetChildren()) do
        if part:FindFirstChild("ClickDetector") and not part:GetAttribute("ClickConnected") then
            local clickDetector = part.ClickDetector
            clickDetector.MouseClick:Connect(function(player)
                scores[player.UserId] = (scores[player.UserId] or 0) + 1
                part:Destroy()
                print(player.Name .. " - Score: " .. scores[player.UserId])
            end)
            part:SetAttribute("ClickConnected", true)
        end
    end
end