CrossClient = {}
loadstring(game:HttpGet(('https://raw.githubusercontent.com/ModuleMandem/Ajnad/main/CrossClient.lua'),true))()

GlobalFunctions = {}
loadstring(game:HttpGet(('https://raw.githubusercontent.com/ModuleMandem/Ajnad/main/GlobalFunctions.lua'),true))()

script = game.Players.LocalPlayer.Character.Terraprisma
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end;CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end;},{__index=math;})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;},{__index=CFrame;})
local Instance=setmetatable({new = function(type,args) local instance = Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent = args elseif string.lower(typeof(args)) == "table" then for i,v in pairs(args) do pcall(function() instance[i] = v end) end end end return instance end;Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance;})
local Player,UIS=game:GetService("Players").LocalPlayer,game:GetService("UserInputService") local Mouse=Player:GetMouse()
--}{		Default Functions	   }{--
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palette
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local cotan=math.CosSin
local floor=math.floor
local pi=math.pi
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
--
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		local Tween=game:GetService("TweenService"):Create(Object,Info,Args) Tween:Play()
		return Tween
	end
end
--






--
local Cam=workspace.CurrentCamera
local char=Player.Character
local hum=char:FindFirstChildOfClass("Humanoid")
hum.Animator:Destroy()
local h=char.Head
local t=char.Torso
local hrp=char.HumanoidRootPart 
local ra=char["Right Arm"]
local la=char["Left Arm"]
local rl=char["Right Leg"]
local ll=char["Left Leg"]
local nec=t.Neck
local rutj=hrp.RootJoint
local rs=t["Right Shoulder"]
local ls=t["Left Shoulder"]
local rh=t["Right Hip"]
local lh=t["Left Hip"]
--
local TP=t.Terraprisma
local TPH=TP.Handle
local fh=h
local ft=t
local fra=ra
local fla=la
local frl=rl
local fll=ll
local th=TPH
t.Terraprisma.Handle.Transparency = 1
t.Terraprisma.Blade.Transparency = 1
game.Players.LocalPlayer.Character.Model.Torso.Terraprisma.Handle.Transparency = 1
game.Players.LocalPlayer.Character.Model.Torso.Terraprisma.Blade.Transparency = 1
local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local stepped = rs.Stepped
local heartbeat = rs.Heartbeat
local renderstepped = rs.RenderStepped
local sg = game:GetService("StarterGui")
local ws = game:GetService("Workspace")
local cf = CFrame.new
local v3 = Vector3.new
local v3_0 = Vector3.zero
local inf = math.huge

local cplayer = lp.Character

local v3 = Vector3.new

local function gp(parent, name, className)
	if typeof(parent) == "Instance" then
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				return v
			end
		end
	end
	return nil
end


local hat2 = gp(cplayer, "BladeMasterAccessory", "Accessory")
local handle2 = gp(hat2, "Handle", "BasePart")
local att2 = gp(handle2, "att1_Handle", "Attachment")
att2.Parent = TPH
att2.Position = Vector3.new(0, 0.5, -2)
--att2.Position = Vector3.new(1, 1.2, -0.3)
att2.Rotation = Vector3.new(48, -99, -6)
--att2.Rotation = Vector3.new(-99, 48, -90)
--att2.Rotation = Vector3.new(-99, -90, 48)



local hat2 = gp(cplayer, "SamuraiHat", "Accessory")
local handle2 = gp(hat2, "Handle", "BasePart")
local att2 = gp(handle2, "att1_Handle", "Attachment")
att2.Parent = game.Players.LocalPlayer.Character.Model["Left Leg"]
att2.Position = Vector3.new(0, 0, 0)
--att2.Position = Vector3.new(1, 1.2, -0.3)
att2.Rotation = Vector3.new(0, 0, 0)
--att2.Rotation = Vector3.new(-99, 48, -90)
--att2.Rotation = Vector3.new(-99, -90, 48)

local hat2 = gp(cplayer, "Pal Hair", "Accessory")
local handle2 = gp(hat2, "Handle", "BasePart")
local att2 = gp(handle2, "att1_Handle", "Attachment")
att2.Parent = game.Players.LocalPlayer.Character["Left Leg"]
att2.Position = Vector3.new(0, 0, 0)
--att2.Position = Vector3.new(1, 1.2, -0.3)
att2.Rotation = Vector3.new(90, 0, 0)
--att2.Rotation = Vector3.new(-99, 48, -90)
--att2.Rotation = Vector3.new(-99, -90, 48)




game.Players.LocalPlayer.Character.Model["Pal Hair"].Handle.Mesh:Destroy()
--]]
game.Players.LocalPlayer.Character.Model.SamuraiHat.Handle.SpecialMesh:Destroy()

