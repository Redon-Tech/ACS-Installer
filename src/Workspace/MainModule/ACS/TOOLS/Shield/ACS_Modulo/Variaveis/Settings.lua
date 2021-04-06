local Tool = script.Parent.Parent.Parent
local ACS = Tool:WaitForChild("ACS_Modulo")
local Var = ACS:WaitForChild("Variaveis")

local Config = {

----------------------------------------------------------------------------------------------------
---------------------=[ GERAL ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	 Name = "Shield"
	,BulletType = "Shield"
	,Ammo = Var.Ammo.Value
	,ChangeFOV = {70, 70}
	,ZoomAnim = false
	,FocusOnSight = false
	,FocusOnSight2 = false
	,MagCount = true
	,Bullets = 0
	,FireRate = 0
	,BurstFireRate = 0
	,BurstShot = 0
	,GunType = 0				--- 1 - Rifle, 2 - Shotgun
	,ReloadType = 0				--- 1 - Magazine, 2 - Shell inserting
	,Mode = ""				--- Semi, Burst, Auto, Explosive || Bolt-Action, Pump-Action
	,FireModes = {
		ChangeFiremode = true;		
		Semi = true;
		Burst = false;
		Auto = true;
		Explosive = false;}
----------------------------------------------------------------------------------------------------
-----------------------=[ PUMP-ACTION ]=------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,AutoChamber = false
	,ChamberWhileAim = false
----------------------------------------------------------------------------------------------------
-----------------=[ RECOIL & PRECISAO ]=------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,VRecoil = {0,0}				--- Vertical Recoil
	,HRecoil = {0,0}				--- Horizontal Recoil
	,AimRecover = 0					---- Between 0 & 1
	
	,RecoilPunch = 0
	,VPunchBase = 0					--- Vertical Punch
	,HPunchBase = 0					--- Horizontal Punch
	,DPunchBase = 0 				--- Tilt Punch | useless
	
	,AimRecoilReduction = 0 		--- Recoil Reduction Factor While Aiming (Do not set to 0)
	,PunchRecover = 0
	,MinRecoilPower = 0
	,MaxRecoilPower = 0
	,RecoilPowerStepAmount = 0
	
	,MinSpread = 0					--- Min bullet spread value | Studs
	,MaxSpread = 0					--- Max bullet spread value | Studs
	,AimInaccuracyStepAmount = 0
	,WalkMultiplier = 0				--- Bullet spread based on player speed

	,SwayBase = 0.05				--- Weapon Base Sway | Studs
	,MaxSway =	2					--- Max sway value based on player stamina | Studs
----------------------------------------------------------------------------------------------------
---------------------=[ DANO ]=---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,LimbsDamage = {0,0}
	,TorsoDamage = {0,0}
	,HeadDamage = {0,0}
	,BulletPenetration = 0			 ---- Between 0 & 100%
	,FallOfDamage = 0
----------------------------------------------------------------------------------------------------
-------------------=[ PROJETIL ]=-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,Distance = 0
	,BDrop = 0
	,BSpeed = 0

	,SuppressMaxDistance = 0	--- Studs
	,SuppressTime = 0			--- Seconds

	,BulletWhiz = false
	,BWEmitter = 0
	,BWMaxDistance = 0
	
	,BulletFlare = false
	,BulletFlareColor = Color3.fromRGB(0,0,0)

	,Tracer = false
	,TracerColor = Color3.fromRGB(0,0,0)
	,TracerLightEmission = 0
	,TracerLightInfluence = 0
	,TracerLifeTime = 0
	,TracerWidth = 0
	,RandomTracer = false
	,TracerEveryXShots = 0
	,TracerChance = 0
	
	,BulletLight = false
	,BulletLightBrightness = 0
	,BulletLightColor = Color3.fromRGB(0,0,0)
	,BulletLightRange = 0

	,ExplosiveHit = false
	,ExPressure = 0
	,ExpRadius = 0
	,DestroyJointRadiusPercent = 0	--- Between 0 & 1
	,ExplosionDamage = 0

	,LauncherDamage = 0
	,LauncherRadius = 0
	,LauncherPressure = 0
	,LauncherDestroyJointRadiusPercent = 0
----------------------------------------------------------------------------------------------------
--------------------=[ OUTROS ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,FastReload = false					--- Automatically operates the bolt on reload if needed
	,SlideLock = false
	,MoveBolt = false
	,BoltLock = false
	,CanBreachDoor = false
	,CanBreak = false					--- Weapon can jam?
	,JamChance = 0						--- This old piece of brick doesn't work fine >;c
	,IncludeChamberedBullet = false		--- Include the chambered bullet on next reload
	,Chambered = false					--- Start with the gun chambered?
	,LauncherReady = false				--- Start with the GL ready?
	,CanCheckMag = false				--- You can check the magazine
	,ArcadeMode = false					--- You can see the bullets left in magazine
	,RainbowMode = false				--- Operation: Party Time xD
	,ModoTreino = false					--- Surrender enemies instead of killing them
	,GunSize = 1.25
	,GunFOVReduction = 5

	,BoltExtend = Vector3.new(0, 0, 0)
	,SlideExtend = Vector3.new(0, 0, 0)	
----------------------------------------------------------------------------------------------------
--------------------=[ CFRAME ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,EnableHolster = false
	,HolsterTo = 'Torso'				 -- Put the name of the body part you wanna holster to
	,HolsterPos = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	
	,RightArmPos = CFrame.new(-1, 0.55, -1.1) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Server
	,LeftArmPos = CFrame.new(1,0.55,-1.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))	--server
	
	,ServerGunPos = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))
	,GunPos = CFrame.new(1, -0.15, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))

	,RightPos = CFrame.new(-1, 0.15, -1.15) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Client
	,LeftPos = CFrame.new(1,0.15,-1.15) * CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))	--Client
}

return Config

