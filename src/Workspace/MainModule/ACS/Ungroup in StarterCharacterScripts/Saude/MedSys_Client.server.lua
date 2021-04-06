local Char = script.Parent.Parent
local human = Char.Humanoid
local PastaVar = script.Parent.Variaveis
local PastasStan = script.Parent.Stances
local ultimavida = human.MaxHealth
local Sangrando = PastasStan.Sangrando
local Sang = PastaVar.Sangue
local UltimoSang = Sang.MaxValue
local Dor = PastaVar.Dor
local Doer = PastaVar.Doer
local MLs = PastaVar.MLs
--local Energia = PastaVar.Energia
local Ferido = PastasStan.Ferido
local Caido = PastasStan.Caido

local Ragdoll = require(game.ReplicatedStorage.ACS_Engine.Modulos.Ragdoll)
local configuracao = require(game.ReplicatedStorage.ACS_Engine.ServerConfigs.Config)

local debounce = false

--Char.Humanoid.BreakJointsOnDeath = false

if configuracao.EnableRagdoll == true then
	Char.Humanoid.Died:Connect(function()
		Ragdoll(Char)
	end)
end


while configuracao.EnableMedSys do
wait()
	if Sangrando.Value == true then
		if PastasStan.Tourniquet.Value == false then
			Sang.Value = (Sang.Value - (MLs.Value/60))
			UltimoSang = Sang.Value
			MLs.Value = MLs.Value + 0.025
		end
	end

	if PastasStan.Tourniquet.Value == true then
		Dor.Value = Dor.Value + 0.1
	end

	if (human.Health - ultimavida < 0) then
		Sang.Value = Sang.Value + (human.Health - ultimavida)*((configuracao.BloodMult)*(configuracao.BloodMult)*(configuracao.BloodMult))
		UltimoSang = Sang.Value
	end

	if (human.Health - ultimavida < 0) then
		Dor.Value = math.ceil(Dor.Value + (human.Health - ultimavida)*(-configuracao.PainMult))
		--Energia.Value = math.ceil(Energia.Value + (human.Health - ultimavida)*(5))
	end	

	if (human.Health - ultimavida < 0) --[[and (Sangrando.Value == true)]] then
		MLs.Value = MLs.Value + ((ultimavida - human.Health)* (configuracao.BloodMult))
	end

	if script.Parent.Parent.Humanoid.Health < ultimavida -(configuracao.BleedDamage) then
			Sangrando.Value = true
		if script.Parent.Parent.Humanoid.Health < ultimavida -(configuracao.InjuredDamage) then
			Ferido.Value = true
			if script.Parent.Parent.Humanoid.Health < ultimavida -(configuracao.KODamage) then
				Caido.Value = true
			end
		end	
	end	
	
	if human.Health >= human.MaxHealth and Sangrando.Value == false then
		Sang.Value = Sang.Value + 0.5	
		Dor.Value = Dor.Value - 0.025
		MLs.Value = MLs.Value - 0.025		
			
	end
		
	if Sang.Value <= 0 then
		human.Health = 0
	end

	ultimavida = script.Parent.Parent.Humanoid.Health


	spawn(function(timer)
			if Sang.Value >= 3500 and Dor.Value < 200 and Caido.Value == true and debounce == false then
				debounce = true
				wait(60)
				Caido.Value = false
				debounce = false
			end	
		end)

end




 -- Quero um pouco de credito,plox :P --
     --  FEITO 100% POR SCORPION --
		-- Oficial Release 1.5 --
