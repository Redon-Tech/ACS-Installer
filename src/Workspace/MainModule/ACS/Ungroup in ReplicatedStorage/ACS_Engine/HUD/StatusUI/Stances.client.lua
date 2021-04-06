repeat wait() until game.Players.LocalPlayer.Character:IsDescendantOf(game.Workspace)

local Player = game.Players.LocalPlayer
local player = game.Players.LocalPlayer
local Character = Player.Character
local char = Player.Character
local Humanoid = Character:WaitForChild("Humanoid")
local Mouse = Player:GetMouse()
local mouse = Player:GetMouse()

local Engine = game.ReplicatedStorage:WaitForChild("ACS_Engine")
local PastaFX = Engine:WaitForChild("FX")
local Evt = Engine:WaitForChild("Eventos")
local Mod = Engine:WaitForChild("Modulos")
local Ultil = require(Mod:WaitForChild("Utilities"))
local SpringMod = require(Mod:WaitForChild("Spring"))
local ServerConfig = require(Engine.ServerConfigs:WaitForChild("Config"))

local Debris = game:GetService("Debris")

local Camera = game.Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Torso = Character:WaitForChild("Torso")
local Neck = Torso:WaitForChild("Neck")

local Poses = script.Parent.MainFrame.Poses
local Main = script.Parent.MainFrame

local saude = char:WaitForChild("Saude")
local StancesPasta = saude:WaitForChild("Stances")
local Protecao = saude:WaitForChild("Protecao")
local Sangrando = StancesPasta.Sangrando
local Ferido = StancesPasta.Ferido
local Caido = StancesPasta.Caido
local Correndo = StancesPasta.Correndo
local Rendido = StancesPasta.Rendido
local Algemado = StancesPasta.Algemado
local Rappeling = StancesPasta.Rappeling

local Stance = Evt.MedSys.Stance
local Stances = 0
local Virar = 0
local CameraX = 0
local CameraY = 0
local Velocidade = 0
maxAir = 100
air = maxAir
lastHealth = 100
lastHealth2 = 100
local Sentado = false
local CanLean = true
local ChangeStance = true
local cansado = false
local Steady = false

_G.SteadyStance = false
_G.LeanR = 0
_G.LeanL = 0

local RAW
local LAW
----------------
local RootPart = char:WaitForChild("HumanoidRootPart")
local RootJoint = RootPart.RootJoint
RootJoint.C0 = CFrame.new()
RootJoint.C1 = CFrame.new()

local Aiming = false

local ZoomDistance = 40

local NV

local L_150_ = {}

local L_153_ = {}
L_153_.cornerPeek = SpringMod.new(0)
L_153_.cornerPeek.d = 0.8
L_153_.cornerPeek.s = 16
L_153_.peekFactor = math.rad(-15)
L_153_.dirPeek = 0


----------------

---------------------------------------------------------------------------------------
---------------- [ Tween Module ] --------------------------------------------------------
---------------------------------------------------------------------------------------


--[[
	
	tweenJoint Function Parameters:
	
	Object Joint - This has to be a weld with a C0 and C1 property
	
	CFrame newC0 - This is what the new C0 of the weld will be. You can put nil if you don't want to effect the C0
	
	CFrame newC1 - This is what the new C1 of the weld will be. You can put nil if you don't want to effect the C1
	
	function Alpha - This is an alpha function that takes an input parameter of a number between 0 and 90 and returns a number between 0 and 1.
		For example, function(X) return math.sin(math.rad(X)) end
		
	float Duration - This is how long the tweening takes to complete
	
--]]
local RS = game:GetService("RunService")

local Proned2

Rendido.Changed:Connect(function()
	Stance:FireServer(Stances,Virar,Rendido.Value)
end)

Algemado.Changed:Connect(function()
	Stance:FireServer(Stances,Virar,Rendido.Value)
end)

