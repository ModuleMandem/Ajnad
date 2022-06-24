--Crossclient


script = game:GetObjects("rbxassetid://10012903397")[1].Vancuit
script.Parent = game.Players.LocalPlayer.Character

local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end;CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end;},{__index=math;})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;},{__index=CFrame;})
local Instance=setmetatable({new = function(type,args) local instance = Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent = args elseif string.lower(typeof(args)) == "table" then for i,v in pairs(args) do pcall(function() instance[i] = v end) end end end return instance end;Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance;})
local Player,UIS=game:GetService("Players").LocalPlayer,game:GetService("UserInputService") local Mouse=Player:GetMouse()
local Client=script.Data.Scripts.SClient
CrossClient = {}

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
--}{		Useful Functions	   }{--
function Tween(Object,Args,Info)
	if Object and Args then
		Info = Info or TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.In,0,false,0)
		if typeof(Info) == "table" then Info = TweenInfo.new(unpack(Info)) end
		game:GetService("TweenService"):Create(Object,Info,Args):Play()
	end
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
function Raycast(Origin,Direction,Blacklist,MaxDistance,IgnoreWater)
	return workspace:FindPartOnRayWithIgnoreList(ray(Origin,Direction.Unit*MaxDistance),Blacklist or {},false,IgnoreWater)
end
function Lerp(a,b,t)
	return a+(b-a)*t
