script = game:GetObjects("rbxassetid://10012557531")[1].Nullioner
script.Parent = game.Players.LocalPlayer.Character
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end,CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end,},{__index=math,})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end,},{__index=CFrame,})
local Instance=setmetatable({new=function(type,args) local instance=Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent=args elseif string.lower(typeof(args))=="table" then for i,v in pairs(args) do pcall(function() instance[i]=v end) end end end return instance end,Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance,})
local Player,UIS,Mouse=game:GetService("Players").LocalPlayer,game:GetService("UserInputService")
Mouse=Player:GetMouse()
local Rem=script.Scripts.Input
local InfoRef=Rem.InfoRef
local Values=script.Values
local HeadFollow=(Values.HeadFollow or{Value=false}).Value
local Resetted=false
local Camera=workspace.CurrentCamera
local Char=Player.Character
local H=Char.Head
local Hum=Char:FindFirstChildOfClass("Humanoid")
local HRP=Char.HumanoidRootPart
local CSFuncs={Events={},Functions={}}
function CreateCSFunc(Type,Name,Func)
	if CSFuncs[Type.."s"] then
		CSFuncs[Type.."s"][Name]=Func
		return Func
	end
end
function CSFire(self,AT,Name,...)
	if not self then return end
	if AT=="S" then
		return Rem:FireServer(nil,false,AT,Name,{...})
	elseif AT=="R" then
		return InfoRef:InvokeServer(AT,Name,{...})
	end
end
function CSTrig(self,Type,Name,...)
	if not self then return end
	if CSFuncs[Type.."s"] and CSFuncs[Type.."s"][Name] then
		return CSFuncs[Type.."s"][Name](...)
	end
end
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(Ray.new(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
end
CSFuncs.new=CreateCSFunc
CSFuncs.Fire=CSFire
CSFuncs.Trigger=CSTrig
--// Free space for CrossServer functions \\
local TurnToggled=false
local Bullets=Char:WaitForChild("Effects")
local function Connect(Model)
	Model.ChildAdded:Connect(function(Child)
		if Child.Name=="Bullet" then
			local Ignore={Char}
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Accessory") or v:IsA("Hat") or v.Name=="BulletImpact" or v.Name=="PhysicalSpark" then
					table.insert(Ignore,v)
				end
			end
			local RHit,RPos,RNID=Raycast(Child.Position,Child.CFrame.LookVector,Ignore,75,true)
			if RHit then
				Child.Name="DeadBullet"
				Child.Anchored=true
				Child.CFrame=CFrame.new(RPos)
				CSFuncs:Fire("S","ApproveHit",Child,RHit,RPos,RNID,Child.CFrame.LookVector)
			end
			Instance.new("BodyVelocity",{Parent=Child;MaxForce=Vector3.new(500000,500000,500000);Velocity=Child.CFrame.LookVector*1650})
		end
	end)
end
Connect(Bullets)
CSFuncs.new("Event","TurnToMouse",function()
	HRP.CFrame=CFrame.new(HRP.Position,Vector3.new(Mouse.Hit.X,HRP.Position.Y,Mouse.Hit.Z))
end)
CSFuncs.new("Event","ToggleTTM",function(Bool)
	TurnToggled=Bool
end)
CSFuncs.new("Event","CamBump",function()
	local Time=math.random(.25,.5,1000)
	local Blur=Instance.new("BlurEffect",{Parent=game:GetService("Lighting"),Size=math.random(10,15,10)})
	Instance.Remove(Blur,Time)
	Tween(Blur,{Size=0},{Time,Enum.EasingStyle.Cubic,Enum.EasingDirection.Out,0,false,0})
	for i=1,math.random(2,4) do
		Tween(Camera,{CFrame=Camera.CFrame*CFrame.Angles(.35,0,0,true)*CFrame.Angles(math.random(-1,1,100),math.random(-1,1,100),math.random(-1,1,100),true)},{.03,Enum.EasingStyle.Back,Enum.EasingDirection.InOut,0,true,0})
		game:GetService("RunService").RenderStepped:Wait()
	end
end)
Char.ChildAdded:Connect(function(Child)
	if Child.Name=="Effects" then
		Bullets=Child
		Connect(Bullets)
	end
end)
UIS.InputBegan:Connect(function(IO,L) Rem:FireServer({UserInputState=IO.UserInputState,KeyCode=IO.KeyCode,UserInputType=IO.UserInputType},L) end)
UIS.InputEnded:Connect(function(IO,L) Rem:FireServer({UserInputState=IO.UserInputState,KeyCode=IO.KeyCode,UserInputType=IO.UserInputType},L) end)
game:GetService("RunService").Heartbeat:Connect(function()
	HeadFollow=(Values.HeadFollow or{Value=false}).Value
	if HeadFollow then
		Resetted=false
		Hum.CameraOffset=Hum.CameraOffset:Lerp((HRP.CFrame*CFrame.new(0,1.5,0)):PointToObjectSpace(H.Position),.125)
	elseif not HeadFollow and not Resetted then
		Resetted=true
		Hum.CameraOffset=Vector3.new()
	end
	if TurnToggled then
		HRP.CFrame=CFrame.new(HRP.Position,Vector3.new(Mouse.Hit.X,HRP.Position.Y,Mouse.Hit.Z))
	end
	local Table=Bullets:GetChildren()
	local Ignore={Char}
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("Accessory") or v:IsA("Hat") or v.Name=="BulletImpact" or v.Name=="PhysicalSpark" then
			table.insert(Ignore,v)
		end
	end
	for i=1,#Table do
		local v=Table[i]
		if v.Name=="Bullet" then
			local RHit,RPos,RNID=Raycast(v.Position,v.Velocity,Ignore,75,true)
			if RHit then
				v.Name="DeadBullet"
				v.Anchored=true
				CSFuncs:Fire("S","ApproveHit",v,RHit,RPos,RNID,v.Velocity)
			end
		end
	end
end)
Rem.OnClientEvent:Connect(function(Name,...)
	return CSFuncs:Trigger("Event",Name,...)
end)
InfoRef.OnClientInvoke=function(Name,...)
	return CSFuncs:Trigger("Function",Name,...)
end
while wait(1/30) do
	Rem:FireServer({Mouse=true,Hit=Mouse.Hit,Target=Mouse.Target,Origin=Mouse.Origin})
end