function Stand()
	
	Stance:FireServer(Stances,Virar,Rendido.Value)
	TS:Create(char.Humanoid, TweenInfo.new(.3), {CameraOffset = Vector3.new(CameraX,CameraY,0)} ):Play()
	
	if Steady then
		Humanoid.WalkSpeed = ServerConfig.SlowPaceWalkSpeed * StancesPasta.Mobility.Value
		Humanoid.JumpPower = ServerConfig.JumpPower
		else
		if  Ferido.Value == false then
			Humanoid.WalkSpeed = ServerConfig.NormalWalkSpeed * StancesPasta.Mobility.Value
			Humanoid.JumpPower = ServerConfig.JumpPower
		else
			Humanoid.WalkSpeed = ServerConfig.SlowPaceWalkSpeed * StancesPasta.Mobility.Value
			Humanoid.JumpPower = ServerConfig.JumpPower
		end
	end


	IsStanced = false	
	Proned2 = Vector3.new(0,0,0)

end





function Crouch()
	
	Stance:FireServer(Stances,Virar,Rendido.Value)
	TS:Create(char.Humanoid, TweenInfo.new(.3), {CameraOffset = Vector3.new(CameraX,CameraY,0)} ):Play()
	Humanoid.WalkSpeed = ServerConfig.CrouchWalkSpeed * StancesPasta.Mobility.Value
	Humanoid.JumpPower = 0
	IsStanced = true	
	Proned2 = Vector3.new(0,0,0)
end

function Prone()
	
	Stance:FireServer(Stances,Virar,Rendido.Value)
	TS:Create(char.Humanoid, TweenInfo.new(.3), {CameraOffset = Vector3.new(CameraX,CameraY,0)} ):Play()
	if Rendido.Value == true then
	Humanoid.WalkSpeed = 0
	else
	Humanoid.WalkSpeed = ServerConfig.ProneWalksSpeed * StancesPasta.Mobility.Value
	end
	Humanoid.JumpPower = 0 
	IsStanced = true
	Proned2 = Vector3.new(0,0.5,0.5)
end

function Lean()

