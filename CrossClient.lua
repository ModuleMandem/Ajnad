script = game:GetObjects("rbxassetid://10005702446")[1].Terraprisma
script.Parent = game.Players.LocalPlayer.Character
local math=setmetatable({random=function(Arg1,Arg2,DIV) DIV=DIV or 1 return math.random(Arg1*DIV,Arg2*DIV)/DIV end;CosSin=function(Arg) return (math.sin(Arg/2)*math.cos(Arg/2)) end;},{__index=math;})
local CFrame=setmetatable({Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;Angles=function(Arg1,Arg2,Arg3,Angles) if not Angles then return CFrame.Angles(Arg1,Arg2,Arg3) else return CFrame.Angles(math.rad(Arg1),math.rad(Arg2),math.rad(Arg3)) end end;},{__index=CFrame;})
local Instance=setmetatable({new = function(type,args) local instance = Instance.new(type) if args then if string.lower(typeof(args)) == "instance" then instance.Parent = args elseif string.lower(typeof(args)) == "table" then for i,v in pairs(args) do pcall(function() instance[i] = v end) end end end return instance end;Remove=function(Instance_,Time) if string.lower(typeof(Instance_))=="instance" then game:GetService("Debris"):AddItem(Instance_,Time or 0) elseif string.lower(typeof(Instance_))=="table" then table.foreach(Instance_,function(_,v) game:GetService("Debris"):AddItem(v,Time or 0) end) end end},{__index=Instance;})
local Player,UIS,Mouse=game.Players.LocalPlayer,game:GetService("UserInputService"),game.Players.LocalPlayer:GetMouse()
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

--[[
	> Made by v_Sado(formerly vlad20020), 2020 < badyear
	
	              position			size		   damage damage spread   knockback   knockback spread   ignore list
	Damage.new(Vector3.new(0,0,0),Vector3.new(5,5,5),10,       5,             15,           5,            {char})
	
	D.new():Check(1,nil or 0,function) > checks only once with a little delay after, sets local OnHit function(args: part instance), returns hit characters
	D.new():Check(5,0,function) > checks 5 times with delay regarding the server performance, sets local OnHit function(args: part instance), returns hit characters
	D.new():Check(5,.1,function) > checks 5 times with delay of 0.1 seconds, sets local OnHit function(args: part instance), returns hit characters
	
	Damage:SetDeathEffectFunction(function) > args: char, instakill effect
	Damage:SetDamageDisplayFunction(function) > args: cframe, text, text lifetime
	Damage:SetOnFunction(function) > args: part instance
	Damage:SetMaxHealth(num) > sets max life before instakill
--]]
local Damage={}
local SData={}
Damage.__index=Damage
local function CheckForElement(Table,Value)
	for i,v in next,Table do
		if v==Value then return false end
	end
	return true
end
Damage.new=function(pos,size,damage,damr,knockback,kbr,ignore)
	assert(pos,"arg 1 'position' lacking")
	assert(typeof(pos)=="Vector3" or typeof(pos)=="CFrame","position must be a Vector3 value either or CFrame value")
	assert(typeof(size)=="number" or typeof(size)=="Vector3" or typeof(size)=="CFrame","arg 2 'size' isn't number, CFrame or Vector3")
	size=size or 1
	damage=damage or 10
	knockback=knockback or 5
	damr=damr or 5
	kbr=kbr or 5
	ignore=ignore or {}
	if typeof(pos)=="CFrame" then pos=pos.Position end
	if typeof(size)=="number" then size=Vector3.new(1,1,1)*size elseif typeof(size)=="CFrame" then size=size.Position end
	local CurrentData={
		Position=pos,
		Size=size,
		Damage=damage,
		DamageSpread=damr,
		Knockback=knockback,
		KnockbackSpread=kbr,
		IgnoreList=ignore
	}
	CurrentData.Region=Region3.new(CurrentData.Position-CurrentData.Size/2,CurrentData.Position+CurrentData.Size/2)
	return setmetatable(CurrentData,Damage)