end
--// Character indexing
Char,char=Player.Character,Player.Character
local Hum,hum=Char:FindFirstChildOfClass("Humanoid"),Char:FindFirstChildOfClass("Humanoid")
local hrp,HRP=Char.HumanoidRootPart,Char.HumanoidRootPart
local h,t,ra,la,rl,ll=char.Head,char.Torso,char["Right Arm"],char["Left Arm"],char["Right Leg"],char["Left Leg"]
local nec,rutj,rs,ls,rh,lh=t.Neck,hrp.RootJoint,t["Right Shoulder"],t["Left Shoulder"],t["Right Hip"],t["Left Hip"]
hum.RequiresNeck=false
local Models,Modules=script.Data.Models,script.Data.Scripts.Modules
local Damage,Ragdoll=require(Modules.Damage),require(Modules.Ragdoll)
--
local Muted,Firing=false,false
local OTick=tick()
local TimePos=0
local ShardCastSounds={2605256561,3025855177}
local Songs={{4476249256,.57,.5},{6078491339,1,.5},{5640306218,1,.5},{4102155984,1,.5},{5362030098,1,.5},{5921747599,1,.5},{4102169069,1,.5},{6140681907,1,.5},{4660743645,1,.5},{5944081580,1,.5},{1113149887,1,.5},{2576808051,1,.5},{6065535768,1,.5},{6108653773,1,.5},{6012657271,1,.5},{3450285734,1,.5},{511859487,1,.5}}
local SongPos=random(1,#Songs)
local Shards={}
local FireRate,Ammo,MaxAmmo,FireTick=600,50,50,tick()
--
local GN=Models.PlsmGn
local Mag=GN.Mag
local Barl=GN.Barrel
local MagPoof=Mag.Poof
GN.Parent=t
GN.Handle.CFrame=ra.CFrame
local Mus=Sound(Songs[SongPos][1],Songs[SongPos][3],Songs[SongPos][2],t,100,5,true)
local FiringV=ins("BoolValue",{Name="FiringVV",Parent=Client})
local AmmoV=ins("NumberValue",{Name="Ammo",Value=MaxAmmo,Parent=Client})
local FocusV=ins("ObjectValue",{Name="Focus",Value=nil,Parent=Client})
local BPa=ins("Part",{Transparency=1,CanCollide=false,Anchored=true,CFrame=cf(0,-5,0),Parent=t})
for i,v in pairs(GN:GetDescendants()) do
	if v:IsA("Script") then
		v.Disabled=false
	end
end
--
ins("NoCollisionConstraint",{Part0=t,Part1=h,Parent=t})
--
pcall(function()
	game:GetService("PhysicsService"):CreateCollisionGroup("FakeRep")
end)
pcall(function()
	game:GetService("PhysicsService"):CollisionGroupSetCollidable("FakeRep","FakeRep",false)
end)
pcall(function()
	game:GetService("PhysicsService"):SetPartCollisionGroup(hrp,"FakeRep")
end)
for i,v in pairs(char:GetDescendants()) do
	if v:IsA("BasePart") and not v.Anchored then
		pcall(function()
			v:SetNetworkOwner(Player)
		end)
	end
end
for i,v in pairs({h,t,ra,la,rl,ll,GN.Handle}) do
	pcall(function()
		game:GetService("PhysicsService"):SetPartCollisionGroup(v,"FakeRep")
	end)
	local BP=ins("BodyPosition",{MaxForce=v3(huge,huge,huge),P=50000,D=500,Position=v.Position,Name="BP",Parent=v})
	local BG=ins("BodyGyro",{MaxTorque=v3(huge,huge,huge),P=50000,D=500,CFrame=v.CFrame,Name="BG",Parent=v})
end
do
	local P=Models.Shard:Clone()
	P.CFrame=GN.Handle.CFrame
	P.BPS.Position=GN.Handle.Position
	P.SparkColour.Value=rgb(255,150,255)
	for i,v in pairs(P:GetDescendants()) do
		if (v:IsA("Trail") or v:IsA("ParticleEmitter")) then
			v.Color=cs(rgb(255,150,255))
		elseif v:IsA("Light") then
			v.Color=rgb(255,150,255)
		elseif v:IsA("Script") then
			v.Disabled=false
		end
	end
	P.Parent=h
	P:SetNetworkOwner(Player)
	table.insert(Shards,{P,v3(),P.BPS,{.1,2,0},v3(),tick(),v3(),v3()})
end
Mus.Parent=Shards[1][1]
--
local function NewBeamRing(CF,Size,Width,Ang,Trans,Col,SizeT,WidthT,AngT,TransT,ColT,Time,Style,Dir)
	assert(CF,"no cframe given")
	Size,Width,Ang,Trans,Col,SizeT,WidthT,AngT,TransT,ColT,Time,Style,Dir=Size or 5,Width or 1,Ang or 90,Trans or 0,Col or c3(1,1,1),SizeT or 10,WidthT or 5,AngT or 0,TransT or 1,ColT or c3(1,1,1),Time or 1.5,Style or Enum.EasingStyle.Back,Dir or Enum.EasingDirection.Out
	local P=Models.NewBeamRing:Clone()
	local TV,CV=ins("NumberValue",{Value=Trans}),ins("Color3Value",{Value=Col})
	local A1,A2,A3,A4=P.A1,P.A2,P.A3,P.A4
	local B1,B2,B3,B4=P.B1,P.B2,P.B3,P.B4
	P.CFrame=CF
	A1.Position,A2.Position,A3.Position,A4.Position=v3(0,0,Size/2),v3(0,0,-Size/2),v3(Size/2,0,0),v3(-Size/2,0,0)
	A1.Orientation,A2.Orientation,A3.Orientation,A4.Orientation=v3(Ang,0,0),v3(Ang,-180,0),v3(Ang,90,0),v3(Ang,-90,0)
	B1.Transparency,B2.Transparency,B3.Transparency,B4.Transparency=ns(Trans),ns(Trans),ns(Trans),ns(Trans)
	B1.Color,B2.Color,B3.Color,B4.Color=cs(Col),cs(Col),cs(Col),cs(Col)  --  v lazy lol
	B1.Width0,B1.Width1,B2.Width0,B2.Width1,B3.Width0,B3.Width1,B4.Width0,B4.Width1=Width*2,Width*2,Width*2,Width*2,Width*2,Width*2,Width*2,Width*2
	B1.CurveSize0,B1.CurveSize1,B2.CurveSize0,B2.CurveSize1,B3.CurveSize0,B3.CurveSize1,B4.CurveSize0,B4.CurveSize1=(Size/2)*.60000000,(Size/2)*.60000000,-(Size/2)*.60000000,-(Size/2)*.60000000,(Size/2)*.60000000,(Size/2)*.60000000,-(Size/2)*.60000000,-(Size/2)*.60000000
	P.Parent=h
	Tween(A1,{Position=v3(0,0,SizeT/2),Orientation=v3(AngT,0,0)},{Time,Style,Dir,0,false,0}) Tween(A2,{Position=v3(0,0,-SizeT/2),Orientation=v3(AngT,180,0)},{Time,Style,Dir,0,false,0}) Tween(A3,{Position=v3(SizeT/2,0,0),Orientation=v3(AngT,90,0)},{Time,Style,Dir,0,false,0}) Tween(A4,{Position=v3(-SizeT/2,0,0),Orientation=v3(AngT,-90,0)},{Time,Style,Dir,0,false,0})
	Tween(TV,{Value=TransT},{Time,Style,Dir,0,false,0}) Tween(CV,{Value=ColT},{Time,Style,Dir,0,false,0})
	Tween(B1,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(SizeT/2)*.6,CurveSize1=(SizeT/2)*.6},{Time,Style,Dir,0,false,0}) Tween(B2,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(SizeT/2)*.60000000,CurveSize1=-(SizeT/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B3,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=(SizeT/2)*.60000000,CurveSize1=(SizeT/2)*.60000000},{Time,Style,Dir,0,false,0}) Tween(B4,{Width0=WidthT*2,Width1=WidthT*2,CurveSize0=-(SizeT/2)*.60000000,CurveSize1=-(SizeT/2)*.60000000},{Time,Style,Dir,0,false,0})
	TV.Changed:Connect(function()
		B1.Transparency,B2.Transparency,B3.Transparency,B4.Transparency=ns(TV.Value),ns(TV.Value),ns(TV.Value),ns(TV.Value)
		B1.Color,B2.Color,B3.Color,B4.Color=cs(CV.Value),cs(CV.Value),cs(CV.Value),cs(CV.Value)
	end)
	if Time>0 then Instance.Remove(P,Time+.25) end
	return P