TS:Create(char.Humanoid, TweenInfo.new(.3), {CameraOffset = Vector3.new(CameraX,CameraY,0)} ):Play()
Stance:FireServer(Stances,Virar,Rendido.Value)
end
	
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed then
		if input.KeyCode == Enum.KeyCode.C and Stances == 0 and ChangeStance and Caido.Value == false and Correndo.Value == false and Rappeling.Value == false and not _G.Lean and not Sentado then
			Stances = 1
			--CameraX = 0
			CameraY = -1
			Poses.Levantado.Visible = false
			Poses.Agaixado.Visible = true
			Poses.Deitado.Visible = false
			Crouch()
			
				
			_G.Crouched = true
		elseif input.KeyCode == Enum.KeyCode.C and Stances == 1 and ChangeStance and Caido.Value == false and Correndo.Value == false and Rappeling.Value == false and not _G.Lean and not Sentado then	
			Stances = 2
			CameraX = 0
			CameraY = -3.25
			Virar = 0
			Poses.Levantado.Visible = false
			Poses.Agaixado.Visible = false
			Poses.Deitado.Visible = true
			Poses.Esg_Right.Visible = false
			Poses.Esg_Left.Visible = false
			Lean()
			Prone()
			
			_G.Crouched = false
			_G.Proned = true
			
		elseif input.KeyCode == Enum.KeyCode.X and Stances == 2 and ChangeStance and Caido.Value == false and Correndo.Value == false and Rappeling.Value == false and not _G.Lean and not Sentado  then
			_G.Crouched = true
			_G.Proned = false
			Stances = 1
			--CameraX = 0
			CameraY = -1
			Poses.Levantado.Visible = false
			Poses.Agaixado.Visible = true
			Poses.Deitado.Visible = false
			Crouch()
			
				
		elseif input.KeyCode == Enum.KeyCode.X and Stances == 1 and ChangeStance and Caido.Value == false and Correndo.Value == false and Rappeling.Value == false and not _G.Lean and not Sentado  then		
			_G.Crouched = false
			Stances = 0
			--CameraX = 0
			CameraY = 0
			Poses.Levantado.Visible = true
			Poses.Agaixado.Visible = false
			Poses.Deitado.Visible = false
			Stand()
		elseif input.KeyCode == Enum.KeyCode.Z and ChangeStance and Caido.Value == false and Correndo.Value == false then
				if not Steady then
				Steady = true
				Poses.Steady.Visible = true							
					if Stances == 0 then
						Stand()
						Humanoid.WalkSpeed = ServerConfig.SlowPaceWalkSpeed * StancesPasta.Mobility.Value
					end
				else
				Steady = false
				Poses.Steady.Visible = false
					if Stances == 0 then
						Stand()
						Humanoid.WalkSpeed = ServerConfig.NormalWalkSpeed * StancesPasta.Mobility.Value
					end
				end
		elseif input.KeyCode == Enum.KeyCode.E and Stances ~= 2 and ChangeStance and Caido.Value == false and Correndo.Value == false and not _G.Lean and CanLean then		
			if Virar == 0 or Virar == -1 then
				Virar = 1
				CameraX = 1.75
				Poses.Esg_Right.Visible = true
				Poses.Esg_Left.Visible = false
			else
				Virar = 0
				CameraX = 0
				Poses.Esg_Right.Visible = false
				Poses.Esg_Left.Visible = false
			end
			Lean()
		elseif input.KeyCode == Enum.KeyCode.Q and Stances ~= 2 and ChangeStance and Caido.Value == false and Correndo.Value == false and not _G.Lean and CanLean  then
			if Virar == 0 or Virar == 1 then
				Virar = -1
				CameraX = -1.75
				Poses.Esg_Right.Visible = false
				Poses.Esg_Left.Visible = true
			else
				Virar = 0
				CameraX = 0
				Poses.Esg_Right.Visible = false
				Poses.Esg_Left.Visible = false
			end
			Lean()
		elseif input.KeyCode == Enum.KeyCode.LeftShift and Correndo.Value == false and Ferido.Value == false and Caido.Value == false and Rappeling.Value == false and not _G.Lean and not Sentado and not cansado then	
			if Velocidade > 0 then
			ChangeStance = false
			Correndo.Value = true
			--Steady = false
			Stand()
			Stances = 0
			Virar = 0
			CameraX = 0
			CameraY = 0
			Lean()
			Poses.Levantado.Visible = true
			Poses.Agaixado.Visible = false
			Poses.Deitado.Visible = false
			Poses.Esg_Right.Visible = false
			Poses.Esg_Left.Visible = false
			Humanoid.WalkSpeed = ServerConfig.RunWalkSpeed * StancesPasta.Mobility.Value
			end
			end
		end
	end)
	
UserInputService.InputEnded:Connect(function(input, gameProcessed)
if not gameProcessed then
	if input.KeyCode == Enum.KeyCode.LeftShift and Correndo.Value == true and not _G.Lean then	
		ChangeStance = true
		Correndo.Value = false
		if Steady then
		Humanoid.WalkSpeed = ServerConfig.SlowPaceWalkSpeed * StancesPasta.Mobility.Value
		Poses.Steady.Visible = true	
		else
		Humanoid.WalkSpeed = ServerConfig.NormalWalkSpeed * StancesPasta.Mobility.Value
		Poses.Steady.Visible = false
		end
		end
	end
end)


	
Stand()

Humanoid.Died:Connect(function()
	TS:Create(char.Humanoid, TweenInfo.new(1), {CameraOffset = Vector3.new(0,0,0)} ):Play()
	ChangeStance = false
	Main.Visible = false
end)

Humanoid.Seated:Connect(function(IsSeated, Seat)

	if IsSeated  then
		Sentado = true
		Stand()
		Stances = 0
		Virar = 0
		CameraX = 0
		CameraY = 0
		Lean()
		Poses.Levantado.Visible = true
		Poses.Agaixado.Visible = false
		Poses.Deitado.Visible = false
		Poses.Esg_Right.Visible = false
		Poses.Esg_Left.Visible = false
			
		if Seat:IsA("VehicleSeat") then
			CanLean = false
		end
			
	else
		Sentado = false
		CanLean = true
	end
end)