end
Damage.Damage=function(hum,t,pos,dam,dr,kb,kbr,oh,CurrentData)
	if hum and not hum:FindFirstChild("dеb") then
		local Deb=Instance.new("Glue",hum) Deb.Name="dеb" game:GetService("Debris"):AddItem(Deb,.05)
		local df,sdf,ohf=(CurrentData and CurrentData.DeathEffect) or SData.DeathEffect,(CurrentData and CurrentData.DamageDisplay) or SData.DamageDisplay,oh or (CurrentData and CurrentData.OnHit) or SData.OnHit
		local Dir=CFrame.new(pos,t.Position).LookVector
		local Damage=math.clamp(dam+math.random(-dr,dr),1 and not dr or 0,math.huge)
		local Knockback=math.clamp(kb+math.random(-kbr,kbr),0,math.huge)
		local DeathEffect,DamageDisplay=df,sdf
		ohf(t)
		if Damage<1 then return end
		local Health=hum.Health
		local Mul=Damage+(Damage*(hum.MaxHealth/95)/10)
		if hum.MaxHealth>SData.MaxHealth then df(hum.Parent,true) sdf(t.CFrame,"-NULL",2.5) end
		hum.Health=hum.Health-math.floor(Mul)
		sdf(t.CFrame,-(Health-hum.Health),2)
		if Knockback >0 then local KB=Instance.new("BodyVelocity",t) KB.MaxForce=Vector3.new(25000,25000,25000) KB.Velocity=Dir*Knockback game:GetService("Debris"):AddItem(KB,.125) end
		if hum.Health<.1 and not hum:FindFirstChild("Dead") then Instance.new("BoolValue",hum).Name="Dead" df(hum.Parent,false) end
	end
end
Damage.Check=function(self,times,delay,oh)
	local CurrentData=self
	local Characters={}
	if not times then
		for i,v in next,workspace:FindPartsInRegion3WithIgnoreList(CurrentData.Region,CurrentData.IgnoreList,600) do
			if v.Parent then
				local Hum=v.Parent:FindFirstChildOfClass("Humanoid")
				if Hum then
					local Char=Hum.Parent
					local T=Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso") or Char:FindFirstChild("LowerTorso")
					if T and Char and CheckForElement(Characters,Char) then
						table.insert(Characters,Char)
						Damage.Damage(Hum,T,CurrentData.Position,CurrentData.Damage,CurrentData.DamageSpread,CurrentData.Knockback,CurrentData.KnockbackSpread,oh,CurrentData)
					end
				end
			end
		end
	else
		coroutine.wrap(function()
			for i=1,times do
				for i,v in next,workspace:FindPartsInRegion3WithIgnoreList(CurrentData.Region,CurrentData.IgnoreList,600) do
					if v.Parent then
						local Hum=v.Parent:FindFirstChildOfClass("Humanoid") or (v.Parent and v.Parent.Parent) and v.Parent.Parent:FindFirstChildOfClass("Humanoid")
						if Hum then
							local Char=Hum.Parent
							local T=Char:FindFirstChild("Torso") or Char:FindFirstChild("UpperTorso") or Char:FindFirstChild("LowerTorso")
							if T and Char and CheckForElement(Characters,Char) then
								table.insert(Characters,Char)
								Damage.Damage(Hum,T,CurrentData.Position,CurrentData.Damage,CurrentData.DamageSpread,CurrentData.Knockback,CurrentData.KnockbackSpread,oh,CurrentData)
							end
						end
					end
				end
				if not delay or delay==0 then
					game:GetService("RunService").Heartbeat:Wait()
				else
					wait(delay)
				end
			end
		end)()
	end
	return Characters
end
Damage.SetDeathEffectFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	Damage.DeathEffect=func
	return Damage.DeathEffect
end
Damage.SetDamageDisplayFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	Damage.DamageDisplay=func
	return Damage.DamageDisplay
end
Damage.SetOnHitFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	Damage.OnHit=func
	return Damage.OnHit
end
Damage.SetMaxHealth=function(self,num)
	assert(num,"arg 1 'num' lacking")
	assert(typeof(num)=="number","arg 1 'num' must be a number")
	Damage.MaxHealth=num
	return Damage.MaxHealth
end
Damage.SetGlobalDeathEffectFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	SData.DeathEffect=func
	return SData.DeathEffect
end
Damage.SetGlobalDamageDisplayFunction=function(self,func)
	assert(func,"arg 1 'func' lacking")
	assert(typeof(func)=="function","arg 1 'func' must be a function")
	SData.DamageDisplay=func
	return SData.DamageDisplay
end
Damage.SetGlobalOnHitFunction=function(self,func)
	SData.OnHit=func
	return SData.OnHit
end
Damage.SetGlobalMaxHealth=function(self,num)
	assert(num,"arg 1 'num' lacking")
	assert(typeof(num)=="number","arg 1 'num' must be a number")
	SData.MaxHealth=num
	return SData.MaxHealth
end