end
function Fire(Tar,Off)
	Tar=Tar or Mouse.Hit.Position
	if tick()-FireTick<1/(FireRate/60) then return false end
	FireTick=tick()
	FiringV.Value=not FiringV.Value
	Ammo-=1
	Sound(6150716597,1,random(.9,1.1,100),Barl,250,7)
	local S=Models.PlsmShard:Clone()
	S.CFrame=cf(Barl.Position,Tar)
	S.Parent=h
	S:SetAttribute("Offset",Off)
	S:SetNetworkOwner(Player)
	local Hit,Pos,NID=Raycast(Barl.Position,v3(random(-1,1,100),random(-1,1,100),random(-1,1,100)),{char},15,true)
	if Hit then
		local Dist=(Pos-Barl.Position).Magnitude
		local A2=ins("Attachment",{WorldPosition=Pos,Orientation=v3(random(-180,180,10),random(-180,180,10),random(-180,180,10)),Parent=BPa})
		local L=ins("PointLight",{Color=c3(0,1,1),Brightness=0,Shadows=true,Parent=A2})
		local B=ins("Beam",{FaceCamera=true,Transparency=ns(0),Attachment0=Barl.Attachment,Attachment1=A2,Width0=0,Width1=0,LightInfluence=0,LightEmission=1,Color=cs(c3(0,1,1)),Texture="rbxassetid://5943306985",Segments=random(2,4),CurveSize0=random(-Dist,Dist,100),CurveSize1=random(-Dist,Dist,100),Parent=A2})
		Instance.Remove({B,A2},20)
		Tween(L,{Brightness=.5},{.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,true,0})
		Tween(B,{Width0=.5},{.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,true,0})
		Tween(B,{Width1=.5},{.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,true,.05})
		coroutine.wrap(function()
			repeat
				A2.Orientation=v3(random(-180,180,10),random(-180,180,10),random(-180,180,10))
				B.Segments,B.CurveSize0,B.CurveSize1=random(2,4),random(-Dist,Dist,100)/5,random(-Dist,Dist,100)/5
				game:GetService("RunService").Heartbeat:Wait()
			until not B.Parent
		end)()
	end
	return true
end
local function Death(char)
	local Hum=char:FindFirstChildOfClass("Humanoid")
	if #Shards-1<8 then
		local CF=char:FindFirstChildWhichIsA("BasePart") and char:FindFirstChildWhichIsA("BasePart").CFrame or GN.CFrame
		local P=Models.Shard:Clone()
		P.CFrame=CF
		P.BPS.Position=CF.Position
		P.Parent=h
		P:SetNetworkOwner(Player)
		table.insert(Shards,{P,v3(),P.BPS,{.1,2,0},v3(),tick(),v3(),v3()})
		CrossClient:FireClient("Event","UpdateShards",Shards)
		for i,v in pairs(P:GetDescendants()) do
			if v:IsA("Script") then
				v.Disabled=false
			end
		end
	end
	coroutine.wrap(function()
		wait(random(.5,1,100))
		local Dir=v3(random(-25,25,10),random(0,15,100),random(-25,25,10))
		for i,v in pairs(char:GetChildren()) do
			if v:IsA("BasePart") then
				local Col=c3(0,1,1)
				v:ClearAllChildren()
				v.Transparency=1
				v.Size=v3()
				local Vap=Models.CrackVap:Clone()
				local L=ins("PointLight",{Range=15,Brightness=.75,Shadows=true,Color=Col,Parent=v})
				Tween(L,{Brightness=0},{2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out,0,false,0})
				Vap.Acceleration=Dir
				Vap.VelocityInheritance=random(.1,.25,100)
				Vap.Color=cs(Col)
				Vap.Parent=v
				Vap:Emit(random(5,7))
				Instance.Remove(v,2)
				Sound(3264923,.7,random(.8,1.1,100),v,150,5)
				wait(random(.03,.06,1000))
			else
				Instance.Remove(v)
			end
		end
	end)()
	Ragdoll:Ragdollify(char,true)
