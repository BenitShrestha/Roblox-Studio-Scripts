-- Code stored here for version control
-- Insert Object -> Animation -> AnimationID: 18510669427, Simple Kick Animation

-- Get the UserInputService, which allows the script to detect user input
local UserInputService = game:GetService("UserInputService")

-- Get the Animation object from the script
local Animation = script.Animation

-- Connect a function to the InputBegan event, which fires when the user begins to input (e.g., presses a key)
UserInputService.InputBegan:Connect(function(Input)
    -- Check if the key pressed is 'Q'
    if Input.KeyCode == Enum.KeyCode.Q then
        -- Get the local player (the player running the script)
        local Player = game.Players.LocalPlayer

        -- Get the character model of the player
        local Character = Player.Character

        -- Wait for the Humanoid object within the character (this handles character animations and health)
        local Humanoid = Character:WaitForChild("Humanoid")

        -- Load the animation into the Humanoid
        local Anim = Humanoid:LoadAnimation(Animation)

        -- Play the animation
        Anim:Play()
    end
end)
