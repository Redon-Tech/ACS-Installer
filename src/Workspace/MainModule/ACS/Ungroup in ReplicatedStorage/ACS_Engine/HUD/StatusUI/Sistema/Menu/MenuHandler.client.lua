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

local Reset = Functions.Reset
local Render = Functions.Render

local Target = Char.Saude.Variaveis.PlayerSelecionado
local Texto = script.Parent.Parent.Texto

local Timer = script.Parent.Parent.Timer
local TS = game:GetService("TweenService")

Texto.Text =  player.Name
Target.Changed:Connect(function(Valor)
	if Valor == "N/A" then
		Texto.Text =  player.Name
		script.Parent.Parent.Reset.Visible = false
	else
		Texto.Text =  Valor
		script.Parent.Parent.Reset.Visible = true
	end
end)

script.Parent.Parent.Reset.MouseButton1Down:connect(function()
	Reset:FireServer()
end)


--[[script.Parent.Examinar.MouseButton1Down:connect(function()
	if Saude.Variaveis.Doer.Value == false and script.Parent.Parent.ExaminarAberto.Visible == false then
	Saude.Variaveis.Doer.Value = true
	Timer.Barra.Size = UDim2.new(0,0,1,0)
	TS:Create(Timer.Barra, TweenInfo.new(5), {Size =  UDim2.new(1,0,1,0)}):Play()
	wait(5)
	script.Parent.Parent.ExaminarAberto.Visible = true
	script.Parent.Parent.ExaminarAberto.Base.DiagnoseHandler.Disabled = false
	Saude.Variaveis.Doer.Value = false
	end
end)]]


script.Parent.Bandages.MouseButton1Down:connect(function()
	if Saude.Variaveis.Doer.Value == false and script.Parent.Parent.BandagesAberto.Visible == false then
	--Saude.Variaveis.Doer.Value = true
	--Timer.Barra.Size = UDim2.new(0,0,1,0)
	--TS:Create(Timer.Barra, TweenInfo.new(.25), {Size =  UDim2.new(1,0,1,0)}):Play()
	--wait(.25)
	script.Parent.Parent.OtherAberto.Visible = false
	script.Parent.Parent.MedicineAberto.Visible = false
	script.Parent.Parent.BandagesAberto.Visible = true
	--Saude.Variaveis.Doer.Value = false
	end
end)

script.Parent.Medicines.MouseButton1Down:connect(function()
	if Saude.Variaveis.Doer.Value == false and script.Parent.Parent.MedicineAberto.Visible == false then
	--Saude.Variaveis.Doer.Value = true
	--Timer.Barra.Size = UDim2.new(0,0,1,0)
	--TS:Create(Timer.Barra, TweenInfo.new(.25), {Size =  UDim2.new(1,0,1,0)}):Play()
	--wait(.25)
	script.Parent.Parent.OtherAberto.Visible = false
	script.Parent.Parent.MedicineAberto.Visible = true
	script.Parent.Parent.BandagesAberto.Visible = false
	--Saude.Variaveis.Doer.Value = false
	end
end)

script.Parent.Others.MouseButton1Down:connect(function()
	if Saude.Variaveis.Doer.Value == false and script.Parent.Parent.OtherAberto.Visible == false then
	--Saude.Variaveis.Doer.Value = true
	--Timer.Barra.Size = UDim2.new(0,0,1,0)
	--TS:Create(Timer.Barra, TweenInfo.new(.25), {Size =  UDim2.new(1,0,1,0)}):Play()
	--wait(.25)
	script.Parent.Parent.OtherAberto.Visible = true
	script.Parent.Parent.MedicineAberto.Visible = false
	script.Parent.Parent.BandagesAberto.Visible = false
	--Saude.Variaveis.Doer.Value = false
	end
end)