end
Damage:SetGlobalDeathEffectFunction(Death)
--
CrossClient:AddFunction("Event","FireUp",function(b)
	Firing=b
end)
CrossClient:AddFunction("Event","UpdateShards",function(T)
	Shards=T
end)
CrossClient:AddFunction("Event","AddAmmo",function()
	Sound(282061033,random(1,1.25,100),random(.9,1.1,100),Mag,100,5)
	MagPoof:Emit(random(5,15))
	Ammo+=15
	for i=1,random(0,2) do
		NewBeamRing(cf(Mag.Position)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),random(0,1,100),random(4,8,100),-180,.35,c3(0,1,1),random(7,25,100),random(0,1,100),0,1,c3(0,1,1),random(.05,.25,100),Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
	end
end)
CrossClient:AddFunction("Event","ShardSound",function(P)
	local p=ins("Part",{Size=v3(),CanCollide=false,Anchored=true,CFrame=P.CFrame,Transparency=1,Parent=h})
	local S=Sound(ShardCastSounds[random(1,#ShardCastSounds)],random(1.5,2.25,100),random(.9,1.1,100),p,200,6)
	Instance.Remove(p,S.TimeLength)
	for i=1,random(1,3) do
		NewBeamRing(cf(P.Position)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),random(0,1,100),random(4,8,100),-180,.35,c3(0,1,1),random(7,25,100),random(0,1,100),0,1,c3(0,1,1),random(.05,.25,100),Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
	end
end)
CrossClient:AddFunction("Event","Register",function(P,NID,D,DS,Pa)
	D,DS=D or 10,DS or 5
	if typeof(D)=="Instance" then
		Pa=D
		D,DS=10,5
	end
	local P_=ins("Part",{Size=v3(),Anchored=true,CanCollide=false,Transparency=1,CFrame=cf(P+NID/2,P-NID)*angles(pi/2,0,0),Parent=h})
	local L=ins("PointLight",{Range=5,Brightness=1,Shadows=true,Color=c3(0,1,1),Parent=P_})
	local S=Sound(3848679789,2.5,random(.9,1.1,100),P_,300,8)
	Instance.Remove(P_,S.TimeLength-.2)
	Tween(L,{Brightness=0,Range=20},{.25,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0})
	Damage.new(P,(Pa and Pa:GetAttribute("Offset")) and 20 or 5,D,DS,20,5,{char}):Check()
	for i=1,random(1,3) do
		NewBeamRing(cf(P)*angles(random(-180,180,10),random(-180,180,10),random(-180,180,10),true),random(0,1,100),random(4,8,100),-180,.35,c3(0,1,1),random(7,15,100),random(3,5,100),0,1,c3(0,1,1),random(.05,.25,100),Enum.EasingStyle.Sine,Enum.EasingDirection.Out)
	end
end)
CrossClient:AddFunction("Event","DJPlat",function()
	local T=random(.1,.2,100)
	local P=Models.DJPlat:Clone()
	P.CFrame=cf(hrp.Position)*cf(0,-1,0)*cf(hrp.Velocity*v3(.5,.1,.5))
	P.Parent=h
	Sound(845572880,1.5,random(.9,1.1,100),P,150,8)
	Sound(5121746630,1.5,random(.9,1.1,100),P,70,6).TimePosition=.25
	P.SpikyWave.Lifetime=nr(T)
	P.Wave.Lifetime=nr(T)
	P.SpikyWave:Emit(1)
	P.Wave:Emit(1)
	Instance.Remove(P,1)
end)
CrossClient:AddFunction("Event","bop",function(type)
	for i,v in pairs(Shards) do
		v[1][type]:Emit(1)
	end
end)
CrossClient:AddFunction("Event","GrabnShoot",function(Tor,H)
	H.PlatformStand=true
	coroutine.wrap(function()
		wait(random(3,5,10))
		if H.PlatformStand then
			H.PlatformStand=false
		end
	end)()
	for i,v in pairs(Tor.Parent:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide then
			Instance.Remove({ins("NoCollisionConstraint",{Part0=t,Part1=v,Parent=v}),ins("NoCollisionConstraint",{Part0=h,Part1=v,Parent=v})},.9)
		end
	end
	local W=ins("Motor6D",{Part0=la,Part1=Tor,C0=cf(0,-ra.Size.Y/2,0)*angles(-90,180,0,true),Parent=la})
	wait(.85)
	W:Destroy()
	Instance.Remove(ins("BodyVelocity",{MaxForce=v3(huge,huge,huge),Velocity=hrp.CFrame.LookVector*v3(60,0,60)+v3(0,75,0),Parent=Tor}),.1)
	FocusV.Value=Tor
	wait(.2)
	local Buls=random(4,8)
	if Ammo<=0 then FocusV.Value=nil return nil end
	repeat
		local S=Fire(Tor.Position+Tor.Velocity/10+v3(0,-2,0),true)
		if S then Buls-=1 end
		game:GetService("RunService").Heartbeat:Wait()
	until Buls==0 or Ammo<=0 or H.Health==0
	FocusV.Value=nil
end)
CrossClient:AddFunction("Event","UpdateSongPos",function(Num)
	Mus.TimePosition=Num
end)
--
UIS.InputBegan:Connect(nil,function(IO,L)
	if L then return end
	if IO.UserInputType==Enum.UserInputType.Keyboard then
		if IO.KeyCode==Enum.KeyCode.M then
			Muted=not Muted
		elseif IO.KeyCode==Enum.KeyCode.N then
			SongPos+=1
		elseif IO.KeyCode==Enum.KeyCode.B then
			SongPos-=1
		end
		if SongPos>#Songs then SongPos=1 elseif SongPos<1 then SongPos=#Songs end
	end
end)
UIS.InputEnded:Connect(nil,function(IO,L)
	if L then return end
	if IO.UserInputType==Enum.UserInputType.Keyboard then
	elseif IO.UserInputType==Enum.UserInputType.MouseButton1 then
		Firing=false
	end
end)
game:GetService("RunService").Heartbeat:Connect(function()
	if Firing and tick()-FireTick>1/(FireRate/60) then if Ammo==0 then FireTick=tick() Firing=false FiringV.Name="OOA" return end  Fire() end
	AmmoV.Value=Ammo
	FiringV.Name=Ammo==0 and "OOA" or "FiringVV"
	if not Shards[1][1].Parent then
		local P=Models.Shard:Clone()
		P.CFrame=GN.Handle.CFrame
		P.BPS.Position=GN.Handle.Position
		for i,v in pairs(P:GetDescendants()) do
			if v:IsA("Trail") or v:IsA("ParticleEmitter") then
				v.Color=cs(rgb(255,150,255))
			elseif v:IsA("Light") then
				v.Color=rgb(255,150,255)
			end
		end
		P.Parent=h
		P:SetNetworkOwner(Player)
		Shards[1]={P,v3(),P.BPS,{.1,2,0},v3(),tick(),v3(),v3()}
		CrossClient:FireClient("Event","UpdateShards",Shards)
	end
	if Ammo~=MaxAmmo and tick()-FireTick>2 then
		Ammo+=1
	end
	for i,v in pairs(Mag:GetChildren()) do
		if v:IsA("Texture") and v.Name=="Side" then
			v.OffsetStudsV=-.9-(Ammo/MaxAmmo)*.775
		elseif v:IsA("Texture") and v.Name=="Bottom" then
			v.Transparency=Ammo==MaxAmmo and 1 or 0
		end
	end
	if Mus and Mus.Parent~=Shards[1][1] then Instance.Remove(Mus) Mus=Sound(Songs[SongPos][1],Songs[SongPos][3],Songs[SongPos][2],Shards[1][1],100,5,true) Mus.TimePosition=TimePos end
	Mus.SoundId,Mus.Pitch,Mus.Volume,Mus.Looped,Mus.Name,Mus.Playing="rbxassetid://"..Songs[SongPos][1],Songs[SongPos][2],Songs[SongPos][3],true,"VMus",not Muted
	TimePos=Mus.TimePosition
	if Mus.TimeLength-Mus.TimePosition<.5 and Mus.IsLoaded then
		TimePos=0
		Mus.TimePosition=0
		local SP=SongPos
		repeat
			SongPos=random(1,#Songs)
		until SongPos~=SP
	end
	if tick()-OTick>.5 then
		for i,v in pairs(char:GetDescendants()) do
			if v:IsA("BasePart") and not v.Anchored then
				pcall(function() v:SetNetworkOwner(Player) end)
			end
		end
		OTick=tick()
	end
end)
wait(.05)
Modules.Parent.SClient.Disabled=false
CrossClient:FireClient("Event","UpdateShards",Shards)
