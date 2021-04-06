local Tool = script.Parent.Parent.Parent
local ACS = Tool:WaitForChild("ACS_Modulo")
local Var = ACS:WaitForChild("Variaveis")

local Config = {

----------------------------------------------------------------------------------------------------
---------------------=[ GERAL ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	 Name = "AUG A3"
	,BulletType = "5.56x45mm"
	,Ammo = Var.Ammo.Value
	,ChangeFOV = {60, 60}
	,ZoomAnim = false
	,FocusOnSight = false
	,FocusOnSight2 = false
	,MagCount = true
	,Bullets = 1
	,FireRate = 650
	,BurstFireRate = 900
	,BurstShot = 3
	,GunType = 1				--- 1 - Rifle, 2 - Shotgun
	,ReloadType = 1				--- 1 - Magazine, 2 - Shell inserting
	,Mode = "Auto"				--- Semi, Burst, Auto, Explosive || Bolt-Action, Pump-Action
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
	,VRecoil = {13,14}				--- Vertical Recoil
	,HRecoil = {5,6}				--- Horizontal Recoil
	,AimRecover = .75				---- Between 0 & 1
	
	,RecoilPunch = .15
	,VPunchBase = 3.25				--- Vertical Punch
	,HPunchBase = 2					--- Horizontal Punch
	,DPunchBase = 1 				--- Tilt Punch | useless
	
	,AimRecoilReduction = 5 		--- Recoil Reduction Factor While Aiming (Do not set to 0)
	,PunchRecover = 0.2
	,MinRecoilPower = .25
	,MaxRecoilPower = 3
	,RecoilPowerStepAmount = .25
	
	,MinSpread = 0.56				--- Min bullet spread value | Studs
	,MaxSpread = 40					--- Max bullet spread value | Studs
	,AimInaccuracyStepAmount = 0.85
	,WalkMultiplier = 0				--- Bullet spread based on player speed

	,SwayBase = 0.25				--- Weapon Base Sway | Studs
	,MaxSway =	1.5					--- Max sway value based on player stamina | Studs
----------------------------------------------------------------------------------------------------
---------------------=[ DANO ]=---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,LimbsDamage = {42,56}
	,TorsoDamage = {62,70}
	,HeadDamage = {120,140}
	,BulletPenetration = 70			 ---- Between 0 & 100%
	,FallOfDamage = 1.2
----------------------------------------------------------------------------------------------------
-------------------=[ PROJETIL ]=-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,Distance = 10000
	,BDrop = .25
	,BSpeed = 2200

	,SuppressMaxDistance = 25	--- Studs
	,SuppressTime = 10			--- Seconds

	,BulletWhiz = true
	,BWEmitter = 25
	,BWMaxDistance = 200
	
	,BulletFlare = false
	,BulletFlareColor = Color3.fromRGB(255,255,255)

	,Tracer = true
	,TracerColor = Color3.fromRGB(255,255,255)
	,TracerLightEmission = 1
	,TracerLightInfluence = 0
	,TracerLifeTime = .2
	,TracerWidth = .1
	,RandomTracer = false
	,TracerEveryXShots = 5
	,TracerChance = 100
	
	,BulletLight = false
	,BulletLightBrightness = 1
	,BulletLightColor = Color3.fromRGB(255,255,255)
	,BulletLightRange = 10

	,ExplosiveHit = false
	,ExPressure = 500
	,ExpRadius = 25
	,DestroyJointRadiusPercent = 0	--- Between 0 & 1
	,ExplosionDamage = 100

	,LauncherDamage = 100
	,LauncherRadius = 25
	,LauncherPressure = 500
	,LauncherDestroyJointRadiusPercent = 0
----------------------------------------------------------------------------------------------------
--------------------=[ OUTROS ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,FastReload = true					--- Automatically operates the bolt on reload if needed
	,SlideLock = false
	,MoveBolt = false
	,BoltLock = false
	,CanBreachDoor = false
	,CanBreak = true					--- Weapon can jam?
	,JamChance = 1000					--- This old piece of brick doesn't work fine >;c
	,IncludeChamberedBullet = true		--- Include the chambered bullet on next reload
	,Chambered = false					--- Start with the gun chambered?
	,LauncherReady = false				--- Start with the GL ready?
	,CanCheckMag = true					--- You can check the magazine
	,ArcadeMode = false					--- You can see the bullets left in magazine
	,RainbowMode = false				--- Operation: Party Time xD
	,ModoTreino = false					--- Surrender enemies instead of killing them
	,GunSize = 3
	,GunFOVReduction = 5

	,BoltExtend = Vector3.new(0, 0, 0.4)
	,SlideExtend = Vector3.new(0, 0, 0.4)	
----------------------------------------------------------------------------------------------------
--------------------=[ CFRAME ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,EnableHolster = false
	,HolsterTo = 'Torso'				 -- Put the name of the body part you wanna holster to
	,HolsterPos = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	
	,RightArmPos = CFrame.new(-0.85, 0.2, -1.2) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Server
	,LeftArmPos = CFrame.new(1.05,0.9,-1.4) * CFrame.Angles(math.rad(-100),math.rad(25),math.rad(-20))	--server
	
	,ServerGunPos = CFrame.new(-.3, -1, -0.4) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))
	,GunPos = CFrame.new(0.15, -0.15, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))

	,RightPos = CFrame.new(-.65, -0.2, -.85) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Client
	,LeftPos = CFrame.new(1.1, 0.05, -1.5) * CFrame.Angles(math.rad(-120),math.rad(35),math.rad(-20))	--Client
}

return Config

