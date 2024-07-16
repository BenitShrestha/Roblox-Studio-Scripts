-- For version control
-- Binds Left Mouse Click to the specified animation based on its ID
-- Get the UserInputService, which allows the script to detect user input
local inputservice = game:GetService("UserInputService")

-- Create a new Animation instance
local animation = Instance.new("Animation")

-- Set the AnimationId property to the ID of the animation asset
animation.AnimationId = "rbxassetid://18510669427"

-- Variable to track whether the animation is currently playing
local isplaying = false

-- Get the local player (the player running the script)
local plr = game.Players.LocalPlayer

-- Get the character model of the player, waiting for it to load if necessary
local char = plr.Character or plr.CharacterAdded:Wait()

-- Wait for the Humanoid object within the character (this handles character animations and health)
local humanoid = char:WaitForChild("Humanoid")

-- Load the animation into the Humanoid
local animPlay = humanoid:LoadAnimation(animation)

-- Connect a function to the InputBegan event, which fires when the user begins to input (e.g., presses a key or clicks the mouse)
inputservice.InputBegan:Connect(function(input, gameProcessedEvent)
    -- Check if the input action is a left mouse button click and that the event was not processed by the game (i.e., not in a UI element)
    if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessedEvent then
        -- Check if the animation is not already playing
        if not isplaying then
            -- Set the isplaying variable to true to indicate the animation is playing
            isplaying = true 

            -- Play the animation
            animPlay:Play()

            -- Connect a function to the Stopped event of the animation, which fires when the animation stops
            animPlay.Stopped:Connect(function()
                -- Set the isplaying variable to false to indicate the animation has stopped
                isplaying = false
            end)
        end
    end
end)
