local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local enabled = false

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local indicator = Instance.new("TextLabel")
indicator.Parent = screenGui
indicator.Size = UDim2.new(0, 200, 0, 50)
indicator.Position = UDim2.new(0.5, -100, 0.9, 0)
indicator.Text = "Seat Block: OFF"
indicator.TextColor3 = Color3.new(1, 0, 0)
indicator.BackgroundColor3 = Color3.new(0, 0, 0)
indicator.TextScaled = true
indicator.Font = Enum.Font.SourceSansBold
indicator.TextStrokeTransparency = 0
indicator.TextStrokeColor3 = Color3.new(1, 1, 1)
indicator.Active = true
indicator.Draggable = true

local function toggleSeats(enable)
    for _, seat in ipairs(workspace:GetDescendants()) do
        if seat:IsA("Seat") or seat:IsA("VehicleSeat") then
            seat.Disabled = enable
        end
    end
end

local function updateIndicator()
    if enabled then
        indicator.Text = "Seat Block: ON"
        indicator.TextColor3 = Color3.new(0, 1, 0)
    else
        indicator.Text = "Seat Block: OFF"
        indicator.TextColor3 = Color3.new(1, 0, 0)
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.F then -- Клавиша "F" для вкл/выкл
        enabled = not enabled
        toggleSeats(enabled)
        updateIndicator()
    end
end)

toggleSeats(enabled)
updateIndicator()
