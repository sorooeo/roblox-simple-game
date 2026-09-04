-- Block Spawner Script
-- This script spawns clickable blocks randomly around the map

local SPAWN_INTERVAL = 2 -- Spawn a block every 2 seconds
local SPAWN_RADIUS = 50 -- How far from center to spawn blocks
local BLOCK_SIZE = 3 -- Size of each block
local SPAWN_CENTER = Vector3.new(0, 10, 0) -- Where blocks spawn around

while true do
    wait(SPAWN_INTERVAL)
    
    -- Create a new block
    local block = Instance.new("Part")
    block.Shape = Enum.PartType.Ball
    block.Size = Vector3.new(BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE)
    block.BrickColor = BrickColor.Random()
    block.CanCollide = false
    block.TopSurface = Enum.SurfaceType.Smooth
    block.BottomSurface = Enum.SurfaceType.Smooth
    
    -- Random spawn position
    local randomX = math.random(-SPAWN_RADIUS, SPAWN_RADIUS)
    local randomZ = math.random(-SPAWN_RADIUS, SPAWN_RADIUS)
    block.Position = SPAWN_CENTER + Vector3.new(randomX, 0, randomZ)
    
    -- Add ClickDetector for clicking
    local clickDetector = Instance.new("ClickDetector")
    clickDetector.Parent = block
    
    -- Parent block to workspace
    block.Parent = workspace
    
    -- Remove block after 5 seconds if not clicked
    game:GetService("Debris"):AddItem(block, 5)
end