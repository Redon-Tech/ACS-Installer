repeat
	wait()
until game.Players.LocalPlayer.Character
wait(0.5)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Char = player.Character
local Human = Char.Humanoid
local Saude = Char.Saude

local Target = Char.Saude.Variaveis.PlayerSelecionado
local Reset = game.ReplicatedStorage.ACS_Engine.Eventos.MedSys.Reset
local Vida = script.Parent.Vida
local Consciente = script.Parent.Consciente
local Dor = script.Parent.Dor
local Ferido = script.Parent.Ferido
local Sangrando = script.Parent.Sangrando

local TS = game:GetService("TweenService")


local BleedTween = TS:Create(Sangrando, TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,-1,true), {TextColor3 =  Color3.fromRGB(255, 0, 0)} )

while true do
	if Target.Value == "N/A" then
		if Human.Health <= 0 then
			Vida.Text = "Dead"
			Vida.TextColor3 = Color3.fromRGB(255,0,0)
		elseif Human.Health <= (Human.MaxHealth * .5) then
			Vida.Text = "High Risk"
			Vida.TextColor3 = Color3.fromRGB(255,0,0)
		elseif Human.Health <= (Human.MaxHealth * .75) then
			Vida.Text = "Low Risk"
			Vida.TextColor3 = Color3.fromRGB(255,255,0)
		elseif Human.Health <= (Human.MaxHealth) then
			Vida.Text = "Healthy"
			Vida.TextColor3 = Color3.fromRGB(255,255,255)
		end
		
		if Saude.Stances.Caido.Value == true then
			Consciente.Text = "Unconscious"
		else
			Consciente.Text = "Conscious"
		end

		if Saude.Variaveis.Dor.Value <= 0 then
			Dor.Text = "No pain"
			Dor.TextColor3 = Color3.fromRGB(255,255,255)
		elseif Saude.Variaveis.Dor.Value <= 25 then
			Dor.Text = "Minor pain"
			Dor.TextColor3 = Color3.fromRGB(255,255,255)
		elseif Saude.Variaveis.Dor.Value < 100 then
			Dor.Text = "Major pain"
			Dor.TextColor3 = Color3.fromRGB(255,255,0)
		elseif Saude.Variaveis.Dor.Value >= 100 then
			Dor.Text = "Extreme pain"
			Dor.TextColor3 = Color3.fromRGB(255,0,0)
		end


		if Saude.Stances.Ferido.Value == true then
			Ferido.Visible = true
		else
			Ferido.Visible = false
		end

		if Saude.Stances.Sangrando.Value == true or Saude.Stances.Tourniquet.Value == true then
			if Saude.Stances.Tourniquet.Value == true then
				Sangrando.Text = 'Tourniquet'
			else
				Sangrando.Text = 'Bleeding'
			end
			Sangrando.Visible = true
			Sangrando.TextColor3 = Color3.fromRGB(255,255,255)
			BleedTween:Play()
		else
			Sangrando.Visible = false
			BleedTween:Cancel()
		end
		
	else
		local player2 = game.Players:FindFirstChild(Target.Value)
		local PlHuman = player2.Character.Humanoid
		local PlSaude = player2.Character.Saude
		if PlHuman.Health > 0 then
		if PlHuman.Health <= 0 then
			Vida.Text = "Dead"
			Vida.TextColor3 = Color3.fromRGB(255,0,0)
		elseif PlHuman.Health <= (PlHuman.MaxHealth * .5) then
			Vida.Text = "High Risk"
			Vida.TextColor3 = Color3.fromRGB(255,0,0)
		elseif PlHuman.Health <= (PlHuman.MaxHealth * .75) then
			Vida.Text = "Low Risk"
			Vida.TextColor3 = Color3.fromRGB(255,255,0)
		elseif PlHuman.Health <= (PlHuman.MaxHealth) then
			Vida.Text = "Healthy"
			Vida.TextColor3 = Color3.fromRGB(255,255,255)
		end

		if PlSaude.Stances.Caido.Value == true then
			Consciente.Text = "Unconscious"
		else
			Consciente.Text = "Conscious"
		end

		if PlSaude.Variaveis.Dor.Value <= 0 then
			Dor.Text = "No pain"
			Dor.TextColor3 = Color3.fromRGB(255,255,255)
		elseif PlSaude.Variaveis.Dor.Value <= 25 then
			Dor.Text = "Minor pain"
			Dor.TextColor3 = Color3.fromRGB(255,255,255)
		elseif PlSaude.Variaveis.Dor.Value < 100 then
			Dor.Text = "Major pain"
			Dor.TextColor3 = Color3.fromRGB(255,255,0)
		elseif PlSaude.Variaveis.Dor.Value >= 100 then
			Dor.Text = "Extreme pain"
			Dor.TextColor3 = Color3.fromRGB(255,0,0)
		end

		if PlSaude.Stances.Ferido.Value == true then
			Ferido.Visible = true
		else
			Ferido.Visible = false
		end

		if PlSaude.Stances.Sangrando.Value == true or PlSaude.Stances.Tourniquet.Value == true then
			if PlSaude.Stances.Tourniquet.Value == true then
				Sangrando.Text = 'Tourniquet'
			else
				Sangrando.Text = 'Bleeding'
			end
			Sangrando.Visible = true
			Sangrando.TextColor3 = Color3.fromRGB(255,255,255)
			BleedTween:Play()
		else
			Sangrando.Visible = false
			BleedTween:Cancel()
		end
		else
			Reset:FireServer()
		end
	end
wait()
end

--Target.Changed:Connect(update)