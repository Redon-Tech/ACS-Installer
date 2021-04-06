repeat
	wait()
until game.Players.LocalPlayer.Character
wait(0.5)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Char = player.Character
local Human = Char.Humanoid
local Saude = Char.Saude

local MedicSystem = game.ReplicatedStorage.ACS_Engine
local Functions = MedicSystem.Eventos.MedSys
local FunctionsMulti = Functions.Multi

local Target = Char.Saude.Variaveis.PlayerSelecionado

local Timer = script.Parent.Parent.Timer
local TS = game:GetService("TweenService")

Target.Changed:Connect(function()
	if Target.Value == "N/A" then
		script.Parent.TratarFeridasAberto.PainKiller.Style = Enum.ButtonStyle.RobloxButton
		script.Parent.TratarFeridasAberto.Energy.Style = Enum.ButtonStyle.RobloxButton
	
		script.Parent.TratarFeridasAberto.Epinephrine.Style = Enum.ButtonStyle.RobloxButtonDefault
		script.Parent.TratarFeridasAberto.Morphine.Style = Enum.ButtonStyle.RobloxButtonDefault
	else

		script.Parent.TratarFeridasAberto.PainKiller.Style = Enum.ButtonStyle.RobloxButtonDefault
		script.Parent.TratarFeridasAberto.Energy.Style = Enum.ButtonStyle.RobloxButtonDefault	
		
		script.Parent.TratarFeridasAberto.Epinephrine.Style = Enum.ButtonStyle.RobloxButton
		script.Parent.TratarFeridasAberto.Morphine.Style = Enum.ButtonStyle.RobloxButton
	end
end)



script.Parent.TratarFeridasAberto.PainKiller.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		Functions.PainKiller:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	else
		--FunctionsMulti.Energetic:FireServer()
	end
	end
end)

script.Parent.TratarFeridasAberto.Energy.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		Functions.Energetic:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	else
		--FunctionsMulti.Energetic:FireServer()
	end
end
end)

script.Parent.TratarFeridasAberto.Morphine.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		--Functions.PainKiller:FireServer()
	else
		FunctionsMulti.Morphine:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	end
	end
end)

script.Parent.TratarFeridasAberto.Epinephrine.MouseButton1Down:Connect(function()
	if Saude.Variaveis.Doer.Value == false then
	if Target.Value == "N/A" then
		--Functions.PainKiller:FireServer()
	else
		FunctionsMulti.Epinephrine:FireServer()
		Timer.Barra.Size = UDim2.new(0,0,1,0)
		TS:Create(Timer.Barra, TweenInfo.new(2), {Size =  UDim2.new(1,0,1,0)}):Play()
	end
	end
end)

