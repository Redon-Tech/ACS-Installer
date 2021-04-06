local Tool = script.Parent.Parent.Parent
local ACS = Tool:WaitForChild("ACS_Modulo")
local Var = ACS:WaitForChild("Variaveis")

local Config = {

----------------------------------------------------------------------------------------------------
---------------------=[ GERAL ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	 Name = "M870"
	,BulletType = "12 Gauge"
	,Ammo = Var.Ammo.Value
	,ChangeFOV = {60, 60}
	,ZoomAnim = false
	,FocusOnSight = false
	,FocusOnSight2 = false
	,MagCount = false
	,Bullets = 8
	,FireRate = 500
	,BurstFireRate = 900
	,BurstShot = 3
	,GunType = 0				--- 1 - Rifle, 2 - Shotgun
	,ReloadType = 2				--- 1 - Magazine, 2 - Shell inserting
	,Mode = "Pump-Action"				--- Semi, Burst, Auto, Explosive || Bolt-Action, Pump-Action
	,FireModes = {
		ChangeFiremode = false;		
		Semi = true;
		Burst = false;
		Auto = false;
		Explosive = false;}
----------------------------------------------------------------------------------------------------
-----------------------=[ PUMP-ACTION ]=------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,AutoChamber = true
	,ChamberWhileAim = true
----------------------------------------------------------------------------------------------------
-----------------=[ RECOIL & PRECISAO ]=------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,VRecoil = {35,45}				--- Vertical Recoil
	,HRecoil = {32,35}				--- Horizontal Recoil
	,AimRecover = .35				---- Between 0 & 1
	
	,RecoilPunch = .2
	,VPunchBase = 30.75				--- Vertical Punch
	,HPunchBase = 22.25				--- Horizontal Punch
	,DPunchBase = 1 				--- Tilt Punch | useless
	
	,AimRecoilReduction = 1 		--- Recoil Reduction Factor While Aiming (Do not set to 0)
	,PunchRecover = 0.1
	,MinRecoilPower = 1
	,MaxRecoilPower = 1
	,RecoilPowerStepAmount = 1
	
	,MinSpread = 35					--- Min bullet spread value | Studs
	,MaxSpread = 65					--- Max bullet spread value | Studs
	,AimInaccuracyStepAmount = 15
	,WalkMultiplier = 0				--- Bullet spread based on player speed

	,SwayBase = 0.25				--- Weapon Base Sway | Studs
	,MaxSway =	2					--- Max sway value based on player stamina | Studs
----------------------------------------------------------------------------------------------------
---------------------=[ DANO ]=---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,LimbsDamage = {28,34}
	,TorsoDamage = {52,64}
	,HeadDamage = {104,108}
	,BulletPenetration = 37			 ---- Between 0 & 100%
	,FallOfDamage = 2
----------------------------------------------------------------------------------------------------
-------------------=[ PROJETIL ]=-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,Distance = 10000
	,BDrop = .25
	,BSpeed = 2000

	,SuppressMaxDistance = 25	--- Studs
	,SuppressTime = 10			--- Seconds

	,BulletWhiz = false
	,BWEmitter = 25
	,BWMaxDistance = 200
	
	,BulletFlare = false
	,BulletFlareColor = Color3.fromRGB(255,255,255)

	,Tracer = false
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
	,CanBreachDoor = true
	,CanBreak = true					--- Weapon can jam?
	,JamChance = 1000					--- This old piece of brick doesn't work fine >;c
	,IncludeChamberedBullet = true		--- Include the chambered bullet on next reload
	,Chambered = false					--- Start with the gun chambered?
	,LauncherReady = false				--- Start with the GL ready?
	,CanCheckMag = false				--- You can check the magazine
	,ArcadeMode = false					--- You can see the bullets left in magazine
	,RainbowMode = false				--- Operation: Party Time xD
	,ModoTreino = false					--- Surrender enemies instead of killing them
	,GunSize = 5
	,GunFOVReduction = 5.5

	,BoltExtend = Vector3.new(0, 0, 0.4)
	,SlideExtend = Vector3.new(0, 0, 0.2)	
----------------------------------------------------------------------------------------------------
--------------------=[ CFRAME ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,EnableHolster = false
	,HolsterTo = 'Torso'				 -- Put the name of the body part you wanna holster to
	,HolsterPos = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	
	,RightArmPos = CFrame.new(-.875, -0.2, -1.25) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Server
	,LeftArmPos = CFrame.new(1.2,-0.05,-1.65) * CFrame.Angles(math.rad(-120),math.rad(35),math.rad(-25))	--server
	
	,ServerGunPos = CFrame.new(-.3, -1, -0.4) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))
	,GunPos = CFrame.new(0.15, -0.15, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))

	,RightPos = CFrame.new(-.875, -0.2, -1.25) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Client
	,LeftPos = CFrame.new(0.85, 0.5,-2.2) * CFrame.Angles(math.rad(-120),math.rad(20),math.rad(-25))	--Client
}

return Config