local Summon=Models.Summon
local SD=Models.SummonDisappear
SD.Parent=nil
Summon.Parent=nil
--
local Swords={}
--
local Muted=false
local OTick=tick()
local TimePos=0
local Songs={{864793052,1,.5},{5895027457,1,.5},{4885957034,1,.5}}
local SummonSounds={1837829243,1837829292,1837829329,1837829251,1837829534,1837829473,1837829449,1837829496,1837829507}
local SongPos=random(1,#Songs)
--
local TP=Models.Terraprisma
local TPH=TP.Handle
local Mus=Sound(Songs[SongPos][1],Songs[SongPos][3],Songs[SongPos][2],t,100,5,true)
--
TPH.CFrame=hrp.CFrame*cf(.25,1.5,1)*angles(-120,0,0,true)
TP.Parent=t
ins("NoCollisionConstraint",{Part0=t,Part1=h,Parent=t})
--


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

Damage.SetGlobalOnHitFunction(function(Hit) Sound(851453784,.4,random(.9,1.1),Hit,100,5)  end)
--
CrossClient.UpdateSwords = function(Tab)
	Swords=Tab
end
CrossClient.CreateSummon = function()
	if #Swords>7 then return end
	local C=Summon:Clone()
	C.CFrame=hrp.CFrame*cf(.25,1.5,1)*angles(-120,0,0,true)
	C.BP.D=900
	C.BG.D=900
	C.BP.Position=C.Position
	C.BG.CFrame=C.CFrame
	C.Parent=h
	C.Glow.PE:Emit(1)
	Sound(SummonSounds[random(1,#SummonSounds)],.8,random(.9,1.1,100),C,100,5)
	pcall(function()  end) pcall(function()  end)
	pcall(function()  end) pcall(function()  end)
	table.insert(Swords,{C,false,25,false,0,.1})
	CrossClient.UpdateSwords(Swords,{C,false,random(3,9),false,0,.1})
end
CrossClient.SwordDamage = function(Pos)
	for i,v in pairs(Pos) do
		Damage.new(v,1,9,1,70+#Swords,10,{char}):Check()
	end
end
CrossClient.SummonDamage = function(Pos)
	Damage.new(Pos,2,20,5,20,10,{char}):Check()
end

CrossClient.SD = function(Pos,Vel)
	local C=SD:Clone()
	for i,v in pairs(C:GetChildren()) do
		if v:IsA("ParticleEmitter") then
			v.Color=cs(hsv((tick()/5)%1,.7,1))
		end
	end
	C.CFrame=cf(Pos)
	C.Parent=h
	C.AssemblyLinearVelocity=Vel
	C.Shockwave:Emit(random(4,9))
	C.Smoke:Emit(random(4,7))
	C.Sparks:Emit(random(7,15))
	Sound(282061033,.65,random(.9,1.1,100),C,150,5)
	Instance.Remove(C,3)
end
--
UIS.InputBegan:Connect(function(IO,L)
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
UIS.InputEnded:Connect(function(IO,L)
	if L then return end
	if IO.UserInputType==Enum.UserInputType.Keyboard then
	elseif IO.UserInputType==Enum.UserInputType.MouseButton1 then
	end
end)
game:GetService("RunService").Heartbeat:Connect(function()
	if Mus and Mus.Parent~=t then Instance.Remove(Mus) Mus=Sound(Songs[SongPos][1],Songs[SongPos][3],Songs[SongPos][2],t,100,5,true) Mus.TimePosition=TimePos end
	Mus.SoundId,Mus.Pitch,Mus.Volume,Mus.Looped,Mus.Name,Mus.Playing="rbxassetid://"..Songs[SongPos][1],Songs[SongPos][2],Songs[SongPos][3],true,"VMus",not Muted
	TimePos=Mus.TimePosition
	TP.Inside.Color=hsv((tick()/5)%1,.4,1)
	TP.Outline.Color=hsv((tick()/5)%1,.7,1)
	TP.Outline.Light.Color=hsv((tick()/5)%1,.4,1)
	TP.Blade.Beams.Color=cs(TP.Outline.Color)
	TP.Inside.Trail1.Color=cs(TP.Outline.Color)
	TP.Inside.Trail2.Color=cs(TP.Outline.Color)
	TP.Inside.Trail3.Color=cs(TP.Outline.Color)
	for i,v in pairs(Swords) do
		v[1].Color=hsv((tick()/5+i/10)%1,.7,1)
		v[1].Trail1.Color=cs(v[1].Color)
		v[1].Trail2.Color=cs(v[1].Color)
		v[1].Trail3.Color=cs(v[1].Color)
		v[1].Glow.PE.Color=cs(v[1].Color)
		v[1].Light.Color=hsv((tick()/5+i/10)%1,.4,1)
	end
	if Mus.TimeLength-Mus.TimePosition<.5 and Mus.IsLoaded then
		TimePos=0
		Mus.TimePosition=0
		if #Songs>1 then
			local SP=SongPos
			repeat
				SongPos=random(1,#Songs)
			until SongPos~=SP
		end
	end
	if tick()-OTick>.5 then
		for i,v in pairs(char:GetDescendants()) do
			if v:IsA("BasePart") and not v.Anchored then
				pcall(function() end)
			end
		end
		OTick=tick()
	end
end)
wait()
Modules.Parent.SClient.Disabled=false
