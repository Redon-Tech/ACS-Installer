local Tool = script.Parent.Parent.Parent
local ACS = Tool:WaitForChild("ACS_Modulo")
local Var = ACS:WaitForChild("Variaveis")

local Config = {

----------------------------------------------------------------------------------------------------
---------------------=[ GERAL ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	 Name = "M40A5"
	,BulletType = "7.62x51mm"
	,Ammo = Var.Ammo.Value
	,ChangeFOV = {10, 5}
	,ZoomAnim = false
	,FocusOnSight = true
	,FocusOnSight2 = true
	,MagCount = true
	,Bullets = 1
	,FireRate = 750
	,BurstFireRate = 900
	,BurstShot = 3
	,GunType = 0				--- 1 - Rifle, 2 - Shotgun
	,ReloadType = 1				--- 1 - Magazine, 2 - Shell inserting
	,Mode = "Bolt-Action"				--- Semi, Burst, Auto, Explosive || Bolt-Action, Pump-Action
	,FireModes = {
		ChangeFiremode = false;		
		Semi = false;
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
	,VRecoil = {20,22}				--- Vertical Recoil
	,HRecoil = {8,10}				--- Horizontal Recoil
	,AimRecover = .3				---- Between 0 & 1
	
	,RecoilPunch = .35
	,VPunchBase = 5.75				--- Vertical Punch
	,HPunchBase = 3.25				--- Horizontal Punch
	,DPunchBase = 1 				--- Tilt Punch | useless
	
	,AimRecoilReduction = .75 		--- Recoil Reduction Factor While Aiming (Do not set to 0)
	,PunchRecover = 0.1
	,MinRecoilPower = 1
	,MaxRecoilPower = 1
	,RecoilPowerStepAmount = 1
	
	,MinSpread = 0.15				--- Min bullet spread value | Studs
	,MaxSpread = 25					--- Max bullet spread value | Studs
	,AimInaccuracyStepAmount = 0
	,WalkMultiplier = 0				--- Bullet spread based on player speed

	,SwayBase = 0.25				--- Weapon Base Sway | Studs
	,MaxSway =	3					--- Max sway value based on player stamina | Studs
----------------------------------------------------------------------------------------------------
---------------------=[ DANO ]=---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,LimbsDamage = {75,90}
	,TorsoDamage = {125,150}
	,HeadDamage = {350,400}
	,BulletPenetration = 75 ---- Between 0 & 100%
	,FallOfDamage = .65
----------------------------------------------------------------------------------------------------
-------------------=[ PROJETIL ]=-------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,Distance = 10000
	,BDrop = .25
	,BSpeed = 3000

	,SuppressMaxDistance = 25	--- Studs
	,SuppressTime = 10			--- Seconds

	,BulletWhiz = true
	,BWEmitter = 25
	,BWMaxDistance = 200
	
	,BulletFlare = true
	,BulletFlareColor = Color3.fromRGB(255,255,255)

	,Tracer = true
	,TracerColor = Color3.fromRGB(255,255,255)
	,TracerLightEmission = 1
	,TracerLightInfluence = 0
	,TracerLifeTime = .2
	,TracerWidth = .1
	,RandomTracer = false
	,TracerEveryXShots = 1
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
	,CanCheckMag = true					--- You can check the magazine
	,ArcadeMode = false					--- You can see the bullets left in magazine
	,RainbowMode = false				--- Operation: Party Time xD
	,ModoTreino = false					--- Surrender enemies instead of killing them
	,GunSize = 8
	,GunFOVReduction = 8

	,BoltExtend = Vector3.new(0, 0, 0.4)
	,SlideExtend = Vector3.new(0, 0, 0.4)	
----------------------------------------------------------------------------------------------------
--------------------=[ CFRAME ]=--------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
	,EnableHolster = false
	,HolsterTo = 'Torso'				 -- Put the name of the body part you wanna holster to
	,HolsterPos = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
	
	,RightArmPos = CFrame.new(-0.85, -0.2, -1.2) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Server
	,LeftArmPos = CFrame.new(1.05,0.9,-1.4) * CFrame.Angles(math.rad(-100),math.rad(25),math.rad(-20))	--server
	
	,ServerGunPos = CFrame.new(-.3, -1, -0.4) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))
	,GunPos = CFrame.new(0.15, -0.15, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))

	,RightPos = CFrame.new(-.65, -0.2, -1) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(0))	--Client
	,LeftPos = CFrame.new(1.2,0.1,-1.6) * CFrame.Angles(math.rad(-120),math.rad(35),math.rad(-20))	--Client
}

return Config