Humanoid.Running:Connect(function(Speed)
--print(Speed)
Velocidade = Speed
TS:Create(Main.Status.Barra.Stamina, TweenInfo.new(.25), {Size =  UDim2.new(Speed/(ServerConfig.RunWalkSpeed * StancesPasta.Mobility.Value),0,0.75,0)} ):Play()
end)

TS:Create(script.Parent.Efeitos.Health, TweenInfo.new(1,Enum.EasingStyle.Circular,Enum.EasingDirection.InOut,-1,true), {Size =  UDim2.new(1.2,0,1.4,0)} ):Play()
Humanoid.Changed:Connect(function(Health)
	script.Parent.Efeitos.Health.ImageTransparency = ((Humanoid.Health - (Humanoid.MaxHealth/2))/(Humanoid.MaxHealth/2))
	--[[if Humanoid.Health <= (Humanoid.MaxHealth/2) then
		script.Parent.Efeitos.Health.BackgroundTransparency = ((Humanoid.Health)/(Humanoid.MaxHealth/2))
		script.Parent.Efeitos.Health.BackgroundColor3 = Color3.fromRGB((170 * (Humanoid.Health)/(Humanoid.MaxHealth/2)) , 0, 0)
		--script.Parent.Efeitos.Health.ImageColor3 = Color3.fromRGB((170 * (Humanoid.Health)/(Humanoid.MaxHealth/2)) , 0, 0)
	else
		--script.Parent.Efeitos.Health.ImageColor3 = Color3.fromRGB(170, 0, 0)
		script.Parent.Efeitos.Health.BackgroundTransparency = 1
		script.Parent.Efeitos.Health.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
	end]]
end)


Ferido.Changed:Connect(function(Valor)
--print(Valor)
if Valor == true then
	if Correndo.Value == true then
		ChangeStance = true
		Correndo.Value = false
		Stand()
		Stances = 0
	end
	if Stances == 0 then
		Stand()
	end

	TS:Create(Poses.Levantado, TweenInfo.new(.25), {ImageColor3 =  Color3.fromRGB(150,0,0)} ):Play()
	TS:Create(Poses.Agaixado, TweenInfo.new(.25), {ImageColor3 =  Color3.fromRGB(150,0,0)} ):Play()
	TS:Create(Poses.Deitado, TweenInfo.new(.25), {ImageColor3 =  Color3.fromRGB(150,0,0)} ):Play()

	--Poses.Levantado.ImageColor3 = Color3.fromRGB(100,0,0)
	--Poses.Agaixado.ImageColor3 = Color3.fromRGB(100,0,0)
	--Poses.Deitado.ImageColor3 = Color3.fromRGB(100,0,0)
	--Main.Status.Barra.Stamina.BackgroundColor3 = Color3.fromRGB(170,0,0)
else
	if Stances == 0 then
		Stand()
	end
	
	TS:Create(Poses.Levantado, TweenInfo.new(.25), {ImageColor3 =  Color3.fromRGB(255,255,255)} ):Play()
	TS:Create(Poses.Agaixado, TweenInfo.new(.25), {ImageColor3 =  Color3.fromRGB(255,255,255)} ):Play()
	TS:Create(Poses.Deitado, TweenInfo.new(.25), {ImageColor3 =  Color3.fromRGB(255,255,255)} ):Play()

	--Poses.Levantado.ImageColor3 = Color3.fromRGB(0,0,0)
	--Poses.Agaixado.ImageColor3 = Color3.fromRGB(0,0,0)
	--Poses.Deitado.ImageColor3 = Color3.fromRGB(0,0,0)
	--Main.Status.Barra.Stamina.BackgroundColor3 = Color3.fromRGB(125,125,125)
end
end)

local BleedTween = TS:Create(Main.Poses.Bleeding, TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,-1,true), {ImageColor3 =  Color3.fromRGB(150, 0, 0)} )

Sangrando.Changed:Connect(function(Valor)
if Valor == true then
	Main.Poses.Bleeding.ImageColor3 = Color3.fromRGB(255,255,255)
	Main.Poses.Bleeding.Visible = true
	BleedTween:Play()
else
	Main.Poses.Bleeding.Visible = false
	BleedTween:Cancel()
end
end)

