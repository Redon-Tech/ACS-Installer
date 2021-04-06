local ServerConfig = {
----------------------------------------------------------------------------------------------------
-----------------=[ General ]=----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	 TeamKill = true					--- Enable TeamKill?
	,TeamDamageMultiplier = 1			--- Between 0-1 | This will make you cause less damage if you hit your teammate
	
	,ReplicatedBullets = true			--- Keep in mind that some bullets will pass through surfaces...
	
	,AntiBunnyHop = true				--- Enable anti bunny hop system?
	,JumpCoolDown = 3					--- Seconds before you can jump again
	,JumpPower = 50						--- Jump power, default is 50
	
	,RealisticLaser = true				--- True = Laser line is invisible
	,ReplicatedLaser = true				
	,ReplicatedFlashlight = true
	
	,EnableRagdoll = true				--- Enable ragdoll death?
	,TeamTags = true					--- Aaaaaaa
	,HitmarkerSound = false				--- GGWP MLG 360 NO SCOPE xD
----------------------------------------------------------------------------------------------------
------------------=[ Core GUI ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,CoreGuiHealth = false				--- Enable Health Bar?
	,CoreGuiPlayerList = true			--- Enable Player List?
	,TopBarTransparency = 1
----------------------------------------------------------------------------------------------------
------------------=[ Status UI ]=-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,EnableStatusUI = true				--- Don't disabled it...
	,RunWalkSpeed = 22
	,NormalWalkSpeed = 16
	,SlowPaceWalkSpeed = 8	
	,CrouchWalkSpeed = 8
	,ProneWalksSpeed = 4

	,EnableHunger = true				--- Hunger and Thirst system
	,HungerWaitTime = 25

	,CanDrown = true 					--- Welp.. That's it
	
	,EnableStamina = true 				--- Weapon Sway based on stamina	
	,RunValue = 1						--- Stamina consumption
	,StandRecover = .25					--- Stamina recovery while stading
	,CrouchRecover = .5					--- Stamina recovery while crouching
	,ProneRecover = 1					--- Stamina recovery while lying

	,EnableGPS = true					--- GPS shows your allies around you
	,GPSdistance = 150

	,InteractionMenuKey = Enum.KeyCode.LeftControl
----------------------------------------------------------------------------------------------------
----------------=[ Medic System ]=------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,EnableMedSys = true
	,BleedDamage = 30					--- The damage needed to start bleeding
	,InjuredDamage = 40					--- The damage needed to get injured
	,KODamage = 85						--- The damage needed to pass out
	,PainMult = 1.5						--- 
	,BloodMult = 1.75					--- 

	,EnableFallDamage = true			--- Enable Fall Damage?
	,MaxVelocity = 75					--- Velocity that will trigger the damage
	,DamageMult = 1 					--- The min time a player has to fall in order to take fall damage.
----------------------------------------------------------------------------------------------------
--------------------=[ Others ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,VehicleMaxZoom = 150
}

return ServerConfig
