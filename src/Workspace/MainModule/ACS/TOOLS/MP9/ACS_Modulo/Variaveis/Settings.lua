local Tool = script.Parent.Parent.Parent
local ACS = Tool:WaitForChild("ACS_Modulo")
local Var = ACS:WaitForChild("Variaveis")

local Config = {

----------------------------------------------------------------------------------------------------
---------------------=[ GERAL ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	 Name = "MP9"
	,BulletType = "9x19mm"
	,Ammo = Var.Ammo.Value
	,ChangeFOV = {60, 60}
	,ZoomAnim = false
	,FocusOnSight = false
	,FocusOnSight2 = false
	,MagCount = true
	,Bullets = 1
	,FireRate = 1100
	,BurstFireRate = 900
	,BurstShot = 3
	,GunType = 1				--- 0 - Pistol, 1 - Rifle, 2 - Shotgun
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
	,VRecoil = {4,6}				--- Vertical Recoil
	,HRecoil = {6,9}				--- Horizontal Recoil
	,AimRecover = .85				---- Between 0 & 1
	
	,RecoilPunch = .15
	,VPunchBase = 3.25				--- Vertical Punch
	,HPunchBase = 2.5					--- Horizontal Punch
	,DPunchBase = 1 				--- Tilt Punch | useless
	
	,AimRecoilReduction = 5 		--- Recoil Reduction Factor While Aiming (Do not set to 0)
	,PunchRecover = 0.2
	,MinRecoilPower = .5
	,MaxRecoilPower = 3
	,RecoilPowerStepAmount = .25
	
	,MinSpread = 7					--- Min bullet spread value | Studs
	,MaxSpread = 40					--- Max bullet spread value | Studs
	,AimInaccuracyStepAmount = 1.5
	,WalkMultiplier = 0				--- Bullet spread based on player speed

	,SwayBase = 0.25				--- Weapon Base Sway | Studs
	,MaxSway =	1					--- Max sway value based on player stamina | Studs
----------------------------------------------------------------------------------------------------
---------------------=[ DANO ]=---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,LimbsDamage = {30,38}
	,TorsoDamage = {45,52}
	,HeadDamage = {114,124}
	,BulletPenetration = 47 ---- Between 0 & 100%
	,FallOfDamage = 1.5
----------------------------------------------------------------------------------------------------
-------------------=[ PROJETIL ]=-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,Distance = 500
	,BDrop = .25
	,BSpeed = 2000

	,SuppressMaxDistance = 25	--- Studs
	,SuppressTime = 10			--- Seconds

	,BulletWhiz = true
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
	,GunSize = 1
	,GunFOVReduction = 5

	,BoltExtend = Vector3.new(0, 0, 0.375)
	,SlideExtend = Vector3.new(0, 0, 0.3)
----------------------------------------------------------------------------------------------------
--------------------=[ CFRAME ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,EnableHolster = false
	,HolsterTo = 'Right Leg'				 -- Put the name of the body part you wanna holster to
	,HolsterPos = CFrame.new(0.80,0.7,0.2) * CFrame.Angles(math.rad(-88),math.rad(-180),math.rad(0))
	
	,RightArmPos = CFrame.new(-.875, 0.2, -1.25) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Server
	,LeftArmPos = CFrame.new(0.25,0.65,-1.65) * CFrame.Angles(math.rad(-100),math.rad(15),math.rad(-0))	--server

	,ServerGunPos = CFrame.new(-.3, -1, -0.4) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))
	,GunPos = CFrame.new(0.15, -0.15, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))

	,RightPos = CFrame.new(-0.65, 0.25, -1) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Client
	,LeftPos = CFrame.new(0.2,0.675,-1.45) * CFrame.Angles(math.rad(-100),math.rad(15),math.rad(-0))	--Client
}

return Config