Caido.Changed:Connect(function(Valor)
if Valor == true then
		if Stances ~= 0 then

			Poses.Levantado.Visible = true
			Poses.Agaixado.Visible = false
			Poses.Deitado.Visible = false
			Poses.Esg_Right.Visible = false
			Poses.Esg_Left.Visible = false
			CameraX = 0
			CameraY = 0
			Stances = 0
			Correndo.Value = false
			Steady = false
			Stand()
		end
	
end
end)


local a = Main.Vest.TextBox
local b = Main.Helm.TextBox
local Ener = Main.Poses.Energy

function Vest()
	a.Text = math.ceil(Protecao.VestVida.Value)
	a.Parent.ImageColor3 = Color3.fromRGB(255,0,0)
	TS:Create(a.Parent, TweenInfo.new(2), {ImageColor3 =  Color3.fromRGB(255, 255, 255)} ):Play()
	if Protecao.VestVida.Value <= 0 then
		a.Parent.Visible = false
	else
		a.Parent.Visible = true
	end
end

function Helmet()
	b.Text = math.ceil(Protecao.HelmetVida.Value)
	b.Parent.ImageColor3 = Color3.fromRGB(255,0,0)
	TS:Create(b.Parent, TweenInfo.new(2), {ImageColor3 =  Color3.fromRGB(255, 255, 255)} ):Play()

	if Protecao.HelmetVida.Value <= 0 then
		b.Parent.Visible = false
	else
		b.Parent.Visible = true
	end
end

function Stamina()
if ServerConfig.EnableStamina then
	if saude.Variaveis.Stamina.Value <= (saude.Variaveis.Stamina.MaxValue/2) then
		Ener.ImageColor3 = Color3.new(1,saude.Variaveis.Stamina.Value/(saude.Variaveis.Stamina.MaxValue/2),saude.Variaveis.Stamina.Value/saude.Variaveis.Stamina.MaxValue)
		Ener.Visible = true
	elseif saude.Variaveis.Stamina.Value < saude.Variaveis.Stamina.MaxValue then
		Ener.ImageColor3 = Color3.new(1,1,saude.Variaveis.Stamina.Value/saude.Variaveis.Stamina.MaxValue)
		Ener.Visible = true
	elseif saude.Variaveis.Stamina.Value >= saude.Variaveis.Stamina.MaxValue then
		Ener.Visible = false
	end
else
	saude.Variaveis.Stamina.Value = saude.Variaveis.Stamina.MaxValue
	Ener.Visible = false
end
end

Vest()
Helmet()
Stamina()

Protecao.VestVida.Changed:Connect(Vest)
Protecao.HelmetVida.Changed:Connect(Helmet)
saude.Variaveis.Stamina.Changed:Connect(Stamina)

Character.Humanoid.Changed:connect(function(Property)
	if ServerConfig.AntiBunnyHop then
		if Property == "Jump" and Character.Humanoid.Sit == true and Character.Humanoid.SeatPart ~= nil then
		Character.Humanoid.Sit = false
		elseif Property == "Jump" and Character.Humanoid.Sit == false then
			if JumpDelay then
				Character.Humanoid.Jump = false
				return false
			end
			JumpDelay = true
			delay(0, function()
				wait(ServerConfig.JumpCoolDown)
				JumpDelay = false
			end)
		end
	end
end)



local uis = game:GetService('UserInputService')
local Evt = Engine:WaitForChild("Eventos")
local placeEvent = Evt.Rappel:WaitForChild('PlaceEvent')
local ropeEvent = Evt.Rappel:WaitForChild('RopeEvent')
local cutEvent = Evt.Rappel:WaitForChild('CutEvent')

uis.InputBegan:connect(function(input,chat)
	if not chat and Rappeling.Value == true then
		if input.KeyCode == Enum.KeyCode.C then
			ropeEvent:FireServer('Up',true)
		end;
		
		if input.KeyCode == Enum.KeyCode.X then
			ropeEvent:FireServer('Down',true)
		end;
	end
end)