--game.Players.LocalPlayer.Character.Model["Left Leg"].Position = game.Players.LocalPlayer.Character.Model.Torso
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local ins=Instance.new
local v3=Vector3.new
local v2=Vector2.new
local cf=CFrame.new
local angles=CFrame.Angles
local ud=UDim.new
local ud2=UDim2.new
local c3=Color3.new
local rgb=Color3.fromRGB
local hsv=Color3.fromHSV
local bc=BrickColor.new
local bcRandom=BrickColor.Random
local palette=BrickColor.palatte
local cs=ColorSequence.new
local ns=NumberSequence.new
local nsk=NumberSequenceKeypoint.new
local nr=NumberRange.new
local random=math.random
local rad=math.rad
local sin=math.sin
local cos=math.cos
local tan=math.tan
local CosSin=math.CosSin
local floor=math.floor
local pi=math.floor
local abs=math.abs
local sqrt=math.sqrt
local clamp=math.clamp
local ray=Ray.new
local huge=math.huge
local Anims = {
	Swing1={
		Waits={
			[1]=.1,
			[2]=.05,
			[3]=.075,
			[4]=.075,
			[5]=.025
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(-10),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.1,0)*CFrame.Angles(math.rad(-10),math.rad(40),math.rad(5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.3,-0.35,-0.75)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(75),math.rad(90),math.rad(190))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(20))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.1,0.05)*CFrame.Angles(math.rad(-5),math.rad(10),math.rad(-5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-5),math.rad(-30),math.rad(0))*CFrame.new(0,0.05,-0.2)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.1)*CFrame.Angles(math.rad(5),math.rad(-5),math.rad(-5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}}
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-25),math.rad(0))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.Angles(math.rad(-7.5),math.rad(25),math.rad(2.5))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.2,-0.35,-0.75)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(50),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(20))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.1,0.075)*CFrame.Angles(math.rad(-7.5),math.rad(15),math.rad(-10))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))*CFrame.new(0,0,-0.2)},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.3,-0.3)*CFrame.Angles(math.rad(-10),math.rad(5),math.rad(-2.5))},{.065,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}}
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(10))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.05,0)*CFrame.Angles(math.rad(-7.5),math.rad(0),math.rad(2.5))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.4,-0.35,-0.25)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(-50),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.1,0.075)*CFrame.Angles(math.rad(-15),math.rad(25),math.rad(-10))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-2.5),math.rad(-15),math.rad(0))*CFrame.new(0,0,-0.2)},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.25)*CFrame.Angles(math.rad(10),math.rad(10),math.rad(-7.5))},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-5,0,0,true)},{.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0}}
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(25),math.rad(7.5))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.05,0)*CFrame.Angles(math.rad(-1.5),math.rad(-25),math.rad(2.5))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.5,-0.35,0)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(10))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.3,-0.2,0.25)*CFrame.Angles(math.rad(-25),math.rad(25),math.rad(-10))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(7.5),math.rad(15),math.rad(-5))*CFrame.new(0,0,-0.2)},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.3)*CFrame.Angles(math.rad(-10),math.rad(25),math.rad(-7.5))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-15,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[5]={
			{"nec",{C1=CFrame.Angles(math.rad(-2.5),math.rad(26),math.rad(5))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.05,0)*CFrame.Angles(math.rad(-1.5),math.rad(-20),math.rad(2.5))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rs",{C0=CFrame.new(0.5,-0.35,-0.05)*CFrame.Angles(math.rad(90),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(-85),math.rad(0),math.rad(10))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(0.3,-0.175,0.225)*CFrame.Angles(math.rad(-20),math.rad(20),math.rad(-10))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(5),math.rad(15),math.rad(-5))*CFrame.new(0,0,-0.2)},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.05,-0.3)*CFrame.Angles(math.rad(-7.5),math.rad(25),math.rad(-7.5))},{.025,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		}
	},
	
	Swing2={
		Waits={
			[1]=.075,
			[2]=.1,
			[3]=.075,
			[4]=.05,
			[5]=.05
		},
		[1]={
			{"rh",{C1=CFrame.new(0,.15,-0.15)*CFrame.Angles(math.rad(-15),math.rad(-5),math.rad(0))},{.075,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-10),math.rad(50),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.2,0.2)*CFrame.Angles(math.rad(-15),math.rad(-50),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.5,0,-0.5)*CFrame.Angles(math.rad(10),math.rad(50),math.rad(5))*CFrame.Angles(math.rad(-5),math.rad(0),math.rad(2.5))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.15,-0.1)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(-10))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(-5),math.rad(-15),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.25,0)*CFrame.Angles(math.rad(0),math.rad(40),math.rad(-5))*CFrame.Angles(math.rad(1),math.rad(0),math.rad(0))*CFrame.new(0,0,-0.35)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,0.05)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(0.65,0.1,-0.35)*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(200),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.1,-0.15,-0.1)*CFrame.Angles(math.rad(30),math.rad(0),math.rad(20))*CFrame.Angles(math.rad(0),math.rad(-40),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-7.5),math.rad(-15),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.Angles(math.rad(0),math.rad(5),math.rad(-5))*CFrame.Angles(math.rad(-2.5),math.rad(0),math.rad(0))},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(35,0,0,true)},{.075,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}}
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.125,0.15)*CFrame.Angles(math.rad(15),math.rad(40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.15,0.5,-0.5)*CFrame.Angles(math.rad(150),math.rad(0),math.rad(-50))*CFrame.Angles(math.rad(0),math.rad(200),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.15,-0.1)*CFrame.Angles(math.rad(65),math.rad(0),math.rad(70))*CFrame.Angles(math.rad(0),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-15),math.rad(-15),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.125,-0.25)*CFrame.Angles(math.rad(-10),math.rad(25),math.rad(-7.5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-25,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[5]={
			{"nec",{C1=CFrame.Angles(math.rad(-2.5),math.rad(-40),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.125,0.15)*CFrame.Angles(math.rad(10),math.rad(40),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rs",{C0=CFrame.new(-0.15,0.4,-0.5)*CFrame.Angles(math.rad(140),math.rad(0),math.rad(-50))*CFrame.Angles(math.rad(0),math.rad(200),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"ls",{C0=CFrame.new(0.25,-0.15,-0.1)*CFrame.Angles(math.rad(45),math.rad(0),math.rad(50))*CFrame.Angles(math.rad(0),math.rad(-40),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"rh",{C1=CFrame.Angles(math.rad(-10),math.rad(-15),math.rad(0))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.125,-0.25)*CFrame.Angles(math.rad(-5),math.rad(25),math.rad(-7.5))},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-20,0,0,true)},{.05,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}}
		}
	},
	--]]
	Swing3={
		Waits={
			[1]=.1,
			[2]=.1,
			[3]=.1,
			[4]=.05
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(-10),math.rad(40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,-0.1,0)*CFrame.Angles(math.rad(-5),math.rad(-40),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(0.35,0.65,0.1)*CFrame.Angles(math.rad(-10),math.rad(-10),math.rad(90))*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,-0.1)*CFrame.Angles(math.rad(10),math.rad(-20),math.rad(-10))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(5),math.rad(-20),math.rad(5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0.1,-0.15)*CFrame.Angles(math.rad(0),math.rad(35),math.rad(0))*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(0,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.2)*CFrame.Angles(math.rad(-2),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(0,0.65,-0.5)*CFrame.Angles(math.rad(0),math.rad(-10),math.rad(90))*CFrame.Angles(math.rad(90),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,0.1)*CFrame.Angles(math.rad(-5),math.rad(-20),math.rad(-15))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=CFrame.new(0,0.25,-0.2)*CFrame.Angles(math.rad(-5),math.rad(-10),math.rad(2.5))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(0),math.rad(35),math.rad(0))*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(15,0,0,true)},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In,0,false,0}}
		},
		[3]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-45),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.215)*CFrame.Angles(math.rad(-5),math.rad(45),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.25,0.65,-0.5)*CFrame.Angles(math.rad(15),math.rad(-10),math.rad(80))*CFrame.Angles(math.rad(170),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,0.2)*CFrame.Angles(math.rad(-15),math.rad(10),math.rad(-15))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(10),math.rad(-25),math.rad(7.5))*CFrame.new(0,0,-0.15)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(0),math.rad(15),math.rad(0))*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(0))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-25,0,0,true)},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(-5),math.rad(-45),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0,0,-0.215)*CFrame.Angles(math.rad(-5),math.rad(45),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rs",{C0=CFrame.new(-0.25,0.65,-0.5)*CFrame.Angles(math.rad(15),math.rad(-10),math.rad(80))*CFrame.Angles(math.rad(170),math.rad(0),math.rad(0))*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C0=CFrame.new(0.2,-0.1,0.2)*CFrame.Angles(math.rad(-15),math.rad(10),math.rad(-15))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(10),math.rad(-25),math.rad(7.5))*CFrame.new(0,0,-0.15)},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,-0.15)*CFrame.Angles(math.rad(0),math.rad(15),math.rad(0))*CFrame.Angles(math.rad(-10),math.rad(0),math.rad(0))},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=cf(0,0,0)*angles(-25,0,0,true)},{.05,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}}
		}
	},
	
	Summon={
		Waits={
			[1]=.14,
			[2]=.04,
			[3]=.04,
			[4]=.09,
			[5]=.04,
			[6]=0
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(20),math.rad(0),math.rad(0))},{.25,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=cf(0,0,-.15)*angles(-3,0,0,true)},{.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.1,-0.5,0.25)*CFrame.Angles(math.rad(40),math.rad(0),math.rad(30))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C1=CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=angles(30,0,0,true)},{.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(20),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,-1,false,0}},
			{"rutj",{C1=cf(0,0,-.15)*angles(-3,0,0,true)},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
		},
		[3]={
			{"rutj",{C1=cf(0,0,-.15)*angles(-3,0,0,true)},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
			{"nec",{C1=CFrame.Angles(math.rad(20),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.In,-1,false,0}},
			{"sw",{C0=angles(30,0,0,true)},{0,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,false,0}},
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(40),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=cf(0,0,.25)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.1,0.5,-0.05)*CFrame.Angles(math.rad(160),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C1=CFrame.new(0.1,-0.1,-0.05)*CFrame.Angles(math.rad(5),math.rad(10),math.rad(-15))},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=angles(-60,0,0,true)},{.25,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
		},
		[5]={
			{"nec",{C1=CFrame.Angles(math.rad(40),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,-1,false,0}},
			{"rutj",{C1=cf(0,0,.25)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
		},
		[6]={
			{"nec",{C1=CFrame.Angles(math.rad(40),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=cf(0,0,.25)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
		}
	},
	Cast={
		Waits={
			[1]=.14,
			[2]=.04,
			[3]=.04,
			[4]=.09,
			[5]=.04,
			[6]=.04,
			[7]=.1
		},
		[1]={
			{"nec",{C1=CFrame.Angles(math.rad(-3),math.rad(0),math.rad(0))},{.25,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=cf(0,0,-.15)*angles(-3,0,0,true)},{.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.1,-0.5,0.25)*CFrame.Angles(math.rad(40),math.rad(0),math.rad(30))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C1=CFrame.Angles(math.rad(0),math.rad(0),math.rad(-5))},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=angles(30,0,0,true)},{.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0}},
		},
		[2]={
			{"nec",{C1=CFrame.Angles(math.rad(-3),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,-1,false,0}},
			{"rutj",{C1=cf(0,0,-.15)*angles(-3,0,0,true)},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
		},
		[3]={
			{"rutj",{C1=cf(0,0,-.15)*angles(-3,0,0,true)},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
			{"nec",{C1=CFrame.Angles(math.rad(-3),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.In,-1,false,0}},
			{"sw",{C0=angles(30,0,0,true)},{0,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,-1,false,0}},
		},
		[4]={
			{"nec",{C1=CFrame.Angles(math.rad(10),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=cf(0,0,.25)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.1,0.5,-0.05)*CFrame.Angles(math.rad(160),math.rad(0),math.rad(0))},{.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C1=CFrame.new(0.1,-0.1,-0.05)*CFrame.Angles(math.rad(5),math.rad(10),math.rad(-15))},{.1,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"sw",{C0=angles(-60,0,0,true)},{.25,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
		},
		[5]={
			{"nec",{C1=CFrame.Angles(math.rad(10),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,-1,false,0}},
			{"rutj",{C1=cf(0,0,.25)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,-1,false,0}},
		},
		[6]={
			{"nec",{C1=CFrame.Angles(math.rad(10),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Circular,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=cf(0,0,.25)*CFrame.Angles(math.rad(5),math.rad(0),math.rad(0))},{0,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
		},
		[7]={
			{"nec",{C1=CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))},{.25,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
			{"rutj",{C1=CFrame.new(0.15,-0.05,-0.1)*CFrame.Angles(math.rad(-1),math.rad(30),math.rad(-5))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=CFrame.new(-0.1,-0.05,-0.5)*CFrame.Angles(math.rad(81),math.rad(0),math.rad(30))},{.1,Enum.EasingStyle.Back,Enum.EasingDirection.Out,0,false,0}},
			{"ls",{C1=CFrame.new(0.1,-0.1,-0.05)*CFrame.Angles(math.rad(5),math.rad(-5),math.rad(-5))},{.2,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0}},
			{"rh",{C1=CFrame.new(0,0,-0.25)*CFrame.Angles(math.rad(-20),math.rad(-10),math.rad(0))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(7.5),math.rad(10),math.rad(5))},{.15,Enum.EasingStyle.Quad,Enum.EasingDirection.In,0,false,0}},
			{"sw",{C0=angles(-85,0,0,true)},{.25,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0}},
		}
	}
}
--[[
Left Shoulder: 
	C0: CFrame.new(-1,.5,0)*CFrame.new(0.1,-0.1,-0.05)*CFrame.Angles(math.rad(5),math.rad(-5),math.rad(-5))
	C1: CFrame.new(.5,.5,0)
Right Shoulder: 
	C0: CFrame.new(1,.5,0)*CFrame.new(-0.1,-0.05,-0.5)*CFrame.Angles(math.rad(91),math.rad(0),math.rad(30))
	C1: CFrame.new(-.5,.5,0)
Neck: 
	C0: CFrame.new(0,1,0)*CFrame.Angles(math.rad(0),math.rad(-30),math.rad(0))
	C1: CFrame.new(0,-.5,0)
Right Hip: 
	C0: CFrame.new(0.5,-1,0)*CFrame.new(0,0,-0.25)*CFrame.Angles(math.rad(-20),math.rad(-10),math.rad(0))
	C1: CFrame.new(0,1,0)
Left Hip: 
	C0: CFrame.new(-0.5,-1,0)*CFrame.new(0,0,0)*CFrame.Angles(math.rad(7.5),math.rad(10),math.rad(5))
	C1: CFrame.new(0,1,0)
RootJoint: 
	C0: CFrame.new(0.15,-0.05,-0.1)*CFrame.Angles(math.rad(-1),math.rad(30),math.rad(-5))
	C1: 
--]]
--[[
	,
	temp={
		Waits={
			[1]=.225
		},
		[1]={
			{"nec",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rutj",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rs",{C0=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"ls",{C0=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"rh",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}},
			{"lh",{C1=000},{.25,Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0}}
		}
	}
--]]


local Swords={}
local AttTarget=nil
local AttTargets=nil
local AttTargetNum=0
--
local ClimbTick=tick()
local Using,Climbing,Hitbox,LtM=false,false,false,false
local Dancing,Sitting,Crying=false,false,false
local Sine,Change=0,1
local Mus=t:FindFirstChild("VMus")
local Combo=1
--
local necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
local rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
local rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
local lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
local rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
local lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
local thC0=cf(-ra.Size.X/5,-ra.Size.Y/2+.1,0)
--
Instance.Remove({nec;rutj;rs;ls;rh;lh})
nec=ins("Motor6D",{Name="Neck";Part0=ft;Part1=fh;C0=necC0;C1=necC1;Parent=ft})
rutj=ins("Motor6D",{Name="RootJoint";Part0=hrp;Part1=ft;C0=rutjC0;C1=rutjC1;Parent=hrp})
rs=ins("Motor6D",{Name="Right Shoulder";Part0=ft;Part1=fra;C0=rsC0;C1=rsC1;Parent=ft})
ls=ins("Motor6D",{Name="Left Shoulder";Part0=ft;Part1=fla;C0=lsC0;C1=lsC1;Parent=ft})
rh=ins("Motor6D",{Name="Right Hip";Part0=ft;Part1=frl;C0=rhC0;C1=rhC1;Parent=ft})
lh=ins("Motor6D",{Name="Left Hip";Part0=ft;Part1=fll;C0=lhC0;C1=lhC1;Parent=ft})
local tw=ins("Motor6D",{Name="GunWeld";Part0=fra;Part1=th;C0=thC0;C1=cf();Parent=TPH})
--
function Lerp(a,b,t)
	return a+(b-a)*t
end
function Reflect(V,N)
	return -2*V:Dot(N)*N+V
end
function TwoVecToAng(v1,v2,rad)
	return math.acos(v1.CFrame.LookVector:Dot((v2-v1.Position).Unit))*(rad and 1 or 180/math.pi)
end
function Bezier(a,b,c,t)
	return a:Lerp(c,t):Lerp(c:Lerp(b,t),t)
end
--
function PlayAnimSingle(...)
	local Joints_={nec=nec,rutj=rutj,rs=rs,ls=ls,rh=rh,lh=lh,sw=tw}
	local CFs_={necC0=necC0,necC1=necC1,rutjC0=rutjC0,rutjC1=rutjC1,rsC0=rsC0,rsC1=rsC1,lsC0=lsC0,lsC1=lsC1,rhC0=rhC0,rhC1=rhC1,lhC0=lhC0,lhC1=lhC1,swC0=thC0,swC1=cf()}
	for i,v in pairs({...}) do
		if Joints_[v[1]] then
			local T={}
			table.foreach(v[2],function(i,v) T[i]=v end)
			local C0=((CFs_[v[1].."C0"] or cf(0,0,0))*(T.C0 or cf(0,0,0))) or CFs_[v[1].."C0"]
			local C1=((CFs_[v[1].."C1"] or cf(0,0,0))*((T.C1 or cf(0,0,0))):Inverse())
			for i,v in pairs(T) do if i=="C0" then T.C0=C0 elseif i=="C1" then T.C1=C1 end end
			Tween(Joints_[v[1]],T,v[3])
		end
	end
end
function PlayAnim(Table,AddFuncs)
	AddFuncs=AddFuncs or {}
	local Waits=Table.Waits
	for i=1,#Table do
		local v=Table[i]
		if i~="Waits" and Waits[i] then
			local WaitTime=Waits[i]
			PlayAnimSingle(unpack(v))
			if WaitTime>0 then wait(WaitTime) end
			if AddFuncs[i] then AddFuncs[i]() end
		end
	end
end
local function SolveRot(CF,Pos,Full,a,b,Inv,Det)
	if Full then
		local L=CF:PointToObjectSpace(Pos)
		local Lu=L.Unit
		local c=L.Magnitude
		local Ax=v3(0,0,-1):Cross(Lu)
		local Ang=math.acos(-Lu.Z)
		local Pl=CFrame.fromAxisAngle(Ax,Ang)
		if c<math.max(a,b)-math.min(a,b) then
			return Pl*cf(0,0,math.max(a,b)-math.min(a,b)-c)*angles(math.pi/2,0,0)
		elseif c>a+b then
			return Pl*cf(0,0,a+b-c)*angles(math.pi/2,0,0)
		else
			local t1=-math.acos((-b^2+a^2+c^2)/(2*a*c))
			local t2=math.acos((b^2-a^2+c^2)/(2*b*c))
			if Inv then t1=-t1 t2=-t2 end
			if Det then
				return Pl,t1+math.pi/2,t2-t1
			else
				return Pl*angles(t1+math.pi/2,0,0)*cf(0,-a,0)*angles(t2-t1,0,0)*cf(0,a,0)
			end
		end
	else
		local L=CF:PointToObjectSpace(Pos)
		local Lu=L.Unit
		local Ax=v3(0,0,-1):Cross(Lu)
		local Ang=math.acos(-Lu.Z)
		local P=CFrame.fromAxisAngle(Ax,Ang)*angles(math.pi/2,0,0)
		return P
	end
end
function GetCC(Pos,Range,Ignore,CharPos,Turn)
	Pos=Pos or hrp.Position
	Range=Range or 5
	Ignore=Ignore or {char}
	local Chars,CharsDist={},{}
	for i,v in pairs(workspace:FindPartsInRegion3WithIgnoreList(Region3.new(Pos-Vector3.new(1,1,1)*Range,Pos+Vector3.new(1,1,1)*Range),Ignore,100)) do
		if v.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM=v.Parent:FindFirstChildOfClass("Humanoid")
			local T=HUM.Parent:FindFirstChild("Torso") or HUM.Parent:FindFirstChild("UpperTorso")
			local Hit=Raycast(CharPos or Pos,T.Position-(CharPos or Pos),{char},((CharPos or Pos)-T.Position).Magnitude+.1,true)
			local Ex=false
			for i,q in pairs(Chars) do
				if v:IsDescendantOf(q[1].Parent) then Ex=true break end
			end
			if T and (Hit and Hit:IsDescendantOf(HUM.Parent)) and HUM.Health>0 and not Ex then
				table.insert(Chars,{T,HUM})
				table.insert(CharsDist,(Pos-T.Position).Magnitude)
			end
		end
	end
	if #Chars==0 then return end
	local Closest=math.min(unpack(CharsDist))
	for i=1,#Chars do
		if (Pos-Chars[i][1].Position).Magnitude==Closest then
			if Turn then hrp.CFrame=CFrame.new((CharPos or Pos),Vector3.new(Chars[i][1].Position.X,Pos.Y,Chars[i][1].Position.Z)) end
			return Chars[i][1].Parent,Chars[i][1],Chars[i][2]
		end
	end
end
function GetCCs(Pos,Range,Ignore,Limit,CharPos)
	Pos=Pos or hrp.Position
	Range=Range or 5
	Ignore=Ignore or {char}
	local Chars,CharsDist={},{}
	for i,v in pairs(workspace:FindPartsInRegion3WithIgnoreList(Region3.new(Pos-Vector3.new(1,1,1)*Range,Pos+Vector3.new(1,1,1)*Range),Ignore,200)) do
		if v.Parent:FindFirstChildOfClass("Humanoid") then
			local HUM=v.Parent:FindFirstChildOfClass("Humanoid")
			local T=HUM.Parent:FindFirstChild("Torso") or HUM.Parent:FindFirstChild("UpperTorso")
			local Hit=Raycast(CharPos or Pos,T.Position-(CharPos or Pos),{char},((CharPos or Pos)-T.Position).Magnitude+.1,true)
			local Ex=false
			for i,q in pairs(Chars) do
				if v:IsDescendantOf(q[1].Parent) then Ex=true break end
			end
			if T and (Hit and Hit:IsDescendantOf(HUM.Parent)) and HUM.Health>0 and not Ex then
				table.insert(Chars,{T,HUM})
				table.insert(CharsDist,(Pos-T.Position).Magnitude)
			end
		end
	end
	if #Chars==0 then return end
	if #Chars<=Limit then return Chars end
	local GivChars={}
	for x=1,Limit do
		local Closest=math.min(unpack(CharsDist))
		for i=1,#Chars do
			if (Pos-Chars[i][1].Position).Magnitude==Closest then
				table.insert(GivChars,{Chars[i][1],Chars[i][2]})
				table.remove(Chars,i)
				table.remove(CharsDist,i)
			end
		end
	end
	return GivChars
end
function Sound(Id,Volume,Pitch,Parent,MaxDistance,EmitterSize,Looped)
	local S=ins("Sound",{Volume=Volume or 1;Pitch=Pitch or 1;MaxDistance=MaxDistance or 500;EmitterSize=EmitterSize or 5;Looped=Looped or false;SoundId="rbxassetid://"..Id,Parent=Parent})
	S:Play()
	coroutine.wrap(function()
		if S.Looped then return end
		if S.IsLoaded then
			Instance.Remove(S,S.TimeLength/S.Pitch)
		else
			S.Loaded:Connect(function()
				Instance.Remove(S,S.TimeLength/S.Pitch)
			end)
		end
	end)()
	return S
end
--
local SAttacks={
	function(Sword,Hum,T,ind)
		if Sword[7] or Hum.Health<.1 or not Sword[1] then return end
		coroutine.wrap(function()
			local Accel=random(10,20,19)
			local Dist=(Sword[1].Position-T.Position).Magnitude+Accel
			local Pos=Sword[1].Position
			local Off=v3(random(-10,10,10),random(-10,10,10),random(-10,10,10))
			Sword[4]=true
			Sword[2]=true
			Sword[5]=tick()
			Sword[6]=Dist/200+.25
			for i=0,1.2,.1 do
				local B=Bezier(Pos,T.Position,Pos+(T.Position-Pos)/2+Off,i)
				local LB=Bezier(Pos,T.Position,Pos+(T.Position-Pos)/2+Off,i+.1)
				Sword[1]:WaitForChild("BP",1).Position=B
				Sword[1]:WaitForChild("BG",1).CFrame=cf(Sword[1].Position,LB)*angles(-90,0,0,true)
				game:GetService("RunService").Heartbeat:Wait()
			end
			if not Sword[7] then
				Sword[3]-=1
				if Sword[3]<1 then
					Sword[7]=true
					CrossClient.SD(Sword[1].Position,Sword[1].Velocity)
					Sword[1].Parent=nil
				end
			end
			Sword[4]=false
		end)()
	end,
	function(Sword,Hum,T,ind)
		if Sword[7] or Hum.Health<.1 or not Sword[1] then return end
		coroutine.wrap(function()
			local Accel=random(10,20,19)
			local Dist=(Sword[1].Position-T.Position).Magnitude+Accel
			Sword[4]=true
			Sword[2]=true
			Sword[5]=tick()
			Sword[6]=Dist/200+.1*ind
			Sword[1]:WaitForChild("BG",1).CFrame=cf(Sword[1].Position,T.Position)*angles(-90,0,0,true)
			local T=Tween(Sword[1]:WaitForChild("BP",1),{Position=(cf(Sword[1].Position,T.Position)*cf(0,0,-Dist)).Position},{Sword[6],Enum.EasingStyle.Back,Enum.EasingDirection.In,0,false,0})
			Sword[8]=T
			wait(Sword[6]+.25)
			if not Sword[7] then
				Sword[3]-=1
				if Sword[3]<1 then
					Sword[7]=true
					CrossClient.SD(Sword[1].Position,Sword[1].Velocity)
					Sword[1].Parent=nil
				end
			end
			Sword[4]=false
		end)()
	end,
}
--
CrossClient.UpdateSwords = function(Tab,New)
	if AttTarget then table.insert(Swords,New) return end
	Swords=Tab
end
--
local Moves={
	Equals={Func=function()
		Hitbox=not Hitbox
	end,Deb=0,Tick=tick()},
	Underscore={Func=function()
		char:MoveTo(t.Position)
		print(Swords)
	end,Deb=0,Tick=tick()},
	T={Func=function()
		Dancing=not Dancing
	end,Deb=0,Tick=tick()},
	Z={Func=function()
		Sitting=not Sitting
		Crying=false
		Dancing=false
	end,Deb=0,Tick=tick()},
	X={Func=function()
		Sitting=false
		Crying=not Crying
		Dancing=false
	end,Deb=0,Tick=tick()},
	
	F={Func=function()
		if #Swords<1 or Using or AttTarget then return end
		Using=true
		local Targets=GetCCs(Mouse.Hit.Position,(Mouse.Hit.Position-Cam.CFrame.Position).Magnitude/3,{char},6,t.Position)
		if Targets then
			local T,H=Targets[1][1],Targets[1][2]
			PlayAnim(Anims.Cast)
			AttTargetNum=1
			AttTarget={T,H}
			AttTargets=Targets
		end
		Using=false
	end,Deb=0,Tick=tick()},
}
--
UIS.InputBegan:Connect(function(IO,L)
	if L then return end
	if IO.UserInputType==Enum.UserInputType.Keyboard then
		if Moves[IO.KeyCode.Name] then 
			local T=Moves[IO.KeyCode.Name]
			if tick()-T.Tick>T.Deb or T.Deb==0 then
				local Res=T.Func()
				T.Tick=not Res and T.Tick or tick()
			end
		end
	elseif IO.UserInputType==Enum.UserInputType.MouseButton1 and not Using then
		if (Sitting or Crying) then return end
		local Anim=Anims["Swing"..Combo]
		if Anim then
			Using=true
			LtM=true
			local Damage=false
			local KillDamage=false
			coroutine.wrap(function()
				while not KillDamage do
					if Damage then
						local Pos={}
						for i=-.3,.3,.3 do
							table.insert(Pos,(TP.Blade.CFrame*cf(0,0,TP.Blade.Position.Z*i)).Position)
							--GlobalFunctions.fling(game.Players.LocalPlayer.Torso, 10)
							GlobalFunctions.fling(TP.Blade, 0.001)
							GlobalFunctions.fling(Torso, 0.0001)
						end
						
						--CrossClient.SwordDamage(Pos)
					end
					game:GetService("RunService").Heartbeat:Wait()
				end
			end)()
			PlayAnim(Anim,{[1]=function() Damage=true end})
			Damage=false
			KillDamage=true
			Using=false
			LtM=false
			Combo+=1
			if Combo>3 then Combo=1 end
		end
	end
end)
UIS.InputEnded:Connect(function(IO,L)
	if L then return end
	if IO.UserInputType==Enum.UserInputType.Keyboard then
	elseif IO.UserInputType==Enum.UserInputType.MouseButton1 then
	end
end)
--

game:GetService("RunService").Heartbeat:Connect(function(Step)
	if Climbing and tick()-ClimbTick>.15 then Climbing=false end
	if hum.FloorMaterial==Enum.Material.Air and not Climbing then
		local Hits,LastHit,LastPos,HitParts=0,nil,0,{}
		local Div=20
		local HIt,POs=Raycast(hrp.CFrame*cf(0,1,0).Position,v3(0,1,0),{char},5,true)
		for i=0,3,1/Div do
			local Dir=hum.MoveDirection.Magnitude>0 and hum.MoveDirection or (hrp.Velocity*v3(1,0,1))/10
			local Hit,Pos,NID=Raycast((Dir.Magnitude>.5 and (cf(hrp.Position,hrp.Position+Dir)) or hrp.CFrame)*cf(0,5,-i-.5).Position,v3(0,-1,0),{char},5,true)
			local HIT,POS=Raycast(POs,Pos-POs,{char},10,true)
			Hits+=((Hit and POS==Pos) and Hit.CanCollide) and 1 or 0
			if (Hit and POS==Pos) and Hit.CanCollide then LastHit=Pos LastPos=i*10 table.insert(HitParts,Hit) end
		end
		if Hits>=Div then
			Climbing=true ClimbTick=tick()
			Instance.Remove(ins("BodyVelocity",{MaxForce=v3(1/0,1/0,1/0),Velocity=(LastHit*v3(1,0,1)-hrp.Position*v3(1,0,1)).Unit*(LastPos/1.75)+v3(0,30,0),Parent=hrp}),.1)
			coroutine.wrap(function()
				for i,v in pairs(HitParts) do
					v.CanCollide=false
				end
				wait(.15)
				for i,v in pairs(HitParts) do
					v.CanCollide=true
				end
			end)()
		elseif Hits>=4 and LastPos<25 then
			local Hits=0
			for i=0,5,.1 do
				local Hit,Pos,NID=Raycast((hrp.Position*v3(1,0,1))+v3(0,LastHit.Y,0)-v3(0,.5+i,0),(LastHit*v3(1,0,1)-hrp.Position*v3(1,0,1)).Unit,{char},10,true) --TODO:finish_swings
				Hits+=Hit and 1 or 0
			end
			if Hits<5 then
				coroutine.wrap(function()
					for i,v in pairs(HitParts) do
						v.CanCollide=false
					end
					wait(.15)
					for i,v in pairs(HitParts) do
						v.CanCollide=true
					end
				end)()
				coroutine.wrap(function()
					for i=0,360,30 do
						rutj.C1=rutjC1*angles(-i,0,0,true)
						game:GetService("RunService").Heartbeat:Wait()
					end
				end)()
				Instance.Remove(ins("BodyVelocity",{MaxForce=v3(1/0,1/0,1/0),Velocity=(LastHit*v3(1,0,1)-hrp.Position*v3(1,0,1)).Unit*60+v3(0,40,0),Parent=hrp}),.1)
			else
				coroutine.wrap(function()
					for i,v in pairs(HitParts) do
						v.CanCollide=false
					end
					wait(.15)
					for i,v in pairs(HitParts) do
						v.CanCollide=true
					end
				end)()
				Tween(rutj,{C1=cf(0,-.5,0)*angles(30,-20,-50,true)},{.15,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut,0,false,0})
				Instance.Remove(ins("BodyVelocity",{MaxForce=v3(1/0,1/0,1/0),Velocity=(LastHit*v3(1,0,1)-hrp.Position*v3(1,0,1)).Unit*30+v3(0,40,0),Parent=hrp}),.1)
			end
		end
	end
	if LtM then
		hrp.CFrame=cf(hrp.Position,v3(Mouse.Hit.X,hrp.Position.Y,Mouse.Hit.Z))
	end
	Mus=t:FindFirstChild("VMus")
	hum.CameraOffset=hum.CameraOffset:Lerp((hrp.CFrame*cf(0,1.5,0)):PointToObjectSpace(h.Position),.15)
	Sine=Sine+Change
	local Direction=hum.MoveDirection
	if Direction.Magnitude==0 then Direction=hrp.Velocity/7.5 end
	local MoveZ=clamp((Direction*ft.CFrame.LookVector).X+(Direction*ft.CFrame.LookVector).Z,-1,1)
	local MoveX=clamp((Direction*ft.CFrame.RightVector).X+(Direction*ft.CFrame.RightVector).Z,-1,1)
	local Moving=(hrp.Velocity*v3(1,0,1)).Magnitude>1
	local VerY=hrp.Velocity.Y
	local StandR,RPos,RNID=Raycast(hrp.CFrame*cf(t.Size.X/4,-t.Size.Y/2,0).Position,-t.CFrame.UpVector,{char},4,false)
	local StandL,LPos,LNID=Raycast(hrp.CFrame*cf(-t.Size.X/4,-t.Size.Y/2,0).Position,-t.CFrame.UpVector,{char},4,false)
	local Stand=StandR or StandL
	if not Moving and Stand then
		local IdleVal=20
		Change=1*(Step*60)
		if not Dancing then
			nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(cos(Sine/IdleVal)*-9,cotan(Sine/(IdleVal*4))*5,cos(Sine/(IdleVal*3))*-10,true)*(Sitting and angles(-15,15,5,true) or Crying and angles(-50,0,0,true) or CFrame.Angles(math.rad(0),math.rad(-10),math.rad(0))),.1*(Step*60))
			rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,sin(Sine/IdleVal)*.07,cos(Sine/(IdleVal*1.5))*.05)*angles(sin(Sine/IdleVal)*2+cos(Sine/(IdleVal*1.5)),cos(Sine/(IdleVal*1.5))*3,cotan(Sine/(IdleVal*3))*5,true)*(Sitting and cf(0,-1.65,0)*angles(20,-25,0,true) or Crying and cf(0,-1.9,1)*angles(-15,0,0,true) or CFrame.Angles(math.rad(0),math.rad(10),math.rad(0))),.1*(Step*60))
--[[wat--]]	rs.C0=rs.C0:Lerp(rsC0*cf(0,-.05+cos(Sine/IdleVal)*-.05-.05+cotan(Sine/(IdleVal*3))*.05,0)*cf(0,.25,-0.5)*angles(cos(Sine/IdleVal)*-2+sin(Sine/(IdleVal*1.5))*1+cotan(Sine/(IdleVal*1.5))*-3+sin(Sine/(IdleVal*1.5))*-2,sin(Sine/(IdleVal*1.5))*-3,sin(Sine/(IdleVal*3))*-3+1+cos(Sine/IdleVal)*-1,true)*cf(0,-.25,0)*((Sitting or Crying) and cf(-0.1,-0.1,0.05) or CFrame.new(-0.35,-0.2,-0.15))*(Sitting and cf(0,-0.35,0.1)*angles(-30,0,10,true)*angles(0,-50,0,true) or Crying and cf(-0.25,-0.4,-0.5)*angles(100,0,-80,true)*angles(0,70,0,true) or CFrame.Angles(math.rad(0),math.rad(90),math.rad(0))*CFrame.Angles(math.rad(90),math.rad(-70),math.rad(0))),.1*(Step*60))
			ls.C0=ls.C0:Lerp(lsC0*cf(0,-.05+cos(Sine/IdleVal)*-.05-.05+cotan(Sine/(IdleVal*3))*-.05,0)*cf(0,.25,0.7)*angles(cos(Sine/IdleVal)*-2+sin(Sine/(IdleVal*1.5))*1+cotan(Sine/(IdleVal*1.5))*3+sin(Sine/(IdleVal*1.5))*2,sin(Sine/(IdleVal*1.5))*-3,sin(Sine/(IdleVal*3))*-3-1+cos(Sine/IdleVal)*1,true)*cf(0,-.25,0)*((Sitting or Crying) and cf(0.1,-0.1,0.05) or CFrame.new(0.1,-0.1,0.05))*(Sitting and cf(0.3,-0.25,-0.1)*angles(70,0,60,true) or Crying and cf(0.25,-0.4,-0.5)*angles(100,0,70,true)*angles(0,-70,0,true) or CFrame.Angles(math.rad(0),math.rad(-20),math.rad(60))),.1*(Step*60))
			rh.C0=rh.C0:Lerp(rhC0*cf(0,-sin(Sine/IdleVal)*.05+clamp(cotan(Sine/(IdleVal*3))*-.05,0,.05),-.025+cos(Sine/(IdleVal*1.5))*-.025)*angles(sin(Sine/IdleVal)*-3+cos(Sine/(IdleVal*1.5))*-1.5+cos(Sine/(IdleVal*1.5))*-1-.5+cos(Sine/(IdleVal*1.5))*.5,0,cotan(Sine/(IdleVal*3))*-7.5,true)*cf(0,0,-0.05)*(Sitting and angles(70,15,-10,true) or Crying and cf(0,1.25,-0.45)*angles(50,5,-5,true) or CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(-12.5),math.rad(5))),.1*(Step*60))
			lh.C0=lh.C0:Lerp(lhC0*cf(0,-sin(Sine/IdleVal)*.05+clamp(cotan(Sine/(IdleVal*3))*.05,0,.05),-.025+cos(Sine/(IdleVal*1.5))*-.025)*angles(sin(Sine/IdleVal)*-3+cos(Sine/(IdleVal*1.5))*-1.5+cos(Sine/(IdleVal*1.5))*1-.5+cos(Sine/(IdleVal*1.5))*.5,0,cotan(Sine/(IdleVal*3))*-7.5,true)*(Sitting and cf(0,0.9,-0.65)*angles(20,5,0,true) or Crying and cf(0,1.1,-0.5)*angles(60,-10,7,true) or CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(7.5),math.rad(-5))),.1*(Step*60))	
			tw.C0=tw.C0:Lerp(thC0*angles(-10,0,0,true),.1*(Step*60))
		else
			IdleVal=15
			nec.C0=nec.C0:Lerp(necC0*angles(-5+sin(Sine/(IdleVal/4))*5,(-cos(Sine/(IdleVal))*sin(Sine/(IdleVal/4)))*30,0,true),.1*(Step*60))
			rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,-1,0)*cf(0,-.25-(cotan(Sine/IdleVal)*cos(Sine/(IdleVal/3)))*.5,0)*angles(5-cos(Sine/(IdleVal/2))*5,(cos(Sine/(IdleVal/2))*sin(Sine/IdleVal))*30,0,true)*cf(0,1,0),.1*(Step*60))
			rs.C0=rs.C0:Lerp(rsC0*cf(-.2-(cos(Sine/(IdleVal/2))*sin(Sine/(IdleVal*2)))*.5,-.25-sin(Sine/(IdleVal/4))*.4,-.4-sin(Sine/(IdleVal/4))*.25+(cos(Sine/(IdleVal/2))*sin(Sine/IdleVal))*.2)*angles((-cos(Sine/(IdleVal/2))*cos(Sine/IdleVal))*60+(cos(Sine/(IdleVal/2))*sin(Sine/(IdleVal*2)))*45,cotan(Sine/(IdleVal))*cos(Sine/(IdleVal/2))*120+(cos(Sine/(IdleVal/2))*sin(Sine/(IdleVal*2)))*30,-cos(Sine/(IdleVal/4))*20,true)*angles(90,0,0,true),.1*(Step*60))
			ls.C0=ls.C0:Lerp(lsC0*cf(.2+(cos(Sine/(IdleVal/2))*sin(Sine/(IdleVal*2)))*.5,-.25-sin(Sine/(IdleVal/4))*.4,-.4-sin(Sine/(IdleVal/4))*.25+(cos(Sine/(IdleVal/2))*sin(Sine/IdleVal))*.2)*angles((-cos(Sine/(IdleVal/2))*cos(Sine/IdleVal))*60+(cos(Sine/(IdleVal/2))*sin(Sine/(IdleVal*2)))*45,cotan(Sine/(IdleVal))*cos(Sine/(IdleVal/2))*120-(cos(Sine/(IdleVal/2))*sin(Sine/(IdleVal*2)))*30,cos(Sine/(IdleVal/4))*20,true)*angles(90,0,0,true),.1*(Step*60))
			rh.C0=rh.C0:Lerp(rhC0*cf(0,.15-(cotan(Sine/IdleVal)*cos(Sine/(IdleVal/3)))*-.5+clamp(sin(Sine/(IdleVal))*cos(Sine/(IdleVal/2)),.1,1)*.5,-.25+(cotan(Sine/IdleVal)*cos(Sine/(IdleVal/3)))*.25-clamp(sin(Sine/(IdleVal))*cos(Sine/(IdleVal/2)),0,1)*.35)*angles(-2.5+(cos(Sine/(IdleVal/2))*sin(Sine/IdleVal))*-5+(-5+(cotan(Sine/IdleVal)*cos(Sine/(IdleVal/3)))*2.5)-clamp(sin(Sine/(IdleVal))*cos(Sine/(IdleVal/2)),0,1)*25,(cos(Sine/(IdleVal/2))*sin(Sine/IdleVal))*-30,0,true)*angles(0,-5,5,true),.1*(Step*60))
			lh.C0=lh.C0:Lerp(lhC0*cf(0,.15-(cotan(Sine/IdleVal)*cos(Sine/(IdleVal/3)))*-.5-clamp(sin(Sine/(IdleVal))*cos(Sine/(IdleVal/2)),-1,.1)*.5,-.25-(cotan(Sine/IdleVal)*cos(Sine/(IdleVal/3)))*.25+clamp(sin(Sine/(IdleVal))*cos(Sine/(IdleVal/2)),-1,0)*.35)*angles(-2.5+(cos(Sine/(IdleVal/2))*sin(Sine/IdleVal))*5+(-5-(cotan(Sine/IdleVal)*cos(Sine/(IdleVal/3)))*2.5)+clamp(sin(Sine/(IdleVal))*cos(Sine/(IdleVal/2)),-1,0)*25,(cos(Sine/(IdleVal/2))*sin(Sine/IdleVal))*-30,0,true)*angles(0,5,-5,true),.1*(Step*60))
			tw.C0=tw.C0:Lerp(thC0,.1*(Step*60))
		end
	elseif Moving and Stand then
		local WSVal=6/clamp(hum.WalkSpeed/16,.25,2)*t.Size.Y/2
		local WSMul=(1+(WSVal/4))
--[[what--]]		Change=1*(Step*60)
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(sin(Sine/(WSVal/2))*2.5,0,0,true)*cf(0,0,0)*angles(5*MoveZ,-60*MoveX,0,true),(.2--[[.2--]]/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)*(Step*60))
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,-3,0)*angles(VerY*2.5*MoveZ,0,VerY*2.5*MoveX,true)*cf(0,3,0)*cf(0,.75*cos(Sine/(WSVal/2)),0)*angles(cotan(Sine/(WSVal/2))*22.5,sin(Sine/WSVal)*10,0,true)*cf(0,0,0)*angles(-10*MoveZ,0,-10*MoveX,true),(.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)*(Step*60))
		rs.C0=rs.C0:Lerp(rsC0*cf(0.2,0,.5*sin(Sine/WSVal)*MoveZ)*angles(-cotan(Sine/WSVal)*220*MoveZ,0,0,true)*angles(0,-cotan(Sine/WSVal)*70*MoveZ,0,true)*cf(-.15,0,0)*angles(10,0,-10*abs(MoveZ),true),(.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)*(Step*60))
		ls.C0=ls.C0:Lerp(lsC0*cf(-0.2,0,-.5*sin(Sine/WSVal)*MoveZ)*angles(cotan(Sine/WSVal)*220*MoveZ,0,0,true)*angles(0,-cotan(Sine/WSVal)*70*MoveZ,0,true)*cf(.15,0,0)*angles(10,0,10*abs(MoveZ),true),(.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)*(Step*60))
		rh.C0=rh.C0:Lerp(rhC0*cf(0,.1+.75*cos(Sine/WSVal),-.2-.9*cos(Sine/WSVal))*angles(cotan(Sine/WSVal)*290*MoveZ,0,cotan(Sine/WSVal)*160*MoveX,true)*cf(0,0,0)*angles(-7.5*abs(MoveZ),0,0,true),(.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)*(Step*60))
		lh.C0=lh.C0:Lerp(lhC0*cf(0,.1+-.75*cos(Sine/WSVal),-.2+.9*cos(Sine/WSVal))*angles(-cotan(Sine/WSVal)*290*MoveZ,0,-cotan(Sine/WSVal)*160*MoveX,true)*cf(0,0,0)*angles(-7.5*abs(MoveZ),0,0,true),(.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)*(Step*60))
		tw.C0=tw.C0:Lerp(thC0,(.2/(t.Size.Y/2)*(hum.WalkSpeed/16)/3)*(Step*60))
	elseif not Stand then
		Change=1*(Step*60)
		nec.C0=nec.C0:Lerp(necC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-15,15),0,0,true),.2*(Step*60))
		rutj.C0=rutj.C0:Lerp(rutjC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,0,0)*angles(clamp(hrp.Velocity.Y,-30,20),0,0,true),.2*(Step*60))
		rs.C0=rs.C0:Lerp(rsC0*cf(0,0,0)*angles(0,5,-7.5,true)*cf(-(clamp(hrp.Velocity.Y/20,-.45,0)),0,0)*angles((clamp(hrp.Velocity.Y*4,0,150)),0,-(clamp(hrp.Velocity.Y*4,-120,0)),true),.1*(Step*60))
		ls.C0=ls.C0:Lerp(lsC0*cf(0,0,0)*angles(0,-5,7.5,true)*cf((clamp(hrp.Velocity.Y/20,-.45,0)),0,0)*angles((clamp(hrp.Velocity.Y*4,0,150)),0,(clamp(hrp.Velocity.Y*4,-120,0)),true),.1*(Step*60))
		rh.C0=rh.C0:Lerp(rhC0*cf(0,0,0)*angles(0,0,0,true)*cf(0,.4,-.35)*angles(-10,-5,5,true),.2*(Step*60))
		lh.C0=lh.C0:Lerp(lhC0*cf(0,0,0)*angles(clamp(-hrp.Velocity.Y,-25,35),0,0,true)*cf(0,.2,-.15)*angles(-2.5,5,-5,true),.2*(Step*60))
		tw.C0=tw.C0:Lerp(thC0,.2*(Step*60))
	end
	nec.C1=nec.C1:Lerp(necC1,.2*(Step*60))
	rutj.C1=rutj.C1:Lerp(rutjC1,.2*(Step*60))
	rs.C1=rs.C1:Lerp(rsC1,.2*(Step*60))
	ls.C1=ls.C1:Lerp(lsC1,.2*(Step*60))
	rh.C1=rh.C1:Lerp(rhC1,.2*(Step*60))
	lh.C1=lh.C1:Lerp(lhC1,.2*(Step*60))
	necC0,necC1=cf(0,t.Size.Y/2,0),cf(0,-h.Size.Y/2,0)
	rutjC0,rutjC1=cf(0,0,0),cf(0,0,0)
	rsC0,rsC1=cf(t.Size.X/2,t.Size.Y/4,0),cf(-ra.Size.X/2,ra.Size.Y/4,0)
	lsC0,lsC1=cf(-t.Size.X/2,t.Size.Y/4,0),cf(la.Size.X/2,la.Size.Y/4,0)
	rhC0,rhC1=cf(t.Size.X/4,-t.Size.Y/2,0),cf(0,rl.Size.Y/2,0)
	lhC0,lhC1=cf(-t.Size.X/4,-t.Size.Y/2,0),cf(0,ll.Size.Y/2,0)
	thC0=cf(-ra.Size.X/5,-ra.Size.Y/2+.1,0)
	fh.Size,ft.Size,fra.Size,fla.Size,frl.Size,fll.Size=h.Size,t.Size,ra.Size,la.Size,rl.Size,ll.Size
	if AttTarget then
		local Dead=0
		local ToRemove={}
		for i,v in pairs(Swords) do
			if AttTarget[2].Health<.1 then break end
			if v[7] or not v[1] then Dead+=1 table.insert(ToRemove,i) continue end
			CrossClient.SummonDamage(v[1].Position)
			if not v[4] then
				SAttacks[random(1,#SAttacks)](Swords[i],AttTarget[2],AttTarget[1],i)
			end
		end
		if Dead==#Swords then
			Swords={}
		elseif Dead>0 then
			for i,v in pairs(ToRemove) do
				if Swords[v][1] and Swords[v][1].Parent then CrossClient.SD(Swords[v][1].Position,Swords[v][1].Velocity) end
				Instance.Remove(Swords[v][1])
				table.remove(Swords,v)
			end
		end
		if AttTarget[2].Health<.1 then for i,v in pairs(Swords) do if v[8] then v[8]:Cancel() end Swords[i][2],Swords[i][4]=false,false end end
		if #Swords<1 then AttTarget=nil AttTargets=nil end
		if #Swords>1 and AttTarget[2].Health<.1  then AttTargetNum+=1 if AttTargetNum>#AttTargets then AttTarget=nil AttTargets=nil for i,v in pairs(Swords) do Swords[i][4]=false end end if AttTargets then AttTarget={AttTargets[AttTargetNum][1],AttTargets[AttTargetNum][2]}  end end
		CrossClient.UpdateSwords(Swords)
	end
	for i,v in pairs(Swords) do
		if v[2] then continue end
		if not v[1] or not v[1].Parent or not v[1]:FindFirstChild("BP") then table.remove(Swords,i) continue end
		local Change=i/2==floor(i/2)
		local Off=cf(Change and -.5 or .5,.65,1.25+i/1.5)
		local CF=t.CFrame*angles(0,Change and -15 or 15,0,true)*Off*angles(180-(5*i),0,0,true)*cf(0,sin(Sine/15+i)*.25,-cos(Sine/15+i)*.25)*angles(cos((Sine/15+i)/2)*15,0,0,true)
		v[1].BP.Position=CF.Position
		v[1].BG.CFrame=CF
	end
	
end)

wait(1/30)

--[[
_G.songs = true

local customasset

local function nosong(song)
song = "rbxassetid://9439223599"

return(song)

end
if not getsynasset and _G.songs == true then
customasset = getcustomasset

elseif getsynasset and _G.songs == false then
customasset = nosong
elseif getsynasset and _G.songs == true then
customasset = getsynasset

elseif not getsynasset and _G.songs == false then
customasset = nosong
end

local sound69 = Instance.new("Sound",game.Players.LocalPlayer.Character.Torso)
sound69.Looped = false
sound69.Playing = true
sound69.Volume = 2
sound69.SoundId = customasset("KAFIR GAMER.mp3")
--]]
