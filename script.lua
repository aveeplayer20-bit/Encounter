--// RAIOT - KUSANAGI CLAN EDITION (FIXED) \\--
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Library = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Just-Egg-Salad/roblox-scripts/main/uwuware'))()
local Window = Library:CreateWindow("RAIOT: GOD HITBOX")

Window:AddSlider({
    text = "Rango de Hitbox",
    min = 2,
    max = 200, 
    float = 0.1,
    flag = "Size"
})
Library:Init()

--// El Motor de Raiot con Filtro Anti-AutoHitbox //--
task.spawn(function()
    while task.wait(0.3) do 
        local SizeNumber = Library.flags.Size or 2
        local ChangedSize = Vector3.new(SizeNumber, SizeNumber, SizeNumber)

        for _, target in ipairs(Players:GetPlayers()) do
            -- FILTRO CRÍTICO: Si el jugador NO eres tú, se expande
            if target ~= Player and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local HRP = target.Character.HumanoidRootPart
                HRP.Size = ChangedSize
                HRP.CanCollide = false
                HRP.Transparency = 0.9 
            -- SI ERES TÚ: Te mantiene el tamaño normal (2, 2, 1)
            elseif target == Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                Player.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
            end
        end
    end
end)