uis.InputEnded:connect(function(input,chat)
	if not chat and Rappeling.Value == true then		
		if input.KeyCode == Enum.KeyCode.C then
			ropeEvent:FireServer('Up',false)
		end;
		
		if input.KeyCode == Enum.KeyCode.X then
			ropeEvent:FireServer('Down',false)
		end;
	end
end)




function L_150_.Update()

local L_174_ = CFrame.new()
L_153_.cornerPeek.t = L_153_.peekFactor * Virar
local L_326_ = CFrame.fromAxisAngle(Vector3.new(0, 0, 1), L_153_.cornerPeek.p) -- SOLUTION TO 3RD PERSON --> CFrame.new(10,0,0) * CFrame.fromAxisAngle(Vector3.new(0,0,1), this.cornerPeek.p)
Camera.CFrame = Camera.CFrame * L_326_ * L_174_
if saude.Variaveis.Stamina.Value <= (saude.Variaveis.Stamina.MaxValue/2) then
local StaminaX = (1 - (saude.Variaveis.Stamina.Value)/(saude.Variaveis.Stamina.MaxValue/2))/20
Camera.CoordinateFrame = Camera.CoordinateFrame * CFrame.Angles( math.rad( StaminaX * math.sin( tick() * 3.5 )) , math.rad( StaminaX * math.sin( tick() * 1 )), 0)
end
end


local Nadando = false

function onStateChanged(_,state)
	--print(state)
	if state == Enum.HumanoidStateType.Swimming then
		Nadando = true
	else
		Nadando = false
	end
end

maxAir = 100
air = maxAir

lastHealth = 100
lastHealth2 = 100
maxWidth = 0.96

Humanoid.StateChanged:connect(onStateChanged)
game:GetService("RunService"):BindToRenderStep("Camera Update", 200, L_150_.Update)

while wait() do
	if ServerConfig.CanDrown then
		local headLoc = game.Workspace.Terrain:WorldToCell(player.Character.Head.Position)
		local hasAnyWater = game.Workspace.Terrain:GetWaterCell(headLoc.x, headLoc.y, headLoc.z)
		if player.Character.Humanoid.Health ~= 0 then
			if hasAnyWater then
				if air > 0 then
					air = air-0.15
				elseif air <= 0 then
					air = 0
					Evt.Afogar:FireServer()
				end
			else
				if air < maxAir then
					air = air + .5
				end
			end
		end
	
		if air <= 50 then
			script.Parent.Frame.Oxygen.ImageColor3 = Color3.new(1,air/50,air/100)
			script.Parent.Frame.Oxygen.Visible = true
		elseif air < maxAir then
			script.Parent.Frame.Oxygen.ImageColor3 = Color3.new(1,1,air/100)
			script.Parent.Frame.Oxygen.Visible = true
		elseif air >= maxAir then
			script.Parent.Frame.Oxygen.Visible = false
		end
		script.Parent.Efeitos.Oxigen.ImageTransparency = air/100
		if air <= 25 then
			script.Parent.Efeitos.Oxigen.BackgroundTransparency = air/25
		end
	end
	if ServerConfig.EnableStamina then
		if Correndo.Value == true and Velocidade > 0 then
			saude.Variaveis.Stamina.Value = saude.Variaveis.Stamina.Value - ServerConfig.RunValue
		elseif Stances == 0 and (Correndo.Value == false or Velocidade <= 0) then
			saude.Variaveis.Stamina.Value = saude.Variaveis.Stamina.Value + ServerConfig.StandRecover
		elseif Stances == 1 and (Correndo.Value == false or Velocidade <= 0) then
			saude.Variaveis.Stamina.Value = saude.Variaveis.Stamina.Value + ServerConfig.CrouchRecover
		elseif Stances == 2 and (Correndo.Value == false or Velocidade <= 0) then
			saude.Variaveis.Stamina.Value = saude.Variaveis.Stamina.Value + ServerConfig.ProneRecover
		end
	end
end
