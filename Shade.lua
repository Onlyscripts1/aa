local plrs=game:FindFirstChildOfClass("Players")
local rs=game:FindFirstChildOfClass("RunService")
local ws=game:FindFirstChildOfClass("Workspace")
local uis=game:FindFirstChildOfClass("UserInputService")
local gs=game:FindFirstChildOfClass("GuiService")
local lp=plrs.LocalPlayer
local pg=lp:FindFirstChildOfClass("PlayerGui")
local mouse=lp:GetMouse()
local stepped=rs.Stepped
local heartbeat=rs.Heartbeat
local renderstepped=rs.RenderStepped

local osclock=os.clock
local tspawn=task.spawn
local twait=task.wait
local schar=string.char
local ssub=string.sub
local sfind=string.find
local supper=string.upper
local mrandom=math.random
local clamp=math.clamp
local sin=math.sin
local cos=math.cos
local abs=math.abs
local rad=math.rad
local tinsert=table.insert
local tclear=table.clear
local tclone=table.clone
local tfind=table.find
local tunpack=table.unpack

local pairs=pairs 
local next=next

local i=Instance.new 
local v2=Vector2.new 
local v3=Vector3.new
local c3=Color3.new 
local cf=CFrame.new
local angles=CFrame.Angles
local u2=UDim2.new
local e=Enum 
local cs=ColorSequence.new 
local csk=ColorSequenceKeypoint.new 

local sine=osclock()
local deltaTime=0
local v3_0=v3(0,0,0)
local v3_101=v3(1,0,1)
local v3_010=v3(0,1,0)
local v3_001=v3(0,0,1)
local cf_0=cf(0,0,0)
local v3_xz=v3_101*10
local v3_net=v3_010*25.01

local Inverse=cf_0.Inverse
local Lerp=cf_0.Lerp

local function rs(l) 
	l=l or mrandom(8,15) 
	local s="" 
	for i=1,l do 
		if mrandom(1,2)==1 then 
			s=s..schar(mrandom(65,90)) 
		else 
			s=s..schar(mrandom(97,122)) 
		end 
	end 
	return s 
end
local function gp(p,n,cl)
	if typeof(p)=="Instance" then
		local c=p:GetChildren()
		for i=1,#c do
			local v=c[i]
			if (v.Name==n) and v:IsA(cl) then
				return v
			end
		end
	end
	return nil
end
local function timegp(p,n,c,t)
	t=osclock()+t
	while t>osclock() do
		local r=gp(p,n,c)
		if r then
			return r
		end
		stepped:Wait()
	end
	return nil
end
local function getNetlessVelocity(realVel)
	--if true then return v3_0 end
	--if true then return realPartVelocity end
	--if true then return v3_net end
	if realVel.Magnitude>25.01 then
		realVel=realVel.Unit*25.01
	end
	return realVel*v3_xz+v3_net
end
local sft=1/45
local function getFallingTime(Ypos,destY,gravity)
	local velY=25.01
	local fallingTime=0
	gravity=gravity*sft
	while (Ypos>destY) or (velY>0) do
		fallingTime=fallingTime+sft
		velY=velY-gravity
		Ypos=Ypos+(velY*sft)
	end
	return fallingTime
end
local function getMeshOfPart(v)
	if v:IsA("MeshPart") then
		return v.MeshId, v.TextureID
	elseif v:IsA("BasePart") then
		v=v:FindFirstChildOfClass("SpecialMesh")
		if v then
			return v.MeshId, v.TextureId
		end
	end
	return nil, nil
end
local function makeplaceholder(v)
	if typeof(v)~="Instance" then
		return nil
	end
	if not v.Archivable then
		v.Archivable=true
	end
	v=v:Clone()
	local c=v:GetChildren()
	for i=1,#c do
		local v=c[i]
		if v:IsA("SpecialMesh") then
			v.Name=rs()
			v:ClearAllChildren()
		else
			v:Destroy()
		end
	end
	v.Name=rs()
	v.CanQuery=false
	v.Anchored=true
	v.CanCollide=false
	v.Transparency=0
	v.Parent=ws
	return v
end
local function emptyfunction() end

--it runs even faster if u call __index and __newindex of metatables of userdata directly
local function getMetamethodFromErrorStack(userdata,f,test)
	local ret=nil
	xpcall(f,function()
		ret=debug.info(2,"f")
	end,userdata,nil,0)
	if (type(ret)~="function") or not test(ret) then
		return f
	end
	return ret
end
local insSet=getMetamethodFromErrorStack(game,function(a,b,c) a[b]=c end,function(f) local a=i("Folder") local b=rs() f(a,"Name",b) return a.Name==b end)
local insGet=getMetamethodFromErrorStack(game,function(a,b) return a[b] end,function(f) local a=i("Folder") local b=rs() a.Name=b return f(a,"Name")==b end)
local cfGet=getMetamethodFromErrorStack(cf_0,function(a,b) return a[b] end,function(f) return f(cf(1,2,3),"Position")==v3(1,2,3) end)
local cfMul=getMetamethodFromErrorStack(cf_0,function(a,b) return a*b end,function(f) return angles(1,2,3)*angles(1,2,3)==f(angles(1,2,3),angles(1,2,3)) end)
local cfAdd=getMetamethodFromErrorStack(cf_0,function(a,b) return a+b end,function(f) return cf(1,2,3)+v3(1,2,3)==f(cf(1,2,3),v3(1,2,3)) end)
local v3Get=getMetamethodFromErrorStack(v3_0,function(a,b) return a[b] end,function(f) return v3(1,2,3).Unit==f(v3(1,2,3),"Unit") end)
--multiplying and adding vector3 is faster if you use the * and + operators


local accessorylimbs={	

	{meshid="11263221350",textureid="11263219250",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
	{meshid="11159370334",textureid="11159284657",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

	{meshid="14255522247",textureid="",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Arm"},
	{meshid="14255522247",textureid="",C0=angles(-1.5707963267948966,0,1.5707963267948966),Name="Right Arm"},

	{meshid="11159370334",textureid="11159285454",C0=angles(1.5707963267948966,0,1.5707963267948966),Name="Left Leg"},
	{meshid="12652772399",textureid="12652775021",C0=cf(0,-0.125,0),Name="Right Leg"},

	{meshid="14768684979",textureid="",C0=angles(0,0,1.5707963267948966),Name="Left Leg"},
	{meshid="14768684979",textureid="",C0=angles(0,0,1.5707963267948966),Name="Right Leg"},

	{meshid="14768666349",textureid="",C0=cf_0,Name="Torso"},
	{meshid="14241018198",textureid="",C0=cf_0,Name="Torso"},
	{meshid="13421774668",textureid="",C0=cf_0,Name="Torso"},

	{meshid="4819720316",textureid="4819722776",C0=angles(0,0,rad(15)),Name="Torso"},
	{meshid="4489232754",textureid="4489233876",C0=angles(rad(0),rad(0),rad(-90)),Name="Left Arm"},
	{meshid="4324138105",textureid="4391374782",C0=angles(rad(0),rad(0),rad(90)),Name="Right Arm"},
	{meshid="4094864753",textureid="4094881938",C0=angles(rad(0),rad(0),rad(-90)),Name="Left Leg"},
	{meshid="4154474745",textureid="4154474807",C0=angles(rad(0),rad(0),rad(90)),Name="Right Leg"}

}

local i1=i("Frame") 
local i2=i("Frame") 
local i3=i("ScrollingFrame") 
local i4=i("UIListLayout") 
local i5=i("UIGradient") 
local i6=i("TextLabel") 
local i7=i("TextButton") 
local i8=i("UIGradient") 
local i9=i("ScreenGui") 
i1.AnchorPoint=v2(0.5,0) 
i1.BackgroundColor3=c3(1,1,1) 
i1.BorderSizePixel=0 
i1.Position=u2(0.5,0,0.5,-150) 
i1.Size=u2(0,300,0,350)
i1.Name=rs() 
i1.Parent=i9 
i2.BackgroundColor3=c3(1,1,1) 
i2.BorderSizePixel=0 
i2.Position=u2(0,5,0,20) 
i2.Size=u2(1,-10,1,-25) 
i2.Name=rs() 
i2.Parent=i1 
i3.Active=true 
i3.BackgroundTransparency=1 
i3.BorderSizePixel=0 
i3.Size=u2(1,-3,1,0) 
i3.AutomaticCanvasSize=e.AutomaticSize.Y 
i3.CanvasSize=u2(0,0,0,0) 
i3.ScrollBarThickness=7 
i3.Name=rs() 
i3.Parent=i2 
i4.Name=rs() 
i4.Parent=i3 
i4.SortOrder=e.SortOrder.LayoutOrder 
i5.Name=rs() 
i5.Parent=i2 
i5.Color=cs({[1]=csk(0,c3(0.05,0.05,0.05)),[2]=csk(1,c3(0.4,0,0.6))}) 
i5.Rotation=90 
i6.Font=e.Font.SourceSans 
i6.FontSize=e.FontSize.Size18 
i6.Text="Shade-Hub Reborn" 
i6.TextColor3=c3(0.65,0,0.85) 
i6.TextSize=16 
i6.BackgroundTransparency=1 
i6.BorderSizePixel=0 
i6.Position=u2(0,1,0,1) 
i6.Size=u2(1,-2,0,20) 
i6.Name=rs() 
i6.Parent=i1 
i7.AnchorPoint=v2(1,0) 
i7.BackgroundTransparency=1 
i7.Position=u2(1,0,0,0) 
i7.Size=u2(0,40,1,0) 
i7.Name=rs() 
i7.Parent=i6 
i7.Font=e.Font.SourceSans 
i7.FontSize=e.FontSize.Size18 
i7.Text="-" 
i7.TextColor3=c3(1,1,1) 
i7.TextSize=16 
i8.Name=rs() 
i8.Parent=i1 
i8.Color=cs({[1]=csk(0,c3(0,0,0)),[2]=csk(1,c3(0.5,0,0.7))}) 
i8.Rotation=90 
i9.ZIndexBehavior=e.ZIndexBehavior.Sibling 
i9.IgnoreGuiInset=true 
i9.ResetOnSpawn=false 
i9.Name=rs() 
local min=false
i7.MouseButton1Click:Connect(function()
	min = not min
	if min then
		i2.Visible=false 
		i8.Color=cs({[1]=csk(0,c3(0,0,0)),[2]=csk(1,c3(0,0,0))}) 
		i1.Size=u2(0,300,0,22) 
	else
		i1.Size=u2(0,300,0,350) 
		i8.Color=cs({[1]=csk(0,c3(0,0,0)),[2]=csk(1,c3(0,0,0.584314))}) 
		i2.Visible=true 
	end
end)
local function Draggable(window,obj)
	local MB1enum = e.UserInputType.MouseButton1
	local TOUCHenum = e.UserInputType.Touch
	obj = obj or window
	local activeEntered = 0
	local mouseStart = nil
	local dragStart = nil
	local inputbegancon = nil
	local rendersteppedcon = nil
	local inputendedcon = nil
	local function inputendedf(a)
		a=a.UserInputType
		if (a==MB1enum) or (a==TOUCHenum) then
			rendersteppedcon:Disconnect()
			inputendedcon:Disconnect()
		end
	end
	local function rendersteppedf()
		local off = uis:GetMouseLocation()-mouseStart
		window.Position=dragStart+u2(0,off.X,0,off.Y)
	end
	local function inputbeganf(a)
		a=a.UserInputType
		if ((a==MB1enum) or (a==TOUCHenum)) and (activeEntered==0) and not uis:GetFocusedTextBox() then
			mouseStart=uis:GetMouseLocation()
			dragStart=window.Position
			if rendersteppedcon then rendersteppedcon:Disconnect() end
			rendersteppedcon = renderstepped:Connect(rendersteppedf)
			if inputendedcon then inputendedcon:Disconnect() end
			inputendedcon = uis.InputEnded:Connect(inputendedf)
		end
	end
	obj.MouseEnter:Connect(function()
		if inputbegancon then inputbegancon:Disconnect() end
		inputbegancon = uis.InputBegan:Connect(inputbeganf)
	end)
	obj.MouseLeave:Connect(function()
		inputbegancon:Disconnect()
	end)
	local function ondes(d)
		if d:IsA("GuiObject") then
			local thisEntered = false
			local thisAdded = false
			local con0 = d.MouseEnter:Connect(function()
				thisEntered = true
				if (not thisAdded) and d.Active then
					activeEntered = activeEntered + 1
					thisAdded = true
				end
			end)
			local con1 = d.MouseLeave:Connect(function()
				thisEntered = false
				if thisAdded then
					activeEntered = activeEntered - 1
					thisAdded = false
				end
			end)
			local con2 = d:GetPropertyChangedSignal("Active"):Connect(function()
				if thisEntered then
					if thisAdded and not d.Active then
						activeEntered = activeEntered - 1
						thisAdded = false
					elseif d.Active and not thisAdded then
						activeEntered = activeEntered + 1
						thisAdded = true
					end
				end
			end)
			local con3 = nil
			con3 = d.AncestryChanged:Connect(function()
				if not d:IsDescendantOf(window) then
					if thisEntered then
						activeEntered = activeEntered - 1
					end
					con0:Disconnect()
					con1:Disconnect()
					con2:Disconnect()
					con3:Disconnect()
				end
			end)
		end
	end
	window.DescendantAdded:Connect(ondes)
	local des=window:GetDescendants()
	for i=1,#des do 
		ondes(des[i])
	end
end
local function btn(txt, f)
	local i1=i("TextButton") 
	i1.AutomaticSize=e.AutomaticSize.Y 
	i1.BackgroundTransparency=1 
	i1.Size=u2(1,0,0,0) 
	i1.Name=rs() 
	i1.Font=e.Font.SourceSans 
	i1.FontSize=e.FontSize.Size14 
	i1.Text=txt 
	i1.TextColor3=c3(0.7,0,0.9) 
	if f then 
		i1.MouseButton1Click:Connect(f) 
	end 
	i1.Parent=i3 
	return i1
end
local function lbl(txt)
	local i1=i("TextLabel") 
	i1.Font=e.Font.SourceSans 
	i1.FontSize=e.FontSize.Size14 
	i1.Text=txt 
	i1.TextColor3=c3(0.560784,0.560784,0.560784) 
	i1.AutomaticSize=e.AutomaticSize.Y 
	i1.BackgroundTransparency=1 
	i1.Size=u2(1,0,0,0) 
	i1.Name=rs() 
	i1.Parent=i3 
	return i1
end


Draggable(i1)
lbl("-----------== // Hat Scripts // ==-----------")


local allowshiftlock=nil
local placeholders=nil
local clickfling=nil
local highlightflingtargets=nil
local discharscripts=nil

local c=nil
local function stopreanimate() 
	if c then
		c=nil
		return true
	end
	return false
end
local function reanimate()
	--[[
	MyWorlds sexy reanimate
	]]
	local novoid = true
	local speedlimit = 3000
	local retVelTime = 0.51
	local walkSpeed = 16
	local jumpPower = 50
	local gravity = 196.2
	local ctrlclicktp = false
	local clickfling = clickfling 
	local flingvel = v3(15000,16000,15000) 
	local claimwait=true
	local highlightflingtargets = highlightflingtargets 
	if stopreanimate() then return end
	c=lp.Character
	if not (c and c:IsDescendantOf(ws)) then return end
	local rootpart=gp(c,"HumanoidRootPart","BasePart") or gp(c,"Torso","BasePart") or gp(c,"UpperTorso","BasePart") or timegp(c,"HumanoidRootPart","BasePart",0.5) or c:FindFirstChildWhichIsA("BasePart")
	if not rootpart then return end
	local cam=nil
	local function refcam()
		cam=ws.CurrentCamera
		while not cam do
			ws:GetPropertyChangedSignal("CurrentCamera"):Wait()
			cam=ws.CurrentCamera
		end
	end
	refcam()
	local camcf=cam.CFrame
	local enumCamS=e.CameraType.Scriptable
	local camt=cam.CameraType
	local camcon0=nil
	local camcon1=nil
	local camcon2=nil
	local function onnewcamera()
		refcam()
		if camcon0 then 
			camcon0:Disconnect()
			camcon1:Disconnect()
			camcon0=nil
		end
		if not c then 
			if cam.CameraType==enumCamS then
				cam.CameraType=camt
			end
			return camcon2:Disconnect() 
		end
		camcon0=cam:GetPropertyChangedSignal("CFrame"):Connect(function()
			if cam.CFrame~=camcf then
				cam.CFrame=camcf
			end
		end)
		camcon1=cam:GetPropertyChangedSignal("CameraType"):Connect(function()
			if cam.CameraType~=enumCamS then
				cam.CameraType=enumCamS
			end
		end)
		if cam.CameraType~=enumCamS then
			cam.CameraType=enumCamS
		end
		if cam.CFrame~=camcf then
			cam.CFrame=camcf
		end
	end
	camcon2=ws:GetPropertyChangedSignal("CurrentCamera"):Connect(onnewcamera)
	onnewcamera()

	local rGravity=ws.Gravity
	ws:GetPropertyChangedSignal("Gravity"):Connect(function()
		rGravity=ws.Gravity
	end)

	local fpdh=ws.FallenPartsDestroyHeight
	novoid=novoid and (fpdh+1)

	local Yvel=0
	local cfr=rootpart.CFrame
	local pos=cfr.Position
	local primarypart=nil
	local shiftlock=false
	local firstperson=false
	local xzvel=v3_0
	local v3_0150=v3_010*1.5
	local camoff=cf(v3_0,camcf.LookVector)
	camoff=camoff-v3_001*(camcf.Position-(pos+v3_0150)).Magnitude

	local R6parts={ 
		head={Name="Head"},
		torso={Name="Torso"},
		root={Name="HumanoidRootPart"},
		leftArm={Name="Left Arm"},
		rightArm={Name="Right Arm"},
		leftLeg={Name="Left Leg"},
		rightLeg={Name="Right Leg"}
	}
	rootpart=R6parts.root
	local cframes={}
	for i,v in pairs(R6parts) do
		cframes[v]=cfr
	end
	local joints={
		{
			Name="Neck",
			Part0=R6parts.torso,Part1=R6parts.head,
			C0=cf(0,1,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,-0.5,0,-1,0,0,0,0,1,0,1,-0)
		},
		{
			Name="RootJoint",
			Part0=rootpart,Part1=R6parts.torso,
			C0=cf(0,0,0,-1,0,0,0,0,1,0,1,-0),
			C1=cf(0,0,0,-1,0,0,0,0,1,0,1,-0)
		},
		{
			Name="Right Shoulder",
			Part0=R6parts.torso,Part1=R6parts.rightArm,
			C0=cf(1,0.5,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(-0.5,0.5,0,0,0,1,0,1,-0,-1,0,0)
		},
		{
			Name="Left Shoulder",
			Part0=R6parts.torso,Part1=R6parts.leftArm,
			C0=cf(-1,0.5,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(0.5,0.5,0,0,0,-1,0,1,0,1,0,0)
		},
		{
			Name="Right Hip",
			Part0=R6parts.torso,Part1=R6parts.rightLeg,
			C0=cf(1,-1,0,0,0,1,0,1,-0,-1,0,0),
			C1=cf(0.5,1,0,0,0,1,0,1,-0,-1,0,0)
		},
		{
			Name="Left Hip",
			Part0=R6parts.torso,Part1=R6parts.leftLeg,
			C0=cf(-1,-1,0,0,0,-1,0,1,0,1,0,0),
			C1=cf(-0.5,1,0,0,0,-1,0,1,0,1,0,0)
		}
	}

	local refreshedjoints={}
	local refreshjointsI=nil
	refreshjointsI=function(part)
		tinsert(refreshedjoints,part)
		for i,v in pairs(joints) do
			local part0=v.Part0
			local part1=v.Part1
			if part1 and (part0==part) then
				cframes[part1]=cframes[part]*v.C0*v.C1:Inverse()
				if not tfind(refreshedjoints,part1) then
					refreshjointsI(part1)
				end
			elseif part0 and (part1==part) then
				cframes[part0]=cframes[part]*v.C1*v.C0:Inverse()
				if not tfind(refreshedjoints,part0) then
					refreshjointsI(part0)
				end
			end
		end
	end
	refreshjointsI(rootpart)
	tclear(refreshedjoints)

	local attachments={
		RightShoulderAttachment={R6parts.rightArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		RightGripAttachment={R6parts.rightArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		LeftFootAttachment={R6parts.leftLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		LeftShoulderAttachment={R6parts.leftArm,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		LeftGripAttachment={R6parts.leftArm,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		RootAttachment={rootpart,cf(0,0,0,1,0,0,0,1,0,0,0,1)},
		RightFootAttachment={R6parts.rightLeg,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		NeckAttachment={R6parts.torso,cf(0,1,0,1,0,0,0,1,0,0,0,1)},
		BodyFrontAttachment={R6parts.torso,cf(0,0,-0.5,1,0,0,0,1,0,0,0,1)},
		BodyBackAttachment={R6parts.torso,cf(0,0,0.5,1,0,0,0,1,0,0,0,1)},
		LeftCollarAttachment={R6parts.torso,cf(-1,1,0,1,0,0,0,1,0,0,0,1)},
		RightCollarAttachment={R6parts.torso,cf(1,1,0,1,0,0,0,1,0,0,0,1)},
		WaistFrontAttachment={R6parts.torso,cf(0,-1,-0.5,1,0,0,0,1,0,0,0,1)},
		WaistCenterAttachment={R6parts.torso,cf(0,-1,0,1,0,0,0,1,0,0,0,1)},
		WaistBackAttachment={R6parts.torso,cf(0,-1,0.5,1,0,0,0,1,0,0,0,1)},
		HairAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
		HatAttachment={R6parts.head,cf(0,0.6,0,1,0,0,0,1,0,0,0,1)},
		FaceFrontAttachment={R6parts.head,cf(0,0,-0.6,1,0,0,0,1,0,0,0,1)},
		FaceCenterAttachment={R6parts.head,cf(0,0,0,1,0,0,0,1,0,0,0,1)}
	}

	local function getPart(name,blacklist)
		for i,v in pairs(cframes) do
			if (i.Name==name) and not (blacklist and tfind(blacklist,i)) then
				return i
			end
		end
		return nil
	end

	local function getJoint(name)
		for i,v in pairs(joints) do
			if v.Name==name then
				return v
			end
		end
		return {C0=cf_0,C1=cf_0}
	end

	local function getPartFromMesh(m,t,blacklist)
		if blacklist then
			for v,_ in pairs(cframes) do
				if v.m and (not tfind(blacklist,v)) and sfind(v.m,m) and sfind(v.t,t) then
					return v
				end
			end
		else
			for v,_ in pairs(cframes) do
				if v.m and sfind(v.m,m) and sfind(v.t,t) then
					return v
				end
			end
		end
		local p={m=m,t=t}
		cframes[p]=cfr
		local j={C0=cf_0,C1=cf_0,Part0=p}
		p.j=j
		return p
	end

	local function getPartJoint(p)
		if cframes[p] then
			local j=p.j
			if j then
				return j
			end
			for i,v in pairs(joints) do
				if v.Part0==p then
					return v
				end
			end
			for i,v in pairs(joints) do
				if v.Part1==p then
					return v
				end
			end
		end
		return nil
	end

	local function getAccWeldFromMesh(m,t)
		return getPartJoint(getPartFromMesh(m,t))
	end

	local raycastparams=RaycastParams.new()
	raycastparams.FilterType=e.RaycastFilterType.Blacklist
	raycastparams.RespectCanCollide=true
	local rayfilter={}
	local characters={}
	local function refreshrayfilter()
		tclear(rayfilter)
		for i,v in pairs(characters) do
			tinsert(rayfilter,v)
		end
		raycastparams.FilterDescendantsInstances=rayfilter
	end
	local flingtable={}
	local rootparts={}
	for i=1,#accessorylimbs do
		local v=accessorylimbs[i]
		v.p=getPart(v.Name)
	end
	local ondes=nil
	ondes=function(v)
		if v:IsA("Attachment") then
			local v1=attachments[v.Name]
			if v1 then
				local p=v.Parent
				if (p.Parent~=c) and p:IsDescendantOf(c) then
					local meshid,textureid=getMeshOfPart(p)
					if meshid then
						local found=false
						for i,_ in pairs(cframes) do
							if (meshid==i.m) and (textureid==i.t) then
								local p1=i.p
								if p1 and p1:IsDescendantOf(c) then
									if p1==p then
										found=true
										break
									end
								else
									found=true
									i.p=p
									break
								end
							else
								local j=i.j
								if j and sfind(meshid,i.m) and sfind(textureid,i.t) then
									i.m=meshid
									i.t=textureid
									i.l=p.Position
									i.p=p
									i.j=nil
									i.Name=p.Name
									j.C0=v.CFrame
									j.C1=v1[2]
									j.Part1=v1[1]
									tinsert(joints,j)
									found=true
									break
								end
							end
						end
						if not found then
							for i=1,#accessorylimbs do
								local l=accessorylimbs[i]
								if l.p and sfind(meshid,l.meshid) and sfind(textureid,l.textureid) then
									local t={Name=p.Name,l=p.Position,m=meshid,t=textureid,p=p}
									if placeholders then
										t.v=makeplaceholder(p)
									end
									cframes[t]=p.CFrame
									tinsert(joints,{Part0=t,Part1=l.p,C0=l.C0,C1=cf_0})
									l.p=nil
									found=true
									break
								end
							end
							if not found then
								local t={Name=p.Name,l=p.Position,m=meshid,t=textureid,p=p}
								if placeholders then
									t.v=makeplaceholder(p)
								end
								cframes[t]=v.CFrame
								tinsert(joints,{Part0=t,Part1=v1[1],C0=v.CFrame,C1=v1[2]})
							end
						end
					end
				end
			end
		end
	end

	local function onplayer(v)
		local lastc=nil
		local function oncharacter()
			local newc=v.Character
			if c and newc and (newc~=lastc) then
				lastc=newc
				characters[v]=newc
				refreshrayfilter()
				if v==lp then
					if discharscripts then
						newc.DescendantAdded:Connect(discharscripts)
						for i,v in pairs(newc:GetDescendants()) do
							if v:IsA("Script") then
								v.Disabled=true
							end
						end
					end
					local hrp=timegp(newc,"HumanoidRootPart","BasePart",10)
					if not (hrp and c and newc:IsDescendantOf(ws)) then return end
					c=newc
					local fi,fv=next(flingtable)
					if fi then
						for i,v in pairs(tclone(flingtable)) do
							if not c then
								return
							end
							local startpos=i.Position
							local stoptime=sine+3
							while true do
								twait()
								if sine>stoptime then
									break
								end
								if (startpos-i.Position).Magnitude>200 then
									break
								end
								local tcf=i.CFrame+i.Velocity*(sin(sine*15)+1)
								if novoid and (tcf.Y<novoid) then
									tcf=tcf+v3_010*(novoid-tcf.Y)
								end
								hrp.CFrame=tcf
								hrp.Velocity=i.Velocity*v3_101*75
								hrp.RotVelocity=flingvel
							end
							if v then
								v:Destroy()
							end
							flingtable[i]=nil
						end
						hrp.Velocity=v3_0
						hrp.RotVelocity=v3_0
						hrp.CFrame=cfr
						twait(0.26)
					end
					local startpos=pos+v3(mrandom(-32,32),0,mrandom(-32,32))
					local dir=nil
					local poscheck=true
					while poscheck do
						poscheck=false
						for i,v in pairs(rootparts) do
							local diff=(startpos-v.Position)*v3_101
							if diff.Magnitude<10 then
								poscheck=true
								dir=dir or (diff.Unit * 3)
								startpos=startpos+dir
							end
						end
						local diff=(startpos-pos)*v3_101
						if diff.Magnitude<10 then
							poscheck=true
							dir=dir or (diff.Unit * 3)
							startpos=startpos+dir
						end
					end
					startpos=cfr.Rotation+startpos
					primarypart=c.PrimaryPart or hrp
					hrp.CFrame=startpos
					hrp.Velocity=v3_0
					hrp.RotVelocity=v3_0
					if claimwait then
						twait(0.26)
					else
						lp.Character=nil
					end
					newc:BreakJoints()
					local cd=newc:GetDescendants()
					newc.DescendantAdded:Connect(ondes)
					for i=1,#cd do
						ondes(cd[i])
					end
				else
					local hrp=timegp(newc,"HumanoidRootPart","BasePart",10)
					if hrp and c and newc:IsDescendantOf(ws) then
						rootparts[v]=hrp
					end
				end
			end
		end
		v:GetPropertyChangedSignal("Character"):Connect(oncharacter)
		oncharacter()
	end
	local plrst=plrs:GetPlayers()
	for i=1,#plrst do onplayer(plrst[i]) end
	plrs.PlayerAdded:Connect(onplayer)
	plrs.PlayerRemoving:Connect(function(v)
		characters[v]=nil
		rootparts[v]=nil
	end)

	local mradN05=rad(-0.5)
	local KeyCode=e.KeyCode
	local enumMLC=e.MouseBehavior.LockCenter
	local enumMB2=e.UserInputType.MouseButton2
	local enumMLCP=e.MouseBehavior.LockCurrentPosition
	local enumMD=e.MouseBehavior.Default
	local enumMW=e.UserInputType.MouseWheel
	if uis.TouchEnabled then
		enumMB2=e.UserInputType.MouseButton1
	end

	local mouseBehavior=nil
	local lastMouseBehavior=uis.MouseBehavior
	uis:GetPropertyChangedSignal("MouseBehavior"):Connect(function()
		if mouseBehavior and (uis.MouseBehavior~=mouseBehavior) then
			uis.MouseBehavior=mouseBehavior
		end
	end)

	local mode="default"
	local defaultmode={}
	local modes={default=defaultmode}

	local lerpsIdle=emptyfunction
	local lerpsWalk=emptyfunction
	local lerpsJump=emptyfunction
	local lerpsFall=emptyfunction

	local function addmode(key,mode)
		if (type(key)~="string") or (type(mode)~="table") then
			return
		end
		for i,v in pairs(mode) do
			if type(v)~="function" then
				mode[i]=nil
			end
		end
		if key=="default" then
			defaultmode=mode
			modes.default=mode
			lerpsIdle=mode.idle or emptyfunction
			lerpsWalk=mode.walk or emptyfunction
			lerpsJump=mode.jump or emptyfunction
			lerpsFall=mode.fall or emptyfunction
			if mode.modeEntered then
				mode.modeEntered()
			end
		elseif #key==1 then
			key=KeyCode[supper(ssub(key,1,1))]
			modes[key]=mode
		end
	end

	local keyW=KeyCode.W
	local Wpressed=uis:IsKeyDown(keyW)
	local keyA=KeyCode.A
	local Apressed=uis:IsKeyDown(keyA)
	local keyS=KeyCode.S
	local Spressed=uis:IsKeyDown(keyS)
	local keyD=KeyCode.D
	local Dpressed=uis:IsKeyDown(keyD)
	local keySpace=KeyCode.Space
	local spacePressed=uis:IsKeyDown(keySpace)

	local keyShift=KeyCode.LeftShift
	uis.InputBegan:Connect(function(a)
		if gs.MenuIsOpen or uis:GetFocusedTextBox() then
			return
		end
		a=a.KeyCode
		if a==keyW then
			Wpressed=true
		elseif a==keyA then
			Apressed=true
		elseif a==keyS then
			Spressed=true
		elseif a==keyD then
			Dpressed=true
		elseif a==keySpace then
			spacePressed=true
		elseif a==keyShift then
			shiftlock=allowshiftlock and not shiftlock
		elseif modes[a] then
			if modes[mode].modeLeft then
				modes[mode].modeLeft()
			end
			if mode==a then
				mode="default"
			else
				mode=a
			end
			local modet=modes[mode]
			lerpsIdle=modet.idle or defaultmode.idle or emptyfunction
			lerpsWalk=modet.walk or defaultmode.walk or emptyfunction
			lerpsJump=modet.jump or defaultmode.jump or emptyfunction
			lerpsFall=modet.fall or defaultmode.fall or emptyfunction
			if modes[mode].modeEntered then
				modes[mode].modeEntered()
			end
		end
	end)
	uis.InputEnded:Connect(function(a)
		a=a.KeyCode
		if a==keyW then
			Wpressed=false
		elseif a==keyA then
			Apressed=false
		elseif a==keyS then
			Spressed=false
		elseif a==keyD then
			Dpressed=false
		elseif a==keySpace then
			spacePressed=false
		end
	end)
	uis.InputChanged:Connect(function(a,b)
		if (not b) and (a.UserInputType==enumMW) then
			camoff=camoff+a.Position*v3_001*(0.75-camoff.Z/4)
			if camoff.Z>0 then
				camoff=camoff-camoff.Position
			end
			firstperson=camoff.Z==0
		end
	end)

	local function predictionfling(target)
		if not c then
			return twait() and false
		end
		if typeof(target)~="Instance" then 
			target=mouse.Target
			if not target then
				return twait() and false
			end
		end
		if target:IsA("Humanoid") or target:IsA("BasePart") then 
			target=target.Parent 
			if target:IsA("Accessory") then
				target=target.Parent
			end
		end
		if (not target:IsA("Model")) or (target==c) then
			return twait() and false
		end
		local targetpart=gp(target,"HumanoidRootPart","BasePart") or gp(target,"Torso","BasePart") or gp(target,"UpperTorso","BasePart")
		if not (targetpart and targetpart:IsDescendantOf(ws)) then
			return twait() and false
		end
		if highlightflingtargets then
			local h=i("Highlight")
			h.Name=rs()
			h.Adornee=target
			h.FillColor=c3(1,0,0)
			h.OutlineColor=c3(1,0,0)
			h.FillTransparency=0.5
			h.OutlineTransparency=0
			h.Parent=i9
			flingtable[targetpart]=h
		else
			flingtable[targetpart]=false
		end
		twait()
		return true
	end

	if ctrlclicktp then
		ctrlclicktp=KeyCode.LeftControl
		local tpoff=v3_010*3
		if clickfling then
			mouse.Button1Down:Connect(function()
				if mouse.Target then
					if uis:IsKeyDown(ctrlclicktp) then
						pos=mouse.Hit.Position+tpoff
						cfr=cf(pos,pos+camoff.LookVector*v3_101)
						xzvel=v3_0
						Yvel=0
					else
						predictionfling()
					end
				end
			end)
		else
			mouse.Button1Down:Connect(function()
				if mouse.Target and uis:IsKeyDown(ctrlclicktp) then
					pos=mouse.Hit.Position+tpoff
					cfr=cf(pos,pos+camoff.LookVector*v3_101)
					xzvel=v3_0
					Yvel=0
				end
			end)
		end
	elseif clickfling then
		mouse.Button1Down:Connect(predictionfling)
	end

	local noYvelTime=1
	local lastsine=sine
	local con=nil
	local function mainFunction()
		if not c then 
			for i,v in pairs(cframes) do
				local p=i.v
				if p then
					p:Destroy()
				end
			end
			for i,v in pairs(flingtable) do
				if v then
					v:Destroy()
				end
			end
			mouseBehavior=nil
			uis.MouseBehavior=enumMD
			onnewcamera()
			local c=lp.Character
			if c then
				cam.CameraSubject=c:FindFirstChildOfClass("Humanoid")
			end
			return con and con:Disconnect() 
		end

		sine=osclock()
		local delta=sine-lastsine
		deltaTime=clamp(delta*10,0,1)
		lastsine=sine

		if shiftlock then
			if allowshiftlock then
				mouseBehavior=enumMLC
				local rotation=uis:GetMouseDelta()*mradN05
				local camoffpos=camoff.Position
				camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
			else
				shiftlock=false
			end
		elseif firstperson then
			mouseBehavior=enumMLC
			local rotation=uis:GetMouseDelta()*mradN05
			local camoffpos=camoff.Position
			camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		elseif uis:IsMouseButtonPressed(enumMB2) then
			mouseBehavior=enumMLCP
			local rotation=uis:GetMouseDelta()*mradN05
			local camoffpos=camoff.Position
			camoff=cf(camoffpos,camoffpos+camoff.LookVector)*angles(rotation.Y,rotation.X,0)
		else
			mouseBehavior=enumMD
		end
		if lastMouseBehavior~=mouseBehavior then
			lastMouseBehavior=mouseBehavior
			uis.MouseBehavior=mouseBehavior
		end

		local raycastresult=ws:Raycast(pos,v3_010*(fpdh-pos.Y),raycastparams)
		local onground=nil
		if raycastresult then
			raycastresult=raycastresult.Position
			onground=(pos.Y-raycastresult.Y)<3.01
			if onground then
				Yvel=0
				cfr=cfr+v3_010*(raycastresult.Y+3-pos.Y)*clamp(delta*20,0,1)
				if spacePressed then
					Yvel=jumpPower
				end
			else
				Yvel=Yvel-gravity*delta
				if pos.Y+Yvel*delta<raycastresult.Y then
					Yvel=0
					cfr=cfr+v3_010*(raycastresult.Y+3-pos.Y)
				end
			end
		else
			Yvel=0
			onground=false
		end
		xzvel=v3_0
		if Wpressed then
			xzvel=xzvel+(camoff.LookVector*v3_101).Unit
		end
		if Spressed then
			xzvel=xzvel-(camoff.LookVector*v3_101).Unit
		end
		if Apressed then
			xzvel=xzvel-(camoff.RightVector*v3_101).Unit
		end
		if Dpressed then
			xzvel=xzvel+(camoff.RightVector*v3_101).Unit
		end
		pos=cfr.Position
		if shiftlock or firstperson then
			if xzvel.Magnitude>0 then
				xzvel=xzvel.Unit*walkSpeed
			end
			cfr=cf(pos,pos+camoff.LookVector*v3_101)
		elseif xzvel.Magnitude>0 then 
			xzvel=xzvel.Unit*walkSpeed
			if not uis:IsMouseButtonPressed(e.UserInputType.MouseButton1)
			then
				cfr=cfr:Lerp(cf(pos,pos+xzvel),deltaTime)
			end
		end
		cfr=cfr+(xzvel+(v3_010*Yvel))*delta
		pos=cfr.Position
		camcf=cf(pos,pos+camoff.LookVector)+camoff.LookVector*camoff.Z+v3_0150
		if shiftlock and not firstperson then
			camcf=camcf+camcf.RightVector*1.75
		end
		if cam then
			cam.CFrame=camcf
		end

	cframes[rootpart]=cfr

		if onground then
			if xzvel==v3_0 then
				lerpsIdle()
			else
				lerpsWalk()
			end
		elseif Yvel>0 then
			lerpsJump()
		else
			lerpsFall()
		end

		refreshjointsI(rootpart)
		tclear(refreshedjoints)

		if abs(Yvel)>1 then
			noYvelTime=0
		else
			noYvelTime=clamp(noYvelTime+delta*0.3,0,1)
			xzvel=xzvel*(1-noYvelTime)
		end

		local idlerv=v3(sin((sine-0.0375)*16),sin(sine*16),sin((sine+0.075)*16))
		local idleoff=idlerv*0.001

		local claimpos=primarypart.Position
		local claimposY=claimpos.Y
		for i,v in pairs(cframes) do
			local part=i.p
			if part and (not part.Anchored) and part:IsDescendantOf(ws) then
				if part.ReceiveAge==0 then
					local placeholder=i.v
					if placeholder then
						placeholder.Parent=nil
					end
					if novoid and (v.Y<novoid) then
						v=v+v3_010*(novoid-v.Y)
					end
					local lastpos=i.l
					local vel=(v.Position-lastpos)/delta
					if vel.Magnitude>speedlimit then
						vel=vel.Unit*speedlimit
						v=v+(lastpos+vel*delta)-v.Position
					end
					i.l=v.Position
					if vel.Magnitude<0.15 then
						v=v+idleoff
					end
					local claimtime=i.c
					if claimtime then
						if sine-claimtime<retVelTime then
							part.Velocity=(claimpos-v.Position)*v3_101/getFallingTime(v.Y,claimposY,rGravity)+v3_net
						else
							part.Velocity=getNetlessVelocity(vel*noYvelTime+xzvel)
						end
					else
						i.c=sine
						part.Velocity=getNetlessVelocity(vel*noYvelTime+xzvel)
					end
					part.CFrame=v
					part.RotVelocity=idlerv
				else
					i.c=nil
					i.l=part.Position
					local placeholder=i.v
					if placeholder then
						placeholder.Parent=ws
						placeholder.CFrame=v
					end
				end
			else
				local placeholder=i.v
				if placeholder then
					placeholder.Parent=ws
					placeholder.CFrame=v
				end
			end
		end
	end

	sine=osclock()
	lastsine=sine
	con=heartbeat:Connect(mainFunction)
	mainFunction()

	local function refreshjoints(v) --use this on the main part if u have parts that
		refreshjointsI(v) --are connected with each other but arent connected to rootpart
		tclear(refreshedjoints)
	end

	local legcfR=cf(1,-1,0)
	local legcfL=cf(-1,-1,0)
	local raydir=v3_010*-2
	local function raycastlegs() --this returns 2 values: right leg raycast offset, left leg raycast offset
		local rY=ws:Raycast((cfr*legcfR).Position,raydir,raycastparams)
		local lY=ws:Raycast((cfr*legcfL).Position,raydir,raycastparams)
		return rY and (rY.Position.Y-(pos.Y-3)) or 0,lY and (lY.Position.Y-(pos.Y-3)) or 0
	end

	local function velbycfrvec() --this returns 2 values: forward/backwards movement (from -1 to 1), right/left movement (from -1 to 1)
		local fw=cfr.LookVector*xzvel/walkSpeed
		local rt=cfr.RightVector*xzvel/walkSpeed
		return fw.X+fw.Z,rt.X+rt.Z
	end

	local lastvel=v3_0
	local velchg1=v3_0
	local function velchgbycfrvec() --this returns 2 values: forward/backwards velocity change, right/left velocity change
		velchg1=velchg1+(lastvel-xzvel) --i recommend setting velchg1 to v3_0 when u start using this function or it will look worse
		lastvel=xzvel
		velchg1=velchg1:Lerp(v3_0,deltaTime/2)
		local fw=cfr.LookVector*velchg1/32
		local rt=cfr.RightVector*velchg1/32
		return fw.X+fw.Z,rt.X+rt.Z
	end

	local lastYvel=0
	local velYchg1=0
	local function velYchg() --this returns Y axis velocity change
		velYchg1=clamp(velYchg1+(lastYvel-Yvel),-50,50) --i recommend setting velYchg1 to 0 when u start using this function or it will look worse
		lastYvel=Yvel
		velYchg1=velYchg1-velYchg1*(deltaTime/2)
		return velYchg1
	end

	local function rotToMouse(alpha) --this rotates ur character towards your mouse hit position
		local mpos=mouse.Hit.Position
		cfr=cfr:Lerp(cf(pos,v3(mpos.X,pos.Y,mpos.Z)),alpha or deltaTime)
	end

	local function setWalkSpeed(n)
		if type(n)~="number" then
			n=16
		end
		walkSpeed=n
	end
	local function setJumpPower(n)
		if type(n)~="number" then
			n=50
		end
		jumpPower=n
	end
	local function setGravity(n)
		if type(n)~="number" then
			n=196.2
		end
		gravity=n
	end

	return {
		cframes=cframes,
		joints=joints,
		fling=predictionfling,
		predictionfling=predictionfling,
		refreshjoints=refreshjoints,
		raycastlegs=raycastlegs,
		velbycfrvec=velbycfrvec,
		velchgbycfrvec=velchgbycfrvec,
		velYchg=velYchg,
		addmode=addmode,
		getPart=getPart,
		getPartFromMesh=getPartFromMesh,
		getAccWeldFromMesh=getAccWeldFromMesh,
		getJoint=getJoint,
		getPartJoint=getPartJoint,
		rotToMouse=rotToMouse,
		setWalkSpeed=setWalkSpeed,
		setJumpPower=setJumpPower,
		setGravity=setGravity
	}
end

btn("Rami's Banisher V2", function()
	local t=reanimate()
	local addmode=t.addmode
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(6774735978,6774736019)
	local AccessoryWeld = getPartJoint(AccessoryWeld)

	t.setJumpPower(0)

	local function ShadeID(ID, Duration)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		task.spawn(ShadeID, 1146695308, 2)
		attackAnimation=function()
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.25,-1,1.5)*angles(0,0.2617993877991494,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.5235987755982988),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0)*angles(0,-0.5235987755982988,0.7853981633974483),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.3089969389957472,1.5707963267948966),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.5235987755982988,1.3089969389957472,0.5235987755982988),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.4033920413889427),deltaTime) 
		end
		task.wait(0.3)
		attackAnimation=function()
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.25,-1,1.5)*angles(-0.3490658503988659,0.2617993877991494,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.5235987755982988),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,2.9670597283903604),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0)*angles(0,-0.5235987755982988,0.7853981633974483),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.3089969389957472,1.9198621771937625),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.5235987755982988,1.3089969389957472,0.5235987755982988),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.4033920413889427),deltaTime) 			
		end
		task.wait(0.4)
		attackAnimation=nil
	end)

	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.25)*2.5),0)*angles(-1.631882850614698+0.03490658503988659*sin(sine*2.5),0,3.141592653589793),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.5,-1.1,2.5)*angles(1.5707963267948966,0,-0.6108652381980153),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.3-0.1*sin((sine + 0.75)*2.5),0)*angles(-0.2617993877991494,-0.6108652381980153,0.7853981633974483),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.1*sin((sine + 0.25)*2.5),0.025 * sin(sine*2.5))*angles(-0.7853981633974483-0.03490658503988659*sin(sine*2.5),1.3526301702956054,0.8482300164692442),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132-0.05235987755982989*sin((sine+0.75)*2.5),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin((sine + 0.25)*2.5),0.025 * sin(sine*2.5))*angles(-0.7853981633974483-0.03490658503988659*sin(sine*2.5),-1.3526301702956054,-0.8290313946973066),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3,0)*angles(-1.5707963267948966,0.9599310885968813,1.5707963267948966),deltaTime) 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(14)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0.35 * sin(sine*7))*angles(-0.7853981633974483*sin((sine+0.025)*7),-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802+0.05235987755982989*sin(sine*7),0,3.141592653589793+0.03490658503988659*sin(sine*3.5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3,0)*angles(-1.5707963267948966,0.9599310885968813,1.5707963267948966),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.5*sin((sine + 0.5)*7),-0.5 * sin((sine+1.25)*7))*angles(0.7853981633974483*sin((sine+1.25)*7),1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.075 * sin(sine*7),0)*angles(-1.7453292519943295-0.03490658503988659*sin((sine+1)*7),0,3.141592653589793+0.03490658503988659*sin(sine*3.5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.5*sin((sine + 0.5)*7),0.5 * sin((sine+1.25)*7))*angles(-0.7853981633974483*sin((sine+1.25)*7),-1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.5,-1.1,2.5)*angles(1.5707963267948966,0,-0.6108652381980153),deltaTime) 
		end
	})
	local modeStartTime=sine
	addmode("t", {
		modeEntered=function()
			modeStartTime=sine
		end,
		idle=function()
			if attackAnimation then return attackAnimation() end

			local modeTime=sine-modeStartTime
			if modeTime<0.5 then
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.5,-1,3)*angles(0,0.9599310885968813,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.25,0.5,-0.5)*angles(0,0.6108652381980153,1.5707963267948966),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.5235987755982988,1.3089969389957472,0.4363323129985824),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802,0,2.443460952792061),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.3,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.6108652381980153),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.4363323129985824),deltaTime) 
			elseif modeTime<1 then
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.25,-1,3)*angles(0,0.2617993877991494,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,-0.25)*angles(0,1.3089969389957472,1.5707963267948966),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.5235987755982988,1.3089969389957472,0.4363323129985824),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.0543261909900767),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.3,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.6108652381980153),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.4363323129985824),deltaTime) 
			else
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.25)*2.5),0)*angles(-1.631882850614698+0.03490658503988659*sin(sine*2.5),0,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.5,-1.1,2.5)*angles(1.5707963267948966,0,-0.6108652381980153),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.3-0.1*sin((sine + 0.75)*2.5),0)*angles(-0.2617993877991494,-0.6108652381980153,0.7853981633974483),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.1*sin((sine + 0.25)*2.5),0.025 * sin(sine*2.5))*angles(-0.7853981633974483-0.03490658503988659*sin(sine*2.5),1.3526301702956054,0.8482300164692442),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132-0.05235987755982989*sin((sine+0.75)*2.5),0,3.141592653589793),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin((sine + 0.25)*2.5),0.025 * sin(sine*2.5))*angles(-0.7853981633974483-0.03490658503988659*sin(sine*2.5),-1.3526301702956054,-0.8290313946973066),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3,0)*angles(-1.5707963267948966,0.9599310885968813,1.5707963267948966),deltaTime) 
			end	
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(14)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0.35 * sin(sine*7))*angles(-0.7853981633974483*sin((sine+0.025)*7),-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802+0.05235987755982989*sin(sine*7),0,3.141592653589793+0.03490658503988659*sin(sine*3.5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3,0)*angles(-1.5707963267948966,0.9599310885968813,1.5707963267948966),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.5*sin((sine + 0.5)*7),-0.5 * sin((sine+1.25)*7))*angles(0.7853981633974483*sin((sine+1.25)*7),1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.075 * sin(sine*7),0)*angles(-1.7453292519943295-0.03490658503988659*sin((sine+1)*7),0,3.141592653589793+0.03490658503988659*sin(sine*3.5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.5*sin((sine + 0.5)*7),0.5 * sin((sine+1.25)*7))*angles(-0.7853981633974483*sin((sine+1.25)*7),-1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-1.5,-1.1,2.5)*angles(1.5707963267948966,0,-0.6108652381980153),deltaTime) 
		end
	})
end)
btn("Star Glitcher", function()
	local t=reanimate()
	local addmode=t.addmode
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(4315410540,4458626951)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	local AccessoryWeld1 = getPartFromMesh(4315410540,4315250791)
	local AccessoryWeld1 = getPartJoint(AccessoryWeld1)
	local AccessoryWeld2 = getPartFromMesh(4315410540,4506940486)
	local AccessoryWeld2 = getPartJoint(AccessoryWeld2)
	local AccessoryWeld3 = getPartFromMesh(4315410540,4794299274)
	local AccessoryWeld3 = getPartJoint(AccessoryWeld3)

	t.setJumpPower(0)
	addmode("default", {
		idle = function()
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.155 * sin((sine+0.75)*1.75),0.2 * sin(sine*1.75))*angles(-1.8325957145940461+0.05235987755982989*sin(sine*1.75),0,2.792526803190927),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.35-0.125*sin((sine - 0.75) * 1.75),0)*angles(-1.5707963267948966,1.3089969389957472+0.1308996938995747*sin((sine+1.75)*1.75),1.5707963267948966),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.1,-1-0.1*sin((sine + 0.75)*1.75),-0.4-0.15*sin(sine*1.75))*angles(-0.6108652381980153-0.05235987755982989*sin(sine*1.75),-1.0471975511965976,-0.7853981633974483),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.4-0.1*sin((sine + 0.75)*1.75),0.3-0.155*sin(sine*1.75))*angles(-1.3089969389957472-0.05235987755982989*sin(sine*1.75),1.0471975511965976,0.9599310885968813),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.6,0)*angles(1.5707963267948966,-2.0943951023931953,-1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3089969389957472-0.05235987755982989*sin((sine+0.75)*1.75),0.05235987755982989,3.4033920413889427),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()


			t.setWalkSpeed(12)
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4+0.1*sin((sine + 0.1)*5),0.2 * sin((sine-0.1)*-5))*angles(0.17453292519943295*sin((sine-0.8)*-5),1.5707963267948966+0.3490658503988659*sin(sine*5),0.5235987755982988*sin((sine-0.2)*5)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7016960206944713+0.04363323129985824*sin((sine-0.5)*7.5),0,3.141592653589793+0.04363323129985824*sin(sine*-5)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine-0.1)*7.5),0.05 * sin((sine+0.1)*-7.5))*angles(-1.9198621771937625+0.03490658503988659*sin((sine+0.1)*-7.5),0,3.141592653589793+0.04363323129985824*sin(sine*5)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.3*sin((sine + 0.3)*-5),-0.2+0.4*sin((sine - 0.5)*-5))*angles(-1.5707963267948966+0.6108652381980153*sin((sine+1.2)*-5),1.5707963267948966,1.5707963267948966),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.3*sin((sine + 0.3)*5),-0.2+0.4*sin((sine + 0.7)*5))*angles(1.5707963267948966+0.6108652381980153*sin((sine-1.3)*5),-1.5707963267948966,1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.75,0)*angles(-1.5707963267948966,-0.8726646259971648,1.7453292519943295),deltaTime) 			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 

		end
	})
	addmode("e", {
		idle = function()

			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.8,0.3+0.3*sin((sine + 1)*2.5),-0.2)*angles(0,-2.792526803190927,-1.9198621771937625-0.17453292519943295*sin(sine*2.5)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.05235987755982989*sin((sine+0.75)*2.5),0,3.2724923474893677),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.1-0.1*sin(sine*2.5),0.1)*angles(-0.5235987755982988-0.04363323129985824*sin((sine-1)*2.5),1.3089969389957472,0.2617993877991494),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.8,-0.2+0.3*sin((sine + 1)*2.5),0)*angles(0,2.9670597283903604,1.7453292519943295+0.17453292519943295*sin(sine*2.5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.1-0.1*sin(sine*2.5),-0.1)*angles(-0.5235987755982988-0.04363323129985824*sin((sine-1)*2.5),-1.3089969389957472,-0.5235987755982988),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin(sine*2.5),0)*angles(-1.5271630954950384+0.04363323129985824*sin((sine-1)*2.5),0,3.0543261909900767),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()

			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 

		end
	})	
	addmode("r", {
		idle = function()

			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.2-0.2*sin((sine + 0.5)*1.5),-0.3+0.15*sin(sine*1.5))*angles(-0.8726646259971648-0.08726646259971647*sin(sine*1.5),-1.3962634015954636,-0.6108652381980153),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin((sine+0.5)*1.5),0)*angles(-1.3089969389957472+0.08726646259971647*sin(sine*1.5),0,3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.8,0.2+0.25*sin((sine + 1)*1.5),0)*angles(0,0.6981317007977318,-0.7853981633974483),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.8,0.2+0.25*sin((sine + 1)*1.5),0)*angles(0,-0.6981317007977318,0.7853981633974483),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.2-0.2*sin((sine + 0.5)*1.5),-0.3+0.15*sin(sine*1.5))*angles(-0.8726646259971648-0.08726646259971647*sin(sine*1.5),1.3962634015954636,0.6108652381980153),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295-0.05235987755982989*sin(sine*1.5),0,3.141592653589793),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 

		end,
		walk = function()


			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})	
	addmode("t", {
		idle = function()

			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.3-0.1*sin((sine+0.7)*1.75),-0.3-0.05*sin((sine+0.1)*1.75))*angles(-1.3089969389957472-0.08726646259971647*sin(sine*1.75),-1.1344640137963142-0.03490658503988659*sin(sine*1.75),-0.9599310885968813),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.1 * sin((sine+0.75)*1.75),0.09 * sin(sine*1.75))*angles(-1.3089969389957472+0.08726646259971647*sin(sine*1.75),0,2.8797932657906435),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1.2-0.1*sin((sine+0.7)*1.75),-0.05 * sin((sine+0.1)*1.75))*angles(-1.1344640137963142-0.08726646259971647*sin(sine*1.75),0.9424777960769379-0.03490658503988659*sin(sine*1.75),0.4363323129985824),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295-0.08726646259971647*sin((sine+0.5)*1.75),0.08726646259971647*sin(sine*1000),3.385938748868999),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2-0.2*sin((sine+0.25)*1.75),0.3)*angles(-1.3089969389957472+0.1308996938995747*sin(sine*1000),-1.1344640137963142-0.2181661564992912*sin((sine-0.5)*1.75),-0.9599310885968813+0.17453292519943295*sin(sine*1.75)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.2*sin((sine+0.25)*1.75),0.3)*angles(-1.3089969389957472+0.1308996938995747*sin(sine*1000),1.1344640137963142+0.2181661564992912*sin((sine-0.5)*1.75),0.9599310885968813-0.17453292519943295*sin(sine*1.75)),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()



			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})
	addmode("y", {
		idle = function()

			RootJoint.C0=RootJoint.C0:Lerp(cf(-0.04 * sin((sine+1)*2),0.1 * sin((sine+1)*2),0)*angles(-1.5707963267948966,0.026179938779914945*sin(sine*2),2.443460952792061),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,-0.08726646259971647*sin((sine+1)*2),3.6651914291880923),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1-0.04*sin((sine + 1)*2),-1-0.1*sin((sine + 1)*2),0)*angles(-0.5235987755982988,1.3089969389957472,0.4363323129985824),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1-0.04*sin((sine + 1)*2),-1-0.1*sin((sine + 1)*2),0)*angles(-0.5235987755982988,-1.3089969389957472,-0.4363323129985824),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.9,-0.2-0.15*sin(sine*2),-0.3)*angles(-0.2617993877991494,1.0471975511965976,2.356194490192345-0.17453292519943295*sin((sine-1)*2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.3+0.175*sin((sine + 1)*2),0)*angles(-0.6108652381980153,-1.3089969389957472+0.17453292519943295*sin(sine*2),-0.6108652381980153),deltaTime) 			
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()



			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})
	addmode("u", {
		idle = function()
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.3+0.2*sin(sine*1.5),0)*angles(-1.3089969389957472,-1.1344640137963142-0.2617993877991494*sin((sine+0.75)*1.5),-1.3089969389957472),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,3+0.5*sin((sine+0.75)*1.5),0.3 * sin(sine*0.64))*angles(-1.6580627893946132+0.08726646259971647*sin(sine*1.5),0,3.6651914291880923),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.2*sin(sine*1.5),0)*angles(-0.9599310885968813-0.2617993877991494*sin((sine+0.75)*1.5),-1.0471975511965976,-0.8726646259971648),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.8,0)*angles(1.5707963267948966-0.08726646259971647*sin(sine*1.5),2.2689280275926285,1.6580627893946132),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,0.35 * sin(sine*1.5),-0.7)*angles(-0.9599310885968813-0.17453292519943295*sin((sine+0.75)*1.5),1.2217304763960306,0.9599310885968813),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.5707963267948966-0.08726646259971647*sin(sine*1.5),0,2.443460952792061),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()


			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})
	addmode("f", {
		idle = function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.25,-0.25)*angles(0,2.6179938779914944,1.7453292519943295+0.08726646259971647*sin((sine-0.5)*2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0,0)*angles(-0.3490658503988659,-2.792526803190927,-1.7453292519943295+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.5)*2),-0.17453292519943295+0.08726646259971647*sin((sine+0.5)*-2),2.6179938779914944),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.25+0.1*sin(sine*2),-0.5)*angles(-0.6981317007977318,0.9599310885968813+0.08726646259971647*sin((sine+0.5)*2),0.3490658503988659+0.17453292519943295*sin((sine+0.5)*-2)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-1.2217304763960306+0.1308996938995747*sin((sine-0.75)*2),-1.1344640137963142+0.08726646259971647*sin(sine*2),-0.8726646259971648),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*1),3+0.5*sin(sine*2),0)*angles(-1.7453292519943295+0.08726646259971647*sin((sine+1)*-2),0.3490658503988659+0.1308996938995747*sin(sine*1),3.6651914291880923),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()



			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})
	addmode("g", {
		idle = function()


			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.05235987755982989*sin(sine*2),0,3.5779249665883754),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin(sine*2),0)*angles(-1.6580627893946132-0.05235987755982989*sin((sine-1)*2),0,2.530727415391778),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.1*sin(sine*2),0)*angles(-0.5235987755982988+0.05235987755982989*sin((sine-1)*2),1.3089969389957472,0.5235987755982988),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.15+0.3*sin((sine + 1)*2),0)*angles(-1.5707963267948966,1.0471975511965976-0.3490658503988659*sin(sine*2),1.7453292519943295),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.15+0.3*sin((sine + 1)*2),0)*angles(-1.5707963267948966,-1.0471975511965976+0.3490658503988659*sin(sine*2),-1.7453292519943295),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin(sine*2),0)*angles(-0.5235987755982988+0.05235987755982989*sin((sine-1)*2),-1.3089969389957472,-0.5235987755982988),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()



			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})
	addmode("h", {
		idle = function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.08726646259971647*sin(sine*1.5),0.17453292519943295,2.6179938779914944),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.875,-0.4,-0.25)*angles(0.08726646259971647*sin((sine+0.25)*-1.5),-2.443460952792061,-2.0943951023931953),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.025*sin(sine*-1.5),-1+0.1*sin((sine - 0.4)*-1.5),0.075 * sin((sine+0.7)*-1.5))*angles(1.5707963267948966+0.05235987755982989*sin((sine+1.4)*-1.5),-1.9198621771937625+0.026179938779914945*sin(sine*-1.5),2.0943951023931953),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.75,-0.2,-0.25)*angles(-0.4363323129985824+0.1308996938995747*sin((sine+1.5)*-1.5),2.792526803190927,2.2689280275926285),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.9172883033752441,-1.079618215560913,-0.22498130798339844)*angles(-3.141592653589793,0,-3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.75,-0.75)*angles(-1.0471975511965976,1.2217304763960306,0.17453292519943295*sin((sine+0.5)*1.5)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.15 * sin((sine-0.6)*1.5),0.1 * sin((sine+0.7)*1.5))*angles(-1.2217304763960306+0.05235987755982989*sin((sine-0.7)*-1.5),-0.3490658503988659,2.792526803190927),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.2021636962890625,20,-0.2653465270996094)*angles(0,0,0),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(2.5,2.5,-2)*angles(0,0,-3.141592653589793-0.05235987755982989*sin(sine*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(2.5,2.5,-2)*angles(0,0,-2.356194490192345-0.05235987755982989*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,2.5,-2)*angles(0,0,-1.7453292519943295+0.05235987755982989*sin(sine*1.5)),deltaTime)  
		end,
		walk = function()
			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})
	addmode("j", {
		idle = function()

			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.08726646259971647*sin(sine*2),0.05235987755982989*sin((sine+1)*2),3.9269908169872414),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.3,0.4-0.15*sin((sine + 0.25)*2),-0.5)*angles(0,-0.3490658503988659+0.08726646259971647*sin(sine*2),-1.5707963267948966+0.08726646259971647*sin(sine*2)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.2 * sin(sine*1.75),0.1 * sin((sine-1)*1.75),0)*angles(-1.5707963267948966,0.08726646259971647*sin(sine*1.75),2.0943951023931953),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin((sine - 1) * 1.75),-0.05+0.15*sin(sine*1.75))*angles(-0.5235987755982988+0.08726646259971647*sin(sine*1.75),-1.3089969389957472,-0.5235987755982988),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.1*sin((sine - 1) * 1.75),-0.05+0.15*sin(sine*1.75))*angles(-0.5235987755982988+0.08726646259971647*sin(sine*1.75),1.3089969389957472,0.5235987755982988),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.9,0.6,0)*angles(1.3089969389957472-0.05235987755982989*sin(sine*2),1.9198621771937625,1.7453292519943295),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end,
		walk = function()


			t.setWalkSpeed(24)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*5),-0.1+0.1*sin((sine + 0.4)*10),0.1 * sin((sine+0.3)*10))*angles(-1.9198621771937625+0.08726646259971647*sin((sine+0.2)*10),0.08726646259971647*sin(sine*5),3.141592653589793+0.08726646259971647*sin(sine*5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0.5 * sin((sine+0.6)*10))*angles(1.2217304763960306*sin((sine+0.5)*-10),1.5707963267948966+0.17453292519943295*sin((sine+0.7)*-10),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.75*sin((sine + 0.3)*-10),-0.15+0.7*sin((sine - 1.3)*-10))*angles(-1.6144295580947547+1.0471975511965976*sin((sine+1.74)*10),1.5707963267948966+0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.2)*-10),0.08726646259971647*sin(sine*-5),3.141592653589793+0.08726646259971647*sin(sine*-5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.3)*10),-0.15+0.7*sin((sine - 2.2)*-10))*angles(1.5271630954950384+1.0471975511965976*sin((sine+1.74)*-10),-1.5707963267948966-0.04363323129985824*sin(sine*-5),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.6)*-10))*angles(1.2217304763960306*sin((sine+0.5)*10),-1.5707963267948966+0.17453292519943295*sin((sine+0.7)*10),0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3.5,-1.15,-1.5)*angles(0,0,-0.2181661564992912+0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(-1.15,3.5,-1.5)*angles(0,0,-1.4835298641951802-0.2617993877991494*sin((sine+1)*1.5)),deltaTime) 
			AccessoryWeld2.C0=AccessoryWeld2.C0:Lerp(cf(-0.5,2.5,-1.5)*angles(0,0,-1.3089969389957472-0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
			AccessoryWeld3.C0=AccessoryWeld3.C0:Lerp(cf(2.5,-0.5,-1.5)*angles(0,0,-0.4363323129985824+0.2617993877991494*sin((sine+1.25)*1.5)),deltaTime) 
		end
	})
end)
btn("Jetstream Sam", function()
	local t=reanimate()
	local addmode=t.addmode
	local refreshjoints=t.refreshjoints
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(5870320437,5870198698)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	local cframes=t.cframes
	local rootpart1=t.getPart("HumanoidRootPart")
	local rootpart=t.getPart("Head")
	local i1=i("TextLabel") 
	local i2=i("BillboardGui") 
	i1.Font=e.Font.Garamond 
	i1.FontSize=e.FontSize.Size14 
	i1.Text="[ // Bloodridden Samurai // ]" 
	i1.TextColor3=c3(1,0,0) 
	i1.TextScaled=true 
	i1.TextStrokeTransparency=0 
	i1.BackgroundColor3=c3(0.25,0,0) 
	i1.BackgroundTransparency=1
	i1.Size=u2(1,0,1,0) 
	i1.Name=rs() 
	i1.Parent=i2 
	i2.AlwaysOnTop=true 
	i2.ClipsDescendants=true 
	i2.LightInfluence=1 
	i2.Size=u2(10,0,1.75,0) 
	i2.StudsOffset=v3(0,1.75,0) 
	i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
	i2.ResetOnSpawn=false 
	i2.Name=rs() 
	i2.Parent=pg 
	tspawn(function() while c do twait() end i2:Destroy() end)
	
	t.setJumpPower(0)
	
	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		attackAnimation=function()


			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.5235987755982988,1.3089969389957472,0.5235987755982988),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.5235987755982988),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.3,0.5,0)*angles(0,2.181661564992912,2.356194490192345),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3089969389957472,0,3.3161255787892263),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.7,0.5,0)*angles(0,-2.181661564992912,-2.356194490192345),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.3161255787892263),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.175,3,-3.5)*angles(-0.8726646259971648,0,3.141592653589793),deltaTime) 
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
		task.wait(0.15)
		attackAnimation=function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.5235987755982988,1.3264502315156905,0.6108652381980153),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.7453292519943295,0,2.8797932657906435),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.6108652381980153),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.7,0,0)*angles(0,2.0943951023931953,1.0471975511965976),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0,0)*angles(0,-2.2689280275926285,-1.0471975511965976),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.15,0.5,-4)*angles(-2.6179938779914944,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295,0,2.8797932657906435),deltaTime) 
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
		task.wait(0.25)
		attackAnimation=nil
	end)



	
	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(-0.1,0.3,-1.7)*angles(0.3490658503988659,0,-0.8726646259971648-0.05235987755982989*sin(sine*1.7)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.4+0.1*sin(sine*1.6),0.05 * sin(sine*1.58))*angles(-2.181661564992912+0.05235987755982989*sin(sine*1.58),0,3.141592653589793),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.1200218200683594,-0.013523101806640625,-0.10128402709960938)*angles(-0.22689280275926285,-0.03490658503988659,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953+0.17453292519943295*sin(sine*1.579),0.17453292519943295+0.08726646259971647*sin(sine*1),2.792526803190927+0.05235987755982989*sin(sine*1.3)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-0.3,-0.74-0.1*sin(sine*1.6),-0.4-0.04*sin(sine*1.58))*angles(0.7853981633974483-0.08726646259971647*sin(sine*1.58),0.4363323129985824,-0.17453292519943295),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.6,0.4,-0.2)*angles(0.6981317007977318,0,0.3490658503988659+0.05235987755982989*sin(sine*1.7)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.45,-1.4-0.1*sin(sine*1.6),0.2-0.07*sin(sine*1.58))*angles(-0.08726646259971647*sin(sine*1.58),-0.4363323129985824,0.3490658503988659),deltaTime) 
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(30)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.2+0.3*sin(sine*12.5),-0.6 * sin((sine+1.8)*12.5))*angles(-1.7453292519943295*sin(sine*12.5),-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.2+0.3*sin((sine + 0.15)*12.5),0.6 * sin((sine-0.7)*12.5))*angles(-1.0471975511965976+1.7453292519943295*sin((sine+0.5)*12.5),1.3962634015954636,1.2217304763960306),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.1200218200683594,-0.013523101806640625,-0.10128402709960938)*angles(-0.22689280275926285,-0.03490658503988659,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.04363323129985824*sin((sine+0.35)*-10),0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+1*sin((sine - 0.4)*-12.5),-0.325+1*sin((sine + 1.8)*-12.5))*angles(1.7453292519943295*sin((sine+1.5)*-12.5),1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.3)*10),0.075 * sin((sine+0.2)*10))*angles(-2.007128639793479+0.04363323129985824*sin((sine+0.2)*10),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+1*sin((sine - 0.4)*12.5),-0.325+1*sin((sine + 1.8)*12.5))*angles(1.7453292519943295*sin((sine+1.5)*12.5),-1.5707963267948966,0),deltaTime) 			
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
	addmode("f", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.15+0.2*sin(sine*2),0.15 * sin((sine+0.75)*-2))*angles(-1.5271630954950384+0.08726646259971647*sin((sine+0.75)*-2),0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.9+0.2*sin((sine - 0.025)*-2),0.0725 * sin((sine+0.75555)*2))*angles(-0.6108652381980153+0.08726646259971647*sin((sine+0.75)*2),1.2217304763960306,0.5235987755982988),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,1.1,-4.5)*angles(3.9706240482870996,0,3.141592653589793),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.6,0.5,-0.6)*angles(1.2217304763960306,-0.5235987755982988,0.8726646259971648),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.08726646259971647*sin((sine-0.25)*-2),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.9+0.2*sin((sine - 0.025)*-2),0.07195555 * sin((sine+0.755)*2))*angles(-0.6108652381980153+0.08726646259971647*sin((sine+0.75)*2),-1.2217304763960306,-0.5235987755982988),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.6,0.5,-0.6)*angles(1.2217304763960306,0.6981317007977318,-0.8726646259971648),deltaTime) 
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(30)
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,1-0.1*sin(sine*2),-4.25)*angles(0.7853981633974483,-3.141592653589793,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.6,0.5,-0.6)*angles(1.2217304763960306,-0.5235987755982988,0.8726646259971648),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.6,0.5,-0.6)*angles(1.2217304763960306,0.6981317007977318,-0.8726646259971648),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.04363323129985824*sin((sine+0.35)*-10),0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+1*sin((sine - 0.4)*-12.5),-0.325+1*sin((sine + 1.8)*-12.5))*angles(1.7453292519943295*sin((sine+1.5)*-12.5),1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.3)*10),0.075 * sin((sine+0.2)*10))*angles(-2.007128639793479+0.04363323129985824*sin((sine+0.2)*10),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+1*sin((sine - 0.4)*12.5),-0.325+1*sin((sine + 1.8)*12.5))*angles(1.7453292519943295*sin((sine+1.5)*12.5),-1.5707963267948966,0),deltaTime) 			
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
	addmode("q", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.1200218200683594,-0.013523101806640625,-0.10128402709960938)*angles(-0.22689280275926285,-0.03490658503988659,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953,0,3.4033920413889427),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.05,0)*angles(-0.5235987755982988,-1.3089969389957472,-0.5235987755982988),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.05,0)*angles(-0.5235987755982988,1.3089969389957472,0.5235987755982988),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.6,-0.35)*angles(0,0.17453292519943295,-1.7453292519943295),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.6231562043547265,0,3.2288591161895095),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.7,0.7,0)*angles(0,2.6179938779914944,1.7627825445142729),deltaTime) 
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(30)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.2+0.3*sin(sine*12.5),-0.6 * sin((sine+1.8)*12.5))*angles(-1.7453292519943295*sin(sine*12.5),-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.2+0.3*sin((sine + 0.15)*12.5),0.6 * sin((sine-0.7)*12.5))*angles(-1.0471975511965976+1.7453292519943295*sin((sine+0.5)*12.5),1.3962634015954636,1.2217304763960306),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.1200218200683594,-0.013523101806640625,-0.10128402709960938)*angles(-0.22689280275926285,-0.03490658503988659,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.04363323129985824*sin((sine+0.35)*-10),0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+1*sin((sine - 0.4)*-12.5),-0.325+1*sin((sine + 1.8)*-12.5))*angles(1.7453292519943295*sin((sine+1.5)*-12.5),1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.3)*10),0.075 * sin((sine+0.2)*10))*angles(-2.007128639793479+0.04363323129985824*sin((sine+0.2)*10),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+1*sin((sine - 0.4)*12.5),-0.325+1*sin((sine + 1.8)*12.5))*angles(1.7453292519943295*sin((sine+1.5)*12.5),-1.5707963267948966,0),deltaTime) 			
			refreshjoints(rootpart1)
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
end)
btn("Butcher", function()
	local t=reanimate()
	local addmode=t.addmode
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local velbycfrvec=t.velbycfrvec
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(5555532600,5555532634)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	t.setJumpPower(0)

	local function ShadeID(ID, Duration)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		task.spawn(ShadeID, 158037267, 0.7)
		attackAnimation=function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.25)*angles(-0.3490658503988659,-0.6981317007977318,-0.6981317007977318),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.25,0.75,-0.5)*angles(-2.792526803190927,-2.443460952792061,1.2217304763960306),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3089969389957472,0.08726646259971647,-2.0943951023931953),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.25,0)*angles(0.3490658503988659,0.6981317007977318,0.6981317007977318),deltaTime)  
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.5,0)*angles(-2.0943951023931953,0.3490658503988659,2.0943951023931953),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.1,-0.25)*angles(-0.6981317007977318,0.8726646259971648,0.5235987755982988),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.75,-2,0.375)*angles(-0.6108652381980153,3.2288591161895095,2.181661564992912),deltaTime) 
		end
		task.wait(0.2)
		attackAnimation=function()
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1,-0.25)*angles(-1.3962634015954636,0.17453292519943295,3.839724354387525),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625,0,2.443460952792061),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.125,0)*angles(-0.6981317007977318,1.0471975511965976,0.5235987755982988),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.075,0.25,0)*angles(-1.0035643198967394,-1.0471975511965976,-0.8726646259971648),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.125,0)*angles(-0.6981317007977318,-1.0471975511965976,-0.4363323129985824),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(-0.5,0,-1)*angles(0.5235987755982988,2.6179938779914944,1.5707963267948966),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.35,-2.25,2.75)*angles(-0.2617993877991494,0,-1.3962634015954636),deltaTime)  			
		end
		task.wait(0.3)
		attackAnimation=nil
	end)


	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.1,0)*angles(0,-1.9198621771937625,-1.2217304763960306),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.2,0)*angles(0,1.9198621771937625,1.9198621771937625),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+1)*2),0)*angles(-1.6580627893946132+0.05235987755982989*sin(sine*2),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin((sine + 1)*2),0)*angles(-0.3490658503988659-0.05235987755982989*sin(sine*2),-1.3089969389957472,-0.3490658503988659),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.017453292519943295*sin(sine*2),0,3.141592653589793),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-2,-0.5,0.1)*angles(-0.9599310885968813,-1.5707963267948966,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.1*sin((sine + 1)*2),0)*angles(-0.3490658503988659-0.05235987755982989*sin(sine*2),1.3089969389957472,0.3490658503988659),deltaTime) 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(13)
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636-0.05235987755982989*sin((sine+1)*6),0,3.141592653589793+0.03490658503988659*sin(sine*3)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.5*sin((sine + 0.75)*6),0.5 * sin(sine*6))*angles(-0.9599310885968813*sin(sine*6),-1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.6,-0.5,-1)*angles(-1.5707963267948966+0.08726646259971647*sin((sine+0.6525)*6),-3.141592653589793,-0.17453292519943295),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.5*sin((sine + 0.75)*6),-0.5 * sin(sine*6))*angles(0.9599310885968813*sin(sine*6),1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0.4 * sin((sine+0.6)*6))*angles(-0.8726646259971648*sin((sine+0.6525)*6),-1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.075 * sin(sine*6),0)*angles(-1.7453292519943295-0.04363323129985824*sin((sine+1.25)*6),0,3.141592653589793+0.03490658503988659*sin(sine*3)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.45,0)*angles(-1.5707963267948966,1.3089969389957472,1.5707963267948966+0.08726646259971647*sin((sine+0.6525)*6)),deltaTime) 
		end
	})
end)

btn("Goner", function()
	local t=reanimate()
	local addmode=t.addmode
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local velbycfrvec=t.velbycfrvec
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	
	local AccessoryWeld1 = getPartFromMesh(7547179386,7547152243)
	local AccessoryWeld1 = getPartJoint(AccessoryWeld1)

	local AccessoryWeld = getPartFromMesh(4315410540,4506940486)
	local AccessoryWeld = getPartJoint(AccessoryWeld)

	t.setJumpPower(0)

	local function ShadeID(ID, Duration)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		task.spawn(ShadeID, 211059653, 5)
		attackAnimation=function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.5,3.5,0.5)*angles(-1.5707963267948966,0,0),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(1.5,3.5,0.5)*angles(-1.5707963267948966,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.443460952792061,1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 		
		end
		task.wait(0.2)
		attackAnimation=function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3,4.5,0.5)*angles(-1.5707963267948966,1.5707963267948966,0),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(3,4.5,0.5)*angles(-1.5707963267948966,1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,0.6981317007977318,1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 			
		end
		task.wait(0.3)
		attackAnimation=nil
	end)


	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0,0.4)*angles(0,1.5707963267948966,-0.4363323129985824),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.9,-0.2)*angles(0,-1.2217304763960306,-0.2617993877991494),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.2,0)*angles(-1.8325957145940461,0,2.9670597283903604),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636+0.05235987755982989*sin((sine+0.5)*100000),0.10471975511965978*sin(sine*100000),3.3161255787892263),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.2,0.2)*angles(0,1.2217304763960306,-0.17453292519943295),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.25,0)*angles(0.3490658503988659,-1.3089969389957472,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(2,3,-1.5)*angles(-1.5707963267948966,-1.7889624832941877,-1.5707963267948966),deltaTime) 			
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(2,3,-1.5)*angles(-1.5707963267948966,-1.7889624832941877,-1.5707963267948966),deltaTime) 			
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(6)
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(2.25,2.5,-1.5)*angles(-1.5707963267948966,-1.3962634015954636+0.05235987755982989*sin((sine+2)*4),-1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3089969389957472,0.06981317007977318+0.05235987755982989*sin(sine*1000000),3.141592653589793),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin(sine*4),0)*angles(-1.9198621771937625-0.05235987755982989*sin((sine+2)*4),0,3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0,0.3)*angles(-0.5235987755982988+0.05235987755982989*sin((sine+2)*4),1.3089969389957472,0),deltaTime) 
			AccessoryWeld1.C0=AccessoryWeld1.C0:Lerp(cf(2.25,2.5,-1.5)*angles(-1.5707963267948966,-1.3962634015954636+0.05235987755982989*sin((sine+2)*4),-1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0)*angles(1.5707963267948966,-1.3089969389957472,-0.2617993877991494),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.5*sin((sine + 1)*3),-0.5 * sin((sine+0.25)*3))*angles(0.9599310885968813*sin((sine+0.25)*3),1.5707963267948966,0),deltaTime)  
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.5*sin((sine + 1)*3),0.5 * sin((sine+0.25)*3))*angles(-0.9599310885968813*sin((sine+0.25)*3),-1.5707963267948966,0),deltaTime)
		end
	})
	addmode("q", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-10,0)*angles(-3.141592653589793,0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 			
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(30)
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-10,0)*angles(-3.141592653589793,0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 			end
	})
end)
btn("Neptunian V", function()
	local t=reanimate()
	local addmode=t.addmode
	local refreshjoints=t.refreshjoints
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local velbycfrvec=t.velbycfrvec
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(12798770968,12798770990)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	local AccessoryWeld1 = getPartFromMesh(4315410540,4506940486)
	local AccessoryWeld1 = getPartJoint(AccessoryWeld1)
	local cframes=t.cframes
	local rootpart1=t.getPart("HumanoidRootPart")
	local rootpart=t.getPart("Head")
	local i1=i("TextLabel") 
	local i2=i("BillboardGui") 
	i1.Font=e.Font.Michroma
	i1.FontSize=e.FontSize.Size14 
	i1.Text="Neptunian V" 
	i1.TextColor3=c3(1,0,1) 
	i1.TextScaled=true 
	i1.TextStrokeTransparency=0 
	i1.BackgroundColor3=c3(0,0,0) 
	i1.BackgroundTransparency=1
	i1.Size=u2(1,0,1,0) 
	i1.Name=rs() 
	i1.Parent=i2 
	i2.AlwaysOnTop=true 
	i2.ClipsDescendants=true 
	i2.LightInfluence=1 
	i2.Size=u2(10,0,1.75,0) 
	i2.StudsOffset=v3(0,1.75,0) 
	i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
	i2.ResetOnSpawn=false 
	i2.Name=rs() 
	i2.Parent=pg 
	tspawn(function() while c do twait() end i2:Destroy() end)

	local function ShadeID(ID, Duration)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		task.spawn(ShadeID, 200633196, 5)
		attackAnimation=function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.356194490192345,1.5707963267948966),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6231562043547265,0.05235987755982989,2.443460952792061),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.7853981633974483,-1.3089969389957472,-0.7853981633974483),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.25,-2,2)*angles(1.5707963267948966,-0.08726646259971647,1.5707963267948966),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.3490658503988659,0.7853981633974483,0.2617993877991494),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.3089969389957472,-1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,4.014257279586958),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 

		end
		task.wait(0.2)
		attackAnimation=function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636,0.05235987755982989,4.014257279586958),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.7,-0.5)*angles(0.3490658503988659,-0.5235987755982988,-1.5707963267948966),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.5,-3.25,2)*angles(0.3490658503988659,0,1.5707963267948966),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.4363323129985824,-0.8726646259971648,-0.6108652381980153),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.6108652381980153,1.3089969389957472,0.6981317007977318),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.7453292519943295,0.17453292519943295,2.2689280275926285),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.35,0.5,-0.5)*angles(0,0.17453292519943295,1.5707963267948966),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 

		end
		task.wait(0.3)
		attackAnimation=nil
	end)


	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.025,-1.1,-0.06 * sin(sine*2))*angles(-1.0471975511965976-0.03490658503988659*sin(sine*2),-1.3962634015954636-0.03490658503988659*sin((sine+0.75)*2),-0.9599310885968813),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.075 * sin((sine+0.75)*2),0,0.1 * sin(sine*2))*angles(-1.5707963267948966+0.03490658503988659*sin(sine*2),0.03490658503988659*sin((sine+0.75)*2),2.8797932657906435),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132-0.06981317007977318*sin((sine+0.5)*2),0.05235987755982989*sin(sine*2),3.4033920413889427),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1.025,-1.1,-0.06 * sin(sine*2))*angles(-1.0471975511965976-0.03490658503988659*sin(sine*2),1.3962634015954636-0.03490658503988659*sin((sine+0.75)*2),0.9599310885968813),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.1507892608642578,0.010945305228233337,0.03747892379760742)*angles(0.5235987755982988,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1-0.05*sin(sine*2),0.5,-0.1)*angles(0.8726646259971648,-1.3089969389957472+0.05235987755982989*sin((sine+0.5)*2),0.8726646259971648),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1-0.05*sin(sine*2),0.5,0)*angles(-0.8726646259971648,1.3089969389957472-0.05235987755982989*sin((sine+0.5)*2),0.8726646259971648),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 

		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(16)
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.3*sin((sine + 0.5)*7),0.4 * sin((sine+0.75)*7))*angles(-0.9599310885968813*sin((sine+0.75)*7),-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0.3 * sin(sine*6))*angles(-1.0471975511965976*sin(sine*6),1.5707963267948966-0.17453292519943295*sin(sine*6),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.3*sin((sine + 0.5)*7),-0.4 * sin((sine+0.75)*7))*angles(0.9599310885968813*sin((sine+0.75)*7),1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.1507892608642578,0.010945305228233337,0.03747892379760742)*angles(0.5235987755982988,-1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.075 * sin((sine+0.75)*6),0)*angles(-1.6580627893946132+0.026179938779914945*sin(sine*6),0,3.141592653589793),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,-0.3 * sin(sine*6))*angles(1.0471975511965976*sin(sine*6),-1.5707963267948966-0.17453292519943295*sin(sine*6),0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802+0.05235987755982989*sin((sine+0.25)*5),0,3.141592653589793),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
			end,
		jump = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.025,-1.1,-0.06 * sin(sine*2))*angles(-1.0471975511965976-0.03490658503988659*sin(sine*2),-1.3962634015954636-0.03490658503988659*sin((sine+0.75)*2),-0.9599310885968813),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.075 * sin((sine+0.75)*2),0,0.1 * sin(sine*2))*angles(-1.5707963267948966+0.03490658503988659*sin(sine*2),0.03490658503988659*sin((sine+0.75)*2),2.8797932657906435),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132-0.06981317007977318*sin((sine+0.5)*2),0.05235987755982989*sin(sine*2),3.4033920413889427),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1.025,-1.1,-0.06 * sin(sine*2))*angles(-1.0471975511965976-0.03490658503988659*sin(sine*2),1.3962634015954636-0.03490658503988659*sin((sine+0.75)*2),0.9599310885968813),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.1507892608642578,0.010945305228233337,0.03747892379760742)*angles(0.5235987755982988,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1-0.05*sin(sine*2),0.5,-0.1)*angles(0.8726646259971648,-1.3089969389957472+0.05235987755982989*sin((sine+0.5)*2),0.8726646259971648),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1-0.05*sin(sine*2),0.5,0)*angles(-0.8726646259971648,1.3089969389957472-0.05235987755982989*sin((sine+0.5)*2),0.8726646259971648),deltaTime) 
			--MW_animatorProgressSave: RightArm,1,0,0,1,-0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-40,0,0,1,-1,0,0,1,75,0,0,1,0,0,0,1,20,0,0,1,LeftArm,-1,0,0,1,-90,0,0,1,0.4,0,0,1,-50,0,0,1,0,0,0,1,-90,0,0,1,Torso,0,0,0,1,-87,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Head,0,0,0,1,-75,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,-30,0,0,1,-0,0,0,1,-75,0,0,1,-0.5,0,0,1,-15,0,0,1,Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		fall = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.025,-1.1,-0.06 * sin(sine*2))*angles(-1.0471975511965976-0.03490658503988659*sin(sine*2),-1.3962634015954636-0.03490658503988659*sin((sine+0.75)*2),-0.9599310885968813),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.075 * sin((sine+0.75)*2),0,0.1 * sin(sine*2))*angles(-1.5707963267948966+0.03490658503988659*sin(sine*2),0.03490658503988659*sin((sine+0.75)*2),2.8797932657906435),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132-0.06981317007977318*sin((sine+0.5)*2),0.05235987755982989*sin(sine*2),3.4033920413889427),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1.025,-1.1,-0.06 * sin(sine*2))*angles(-1.0471975511965976-0.03490658503988659*sin(sine*2),1.3962634015954636-0.03490658503988659*sin((sine+0.75)*2),0.9599310885968813),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.1507892608642578,0.010945305228233337,0.03747892379760742)*angles(0.5235987755982988,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1-0.05*sin(sine*2),0.5,-0.1)*angles(0.8726646259971648,-1.3089969389957472+0.05235987755982989*sin((sine+0.5)*2),0.8726646259971648),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1-0.05*sin(sine*2),0.5,0)*angles(-0.8726646259971648,1.3089969389957472-0.05235987755982989*sin((sine+0.5)*2),0.8726646259971648),deltaTime) 
			--MW_animatorProgressSave: RightArm,1,0,0,1,-0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-40,0,0,1,-1,0,0,1,75,0,0,1,0,0,0,1,20,0,0,1,LeftArm,-1,0,0,1,-90,0,0,1,0.4,0,0,1,-70,0,0,1,0,0,0,1,-90,0,0,1,Torso,0,0,0,1,-87,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Head,0,0,0,1,-105,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,-30,0,0,1,-0,0,0,1,-75,0,0,1,-0.5,0,0,1,-15,0,0,1,Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})

	local modeStartTime=sine
	addmode("f", {
		modeEntered=function()
			task.spawn(ShadeID, 1368637781, 5)
			modeStartTime=sine
		end,
		idle=function()
			if attackAnimation then return attackAnimation() end
			local modeTime=sine-modeStartTime
			if modeTime<0.5 then
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,2.356194490192345,1.5707963267948966),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6231562043547265,0.05235987755982989,2.443460952792061),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.7853981633974483,-1.3089969389957472,-0.7853981633974483),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.25,-2,2)*angles(1.5707963267948966,-0.08726646259971647,1.5707963267948966),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.3490658503988659,0.7853981633974483,0.2617993877991494),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(0,-1.3089969389957472,-1.5707963267948966),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,4.014257279586958),deltaTime) 
				i2.StudsOffsetWorldSpace=cframes[rootpart].Position 

			elseif modeTime<0.9 then
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636,0.05235987755982989,4.014257279586958),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.7,-0.5)*angles(0.3490658503988659,-0.5235987755982988,-1.5707963267948966),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.5,-3.25,2)*angles(0.3490658503988659,0,1.5707963267948966),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.4363323129985824,-0.8726646259971648,-0.6108652381980153),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.6108652381980153,1.3089969389957472,0.6981317007977318),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.7453292519943295,0.17453292519943295,2.2689280275926285),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.35,0.5,-0.5)*angles(0,0.17453292519943295,1.5707963267948966),deltaTime) 
				i2.StudsOffsetWorldSpace=cframes[rootpart].Position 

			else
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1-0.05*sin(sine*2),-1-0.1*sin((sine + 0.75)*2),0.05+0.025*sin((sine + 0.5)*2))*angles(-0.5235987755982988-0.03490658503988659*sin((sine+0.5)*2),-1.3089969389957472-0.017453292519943295*sin(sine*2),-0.5235987755982988),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0.075 * sin(sine*2),0.1 * sin((sine+0.75)*2),0)*angles(-1.5707963267948966+0.03490658503988659*sin((sine+0.5)*2),0.017453292519943295*sin(sine*2),2.8797932657906435),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.45,-1.25+0.05*sin((sine + 0.5)*2),3)*angles(0.05235987755982989,-0.17453292519943295+0.03490658503988659*sin(sine*2),3.0543261909900767-0.03490658503988659*sin((sine+0.75)*2)),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.475+0.086*sin((sine + 0.5)*2),0)*angles(-0.6981317007977318,1.3089969389957472+0.03490658503988659*sin(sine*2),0.7853981633974483+0.03490658503988659*sin((sine+0.75)*2)),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.03490658503988659*sin(sine*2),0.03490658503988659*sin((sine+0.75)*2),3.3161255787892263),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1-0.05*sin(sine*2),-1-0.1*sin((sine + 0.75)*2),0.05+0.025*sin((sine + 0.5)*2))*angles(-0.5235987755982988-0.03490658503988659*sin((sine+0.5)*2),1.3089969389957472-0.017453292519943295*sin(sine*1),0.5235987755982988),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35+0.075*sin((sine + 0.35)*2),0)*angles(-1.5707963267948966,-1.3962634015954636-0.03490658503988659*sin(sine*2),-1.5707963267948966),deltaTime) 
				--MW_animatorProgressSave: LeftLeg,-1,-0.05,0,2,-30,-2,0.5,2,-1,-0.1,0.75,2,-75,-1,0,2,0.05,0.025,0.5,2,-30,0,0,1,Torso,0,0.075,0,2,-90,2,0.5,2,0,0.1,0.75,2,-0,1,0,2,0,0,0,1,165,0,0,1,Meshes/swoooordAccessory_Handle,1.45,0,0,1,3,0,0,1,-1.25,0.05,0.5,2,-10,2,0,2,3,0,0,1,175,-2,0.75,2,RightArm,1,0,0,1,-40,0,0,1,0.475,0.086,0.5,2,75,2,0,2,0,0,0,1,45,2,0.75,2,Head,0,0,0,1,-90,-2,0,2,1,0,0,1,-0,2,0.75,2,0,0,0,1,190,0,0,1,RightLeg,1,-0.05,0,2,-30,-2,0.5,2,-1,-0.1,0.75,2,75,-1,0,1,0.05,0.025,0.5,2,30,0,0,1,LeftArm,-1,0,0,1,-90,0,0,1,0.35,0.075,0.35,2,-80,-2,0,2,0,0,0,1,-90,0,0,1
				i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
			end	
		end,
		walk = function()
		if attackAnimation then return attackAnimation() end
	t.setWalkSpeed(35)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.15 * sin((sine-0.05)*28),0)*angles(-2.050761871093337+0.08726646259971647*sin((sine-0.15)*28),0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802+0.05235987755982989*sin((sine+0.6)*-28),0.017453292519943295*sin((sine+0.6325)*-14),3.141592653589793),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.45,-1.25+0.05*sin((sine + 0.5)*2),3)*angles(0.05235987755982989,-0.17453292519943295+0.03490658503988659*sin(sine*2),3.0543261909900767-0.03490658503988659*sin((sine+0.75)*2)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+1*sin((sine + 0.06)*-14),-0.25+1.3*sin((sine + 0.025)*14))*angles(2.0943951023931953*sin((sine-0.05)*-14),-1.5707963267948966+0.5235987755982988*sin((sine+0.075)*14),0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+1*sin((sine + 0.06)*14),-0.25+1.3*sin((sine + 0.025)*-14))*angles(2.0943951023931953*sin((sine-0.05)*14),1.5707963267948966+0.5235987755982988*sin((sine+0.075)*14),0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.025,0.35,0)*angles(-0.8726646259971648,1.2217304763960306,1.0471975511965976),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0.6 * sin((sine+0.0275)*-14))*angles(2.0943951023931953*sin(sine*14),-1.5707963267948966+0.5235987755982988*sin((sine+0.125)*-14),0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		jump = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1-0.05*sin(sine*2),-1-0.1*sin((sine + 0.75)*2),0.05+0.025*sin((sine + 0.5)*2))*angles(-0.5235987755982988-0.03490658503988659*sin((sine+0.5)*2),-1.3089969389957472-0.017453292519943295*sin(sine*2),-0.5235987755982988),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.075 * sin(sine*2),0.1 * sin((sine+0.75)*2),0)*angles(-1.5707963267948966+0.03490658503988659*sin((sine+0.5)*2),0.017453292519943295*sin(sine*2),2.8797932657906435),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.45,-1.25+0.05*sin((sine + 0.5)*2),3)*angles(0.05235987755982989,-0.17453292519943295+0.03490658503988659*sin(sine*2),3.0543261909900767-0.03490658503988659*sin((sine+0.75)*2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.475+0.086*sin((sine + 0.5)*2),0)*angles(-0.6981317007977318,1.3089969389957472+0.03490658503988659*sin(sine*2),0.7853981633974483+0.03490658503988659*sin((sine+0.75)*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.03490658503988659*sin(sine*2),0.03490658503988659*sin((sine+0.75)*2),3.3161255787892263),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1-0.05*sin(sine*2),-1-0.1*sin((sine + 0.75)*2),0.05+0.025*sin((sine + 0.5)*2))*angles(-0.5235987755982988-0.03490658503988659*sin((sine+0.5)*2),1.3089969389957472-0.017453292519943295*sin(sine*1),0.5235987755982988),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35+0.075*sin((sine + 0.35)*2),0)*angles(-1.5707963267948966,-1.3962634015954636-0.03490658503988659*sin(sine*2),-1.5707963267948966),deltaTime) 
			--MW_animatorProgressSave: RightArm,1,0,0,1,-0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-40,0,0,1,-1,0,0,1,75,0,0,1,0,0,0,1,20,0,0,1,LeftArm,-1,0,0,1,-90,0,0,1,0.4,0,0,1,-50,0,0,1,0,0,0,1,-90,0,0,1,Torso,0,0,0,1,-87,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Head,0,0,0,1,-75,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,-30,0,0,1,-0,0,0,1,-75,0,0,1,-0.5,0,0,1,-15,0,0,1,Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		fall = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1-0.05*sin(sine*2),-1-0.1*sin((sine + 0.75)*2),0.05+0.025*sin((sine + 0.5)*2))*angles(-0.5235987755982988-0.03490658503988659*sin((sine+0.5)*2),-1.3089969389957472-0.017453292519943295*sin(sine*2),-0.5235987755982988),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.075 * sin(sine*2),0.1 * sin((sine+0.75)*2),0)*angles(-1.5707963267948966+0.03490658503988659*sin((sine+0.5)*2),0.017453292519943295*sin(sine*2),2.8797932657906435),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.45,-1.25+0.05*sin((sine + 0.5)*2),3)*angles(0.05235987755982989,-0.17453292519943295+0.03490658503988659*sin(sine*2),3.0543261909900767-0.03490658503988659*sin((sine+0.75)*2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.475+0.086*sin((sine + 0.5)*2),0)*angles(-0.6981317007977318,1.3089969389957472+0.03490658503988659*sin(sine*2),0.7853981633974483+0.03490658503988659*sin((sine+0.75)*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.03490658503988659*sin(sine*2),0.03490658503988659*sin((sine+0.75)*2),3.3161255787892263),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1-0.05*sin(sine*2),-1-0.1*sin((sine + 0.75)*2),0.05+0.025*sin((sine + 0.5)*2))*angles(-0.5235987755982988-0.03490658503988659*sin((sine+0.5)*2),1.3089969389957472-0.017453292519943295*sin(sine*1),0.5235987755982988),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35+0.075*sin((sine + 0.35)*2),0)*angles(-1.5707963267948966,-1.3962634015954636-0.03490658503988659*sin(sine*2),-1.5707963267948966),deltaTime) 
			--MW_animatorProgressSave: RightArm,1,0,0,1,-0,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-40,0,0,1,-1,0,0,1,75,0,0,1,0,0,0,1,20,0,0,1,LeftArm,-1,0,0,1,-90,0,0,1,0.4,0,0,1,-70,0,0,1,0,0,0,1,-90,0,0,1,Torso,0,0,0,1,-87,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Head,0,0,0,1,-105,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,LeftLeg,-1,0,0,1,-30,0,0,1,-0,0,0,1,-75,0,0,1,-0.5,0,0,1,-15,0,0,1,Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
end)

btn("Ban Hammer V2", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local getPartFromMesh = t.getPartFromMesh
	local getPartJoint = t.getPartJoint
	local addmode=t.addmode
	local getJoint=t.getJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(14463205245,14463205530)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	t.setJumpPower(0)

	local function ShadeID(ID, Duration)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		task.spawn(ShadeID, 6798698437, 0.5)
		attackAnimation=function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0,-0.25)*angles(0.8726646259971648,0.6981317007977318,1.2217304763960306),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,-3.75,0.5)*angles(2.0943951023931953,-1.7453292519943295,-2.443460952792061),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,-0.1)*angles(-0.6981317007977318,-1.2217304763960306,-0.5235987755982988),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0.1)*angles(-1.4835298641951802,0,1.9198621771937625),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.95,-0.8,-0.1)*angles(-0.6981317007977318,0.8726646259971648,0.5235987755982988),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132,-0.17453292519943295,-2.0943951023931953),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(1,0.25,-0.25)*angles(-0.6981317007977318,-2.792526803190927,-2.0943951023931953),deltaTime) 
		end
		task.wait(0.2)
		attackAnimation=function()
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(3,-3,0)*angles(-1.5707963267948966,2.0943951023931953,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295,0,3.0543261909900767),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.6057029118347832,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.9599310885968813,1.3089969389957472,1.0995574287564276),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.7,0.4,-0.3)*angles(0,2.6179938779914944,1.0471975511965976),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-1.0471975511965976,-1.3089969389957472,-1.0821041362364843),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.7,0.4,-0.3)*angles(0,-1.5707963267948966,-1.0471975511965976),deltaTime) 
			--MW_animatorProgressSave: Meshes/hammerF(2)Accessory_Handle,3,0,0,1,-90,0,0,1,-3,0,0,1,120,0,0,1,,0,0,1,-0,0,0,1,Head,0,0,0,1,-100,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,175,0,0,1,Torso,0,0,0,1,-92,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,RightLeg,1,0,0,1,-55,0,0,1,-1,0,0,1,75,0,0,1,0,0,0,1,63,0,0,1,RightArm,0.7,0,0,1,0,0,0,1,0.4,0,0,1,150,0,0,1,-0.3,0,0,1,60,0,0,1,LeftLeg,-1,0,0,1,-60,0,0,1,-1,0,0,1,-75,0,0,1,0,0,0,1,-62,0,0,1,LeftArm,-0.7,0,0,1,-0,0,0,1,0.4,0,0,1,-90,0,0,1,-0.3,0,0,1,-60,0,0,1
		end
		task.wait(0.3)
		attackAnimation=nil
	end)

	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,-0.25+0.15*sin((sine + 0.5)*-2),-0.125)*angles(2.443460952792061+0.17453292519943295*sin((sine+0.5)*2),1.0471975511965976,-0.6981317007977318),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.875+0.19*sin(sine*-2),0.0775 * sin((sine+0.95)*-2))*angles(-0.5235987755982988+0.08726646259971647*sin((sine+0.75)*2),1.2217304763960306,0.3490658503988659),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1.4+0.025*sin((sine + 0.75)*-2),-0.9+0.05*sin((sine + 0.75)*-2),-2)*angles(-3.141592653589793,0,1.2217304763960306+0.08726646259971647*sin((sine+0.75)*-2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625+0.08726646259971647*sin((sine-0.125)*-2),0,3.141592653589793),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.125,-0.25,-0.3)*angles(1.5707963267948966+0.17453292519943295*sin((sine+1)*-2),-2.0943951023931953,-0.6981317007977318),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.875+0.19*sin(sine*-2),0.0775 * sin((sine+0.95)*-2))*angles(-0.5235987755982988+0.08726646259971647*sin((sine+0.75)*2),-1.2217304763960306,-0.3490658503988659),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.15+0.2*sin(sine*2),0)*angles(-1.3962634015954636+0.08726646259971647*sin((sine+0.75)*-2),0,3.141592653589793),deltaTime) 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end

			t.setWalkSpeed(45)
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0,0.1)*angles(-0.8726646259971648,-1.0471975511965976,1.7453292519943295),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.075+0.5*sin((sine + 0.275)*-14),-0.95+1*sin((sine + 0.075)*-14),-0.25+1*sin((sine + 0.275)*-14))*angles(0,-1.2217304763960306+0.2181661564992912*sin((sine+0.1)*-14),2.0943951023931953*sin((sine-0.025)*14)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.975+0.25*sin((sine + 0.3)*14),-1.2+1*sin((sine + 0.075)*14),-0.5+1*sin((sine + 0.275)*14))*angles(0,1.9198621771937625+0.2181661564992912*sin((sine+0.1)*-14),2.0943951023931953*sin((sine-0.025)*14)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1+0.05*sin((sine + 0.3)*28),0)*angles(-1.3962634015954636+0.08726646259971647*sin((sine+0.375)*28),0.08726646259971647+0.06981317007977318*sin((sine+0.05)*-14),-2.792526803190927+0.04363323129985824*sin((sine-0.1)*14)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.9,0.35,-0.25+0.5*sin((sine + 0.5)*14))*angles(0.8726646259971648*sin(sine*-14),1.7453292519943295+0.8726646259971648*sin((sine+0.7)*14),0.6981317007977318+1.5707963267948966*sin((sine+0.5)*-14)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*28),0)*angles(-2.0943951023931953,0.04363323129985824*sin(sine*14),2.792526803190927),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.5,-1.125,0.5)*angles(-3.141592653589793,-0.08726646259971647,-1.7453292519943295),deltaTime) 
		end
	})
end)
btn("MotorCycle V2", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local addmode=t.addmode
	local refreshjoints=t.refreshjoints
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(11354336568,11354244679)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	t.setWalkSpeed(50)
	t.setJumpPower(0)
	addmode("default",{
		idle=function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5-0.025*sin(sine*2),0)*angles(0,-1.7453292519943295,-1.2217304763960306),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802+0.05235987755982989*sin(sine*100),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.05*sin(sine*2),0)*angles(-1.0471975511965976,-1.3089969389957472,-0.5235987755982988),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,2+0.025*sin(sine*2),0)*angles(-1.7453292519943295,0,3.141592653589793),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,2.5+0.025*sin(sine*2),0)*angles(0.08726646259971647,3.141592653589793,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.7-0.05*sin(sine*2),-0.7)*angles(-1.0471975511965976,1.3089969389957472,0.7853981633974483),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4-0.025*sin(sine*2),0)*angles(0,1.7453292519943295,1.2217304763960306),deltaTime) 
		end,
		walk=function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.9,-0.1)*angles(-1.5707963267948966,-1.3962634015954636,-2.0943951023931953),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,2+0.15*sin(sine*75),0)*angles(-1.9198621771937625,0,3.141592653589793),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,2.5,0)*angles(0.3490658503988659,-3.141592653589793,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0)*angles(0,1.7453292519943295,1.9198621771937625),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.9,-0.1)*angles(-1.5707963267948966,1.3962634015954636,2.0943951023931953),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0)*angles(0,-1.7453292519943295,-1.9198621771937625),deltaTime) 
		end
	})
end)
btn("Andrfix Studio Dummy", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local addmode=t.addmode
	local refresh=t.refreshjoints
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(5164176566,5164167965)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	local cframes=t.cframes
	local rootpart1=t.getPart("HumanoidRootPart")
	local rootpart=t.getPart("Head")
	local i1=i("TextLabel") 
	local i2=i("BillboardGui") 
	i1.Font=e.Font.Arcade
	i1.FontSize=e.FontSize.Size14 
	i1.Text="[ Studio Dummy ]" 
	i1.TextColor3=c3(1,1,1) 
	i1.TextScaled=true 
	i1.TextStrokeTransparency=0 
	i1.BackgroundColor3=c3(1,1,1) 
	i1.TextStrokeColor3=c3(0,0,0)
	i1.BackgroundTransparency=1
	i1.Size=u2(1,0,1,0) 
	i1.Name=rs() 
	i1.Parent=i2 
	i2.AlwaysOnTop=true 
	i2.ClipsDescendants=true 
	i2.LightInfluence=1 
	i2.Size=u2(10,0,1.75,0) 
	i2.StudsOffset=v3(0,1.75,0) 
	i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
	i2.ResetOnSpawn=false 
	i2.Name=rs() 
	i2.Parent=pg 

	local i1=i("TextBox") 
	i1.Font=e.Font.Unknown 
	i1.FontFace=Font.new("rbxasset://fonts/families/PressStart2P.json",e.FontWeight.Bold,e.FontStyle.Normal) 
	i1.FontSize=e.FontSize.Size32 
	i1.Text="[ Song ]: Chillin at Home - Dosi" 
	i1.TextColor3=c3(1,1,1) 
	i1.TextSize=30 
	i1.TextStrokeTransparency=0 
	i1.TextXAlignment=e.TextXAlignment.Left 
	i1.TextYAlignment=e.TextYAlignment.Bottom 
	i1.BackgroundColor3=c3(1,1,1) 
	i1.BackgroundTransparency=1 
	i1.BorderColor3=c3(0,0,0) 
	i1.BorderSizePixel=0 
	i1.Position=u2(0,10,1,-1) 
	i1.Name=rs() 
	i1.Parent=i9

	local sounds = {}

	local function ShadeID(ID, Duration, Looped)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		if Looped then
			s.Looped = true
		end
		sounds[s]=true
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		sounds[s]=nil
		s:Destroy()
	end
	
	tspawn(function() 
		while c do
			twait()
		end 
		i2:Destroy()
		i1:Destroy() 
		ShadeID = emptyfunction
		for i,v in pairs(sounds) do
			i:Destroy()
		end
	end)


	task.spawn(ShadeID, 9042666762, 9999999, true)
	
	local Floating = nil
	
	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		task.spawn(ShadeID, 5686379468, 2, false)
		if Floating then 
			if attackAnimation then return end
			attackAnimation=function()
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.1,0.5,0.1)*angles(0,0.7853981633974483,1.5707963267948966),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.75,-3,1.25)*angles(2.356194490192345,0.5235987755982988,-1.9198621771937625),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,2+0.25*sin(sine*2),0)*angles(-1.6580627893946132,0.17453292519943295,3.839724354387525),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.06981317007977318,2.443460952792061),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1.2,0,-0.6)*angles(0.8726646259971648,1.3089969389957472,-0.8726646259971648),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(-1.2217304763960306,-1.2217304763960306,-1.2217304763960306),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.8726646259971648,-1.3089969389957472,-0.8726646259971648),deltaTime) 
				i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
			end
			task.wait(0.2)
			attackAnimation=function()
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.1,0.5,0.1)*angles(0,0.7853981633974483,2.0943951023931953),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.75,-2.25,1.25)*angles(2.530727415391778,0.6108652381980153,-2.443460952792061),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,2+0.25*sin(sine*2),0)*angles(-1.6580627893946132,0.17453292519943295,3.839724354387525),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.06981317007977318,2.443460952792061),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1.2,0,-0.6)*angles(0.8726646259971648,1.3089969389957472,-0.8726646259971648),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(-1.2217304763960306,-1.2217304763960306,-1.2217304763960306),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.8726646259971648,-1.3089969389957472,-0.8726646259971648),deltaTime) 
				i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
			end
			task.wait(0.2)
			attackAnimation=nil		
		else
			if attackAnimation then return end
			attackAnimation=function()
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.1,0)*angles(-0.8726646259971648,-1.3089969389957472,-0.9162978572970231),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0.05235987755982989,1.3089969389957472,1.4835298641951802),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1.1,0)*angles(-0.8726646259971648,1.3089969389957472,0.9162978572970231),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0)*angles(-1.3089969389957472,-1.2217304763960306,-1.3089969389957472),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6231562043547265,0.03490658503988659,2.8797932657906435),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.3161255787892263),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.75,-2.25,1.5)*angles(-1.2217304763960306,2.6179938779914944,1.2217304763960306),deltaTime) 
				i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
			end
			task.wait(0.3)
			attackAnimation=function()
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.1,0)*angles(-0.8726646259971648,-1.3089969389957472,-0.9162978572970231),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0.05235987755982989,1.3089969389957472,1.9198621771937625),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1.1,0)*angles(-0.8726646259971648,1.3089969389957472,0.9162978572970231),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35,0)*angles(-1.3089969389957472,-1.2217304763960306,-1.3089969389957472),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6231562043547265,0.03490658503988659,2.8797932657906435),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966,0,3.3161255787892263),deltaTime) 
				AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.75,-2.25,1.25)*angles(-1.1344640137963142,2.0943951023931953,1.3089969389957472),deltaTime) 
				--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-50,0,0,1,-1.1,0,0,1,-75,0,0,1,0,0,0,1,-52.5,0,0,1,RightArm,1,0,0,1,3,0,0,1,0.5,0,0,1,75,0,0,1,0,0,0,1,110,0,0,1,RightLeg,1,0,0,1,-50,0,0,1,-1.1,0,0,1,75,0,0,1,0,0,0,1,52.5,0,0,1,LeftArm,-1,0,0,1,-75,0,0,1,0.35,0,0,1,-70,0,0,1,0,0,0,1,-75,0,0,1,Head,0,0,0,1,-93,0,0,1,1,0,0,1,2,0,0,1,0,0,0,1,165,0,0,1,Torso,0,0,0,1,-90,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,190,0,0,1,Meshes/SniperAccessory_Handle,0.75,0,0,1,-65,0,0,1,-2.25,0,0,1,120,0,0,1,1.25,0,0,1,75,0,0,1
				i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
			end
			task.wait(0.2)
			attackAnimation=nil		
		end

	end)

	addmode("default", {
		modeEntered=function()
			Floating = false
		end,
		idle = function()
				t.setJumpPower(0)
			if attackAnimation then return attackAnimation() end
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.5,-0.5,-2)*angles(-1.5707963267948966,1.7453292519943295,-1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-1+0.1*sin(sine*2),0.075 * sin((sine+0.5)*-2))*angles(-2.2689280275926285+0.04363323129985824*sin((sine+0.5)*-2),-0.30543261909900765,2.6179938779914944),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(-0.025,1.05,0)*angles(-2.443460952792061+0.04363323129985824*sin(sine*-2),-0.4363323129985824+0.04363323129985824*sin(sine*-2),-2.6179938779914944),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.0625*sin(sine*-2),-0.5+0.075*sin(sine*-2),-0.5+0.025*sin(sine*-2))*angles(-1.0471975511965976+0.02181661564992912*sin(sine*2),-0.7853981633974483+0.017453292519943295*sin((sine+0.125)*2),-0.3490658503988659+0.02181661564992912*sin((sine+0.75)*-2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,0)*angles(-2.0943951023931953,1.2217304763960306,1.3089969389957472),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.8+0.05*sin((sine - 0.125)*-2),-0.5+0.1*sin((sine + 0.125)*-2),-0.5+0.0325*sin((sine - 0.5)*-2))*angles(0.04363323129985824*sin((sine+0.5)*2),1.0471975511965976+0.008726646259971648*sin((sine+0.5)*2),0.4363323129985824+0.013089969389957472*sin((sine+0.5)*-2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.25,-0.8)*angles(2.2689280275926285,-2.443460952792061,-0.6108652381980153+0.061086523819801536*sin(sine*2)),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 

		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.75*sin(sine*7),-0.5 * sin((sine+0.25)*7))*angles(1.0471975511965976*sin((sine+0.25)*7),1.5707963267948966,0),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(-0.25,-0.75,1.85)*angles(1.5707963267948966,3.490658503988659,-1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.075 * sin((sine+0.75)*7),0)*angles(-1.7016960206944713+0.03490658503988659*sin(sine*7),0,3.141592653589793-0.04363323129985824*sin((sine+0.75)*7)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(-1.5707963267948966,1.3089969389957472,1.6144295580947547),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,-0.3 * sin((sine+0.05)*7))*angles(0.7853981633974483*sin(sine*7),-1.5707963267948966,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802+0.05235987755982989*sin((sine+0.75)*7),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.75*sin(sine*7),0.5 * sin((sine+0.25)*7))*angles(-1.0471975511965976*sin((sine+0.25)*7),-1.5707963267948966,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
	addmode("q", {
		modeEntered=function()
			Floating = true
		end,
		idle = function()
			if attackAnimation then return attackAnimation() end
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0.9,0.1)*angles(-1.5707963267948966,-0.6981317007977318,1.7453292519943295),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.75,-1.5,1.75)*angles(-1.3089969389957472,-1.0471975511965976,1.5707963267948966),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3,0.25)*angles(-1.6580627893946132,1.0471975511965976,0.5235987755982988),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin(sine*2),-1.1,0.2 * sin((sine+0.9)*2))*angles(-2.2689280275926285+0.10471975511965978*sin((sine-0.25)*-2),1.0471975511965976+0.2181661564992912*sin(sine*-2),1.2217304763960306+0.08726646259971647*sin((sine+0.75)*2)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.5+0.1*sin((sine + 0.5)*2))*angles(-0.9599310885968813+0.2617993877991494*sin((sine+0.5)*-2),-1.2217304763960306+0.1308996938995747*sin((sine+0.75)*2),-0.6981317007977318),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.25 * sin(sine*2),2+0.5*sin((sine - 0.5)*2),0.25 * sin((sine+0.75)*-2))*angles(0.3490658503988659+0.10471975511965978*sin(sine*2),1.9198621771937625+0.20943951023931956*sin((sine+0.5)*-2),-3.7524578917878086+0.08726646259971647*sin(sine*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.08726646259971647*sin((sine+0.325)*-2),0,1.9198621771937625+0.08726646259971647*sin(sine*-2)),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end

			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.25-0.075*sin(sine*3),-1.25,-1.5)*angles(-1.5707963267948966,-0.1308996938995747+0.08726646259971647*sin((sine+0.75)*3),-1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,3+0.25*sin(sine*3),0)*angles(-2.181661564992912+0.08726646259971647*sin((sine+0.5)*3),0.05235987755982989*sin(sine*3),3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),1.3089969389957472,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin(sine*3),0)*angles(-0.4363323129985824+0.17453292519943295*sin(sine*3),-1.3089969389957472,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.2217304763960306+0.05235987755982989*sin((sine+0.25)*3),0.08726646259971647*sin(sine*3),3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.175 * sin((sine+0.5)*3),-0.7)*angles(-0.5235987755982988,1.3089969389957472,0.2617993877991494+0.17453292519943295*sin(sine*3)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),-1.3089969389957472,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
	addmode("e", {
		modeEntered=function()
			Floating = true
		end,
			idle = function()
			if attackAnimation then return attackAnimation() end
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.6,0.4,-0.6)*angles(-2.6179938779914944,-0.3490658503988659,1.2217304763960306),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1,-2,1)*angles(-0.7853981633974483,2.6179938779914944,0.7853981633974483),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0,-0.125)*angles(-0.5235987755982988,0.6981317007977318,2.2689280275926285),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,0.1 * sin((sine+0.5)*-3),-0.5)*angles(-0.6981317007977318+0.17453292519943295*sin((sine+0.5)*-3),1.0471975511965976+0.08726646259971647*sin(sine*-3),0.3490658503988659+0.17453292519943295*sin((sine-1.25)*3)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953+0.08726646259971647*sin((sine+0.325)*3),0.2181661564992912+0.04363323129985824*sin((sine+0.325)*-3),2.6179938779914944),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*1.5),4+0.3*sin((sine + 0.25)*-3),0)*angles(-1.2217304763960306+0.08726646259971647*sin((sine+0.75)*3),0.04363323129985824+0.08726646259971647*sin(sine*1.5),3.9269908169872414),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 

		end,
		walk = function()
			if attackAnimation then return attackAnimation() end

			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.25-0.075*sin(sine*3),-1.25,-1.5)*angles(-1.5707963267948966,-0.1308996938995747+0.08726646259971647*sin((sine+0.75)*3),-1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,3+0.25*sin(sine*3),0)*angles(-2.181661564992912+0.08726646259971647*sin((sine+0.5)*3),0.05235987755982989*sin(sine*3),3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),1.3089969389957472,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin(sine*3),0)*angles(-0.4363323129985824+0.17453292519943295*sin(sine*3),-1.3089969389957472,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.2217304763960306+0.05235987755982989*sin((sine+0.25)*3),0.08726646259971647*sin(sine*3),3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.175 * sin((sine+0.5)*3),-0.7)*angles(-0.5235987755982988,1.3089969389957472,0.2617993877991494+0.17453292519943295*sin(sine*3)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),-1.3089969389957472,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
	addmode("r", {
		modeEntered=function()
			Floating = false
		end,
		idle = function()
			if attackAnimation then return attackAnimation() end
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.0175*sin((sine + 0.5)*-2),-0.8+0.2*sin(sine*-2),0.05+0.04*sin((sine + 0.4)*2))*angles(-0.6981317007977318+0.06981317007977318*sin((sine+0.6)*2),-1.0471975511965976+0.017453292519943295*sin((sine+0.6)*-2),-0.6108652381980153+0.02181661564992912*sin((sine+0.6)*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.0175*sin((sine + 0.3)*-2),-0.875+0.19*sin((sine - 0.075)*-2),0.05 * sin((sine+0.3)*2))*angles(-0.5235987755982988+0.03490658503988659*sin((sine+0.6)*2),1.0471975511965976+0.017453292519943295*sin((sine+0.6)*-2),0.3490658503988659+0.026179938779914945*sin((sine+0.6)*2)),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.5,-2,1)*angles(-0.7853981633974483,2.0943951023931953,1.1),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0,1.0471975511965976,1.9198621771937625),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461+0.08726646259971647*sin((sine+1)*2),0.06981317007977318+0.03490658503988659*sin((sine+1)*-2),2.792526803190927),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.175+0.19*sin(sine*2),0.1 * sin((sine+0.6)*-2))*angles(-1.4398966328953218+0.061086523819801536*sin((sine+0.6)*-2),0,3.490658503988659),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4+0.1*sin((sine + 0.75)*-2),0)*angles(-0.8726646259971648,-1.2217304763960306+0.08726646259971647*sin(sine*2),-0.8726646259971648),deltaTime) 
			
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
	addmode("t", {
		modeEntered=function()
			Floating = true
		end,
		idle = function()
			if attackAnimation then return attackAnimation() end
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.75,0)*angles(0.8726646259971648,-2.0943951023931953,-2.007128639793479+0.08726646259971647*sin(sine*2)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.025*sin(sine*-2),-0.25+0.1*sin(sine*-2),-0.25+0.05*sin(sine*-2))*angles(-0.6981317007977318+0.17453292519943295*sin((sine+1)*2),-0.8726646259971648+0.08726646259971647*sin(sine*2),-0.6108652381980153+0.17453292519943295*sin(sine*-2)),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(1,-2,1.25)*angles(-4.014257279586958,1.0471975511965976,-1.9198621771937625),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.125,0,-0.25)*angles(0,0.8726646259971648,1.9198621771937625),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461+0.08726646259971647*sin((sine-0.25)*-2),-0.08726646259971647,-2.356194490192345),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.9+0.1*sin(sine*-2),-1,0)*angles(-1.0471975511965976+0.08726646259971647*sin((sine+0.75)*2),0.6981317007977318+0.17453292519943295*sin((sine+0.5)*2),0.6981317007977318),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.2 * sin((sine+0.75)*2),4+0.5*sin(sine*2),0.25 * sin((sine+1.75)*2))*angles(-2.0943951023931953+0.08726646259971647*sin((sine+1)*2),-0.2181661564992912+0.08726646259971647*sin((sine+0.75)*2),2.0943951023931953),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end

			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.25-0.075*sin(sine*3),-1.25,-1.5)*angles(-1.5707963267948966,-0.1308996938995747+0.08726646259971647*sin((sine+0.75)*3),-1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,3+0.25*sin(sine*3),0)*angles(-2.181661564992912+0.08726646259971647*sin((sine+0.5)*3),0.05235987755982989*sin(sine*3),3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),1.3089969389957472,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin(sine*3),0)*angles(-0.4363323129985824+0.17453292519943295*sin(sine*3),-1.3089969389957472,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.2217304763960306+0.05235987755982989*sin((sine+0.25)*3),0.08726646259971647*sin(sine*3),3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.175 * sin((sine+0.5)*3),-0.7)*angles(-0.5235987755982988,1.3089969389957472,0.2617993877991494+0.17453292519943295*sin(sine*3)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),-1.3089969389957472,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
	addmode("y", {
		modeEntered=function()
			Floating = true
		end,
		idle = function()
			if attackAnimation then return attackAnimation() end
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(0.17453292519943295,1.2217304763960306,0.6981317007977318),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1+0.2*sin(sine*2),0)*angles(-0.6981317007977318+0.08726646259971647*sin((sine+0.325)*2),0.1308996938995747,3.490658503988659),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1.05,-0.05)*angles(-2.443460952792061+0.08726646259971647*sin(sine*-2),0.08726646259971647,2.792526803190927),deltaTime) 
			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0,-2,1.25)*angles(-1.2217304763960306,3.0543261909900767,1.5707963267948966),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-1.0471975511965976+0.08726646259971647*sin((sine+1.125)*-2),-1.2217304763960306,-0.6981317007977318),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.8,0.8,0)*angles(-1.5707963267948966,-0.6981317007977318,1.2217304763960306),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.75,-0.25+0.1*sin((sine + 0.325)*-2),-0.25)*angles(-0.6981317007977318,0.8726646259971648,0.5235987755982988+0.08726646259971647*sin((sine+0.75)*-2)),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end

			AccessoryWeld.C0=AccessoryWeld.C0:Lerp(cf(0.25-0.075*sin(sine*3),-1.25,-1.5)*angles(-1.5707963267948966,-0.1308996938995747+0.08726646259971647*sin((sine+0.75)*3),-1.5707963267948966),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,3+0.25*sin(sine*3),0)*angles(-2.181661564992912+0.08726646259971647*sin((sine+0.5)*3),0.05235987755982989*sin(sine*3),3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),1.3089969389957472,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.1*sin(sine*3),0)*angles(-0.4363323129985824+0.17453292519943295*sin(sine*3),-1.3089969389957472,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.2217304763960306+0.05235987755982989*sin((sine+0.25)*3),0.08726646259971647*sin(sine*3),3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.175 * sin((sine+0.5)*3),-0.7)*angles(-0.5235987755982988,1.3089969389957472,0.2617993877991494+0.17453292519943295*sin(sine*3)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4+0.075*sin(sine*3),0)*angles(-0.9599310885968813+0.08726646259971647*sin((sine+0.75)*3),-1.3089969389957472,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
end)
btn("Shackluster's Knife", function()
	local t=reanimate()
	local addmode=t.addmode
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local setWalkSpeed=t.setWalkSpeed
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(7170466017,7170471218)
	local AccessoryWeld = getPartJoint(AccessoryWeld)
	
	local function ShadeID(ID, Duration, Volume)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		s.Volume = Volume
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	local urKeybind=e.KeyCode.LeftControl
	local isRunning=false
	uis.InputBegan:Connect(function(Input)
		if Input.KeyCode==urKeybind then
			isRunning=true
			setWalkSpeed(32.5)
		end
	end)
	uis.InputEnded:Connect(function(Input)
		if Input.KeyCode==urKeybind then
			isRunning=false
			setWalkSpeed(16) 
		end
	end)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		task.spawn(ShadeID, 2782131222, 0.5, 3)
		attackAnimation=function()
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.2,0)*angles(-1.3089969389957472,-1.3089969389957472,-1.5707963267948966),deltaTime) 
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-1.625,-1.95,1.25)*angles(0.3490658503988659,0,-1.7453292519943295),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1.2,0)*angles(-1.3089969389957472,1.3089969389957472,1.5707963267948966),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1.3,0,-0.4)*angles(-1.5707963267948966,-0.3490658503988659,-2.443460952792061),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4398966328953218,0,3.2288591161895095),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,angles(-1.7453292519943295,0,3.0543261909900767),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2,0.3)*angles(1.2217304763960306,1.8325957145940461,-1.5707963267948966),deltaTime) 
			--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-75,0,0,1,-1.2,0,0,1,-75,0,0,1,0,0,0,1,-90,0,0,1,WhiteSS_Handle,-1.625,0,0,1,20,0,0,1,-1.95,0,0,1,0,0,0,1,1.25,0,0,1,-100,0,0,1,RightLeg,1,0,0,1,-75,0,0,1,-1.2,0,0,1,75,0,0,1,0,0,0,1,90,0,0,1,LeftArm,-1.3,0,0,1,-90,0,0,1,0,0,0,1,-20,0,0,1,-0.4,0,0,1,-140,0,0,1,Head,0,0,0,1,-82.5,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,185,0,0,1,Torso,0,0,0,1,-100,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,175,0,0,1,RightArm,1,0,0,1,70,0,0,1,0.2,0,0,1,105,0,0,1,0.3,0,0,1,-90,0,0,1
		end
		task.wait(0.25)
		attackAnimation=function()
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.2,0)*angles(-1.3089969389957472,-1.3089969389957472,-1.5707963267948966),deltaTime) 
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-1.625,-1.35,0.75)*angles(0.7853981633974483,0,-1.5707963267948966),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1.2,0)*angles(-1.3089969389957472,1.3089969389957472,1.5707963267948966),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1.3,0,-0.4)*angles(-1.5707963267948966,-0.3490658503988659,-3.3161255787892263),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4398966328953218,0,3.2288591161895095),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,angles(-1.7453292519943295,0,3.0543261909900767),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2,0.3)*angles(1.2217304763960306,1.8325957145940461,-1.5707963267948966),deltaTime) 
			--MW_animatorProgressSave: LeftLeg,-1,0,0,1,-75,0,0,1,-1.2,0,0,1,-75,0,0,1,0,0,0,1,-90,0,0,1,WhiteSS_Handle,-1.625,0,0,1,45,0,0,1,-1.35,0,0,1,-0,0,0,1,0.75,0,0,1,-90,0,0,1,RightLeg,1,0,0,1,-75,0,0,1,-1.2,0,0,1,75,0,0,1,0,0,0,1,90,0,0,1,LeftArm,-1.3,0,0,1,-90,0,0,1,0,0,0,1,-20,0,0,1,-0.4,0,0,1,-190,0,0,1,Head,0,0,0,1,-82.5,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,185,0,0,1,Torso,0,0,0,1,-100,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,175,0,0,1,RightArm,1,0,0,1,70,0,0,1,0.2,0,0,1,105,0,0,1,0.3,0,0,1,-90,0,0,1
		end
		task.wait(0.25)
		attackAnimation=nil
	end)
	
	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.075 * sin(sine*2.5),-0.125 * sin((sine+0.75)*2.5))*angles(-1.7453292519943295-0.03490658503988659*sin((sine+0.75)*2.5),0,2.8797932657906435),deltaTime) 
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime)
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.015*sin((sine+0.8)*2.5),-1-0.075*sin((sine+0.175)*2.5),-0.3+0.09*sin((sine+0.8)*2.5))*angles(-1.3089969389957472+0.03490658503988659*sin((sine+0.75)*2.5),-1.0471975511965976,-1.3089969389957472),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.1*sin((sine+0.5)*2.5),0.2-0.15*sin((sine+1)*2.5))*angles(-1.3089969389957472+0.24434609527920614*sin((sine+0.75)*2.5),1.3089969389957472+0.12217304763960307*sin(sine*2.5),1.3962634015954636),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295-0.06981317007977318*sin(sine*2.5),0,3.4033920413889427+0.06981317007977318*sin((sine+0.75)*2.5)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.015*sin((sine+0.8)*2.5),-1.2-0.075*sin((sine+0.175)*2.5),0.1+0.09*sin((sine+0.8)*2.5))*angles(-1.3089969389957472+0.03490658503988659*sin((sine+0.75)*2.5),1.3089969389957472,1.2217304763960306),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
--LeftShoulder = knife hand
		end,
		walk=function()
			if attackAnimation then return attackAnimation() end
			if isRunning then
				LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.6*sin((sine+0.625)*13),0.45 * sin(sine*13))*angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*13),2.0943951023931953*sin(sine*13)),deltaTime) 
				RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.1 * sin((sine+0.75)*26),0)*angles(-1.8325957145940461+0.05235987755982989*sin(sine*26),0,3.141592653589793+0.05235987755982989*sin(sine*13)),deltaTime) 
				RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.35,0.6 * sin((sine+0.035)*13))*angles(0,1.5707963267948966-0.3490658503988659*sin(sine*13),-1.7453292519943295*sin(sine*13)),deltaTime) 
				Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3962634015954636-0.05235987755982989*sin(sine*26),0,3.141592653589793-0.05235987755982989*sin(sine*13)),deltaTime) 
				RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.6*sin((sine+0.625)*13),-0.45 * sin(sine*13))*angles(0,1.5707963267948966-0.08726646259971647*sin(sine*13),2.0943951023931953*sin(sine*13)),deltaTime) 
				LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
				AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime)
				--MW_animatorProgressSave: LeftLeg,-1,0,0,1,0,0,0,1,-1,-0.6,0.625,13,-90,5,0,13,0,0.45,0,13,0,120,0,13,Torso,0,0,0,1,-105,3,0,26,0,0.1,0.75,26,0,0,0,1,0,0,0,1,180,3,0,13,RightArm,1,0,0,1,0,0,0,1,0.35,0,0,1,90,-20,0,13,0,0.6,0.035,13,0,-100,0,13,Head,0,0,0,1,-80,-3,0,26,1,0,0,1,0,0,0,1,0,0,0,1,180,-3,0,13,Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0.6,0.625,13,90,-5,0,13,0,-0.45,0,13,0,120,0,13,LeftArm,-1,0,0,1,0,0,0,1,0.35,0,0,1,-90,-20,0,13,0,-0.6,0.035,13,0,-100,0,13
			else
				RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.35*sin((sine+0.9)*5),0.35 * sin((sine+0.05)*5))*angles(0,1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
				RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*10),0)*angles(-1.8325957145940461+0.03490658503988659*sin(sine*10),0,3.141592653589793+0.03490658503988659*sin(sine*5)),deltaTime) 
				Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4398966328953218-0.03490658503988659*sin(sine*10),0.017453292519943295*sin((sine-0.75)*5),3.141592653589793-0.03490658503988659*sin((sine+0.5)*5)),deltaTime) 
				LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.35*sin((sine+0.9)*5),-0.35 * sin((sine+0.05)*5))*angles(0,-1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
				RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3,-0.35 * sin((sine+0.075)*5))*angles(0,1.5707963267948966+0.1308996938995747*sin(sine*5),0.8726646259971648*sin(sine*5)),deltaTime) 
				LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
				AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime) 			
			end
		end,
		jump = function()
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.35*sin((sine+0.9)*5),0.35 * sin((sine+0.05)*5))*angles(0,1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*10),0)*angles(-1.8325957145940461+0.03490658503988659*sin(sine*10),0,3.141592653589793+0.03490658503988659*sin(sine*5)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4398966328953218-0.03490658503988659*sin(sine*10),0.017453292519943295*sin((sine-0.75)*5),3.141592653589793-0.03490658503988659*sin((sine+0.5)*5)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.35*sin((sine+0.9)*5),-0.35 * sin((sine+0.05)*5))*angles(0,-1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3,-0.35 * sin((sine+0.075)*5))*angles(0,1.5707963267948966+0.1308996938995747*sin(sine*5),0.8726646259971648*sin(sine*5)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime) 			
		end,
		fall = function()
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.35*sin((sine+0.9)*5),0.35 * sin((sine+0.05)*5))*angles(0,1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*10),0)*angles(-1.8325957145940461+0.03490658503988659*sin(sine*10),0,3.141592653589793+0.03490658503988659*sin(sine*5)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4398966328953218-0.03490658503988659*sin(sine*10),0.017453292519943295*sin((sine-0.75)*5),3.141592653589793-0.03490658503988659*sin((sine+0.5)*5)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.35*sin((sine+0.9)*5),-0.35 * sin((sine+0.05)*5))*angles(0,-1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3,-0.35 * sin((sine+0.075)*5))*angles(0,1.5707963267948966+0.1308996938995747*sin(sine*5),0.8726646259971648*sin(sine*5)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime) 			
		end
	})
	local modeStartTime=sine
	addmode("t", {
		
		modeEntered=function()
			task.spawn(ShadeID, 6233126671, 2, 5)
			modeStartTime=sine
		end,
		idle=function()
			if attackAnimation then return attackAnimation() end
			local modeTime=sine-modeStartTime
			if modeTime<2 then
				LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1.2,0.5,-0.1)*angles(-1.7453292519943295,-2.2689280275926285,1.5707963267948966),deltaTime) 
				Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295,-0.3490658503988659,3.141592653589793),deltaTime) 
				AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.5,3.25,-1.5)*angles(-3.6651914291880923,-0.17453292519943295,-0.6981317007977318),deltaTime) 
				LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1,0)*angles(-1.3089969389957472,-1.3089969389957472,-1.0471975511965976),deltaTime) 
				RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(-1.3089969389957472,1.3089969389957472,1.0471975511965976),deltaTime) 
				RightShoulder.C0=Lerp(RightShoulder.C0,cf(1.2,0.5,-0.1)*angles(-1.7453292519943295,2.2689280275926285,-1.5707963267948966),deltaTime) 
				RootJoint.C0=Lerp(RootJoint.C0,angles(-1.3962634015954636,0,3.141592653589793),deltaTime) 
			else
				if attackAnimation then return attackAnimation() end
				RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.075 * sin(sine*2.5),-0.125 * sin((sine+0.75)*2.5))*angles(-1.7453292519943295-0.03490658503988659*sin((sine+0.75)*2.5),0,2.8797932657906435),deltaTime) 
				AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime)
				LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.015*sin((sine+0.8)*2.5),-1-0.075*sin((sine+0.175)*2.5),-0.3+0.09*sin((sine+0.8)*2.5))*angles(-1.3089969389957472+0.03490658503988659*sin((sine+0.75)*2.5),-1.0471975511965976,-1.3089969389957472),deltaTime) 
				RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.1*sin((sine+0.5)*2.5),0.2-0.15*sin((sine+1)*2.5))*angles(-1.3089969389957472+0.24434609527920614*sin((sine+0.75)*2.5),1.3089969389957472+0.12217304763960307*sin(sine*2.5),1.3962634015954636),deltaTime) 
				Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295-0.06981317007977318*sin(sine*2.5),0,3.4033920413889427+0.06981317007977318*sin((sine+0.75)*2.5)),deltaTime) 
				RightHip.C0=Lerp(RightHip.C0,cf(1+0.015*sin((sine+0.8)*2.5),-1.2-0.075*sin((sine+0.175)*2.5),0.1+0.09*sin((sine+0.8)*2.5))*angles(-1.3089969389957472+0.03490658503988659*sin((sine+0.75)*2.5),1.3089969389957472,1.2217304763960306),deltaTime) 
				LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
			end	
		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			if isRunning then
				LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.6*sin((sine+0.625)*13),0.45 * sin(sine*13))*angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*13),2.0943951023931953*sin(sine*13)),deltaTime) 
				RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.1 * sin((sine+0.75)*26),0)*angles(-1.8325957145940461+0.05235987755982989*sin(sine*26),0,3.141592653589793+0.05235987755982989*sin(sine*13)),deltaTime) 
				RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.35,0.6 * sin((sine+0.035)*13))*angles(0,1.5707963267948966-0.3490658503988659*sin(sine*13),-1.7453292519943295*sin(sine*13)),deltaTime) 
				Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3962634015954636-0.05235987755982989*sin(sine*26),0,3.141592653589793-0.05235987755982989*sin(sine*13)),deltaTime) 
				RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.6*sin((sine+0.625)*13),-0.45 * sin(sine*13))*angles(0,1.5707963267948966-0.08726646259971647*sin(sine*13),2.0943951023931953*sin(sine*13)),deltaTime) 
				LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
				AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime)
				--MW_animatorProgressSave: LeftLeg,-1,0,0,1,0,0,0,1,-1,-0.6,0.625,13,-90,5,0,13,0,0.45,0,13,0,120,0,13,Torso,0,0,0,1,-105,3,0,26,0,0.1,0.75,26,0,0,0,1,0,0,0,1,180,3,0,13,RightArm,1,0,0,1,0,0,0,1,0.35,0,0,1,90,-20,0,13,0,0.6,0.035,13,0,-100,0,13,Head,0,0,0,1,-80,-3,0,26,1,0,0,1,0,0,0,1,0,0,0,1,180,-3,0,13,Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1,RightLeg,1,0,0,1,0,0,0,1,-1,0.6,0.625,13,90,-5,0,13,0,-0.45,0,13,0,120,0,13,LeftArm,-1,0,0,1,0,0,0,1,0.35,0,0,1,-90,-20,0,13,0,-0.6,0.035,13,0,-100,0,13
			else
				RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.35*sin((sine+0.9)*5),0.35 * sin((sine+0.05)*5))*angles(0,1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
				RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*10),0)*angles(-1.8325957145940461+0.03490658503988659*sin(sine*10),0,3.141592653589793+0.03490658503988659*sin(sine*5)),deltaTime) 
				Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.4398966328953218-0.03490658503988659*sin(sine*10),0.017453292519943295*sin((sine-0.75)*5),3.141592653589793-0.03490658503988659*sin((sine+0.5)*5)),deltaTime) 
				LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.35*sin((sine+0.9)*5),-0.35 * sin((sine+0.05)*5))*angles(0,-1.5707963267948966+0.05235987755982989*sin(sine*5),-0.9162978572970231*sin(sine*5)),deltaTime) 
				RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3,-0.35 * sin((sine+0.075)*5))*angles(0,1.5707963267948966+0.1308996938995747*sin(sine*5),0.8726646259971648*sin(sine*5)),deltaTime) 
				LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0)*angles(0.4363323129985824,-1.7889624832941877,-0.2617993877991494),deltaTime) 
				AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(1.5,1,1)*angles(-1.5707963267948966,0.2617993877991494,0),deltaTime) 			
			end
		end
	})
end)
btn("Moony Glitcher V3", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local getPartFromMesh = t.getPartFromMesh
	local getPartJoint = t.getPartJoint
	local addmode=t.addmode
	local getJoint=t.getJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local one = getPartFromMesh(7535284433,7535284516)
	local one = getPartJoint(one)
	local two = getPartFromMesh(5295165330,5316516435)
	local two = getPartJoint(two)

	addmode("default", {
		idle = function()
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5,0)*angles(1.3089969389957472,-1.3089969389957472,-1.5707963267948966),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.1-0.1*sin((sine+0.64)*2),-0.075 * sin(sine*2))*angles(-1.2217304763960306-0.05235987755982989*sin(sine*2),-1.3089969389957472-0.03490658503988659*sin(sine*1),-1.0471975511965976),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.1 * sin((sine+0.64)*2),0.1 * sin(sine*2))*angles(-1.3962634015954636+0.05235987755982989*sin(sine*2),0,3.141592653589793+0.06981317007977318*sin(sine*1)),deltaTime) 
			two.C0=Lerp(two.C0,cf(-0.25,-0.75,-0.5)*angles(1.0471975511965976,-4.1887902047863905,0),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.1+0.2*sin((sine+1)*2),0.2)*angles(-1.3089969389957472,1.2217304763960306-0.2617993877991494*sin(sine*2),1.0471975511965976),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1.1-0.1*sin((sine+0.64)*2),-0.2-0.075*sin(sine*2))*angles(-1.2217304763960306-0.05235987755982989*sin(sine*2),1.3089969389957472-0.03490658503988659*sin(sine*1),1.0471975511965976),deltaTime) 
			one.C0=Lerp(one.C0,cf(0,0,-3)*angles(0,0,142.97737232337548*sin(sine*0.05)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295-0.05235987755982989*sin((sine+0.5)*2),0,3.141592653589793+0.05235987755982989*sin(sine*1)),deltaTime) 
		end,
		walk = function()
			t.setWalkSpeed(16)
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.3*sin((sine+0.75)*7),0.3 * sin(sine*7))*angles(0,1.5707963267948966,-0.9599310885968813*sin(sine*7)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.1 * sin((sine+0.75)*14),0)*angles(-1.7453292519943295+0.05235987755982989*sin(sine*14),0,3.141592653589793+0.05235987755982989*sin(sine*7)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.3*sin((sine+0.75)*7),-0.3 * sin(sine*7))*angles(0,-1.5707963267948966,-0.9599310885968813*sin(sine*7)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3,-0.4 * sin((sine+0.05)*7))*angles(0,1.5707963267948966,0.9599310885968813*sin(sine*7)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5,0)*angles(1.3089969389957472,-1.3089969389957472,-1.5707963267948966),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3962634015954636-0.05235987755982989*sin(sine*14),0,3.141592653589793),deltaTime) 
			two.C0=Lerp(two.C0,cf(-0.25,-0.75,-0.5)*angles(1.0471975511965976,-4.1887902047863905,0),deltaTime) 
			one.C0=Lerp(one.C0,cf(0,0,-3)*angles(0,0,142.97737232337548*sin(sine*0.05)),deltaTime) 
		end
	})

	addmode("q", {
		idle = function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.25,1,-0.5)*angles(-3.141592653589793,-2.2689280275926285+0.17453292519943295*sin((sine+0.75)*-1.75),0.5235987755982988+0.08726646259971647*sin((sine+0.5)*1.75)),deltaTime) 
			two.C0=two.C0:Lerp(cf(5,-5,7.5)*angles(-1.7453292519943295+1745329.2519943295*sin((sine-0.75)*0.00001),0.17453292519943295+0.04363323129985824*sin(sine*1.75),1.5707963267948966),deltaTime) 
			one.C0=one.C0:Lerp(cf(0,0,-3)*angles(0,0,142.97737232337548*sin(sine*0.15)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5+0.15*sin(sine*1.75),0)*angles(-0.6981317007977318+0.17453292519943295*sin(sine*1),1.2217304763960306,0.6981317007977318),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1.05,0)*angles(-2.0943951023931953+0.08726646259971647*sin(sine*1.75),-0.2617993877991494+0.08726646259971647*sin((sine-0.5)*1.75),4.014257279586958),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.25,-0.75)*angles(-0.6981317007977318,-0.6981317007977318,-0.17453292519943295),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.5 * sin((sine+0.5)*1.75),4+1*sin(sine*1.75),0.5 * sin((sine+0.5)*1.75))*angles(-1.0471975511965976+0.08726646259971647*sin((sine+0.5)*1.75),0.2617993877991494*sin((sine+0.5)*1.75),1.9198621771937625),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.9,0)*angles(-1.2217304763960306+0.2617993877991494*sin((sine+0.5)*1.75),0.6981317007977318,0.8726646259971648),deltaTime)  		end,
		walk = function()
			t.setWalkSpeed(60)
			one.C0=one.C0:Lerp(cf(0,0,-3)*angles(0,0,142.97737232337548*sin(sine*0.1)),deltaTime) 
			two.C0=two.C0:Lerp(cf(4,5,0)*angles(142.97737232337548*sin(sine*0.1),0,1.5707963267948966),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.35,0.9 * sin((sine+0.025)*12))*angles(0,-1.5707963267948966+0.17453292519943295*sin(sine*12),2.0943951023931953*sin(sine*12)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3089969389957472-0.06981317007977318*sin(sine*24),0,3.141592653589793-0.1308996938995747*sin(sine*12)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.1 * sin((sine+0.75)*24),0)*angles(-1.8325957145940461+0.06981317007977318*sin(sine*24),0,3.141592653589793+0.1308996938995747*sin(sine*12)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.35,-0.9 * sin((sine+0.025)*12))*angles(0,1.5707963267948966+0.17453292519943295*sin(sine*12),2.0943951023931953*sin(sine*12)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.6*sin((sine+0.625)*12),-0.6 * sin(sine*12))*angles(0,-1.5707963267948966,-2.0943951023931953*sin(sine*12)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1-0.6*sin((sine+0.625)*12),0.6 * sin(sine*12))*angles(0,1.5707963267948966,-2.0943951023931953*sin(sine*12)),deltaTime) 
		end
	})
	addmode("e", {
		idle = function()
			two.C0=Lerp(two.C0,cf(4,0,9)*angles(0,-1.5707963267948966,174532.92519943297*sin(sine*0.00005)),deltaTime) 
			one.C0=Lerp(one.C0,cf(0,0,-3.25)*angles(-1.3089969389957472,0,0),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(-1.1344640137963142,1.1344640137963142,0.6981317007977318),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5,0)*angles(2.0943951023931953-0.05235987755982989*sin(sine*2.5),-2.2689280275926285-0.05235987755982989*sin((sine+0.5)*2.5),-0.8726646259971648),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.9198621771937625-0.08726646259971647*sin(sine*2.5),-0.08726646259971647-0.08726646259971647*sin((sine+0.5)*2.5),3.7524578917878086),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,0,-0.8)*angles(-1.0471975511965976,-0.9599310885968813,-0.3490658503988659),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(2 * sin(sine*1.25),3+1*sin(sine*2.5),3 * sin(sine*1.25))*angles(-1.3089969389957472-0.08726646259971647*sin(sine*2.5),0.08726646259971647*sin((sine+0.5)*2.5),2.356194490192345),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,-0.2 * sin((sine+0.625)*2.5),0)*angles(-0.9599310885968813,0.7853981633974483+0.17453292519943295*sin(sine*2.5),1.5707963267948966),deltaTime) 
		end,
		walk = function()
			t.setWalkSpeed(30)
			two.C0=Lerp(two.C0,cf(4,0,9)*angles(0,-1.5707963267948966,174532.92519943297*sin(sine*0.00005)),deltaTime) 
			one.C0=Lerp(one.C0,cf(0,0,-3.25)*angles(-1.3089969389957472,0,0),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(-1.1344640137963142,1.1344640137963142,0.6981317007977318),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5,0)*angles(2.0943951023931953-0.05235987755982989*sin(sine*2.5),-2.2689280275926285-0.05235987755982989*sin((sine+0.5)*2.5),-0.8726646259971648),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.9198621771937625-0.08726646259971647*sin(sine*2.5),-0.08726646259971647-0.08726646259971647*sin((sine+0.5)*2.5),3.7524578917878086),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,0,-0.8)*angles(-1.0471975511965976,-0.9599310885968813,-0.3490658503988659),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(2 * sin(sine*1.25),3+1*sin(sine*2.5),3 * sin(sine*1.25))*angles(-1.3089969389957472-0.08726646259971647*sin(sine*2.5),0.08726646259971647*sin((sine+0.5)*2.5),2.356194490192345),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,-0.2 * sin((sine+0.625)*2.5),0)*angles(-0.9599310885968813,0.7853981633974483+0.17453292519943295*sin(sine*2.5),1.5707963267948966),deltaTime) 
		end
	})
	addmode("r", {
		idle = function()
			RightHip.C0=Lerp(RightHip.C0,cf(1-0.1*sin((sine+0.5)*2),0.5 * sin((sine+1.5)*2),-0.8)*angles(-1.5009831567151235+0.2617993877991494*sin(sine*2),1.1344640137963142+0.3490658503988659*sin(sine*2),0.9599310885968813),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(-2 * sin((sine+1)*2),4+1*sin((sine+2)*2),0)*angles(-1.7453292519943295,0.17453292519943295*sin(sine*2),3.839724354387525),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.1-0.3*sin((sine+1)*2),0)*angles(0.7853981633974483-0.4363323129985824*sin((sine+0.5)*2),-2.0943951023931953,-0.6108652381980153),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.2*sin((sine+0.6)*2),0)*angles(0,0.4363323129985824,-0.9599310885968813),deltaTime) 
			two.C0=Lerp(two.C0,cf(0,0,7)*angles(-2.0943951023931953-174532.92519943297*sin(sine*0.00005),-0.4363323129985824,0),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295-0.17453292519943295*sin((sine+1)*2),0,2.530727415391778+0.06981317007977318*sin(sine*1)),deltaTime) 
			one.C0=Lerp(one.C0,cf(0,3,-10)*angles(0.4363323129985824*sin((sine+1)*2),0,17453.292519943294*sin(sine*0.0005)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1-0.1*sin((sine+0.5)*2),-1+0.3*sin((sine+1.5)*2),0)*angles(-1.1344640137963142+0.2617993877991494*sin(sine*2),-0.7853981633974483+0.3490658503988659*sin(sine*2),-0.7853981633974483),deltaTime) 
			--MW_animatorProgressSave: RightLeg,1,-0.1,0.5,2,-86,15,0,2,-0,0.5,1.5,2,65,20,0,2,-0.8,0,0,1,55,0,0,1,Torso,0,-2,1,2,-100,0,0,1,4,1,2,2,0,10,0,2,0,0,0,1,220,0,0,1,LeftArm,-1,0,0,1,45,-25,0.5,2,0.1,-0.3,1,2,-120,0,0,1,0,0,0,1,-35,0,0,1,RightArm,1,0,0,1,0,0,0,1,0.2,-0.2,0.6,2,25,0,0,1,0,0,0,1,-55,0,0,1,RainbowGodScythe_Handle,0,0,0,1,-120,-10000000,0,0.00005,-0,0,0,1,-25,0,0,1,7,0,0,1,0,0,0,1,Head,0,0,0,1,-100,-10,1,2,1,0,0,1,0,0,0,1,0,0,0,1,145,4,0,1,NebulaBlade_Handle,0,0,0,1,-0,25,1,2,3,0,0,1,0,0,0,1,-10,0,0,1,0,1000000,0,0.0005,LeftLeg,-1,-0.1,0.5,2,-65,15,0,2,-1,0.3,1.5,2,-45,20,0,2,0,0,0,1,-45,0,0,1
		end,
		walk = function()
			t.setWalkSpeed(20)
			one.C0=Lerp(one.C0,cf(0,3,-10)*angles(0.4363323129985824*sin((sine+1)*2),0,17453.292519943294*sin(sine*0.0005)),deltaTime) 
			two.C0=Lerp(two.C0,cf(0,0,7)*angles(-2.0943951023931953-174532.92519943297*sin(sine*0.00005),-0.4363323129985824,0),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2+0.1*sin(sine*2),0.3)*angles(0.5235987755982988+0.12217304763960307*sin((sine+0.5)*2),-1.7453292519943295,1.3089969389957472),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,0.5 * sin(sine*2),-1-0.1*sin(sine*2))*angles(-1.1344640137963142,1.1344640137963142,0.7853981633974483-0.3490658503988659*sin((sine+1)*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2+0.1*sin(sine*2),0.3)*angles(0.5235987755982988+0.12217304763960307*sin((sine+0.5)*2),1.7453292519943295,-1.3089969389957472),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.0471975511965976-0.17453292519943295*sin(sine*2),0,3.141592653589793-0.05235987755982989*sin(sine*2)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.1*sin(sine*2),0)*angles(-1.1344640137963142-0.17453292519943295*sin((sine+1)*2),-1.2217304763960306,-0.6108652381980153),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,4+1*sin((sine+1)*2),-0.75 * sin((sine+0.5)*2))*angles(-2.2689280275926285+0.17453292519943295*sin(sine*2),0,3.141592653589793+0.05235987755982989*sin((sine+0.625)*2)),deltaTime) 
		end
	})
	addmode("t", {
		idle = function()
			two.C0=two.C0:Lerp(cf(3,10 * sin(sine*0.5),0)*angles(0,-1.5707963267948966,-142.97737232337548*sin((sine+5)*0.06)),deltaTime) 
			one.C0=one.C0:Lerp(cf(0,0,-4)*angles(0,0,142.97737232337548*sin((sine+15)*0.05)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.2*sin((sine+1)*1.75),-0.3)*angles(-1.1344640137963142-0.2617993877991494*sin(sine*1.75),-1.3089969389957472,-0.7853981633974483),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3962634015954636-0.08726646259971647*sin(sine*1.75),0,3.141592653589793-0.17453292519943295*sin(sine*0.875)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,1.1,-0.2)*angles(1.7453292519943295-0.08726646259971647*sin(sine*1.75),2.356194490192345-0.08726646259971647*sin(sine*0.875),1.1344640137963142),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-0.325 * sin((sine+1)*1.75),-0.7)*angles(-1.1344640137963142-0.2617993877991494*sin(sine*1.75),1.3089969389957472,0.9599310885968813),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2+0.15*sin(sine*2),0)*angles(0,-0.4363323129985824,0.7853981633974483+0.1308996938995747*sin((sine+0.5)*2)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(-1 * sin((sine+0.875)*1),5+1*sin((sine+0.5)*1.75),0)*angles(-1.7453292519943295+0.08726646259971647*sin(sine*1.75),0,3.141592653589793+0.17453292519943295*sin(sine*0.875)),deltaTime) 
		end,
		walk = function()
			t.setWalkSpeed(30)
			one.C0=one.C0:Lerp(cf(0,0,-10)*angles(0,0,142.97737232337548*sin(sine*0.2)),deltaTime) 
			two.C0=two.C0:Lerp(cf(10,0,10)*angles(0,-1.5707963267948966,142.97737232337548*sin(sine*0.1)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2+0.1*sin(sine*2),0.3)*angles(0.5235987755982988+0.12217304763960307*sin((sine+0.5)*2),-1.7453292519943295,1.3089969389957472),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,0.5 * sin(sine*2),-1-0.1*sin(sine*2))*angles(-1.1344640137963142,1.1344640137963142,0.7853981633974483-0.3490658503988659*sin((sine+1)*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2+0.1*sin(sine*2),0.3)*angles(0.5235987755982988+0.12217304763960307*sin((sine+0.5)*2),1.7453292519943295,-1.3089969389957472),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.0471975511965976-0.17453292519943295*sin(sine*2),0,3.141592653589793-0.05235987755982989*sin(sine*2)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.1*sin(sine*2),0)*angles(-1.1344640137963142-0.17453292519943295*sin((sine+1)*2),-1.2217304763960306,-0.6108652381980153),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,4+1*sin((sine+1)*2),-0.75 * sin((sine+0.5)*2))*angles(-2.2689280275926285+0.17453292519943295*sin(sine*2),0,3.141592653589793+0.05235987755982989*sin((sine+0.625)*2)),deltaTime) 
		end
	})
	addmode("y", {
		idle = function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,1,0)*angles(-0.4363323129985824-0.4363323129985824*sin(sine*999999999999999),-3.141592653589793-0.9599310885968813*sin(sine*999999999999999),-2.530727415391778-0.4363323129985824*sin(sine*999999999999999)),deltaTime) 
			two.C0=two.C0:Lerp(cf(0,-0.3909647464752197,20 * sin(sine*2))*angles(0,1.5707963267948966-0.2617993877991494*sin((sine+2)*2),1745329251.9768763*sin(sine*1.e-08)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.25 * sin((sine+2)*2),4+0.45*sin(sine*2),0.25 * sin(sine*2))*angles(-2.792526803190927+0.17453292519943295*sin((sine+2)*2),0.2617993877991494*sin(sine*999999999999999),3.141592653589793+0.2617993877991494*sin(sine*999999999999999)),deltaTime) 
			one.C0=one.C0:Lerp(cf(-0.01117706298828125,1 * sin(sine*2),0)*angles(0,0,17453292.502490003*sin(sine*0.0000015)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,1,0)*angles(-0.4363323129985824-0.4363323129985824*sin(sine*999999999999999),3.141592653589793-0.9599310885968813*sin(sine*999999999999999),2.530727415391778-0.4363323129985824*sin(sine*999999999999999)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0.5 * sin((sine+2)*2),-0.65)*angles(-0.2617993877991494*sin(sine*2),-1.2217304763960306,0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.4363323129985824*sin(sine*999999999999999),0.9599310885968813*sin((sine-2)*999999999999999),3.141592653589793+0.4363323129985824*sin((sine+2)*999999999999999)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.7+0.2*sin((sine + 2)*2),-0.25)*angles(-0.2617993877991494*sin(sine*2),1.3962634015954636,0),deltaTime) 
		end,
		walk = function()
			t.setWalkSpeed(50)
			one.C0=one.C0:Lerp(cf(0,1 * sin(sine*2),-4)*angles(0,0,17453292.502490003*sin(sine*0.0000015)),deltaTime) 
			two.C0=two.C0:Lerp(cf(0,-0.3909647464752197,20 * sin(sine*2))*angles(0,1.5707963267948966-0.2617993877991494*sin((sine+2)*2),1745329251.9768763*sin(sine*1.e-08)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2+0.1*sin(sine*2),0.3)*angles(0.5235987755982988+0.12217304763960307*sin((sine+0.5)*2),-1.7453292519943295+0.3490658503988659*sin(sine*1000),1.3089969389957472),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,0.5 * sin(sine*2),-1-0.1*sin(sine*2))*angles(-1.1344640137963142,1.1344640137963142+0.3490658503988659*sin(sine*1000),0.7853981633974483-0.3490658503988659*sin((sine+1)*2)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2+0.1*sin(sine*2),0.3)*angles(0.5235987755982988+0.12217304763960307*sin((sine+0.5)*2),1.7453292519943295+0.3490658503988659*sin(sine*1000),-1.3089969389957472),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.0471975511965976-0.17453292519943295*sin(sine*2),0.4363323129985824*sin(sine*1000),3.141592653589793+0.2617993877991494*sin(sine*1000)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.1*sin(sine*2),0)*angles(-1.1344640137963142-0.17453292519943295*sin((sine+1)*2),-1.2217304763960306+0.3490658503988659*sin(sine*1000),-0.6108652381980153),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,4+1*sin((sine+1)*2),-0.75 * sin((sine+0.5)*2))*angles(-2.2689280275926285+0.17453292519943295*sin(sine*2),0,3.141592653589793+0.2617993877991494*sin((sine+0.625)*1000)),deltaTime) 
		end
	})
end)


btn("Eldaft Pandora", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local getPartFromMesh = t.getPartFromMesh
	local getPartJoint = t.getPartJoint
	local addmode=t.addmode
	local getJoint=t.getJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local sad = getPartFromMesh(13520910,13520915)
	local sad = getPartJoint(sad)
	local happy = getPartFromMesh(13520257,13520260)
	local happy = getPartJoint(happy)

	local cframes=t.cframes
	local rootpart1=t.getPart("HumanoidRootPart")
	local rootpart=t.getPart("Head")
	local i1=i("TextLabel") 
	local i2=i("BillboardGui") 
	i1.Font=e.Font.Antique
	i1.FontSize=e.FontSize.Size14 
	i1.Text="Eldaft Pandora" 
	i1.TextColor3=c3(0.5,0,1) 
	i1.TextScaled=true 
	i1.TextStrokeTransparency=0 
	i1.BackgroundColor3=c3(0.25,0,0) 
	i1.BackgroundTransparency=1
	i1.Size=u2(1,0,1,0) 
	i1.Name=rs() 
	i1.Parent=i2 
	i2.AlwaysOnTop=true 
	i2.ClipsDescendants=true 
	i2.LightInfluence=1 
	i2.Size=u2(10,0,1.75,0) 
	i2.StudsOffset=v3(0,1.25,0) 
	i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
	i2.ResetOnSpawn=false 
	i2.Name=rs() 
	i2.Parent=pg 
	tspawn(function() while c do twait() end i2:Destroy() end)


	local sounds = {}

	local function ShadeID(ID, Duration, Looped, Volume)
		s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		if Looped then
			s.Looped = true
		end
		sounds[s]=true
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		sounds[s]=nil
		s:Destroy()
		s.Volume=nil
	end

	tspawn(function() 
		while c do
			twait()
		end 
		i2:Destroy()
		i1:Destroy() 
		ShadeID = emptyfunction
		for i,v in pairs(sounds) do
			i:Destroy()
		end
	end)


	addmode("default", {
		modeEntered=function()
			task.spawn(ShadeID, 1846256860, 9999999, true, 10)
		end,
		modeLeft=function()
			s.SoundId=""
		end,
		idle = function()
			happy.C0=Lerp(happy.C0,cf(3.9353835745714605e-09,0,-0.0002722740173339844),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2+0.05*sin((sine+0.3)*3),0)*angles(0,0.6108652381980153,-0.7853981633974483-0.017453292519943295*sin(sine*3)),deltaTime) 
			sad.C0=Lerp(sad.C0,cf(0,0,1.2)*angles(0,3.141592653589793,0),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877-0.05235987755982989*sin((sine+0.25)*3),-0.03490658503988659*sin(sine*1.5),3.141592653589793+1745329.2519943295*sin(sine*0.00000625)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(-0.075 * sin(sine*1.5),0,0.075 * sin(sine*3))*angles(-1.7453292519943295+0.03490658503988659*sin(sine*3),-0.03490658503988659*sin(sine*1.5),3.141592653589793),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.025*sin(sine*1.5),-1+0.025*sin(sine*3),-0.025 * sin(sine*3))*angles(-1.5707963267948966-0.03490658503988659*sin(sine*3),-1.3526301702956054+0.03490658503988659*sin(sine*1.5),-1.7453292519943295),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.025*sin(sine*1.5),-1+0.025*sin(sine*3),-0.025 * sin(sine*3))*angles(-1.5707963267948966-0.03490658503988659*sin(sine*3),1.3526301702956054+0.03490658503988659*sin(sine*1.5),1.7453292519943295),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2+0.05*sin((sine+0.3)*3),0)*angles(0,-0.6108652381980153,0.7853981633974483+0.017453292519943295*sin(sine*3)),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		walk = function()
			t.setWalkSpeed(16)
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.25*sin((sine+0.625)*6),0.125 * sin(sine*6))*angles(0,-1.5707963267948966,0.6981317007977318*sin(sine*6)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.3+0.025*sin(sine*12),0)*angles(0.2617993877991494,-1.1344640137963142,-0.6108652381980153),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3+0.025*sin(sine*12),0)*angles(0.2617993877991494,1.1344640137963142,0.6108652381980153),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877-0.05235987755982989*sin((sine+0.25)*3),-0.03490658503988659*sin(sine*1.5),3.141592653589793+1745329.2519943295*sin(sine*0.00000625)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*12),0)*angles(-1.7453292519943295+0.03490658503988659*sin(sine*12),0,3.141592653589793+0.03490658503988659*sin(sine*6)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1-0.25*sin((sine+0.625)*6),-0.125 * sin(sine*6))*angles(0,1.5707963267948966,0.6981317007977318*sin(sine*6)),deltaTime) 
			happy.C0=Lerp(happy.C0,cf(3.9353835745714605e-09,0,-0.0002722740173339844),deltaTime) 
			sad.C0=Lerp(sad.C0,cf(0,0,1.2)*angles(0,3.141592653589793,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		jump = function()
			RootJoint.C0=Lerp(RootJoint.C0,angles(-1.3962634015954636,0,3.141592653589793),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,0,-0.7)*angles(-1.3089969389957472,1.3089969389957472,1.0471975511965976),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1,0)*angles(-1.3089969389957472,-1.3089969389957472,-1.0471975511965976),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.3+0.025*sin(sine*12),0)*angles(0.2617993877991494,-1.1344640137963142,-0.6108652381980153),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3+0.025*sin(sine*12),0)*angles(0.2617993877991494,1.1344640137963142,0.6108652381980153),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877-0.05235987755982989*sin((sine+0.25)*3),-0.03490658503988659*sin(sine*1.5),3.141592653589793+1745329.2519943295*sin(sine*0.00000625)),deltaTime) 
			happy.C0=Lerp(happy.C0,cf(3.9353835745714605e-09,0,-0.0002722740173339844),deltaTime) 
			sad.C0=Lerp(sad.C0,cf(0,0,1.2)*angles(0,3.141592653589793,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end,
		fall = function()
			RootJoint.C0=Lerp(RootJoint.C0,angles(-1.7453292519943295,0,3.141592653589793),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,0,-0.7)*angles(-1.3089969389957472,1.3089969389957472,1.0471975511965976),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1,0)*angles(-1.3089969389957472,-1.3089969389957472,-1.0471975511965976),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.3+0.025*sin(sine*12),0)*angles(0.2617993877991494,-1.1344640137963142,-0.6108652381980153),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.3+0.025*sin(sine*12),0)*angles(0.2617993877991494,1.1344640137963142,0.6108652381980153),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877-0.05235987755982989*sin((sine+0.25)*3),-0.03490658503988659*sin(sine*1.5),3.141592653589793+1745329.2519943295*sin(sine*0.00000625)),deltaTime) 
			happy.C0=Lerp(happy.C0,cf(3.9353835745714605e-09,0,-0.0002722740173339844),deltaTime) 
			sad.C0=Lerp(sad.C0,cf(0,0,1.2)*angles(0,3.141592653589793,0),deltaTime) 
			i2.StudsOffsetWorldSpace=cframes[rootpart].Position 
		end
	})
end)

btn("Minigun", function()
	local t=reanimate()
	local rTM=t.rotToMouse
	local addmode=t.addmode
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	local AccessoryWeld = getPartFromMesh(6774736084,6774736116)
	local AccessoryWeld = getPartJoint(AccessoryWeld)


	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		while true do
			attackAnimation=function(iswalking)
				rTM(1)
				if iswalking then
					AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-0.5,-1.25,2.5)*angles(-0.4363323129985824,0,-1.8325957145940461),deltaTime) 
					RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2,0)*angles(-0.9599310885968813,1.2217304763960306,1.1344640137963142),deltaTime) 
					Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877,0,3.5779249665883754),deltaTime) 
					LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.25*sin((sine+0.185)*-7),-0.125+0.4*sin((sine+0.075)*7))*angles(-0.17453292519943295+0.8290313946973066*sin(sine*-7),-1.5533430342749532+0.05672320068981571*sin(sine*-7),-0.17453292519943295),deltaTime) 
					RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.25*sin((sine+0.185)*7),-0.125+0.4*sin((sine+0.075)*-7))*angles(-0.17453292519943295+0.8290313946973066*sin(sine*7),1.53588974175501+0.05672320068981571*sin((sine+0.35)*7),0.17453292519943295),deltaTime) 
					RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*14),0)*angles(-1.5707963267948966+0.03490658503988659*sin(sine*14),0,3.141592653589793+0.04363323129985824*sin(sine*7)),deltaTime) 
					LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4,0)*angles(0,-1.0471975511965976,-1.3962634015954636),deltaTime) 
				else
					AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-0.5,-1.25,2.5)*angles(-0.4363323129985824,0,-1.8325957145940461),deltaTime) 
					RootJoint.C0=Lerp(RootJoint.C0,angles(-1.4398966328953218,0,2.705260340591211),deltaTime) 
					RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2,0)*angles(-0.9599310885968813,1.2217304763960306,1.1344640137963142),deltaTime) 
					Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877,0,3.5779249665883754),deltaTime) 
					LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.1,0)*angles(-1.1344640137963142,-1.265363707695889,-1.090830782496456),deltaTime) 
					RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(-1.1344640137963142,1.1344640137963142,0.7853981633974483),deltaTime) 
					LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4,0)*angles(0,-1.0471975511965976,-1.3962634015954636),deltaTime) 
				end
			end
			task.wait(0.1)
			if not attackAnimation then break end
			attackAnimation=function(iswalking)
				rTM(1)
				if iswalking then
					AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-0.5,-1.2,2.2)*angles(-0.4363323129985824,0,-1.8325957145940461),deltaTime) 
					RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2,0)*angles(-0.9599310885968813,1.2217304763960306,1.1344640137963142),deltaTime) 
					Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877,0,3.5779249665883754),deltaTime) 
					LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-0.9,0.4,0.2)*angles(0,-1.0471975511965976,-1.3962634015954636),deltaTime) 
					LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.25*sin((sine+0.185)*-7),-0.125+0.4*sin((sine+0.075)*7))*angles(-0.17453292519943295+0.8290313946973066*sin(sine*-7),-1.5533430342749532+0.05672320068981571*sin(sine*-7),-0.17453292519943295),deltaTime) 
					RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.25*sin((sine+0.185)*7),-0.125+0.4*sin((sine+0.075)*-7))*angles(-0.17453292519943295+0.8290313946973066*sin(sine*7),1.53588974175501+0.05672320068981571*sin((sine+0.35)*7),0.17453292519943295),deltaTime) 
					RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*14),0)*angles(-1.5707963267948966+0.03490658503988659*sin(sine*14),0,3.141592653589793+0.04363323129985824*sin(sine*7)),deltaTime) 
				else
					AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(-0.5,-1.2,2.2)*angles(-0.4363323129985824,0,-1.8325957145940461),deltaTime) 
					RootJoint.C0=Lerp(RootJoint.C0,angles(-1.4398966328953218,0,2.705260340591211),deltaTime) 
					RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2,0)*angles(-0.9599310885968813,1.2217304763960306,1.1344640137963142),deltaTime) 
					Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7889624832941877,0,3.5779249665883754),deltaTime) 
					LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.1,0)*angles(-1.1344640137963142,-1.265363707695889,-1.090830782496456),deltaTime) 
					RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(-1.1344640137963142,1.1344640137963142,0.7853981633974483),deltaTime) 
					LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-0.9,0.4,0.2)*angles(0,-1.0471975511965976,-1.3962634015954636),deltaTime) 
				end
			end
			task.wait(0.1)
			if not attackAnimation then break end
		end
	end)
	mouse.Button1Up:Connect(function()
		attackAnimation=nil
	end)
	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.5,1.5,1.3)*angles(0.05235987755982989,1.5707963267948966,1.9198621771937625),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1+0.06*sin((sine+0.075)*-3),-0.825+0.1625*sin((sine+0.575)*-3),0.075+0.09*sin((sine-0.3)*-3))*angles(-0.5672320068981571+0.08290313946973066*sin((sine-0.1)*-3),-0.8726646259971648+0.017453292519943295*sin((sine+0.05)*3),-0.5410520681182421+0.06981317007977318*sin((sine-0.3)*-3)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.5,0)*angles(1.5707963267948966,-1.9198621771937625,1.5707963267948966),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(0.75,0.25+0.075*sin(sine*3),0)*angles(0.2617993877991494*sin((sine+0.75)*3),2.443460952792061,1.7453292519943295+0.2181661564992912*sin((sine+0.75)*-3)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.8325957145940461+0.08726646259971647*sin((sine+0.5)*-3),0.08726646259971647+0.05235987755982989*sin(sine*3),2.6179938779914944),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1+0.0775*sin((sine+0.075)*-3),-0.95+0.13*sin((sine+0.4)*-3),0.025+0.085*sin((sine-0.4)*-3))*angles(-0.5235987755982988+0.05235987755982989*sin((sine-0.5)*3),0.9250245035569946+0.017453292519943295*sin((sine-0.3)*3),0.3490658503988659+0.06981317007977318*sin((sine-0.25)*-3)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(-0.025+0.075*sin((sine+0.0625)*3),-0.15+0.15*sin((sine+0.5)*3),0.075 * sin((sine-0.25)*3))*angles(-1.413716694115407+0.05235987755982989*sin(sine*3),0.03490658503988659*sin((sine+0.6)*3),3.6651914291880923),deltaTime) 
		end,
		walk = function()
			if attackAnimation then return attackAnimation(true) end
			t.setWalkSpeed(13)
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.5,1.5,1)*angles(0,1.5707963267948966,1.7453292519943295),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1+0.25*sin((sine+0.185)*-7),-0.125+0.4*sin((sine+0.075)*7))*angles(-0.17453292519943295+0.8290313946973066*sin(sine*-7),-1.5533430342749532+0.05672320068981571*sin(sine*-7),-0.17453292519943295),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.45,0)*angles(-1.5707963267948966,-1.3962634015954636,-1.5707963267948966),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.45,0.25 * sin(sine*7))*angles(-0.5235987755982988,1.5009831567151235,0.5235987755982988+0.8726646259971648*sin(sine*-7)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0.0325 * sin((sine-0.05)*-7),1+0.025*sin(sine*14),0.05 * sin((sine+0.1)*14))*angles(-1.5271630954950384+0.04363323129985824*sin((sine-0.1)*14),0.03490658503988659*sin((sine+0.2)*7),3.141592653589793+0.08726646259971647*sin((sine+0.1)*7)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.25*sin((sine+0.185)*7),-0.125+0.4*sin((sine+0.075)*-7))*angles(-0.17453292519943295+0.8290313946973066*sin(sine*7),1.53588974175501+0.05672320068981571*sin((sine+0.35)*7),0.17453292519943295),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.135 * sin((sine+0.1)*14),0)*angles(-1.7453292519943295+0.05235987755982989*sin((sine-0.05)*14),0.008726646259971648*sin((sine-0.425)*-7),3.141592653589793+0.10471975511965978*sin((sine+0.1)*-7)),deltaTime) 
			--MW_animatorProgressSave: Type-9000Minigun_Handle,.5,0,0,1,-,0,0,1,1.5,0,0,1,90,0,0,1,1.,0,0,1,100,0,0,1,LeftLeg,-1,0,0,1,-10,47.5,-0.0d,-7,-1,0.25,0.185,-7,-89,3.25,-.,-7,-0.125,0.4,0.075,7,-10,0,0,1,LeftArm,-1,0,0,1,-90,0,0,1,0.45,0,0,1,-80,0,0,1,0,0.,0,-7,-90,0,0,-7,RightArm,1,0,0,1,-30,0,0,1,0.45,0,0,1,86,0,0,1,0,0.25,0,7,30,50,0,-7,Head,0,0.0325,-0.05,-7,-87.5,2.5,-0.1,14,1,0.025,0,14,0,2,0.2,7,-0.0,0.05,0.1,14,180,5,0.1,7,RightLeg,1,0,0,1,-10,47.5,-0.,7,-1,0.25,0.185,7,88,3.25,.35,7,-0.125,0.4,0.075,-7,10,0,0,1,Torso,0,0,0,1,-100,3,-0.05,14,0,0.135,0.1,14,0,.5,-0.425,-7,0,0,0,1,180,6,.1,-7
		end,
		jump = function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(1.5707963267948966,1.3962634015954636,1.3089969389957472+0.017453292519943295*sin(sine*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.6981317007977318,1.3089969389957472,0.3490658503988659),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.45,0)*angles(-1.5707963267948966,-1.3962634015954636,-1.5707963267948966),deltaTime) 
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.5,1.5,1)*angles(0,1.5707963267948966,1.7453292519943295),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5184364492350666,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3089969389957472,0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0,-0.5)*angles(-0.5235987755982988,-1.3089969389957472,-0.2617993877991494),deltaTime) 
		end,
		fall = function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(1.5707963267948966,1.3962634015954636,1.3089969389957472+0.017453292519943295*sin(sine*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.6981317007977318,1.3089969389957472,0.3490658503988659),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.45,0)*angles(-1.5707963267948966,-1.3962634015954636,-1.5707963267948966),deltaTime) 
			AccessoryWeld.C0=Lerp(AccessoryWeld.C0,cf(0.5,1.5,1)*angles(0,1.5707963267948966,1.7453292519943295),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5184364492350666,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461,0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0,-0.5)*angles(-0.5235987755982988,-1.3089969389957472,-0.2617993877991494),deltaTime) 
		end
	})
end)

lbl("-----------== // Hatless Scripts // ==-----------")

	btn("Sonic", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local addmode=t.addmode
	local getJoint=t.getJoint
	local velbycfrvec=t.velbycfrvec
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	t.setWalkSpeed(50)
	t.setJumpPower(80)

	addmode("default",{
		idle=function()

			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.025*sin((sine + 0.5)*3),0)*angles(-0.3490658503988659-0.03490658503988659*sin(sine*3),-1.3089969389957472-0.03490658503988659*sin((sine+1.5)*3),-0.3490658503988659),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35+0.1*sin(sine*3),0)*angles(-0.8726646259971648,-1.3962634015954636-0.08726646259971647*sin((sine+0.5)*3),-0.8726646259971648),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.05 * sin((sine+0.5)*3),0)*angles(-1.5707963267948966+0.03490658503988659*sin(sine*3),0,2.8797932657906435+0.03490658503988659*sin((sine+1.5)*3)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966-0.05235987755982989*sin((sine+0.5)*3),0,3.385938748868999+0.03490658503988659*sin(sine*3)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.35+0.1*sin(sine*3),0)*angles(-0.8726646259971648,1.3962634015954636+0.08726646259971647*sin((sine+0.5)*3),0.8726646259971648),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.05*sin((sine + 0.5)*3),0)*angles(-0.3490658503988659-0.03490658503988659*sin(sine*3),1.3089969389957472-0.03490658503988659*sin((sine+1.5)*3),0.3490658503988659),deltaTime) 

		end,
		walk=function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.25,0)*angles(-1.0471975511965976+0.08726646259971647*sin((sine+0.5)*15),1.0471975511965976+0.1308996938995747*sin(sine*-7.5),0.04363323129985824*sin((sine-0.125)*-7.5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.025*sin(sine*7.5),-1+1*sin((sine - 0.0125)*15),-0.25+1*sin((sine - 0.05)*-15))*angles(0,-1.5707963267948966+0.1308996938995747*sin(sine*-7.5),1.9198621771937625*sin((sine+0.5)*15)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin(sine*15),0.05 * sin((sine+0.25)*15))*angles(-2.0943951023931953+0.04363323129985824*sin((sine+0.5)*-15),0,3.141592653589793+0.17453292519943295*sin(sine*7.5)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.25,0.25)*angles(-1.0471975511965976+0.08726646259971647*sin((sine+0.5)*15),-1.0471975511965976+0.1308996938995747*sin(sine*-7.5),0.017453292519943295+0.08726646259971647*sin((sine-0.125)*-7.5)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.025*sin(sine*7.5),-1+1*sin((sine - 0.0125)*-15),-0.25+1*sin((sine - 0.05)*15))*angles(0,1.5707963267948966+0.1308996938995747*sin(sine*-7.5),1.9198621771937625*sin((sine+0.5)*15)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636+0.04363323129985824*sin((sine+0.25)*15),0,3.141592653589793+0.1308996938995747*sin(sine*-7.5)),deltaTime) 
		end,
		jump = function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,0,-1)*angles(0,1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.7,0.5,0)*angles(0,-2.443460952792061,-2.2689280275926285),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.7,0.5,0)*angles(0,2.443460952792061,2.2689280275926285),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0,-1)*angles(0,-1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966-174532925.19943297*sin(sine*1.5e-07),0,3.141592653589793),deltaTime) 
		end,
		fall = function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.9198621771937625,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,0,-1)*angles(0,1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.7,0.5,0)*angles(0,-2.443460952792061,-2.2689280275926285),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.7,0.5,0)*angles(0,2.443460952792061,2.2689280275926285),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0,-1)*angles(0,-1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5707963267948966-174532925.19943297*sin(sine*1.5e-07),0,3.141592653589793),deltaTime) 
		end
	})
end)
btn("Among Us V3", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local addmode=t.addmode
	local getJoint=t.getJoint
	local velbycfrvec=t.velbycfrvec
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
		t.setJumpPower(50)
	addmode("default",{
			idle=function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin(sine*5),0)*angles(-1.5707963267948966-0.05235987755982989*sin((sine+0.5)*5),0.05235987755982989*sin(sine*3),3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin(sine*3),-1-0.2*sin(sine*5),-0.05 * sin((sine+0.5)*5))*angles(-1.5707963267948966+0.05235987755982989*sin((sine+0.5)*5),1.5707963267948966-0.05235987755982989*sin(sine*3),1.5707963267948966),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.05*sin(sine*3),-1-0.2*sin(sine*5),-0.05 * sin((sine+0.5)*5))*angles(-1.5707963267948966+0.05235987755982989*sin((sine+0.5)*5),-1.5707963267948966-0.05235987755982989*sin(sine*3),-1.5707963267948966),deltaTime) 

		end,
		walk=function()
			t.setWalkSpeed(16)
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.4*sin((sine + 0.74)*7),0.3 * sin(sine*7))*angles(-0.8726646259971648*sin(sine*7),1.5707963267948966+0.05235987755982989*sin(sine*7),0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1 * sin((sine+0.75)*14),0)*angles(-1.8325957145940461+0.05235987755982989*sin(sine*14),0,3.141592653589793+0.05235987755982989*sin(sine*7)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.01,-1-0.4*sin((sine + 0.75)*7),-0.3 * sin(sine*7))*angles(0.8726646259971648*sin(sine*7),-1.5707963267948966+0.05235987755982989*sin(sine*7),0),deltaTime) 
		end,
		jump = function()
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,0,-1)*angles(-0.3490658503988659,1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5271630954950384,0,3.141592653589793),deltaTime) 
		end,
		fall = function()
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,0,-1)*angles(-0.5235987755982988,1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.7453292519943295,0,3.141592653589793),deltaTime) 
		end
	})

	local modeStartTime=sine
	addmode("v", {
			modeEntered=function()
				t.setJumpPower(50)
			modeStartTime=sine
		end,
		idle=function()
			local modeTime=sine-modeStartTime
			if modeTime<0.5 then
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
				RightHip.C0=RightHip.C0:Lerp(cf(1,0,-0.5)*angles(0.3490658503988659,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.3490658503988659,-1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,2,0)*angles(-1.8325957145940461,0,3.141592653589793),deltaTime) 
				--MW_animatorProgressSave: Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1,LeftArm,-0.5,0,0,1,-0,0,0,1,0.5,0,0,1,-,0,0,1,0.5,0,0,1,0,0,0,1,RightLeg,1,0,0,1,20,0,0,1,-0,0,0,1,90,0,0,1,-0.5,0,0,1,0,0,0,1,LeftLeg,-1,0,0,1,-020,0,0,1,-1,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightArm,0.5,0,0,1,0,0,0,1,0.5,0,0,1,,0,0,1,0.5,0,0,1,0,0,0,1,Head,0,0,0,1,-90,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Torso,0,0,0,1,-105,0,0,1,2,0,0,1,-,0,0,1,0,0,0,1,180,0,0,1
			else
				RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
				LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.3490658503988659,-1.5707963267948966,0),deltaTime) 
				RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
				RootJoint.C0=RootJoint.C0:Lerp(cf(0,-12.5,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
				Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
				LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			end	
		end,
		walk = function()
			t.setWalkSpeed(25)
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-12.5,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
		end,
		jump = function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-12.5,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
		end,
		fall = function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-12.5,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
		end
	})

	addmode("c", {
		idle = function()
			Neck.C0=Neck.C0:Lerp(cf(0.5,0.25,-0.25)*angles(-1.5707963267948966,-1.5707963267948966,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1-0.025*sin(sine*2),-0.019 * sin((sine+0.5)*2))*angles(-0.8726646259971648+0.017453292519943295*sin((sine+0.5)*2),1.3089969389957472,2.0943951023931953),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-1.6+0.025*sin(sine*2),0)*angles(-1.2217304763960306-0.017453292519943295*sin((sine+0.5)*2),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.025*sin(sine*2),-0.019 * sin((sine+0.5)*2))*angles(-0.8726646259971648+0.017453292519943295*sin((sine+0.5)*2),-1.3089969389957472,-2.0943951023931953),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5,0.5)*angles(0,0,0),deltaTime) 
		end
	})
end)
btn("Chill", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local addmode=t.addmode
	local getJoint=t.getJoint
	local velbycfrvec=t.velbycfrvec
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	t.setWalkSpeed(10)
	t.setJumpPower(0)

	addmode("default",{
		idle=function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.7,-0.6)*angles(-0.6981317007977318*sin((sine+1)*1),1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(-0.4363323129985824*sin((sine+0.75)*1),-1.3962634015954636,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(-0.8726646259971648+0.2617993877991494*sin(sine*1),-1.3962634015954636,-0.8726646259971648),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin(sine*2),7+2*sin(sine*1),0)*angles(-0.17453292519943295-0.2617993877991494*sin((sine+2)*1),0,3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(-0.8726646259971648+0.2617993877991494*sin(sine*1),1.3962634015954636,0.8726646259971648),deltaTime) 
		end,
		walk=function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1,0)*angles(0,-1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,5+1*sin(sine*1),0)*angles(-3.141592653589793,0,3.141592653589793+6.283185307179586*sin(sine*0.5)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,3.141592653589793),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.5,0.5,-0.5)*angles(0,0.17453292519943295*sin((sine+1)*1),1.5707963267948966),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.5,0.5,-0.5)*angles(0,0.17453292519943295*sin((sine+1)*1),-1.5707963267948966),deltaTime) 			
		end
	})
end)
btn("Gale Fighter", function()
	local t=reanimate()
	local addmode=t.addmode
	local getJoint=t.getJoint
	local getPartFromMesh=t.getPartFromMesh
	local getPartJoint=t.getPartJoint
	local velbycfrvec=t.velbycfrvec
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")

	local function ShadeID(ID, Duration)
		local s = Instance.new("Sound")
		s.SoundId = "rbxassetid://" .. ID
		s.Parent = workspace
		s:Play()
		task.wait(Duration)
		s:Destroy()

	end
	tspawn(function() while c do twait() end ShadeID = emptyfunction end)

	t.setJumpPower(0)

	local attackAnimation=nil
	mouse.Button1Down:Connect(function()
		if attackAnimation then return end
		task.spawn(ShadeID, 636494529, 0.5)
		attackAnimation=function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.9,0)*angles(-0.5235987755982988,1.0471975511965976,0.6108652381980153),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0,-2.0943951023931953),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.25,0.25,0.25)*angles(0,0.6981317007977318,1.9198621771937625),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.775,0)*angles(-0.5235987755982988,-0.9162978572970231,-0.6981317007977318),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.25,0)*angles(-1.6580627893946132,0.1308996938995747,2.0943951023931953),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.125,0.5,-0.6)*angles(0,-0.6981317007977318,-1.6580627893946132),deltaTime) 
		end
		task.wait(0.2)
		attackAnimation=function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.6,-0.1)*angles(-0.5235987755982988,-0.9162978572970231,-0.8726646259971648),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.2,0.3,-0.8)*angles(-0.17453292519943295,2.6179938779914944,1.3962634015954636),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(0,1.5707963267948966,0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.25,0)*angles(-1.9198621771937625,-0.1308996938995747,-3.490658503988659),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966,0.1308996938995747,-2.792526803190927),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(-0.5235987755982988,-1.2217304763960306,-0.8726646259971648),deltaTime)  			
		end
		task.wait(0.3)
		attackAnimation=nil
	end)


	addmode("default", {
		idle = function()
			if attackAnimation then return attackAnimation() end
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.04363323129985824*sin((sine-0.76)*-2),-0.08726646259971647+0.04363323129985824*sin((sine-0.76)*-2),-2.2689280275926285),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.05+0.15*sin(sine*2),0)*angles(-1.5707963267948966+0.04363323129985824*sin((sine+1)*-2),0,2.2689280275926285),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.025*sin((sine + 1)*-2),-1+0.15*sin((sine + 0.1)*-2),0.05 * sin((sine+1)*-2))*angles(-0.6981317007977318+0.017453292519943295*sin((sine+1)*2),0.8726646259971648+0.05235987755982989*sin((sine+1)*2),0.5235987755982988+0.008726646259971648*sin((sine+1)*2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.25+0.05*sin(sine*2),-0.25)*angles(-0.3490658503988659,-2.443460952792061,-2.443460952792061+0.08726646259971647*sin((sine+0.5)*2)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.0125*sin((sine - 0.9)*2),-0.95+0.15*sin((sine - 0.1)*-2),0.0125 * sin((sine-0.9)*2))*angles(-0.5235987755982988,-0.8726646259971648+0.026179938779914945*sin((sine+1)*2),-0.3490658503988659+0.04363323129985824*sin((sine+1)*-2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.25+0.05*sin(sine*2),0)*angles(-0.8726646259971648+0.08726646259971647*sin((sine+0.5)*-2),2.0943951023931953,2.792526803190927),deltaTime) 

		end,
		walk = function()
			if attackAnimation then return attackAnimation() end
			t.setWalkSpeed(13)
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.0875 * sin(sine*14),0.075 * sin((sine+0.1)*14))*angles(-2.007128639793479+0.04363323129985824*sin((sine+0.1)*14),0,3.141592653589793+0.17453292519943295*sin(sine*-7)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4398966328953218,0,3.141592653589793+0.08726646259971647*sin((sine+0.075)*7)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0.125 * sin((sine+0.8)*7))*angles(0.5235987755982988*sin((sine-0.8)*7),1.5707963267948966+0.2181661564992912*sin((sine+0.3)*7),0.9162978572970231*sin((sine-0.1)*-7)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1+0.25*sin((sine + 0.225)*-7),-0.275+0.5*sin((sine + 0.075)*7))*angles(0,-1.5707963267948966+0.17453292519943295*sin(sine*7),0.08726646259971647+1.090830782496456*sin((sine-0.1)*7)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0.125 * sin((sine+0.8)*-7))*angles(0.5235987755982988*sin((sine-0.8)*-7),-1.5707963267948966+0.2181661564992912*sin((sine+0.3)*7),0.9162978572970231*sin((sine-0.1)*-7)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.25*sin((sine + 0.225)*7),-0.275+0.5*sin((sine + 0.075)*-7))*angles(0,1.5707963267948966+0.17453292519943295*sin(sine*7),-0.08726646259971647+1.090830782496456*sin((sine-0.1)*7)),deltaTime) 
		end,
	jump = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0,-0.5)*angles(0.17453292519943295,-1.3264502315156905,0.2617993877991494),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(2.792526803190927,1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(2.792526803190927,-1.5707963267948966,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.3490658503988659,1.3089969389957472,0.2617993877991494),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5184364492350666,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4835298641951802,0,3.141592653589793),deltaTime) 
			--MW_animatorProgressSave: Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1,LeftLeg,-1,0,0,1,10,0,0,1,-0,0,0,1,-76,0,0,1,-0.5,0,0,1,15,0,0,1,RightArm,1,0,0,1,160,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,160,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-20,0,0,1,-1,0,0,1,75,0,0,1,0,0,0,1,15,0,0,1,Torso,0,0,0,1,-87,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Head,0,0,0,1,-85,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,14
	end,
	fall = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,0,-0.5)*angles(0.17453292519943295,-1.3264502315156905,0.2617993877991494),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(2.2689280275926285,1.5707963267948966,0),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(2.2689280275926285,-1.5707963267948966,0),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.3490658503988659,1.3089969389957472,0.2617993877991494),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0,0)*angles(-1.5184364492350666,0,3.141592653589793),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295,0,3.141592653589793),deltaTime) 
			--MW_animatorProgressSave: Fedora_Handle,0,0,0,1,-180,0,0,1,-0.03419148921966553,0,0,1,0,0,0,1,-0.030933568254113197,0,0,1,-180,0,0,1,LeftLeg,-1,0,0,1,10,0,0,1,-0,0,0,1,-76,0,0,1,-0.5,0,0,1,15,0,0,1,RightArm,1,0,0,1,130,0,0,1,0.5,0,0,1,90,0,0,1,0,0,0,1,0,0,0,1,LeftArm,-1,0,0,1,130,0,0,1,0.5,0,0,1,-90,0,0,1,0,0,0,1,0,0,0,1,RightLeg,1,0,0,1,-20,0,0,1,-1,0,0,1,75,0,0,1,0,0,0,1,15,0,0,1,Torso,0,0,0,1,-87,0,0,1,0,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1,Head,0,0,0,1,-100,0,0,1,1,0,0,1,-0,0,0,1,0,0,0,1,180,0,0,1
		end
	})
end)
btn("Infinity Glitcher", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local addmode=t.addmode
	local getJoint=t.getJoint
	local SJP=t.setJumpPower
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	SJP(0)
	addmode("default", {
		idle = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.05*sin(sine*-1.5),-0.75+0.175*sin((sine + 0.75)*-1.5),-0.1+0.1*sin(sine*-1.5))*angles(-0.3490658503988659,-1.0471975511965976,-0.8726646259971648+0.1308996938995747*sin((sine-0.5)*1.5)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.25+0.2*sin((sine + 0.75)*1.5),0.2+0.2*sin((sine - 0.5)*1.5))*angles(-1.9198621771937625+0.1308996938995747*sin((sine-0.5)*1.5),-0.08726646259971647,2.6179938779914944),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.1 * sin((sine+1)*1.5),0)*angles(-1.3962634015954636,1.1344640137963142+0.17453292519943295*sin((sine-0.25)*-1.5),1.3962634015954636),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.8,0)*angles(-1.0471975511965976+0.17453292519943295*sin((sine-0.5)*-1.5),-0.5235987755982988+0.04363323129985824*sin(sine*-1.5),2.007128639793479),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.1308996938995747*sin((sine-0.5)*-1.5),0.17453292519943295+0.04363323129985824*sin(sine*-1.5),3.6651914291880923),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.9+0.025*sin((sine + 1)*-1.5),-1.3+0.225*sin((sine + 1)*-1.5),-0.5+0.075*sin(sine*-1.5))*angles(0.5235987755982988,2.0943951023931953,-0.7853981633974483+0.1308996938995747*sin((sine-0.5)*-1.5)),deltaTime) 
		end,
		walk = function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.4,0.5 * sin((sine+0.05)*7))*angles(-1.0471975511965976*sin(sine*7),-1.5707963267948966-0.17453292519943295*sin(sine*7),0),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1 * sin((sine+0.75)*14),0)*angles(-1.7453292519943295+0.05235987755982989*sin(sine*14),0,3.141592653589793+0.05235987755982989*sin(sine*7)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.4,-0.5 * sin((sine+0.05)*7))*angles(1.0471975511965976*sin(sine*7),1.5707963267948966-0.17453292519943295*sin(sine*7),0),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.3962634015954636-0.05235987755982989*sin(sine*14),0,3.141592653589793-0.05235987755982989*sin(sine*7)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.3*sin((sine + 0.74)*7),0.4 * sin(sine*7))*angles(-0.9599310885968813*sin(sine*7),1.5707963267948966,0),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1-0.3*sin((sine + 0.75)*7),-0.4 * sin(sine*7))*angles(0.9599310885968813*sin(sine*7),-1.5707963267948966,0),deltaTime) 
		end
	})
	addmode("q", {
		idle = function()
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin(sine*2),0.2 * sin(sine*2))*angles(-1.5707963267948966+0.08726646259971647*sin(sine*-2),0,2.9670597283903604),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.75,-0.25+0.25*sin((sine - 0.5)*2),0)*angles(0.2617993877991494*sin((sine-0.5)*-2),2.792526803190927,1.5707963267948966),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.05*sin(sine*-2),-1+0.095*sin(sine*-2),-0.1+0.25*sin(sine*-2))*angles(-0.5235987755982988+0.10471975511965978*sin(sine*2),-1.3526301702956054,-0.4188790204786391),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.25+0.25*sin((sine - 0.5)*-2),-0.25)*angles(-0.2617993877991494*sin((sine-0.5)*-2),-2.792526803190927,-1.7453292519943295),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1.05+0.05*sin(sine*-2),-1+0.115*sin(sine*-2),-0.1+0.275*sin(sine*-2))*angles(-0.4363323129985824+0.08726646259971647*sin(sine*2),1.3089969389957472,0.4363323129985824),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7016960206944713+0.05235987755982989*sin((sine-0.6)*2),0,3.3161255787892263),deltaTime) 
		end
	})
	addmode("e", {
		idle = function()
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.15,-0.5+0.25*sin((sine - 0.25)*1.5),-0.5)*angles(0,-1.0471975511965976+0.17453292519943295*sin(sine*1.5),0.17453292519943295+0.3490658503988659*sin((sine+1)*-1.5)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295+0.17453292519943295*sin(sine*-1.5),-0.17453292519943295,3.6651914291880923),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.2+0.15*sin((sine - 1)*1.5),0)*angles(-0.5235987755982988,1.0471975511965976+0.2617993877991494*sin((sine+0.5)*1.5),0.5235987755982988+0.5235987755982988*sin((sine-0.5)*-1.5)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.5 * sin((sine+1)*-1.5),5+0.5*sin((sine - 0.5)*1.5),1 * sin((sine+0.5)*1.5))*angles(-1.7453292519943295+0.1308996938995747*sin((sine-0.5)*1.5),0.17453292519943295+0.08726646259971647*sin((sine+0.5)*1.5),2.443460952792061),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.5,0)*angles(-1.5707963267948966,-1.0471975511965976,1.9198621771937625+0.17453292519943295*sin(sine*1.5)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,0)*angles(-0.5235987755982988,1.0471975511965976,0.3490658503988659+0.3490658503988659*sin((sine+2.5)*-1.5)),deltaTime) 
		end
	})
	addmode("r", {
		idle = function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461+0.05235987755982989*sin((sine-0.25)*2),-0.08726646259971647,3.3161255787892263),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.95+0.125*sin(sine*-2),-0.5+0.2*sin((sine + 0.75)*2))*angles(-0.08726646259971647+0.08726646259971647*sin((sine-0.5)*-2),-1.2217304763960306,0.1308996938995747),deltaTime)  
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.3+0.15*sin(sine*2),0.1 * sin((sine-0.5)*-2))*angles(-1.3962634015954636+0.08726646259971647*sin((sine-0.5)*-2),0.04363323129985824,2.9670597283903604),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.8,-0.25+0.1*sin((sine + 1)*2),0)*angles(0,-2.792526803190927,-1.6144295580947547+0.08726646259971647*sin((sine+1.75)*2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.7,0.15+0.1*sin((sine + 1)*2),0)*angles(0,2.9670597283903604,1.7453292519943295+0.08726646259971647*sin((sine+1.75)*-2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.15*sin(sine*-2),-0.75+0.1*sin((sine - 0.5)*-2))*angles(1.5707963267948966+0.05235987755982989*sin((sine-0.25)*-2),2.007128639793479,-2.0943951023931953),deltaTime) 
		end
	})         
	addmode("t", {
		idle = function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.2,0.25+0.2*sin((sine - 0.5)*-2),-0.25)*angles(-1.5707963267948966,2.2689280275926285+0.17453292519943295*sin((sine+0.3)*-2),-2.443460952792061+0.08726646259971647*sin((sine+0.1)*-2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1.2,0.25+0.2*sin((sine - 0.5)*-2),-0.25)*angles(-1.5707963267948966,-2.2689280275926285+0.17453292519943295*sin((sine+0.3)*2),2.443460952792061+0.08726646259971647*sin((sine+0.1)*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,-0.1+0.075*sin(sine*2))*angles(-1.6144295580947547+0.2181661564992912*sin((sine+1.2)*2),1.3962634015954636,1.1344640137963142),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.007128639793479+0.1308996938995747*sin((sine+0.3)*-2),0.04363323129985824*sin((sine+0.5)*-1),3.141592653589793),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.05 * sin(sine*1),5+0.5*sin((sine - 0.2)*-2),0.3 * sin((sine+0.5)*2))*angles(-1.3526301702956054+0.1308996938995747*sin((sine+0.3)*2),0.04363323129985824*sin((sine+0.5)*1),3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.5+0.25*sin((sine + 0.75)*2),-0.75)*angles(-0.5235987755982988+0.17453292519943295*sin((sine-2.75)*2),-1.3962634015954636+0.08726646259971647*sin(sine*2),0),deltaTime) 		end
	})
	addmode("y", {
		idle = function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.2+0.2*sin((sine + 0.75)*2),0)*angles(-0.5235987755982988,1.2217304763960306+0.17453292519943295*sin((sine+0.5)*2),0.5235987755982988),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-0.975,-0.9,0)*angles(-0.5235987755982988,-1.2217304763960306,-0.3490658503988659+0.08726646259971647*sin((sine-0.5)*2)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.9,-0.25+0.25*sin((sine + 0.5)*2),-0.75)*angles(-1.2217304763960306+0.17453292519943295*sin((sine+1.5)*-2),1.3962634015954636,1.2217304763960306),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,2.5+0.4*sin((sine - 0.2)*-2),0.3 * sin((sine+0.4)*2))*angles(-1.7453292519943295+0.08726646259971647*sin((sine+0.4)*2),0,2.792526803190927),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4486232791552935+0.10471975511965978*sin((sine+0.8)*-2),0.04363323129985824+0.026179938779914945*sin((sine+0.8)*-2),3.490658503988659),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.6,0)*angles(-1.5707963267948966+0.06981317007977318*sin((sine+0.8)*-2),-1.0471975511965976,1.6144295580947547),deltaTime) 
		end
	})        
	addmode("u", {
		idle = function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0.25+0.1*sin(sine*2),-0.25)*angles(0,-2.792526803190927,-1.5707963267948966+0.2617993877991494*sin((sine+4)*2)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.75,-0.5+0.15*sin(sine*2),-0.5)*angles(0,3.141592653589793,1.5707963267948966+0.17453292519943295*sin((sine+0.5)*-2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295+0.08726646259971647*sin((sine+0.4)*-2),0.04363323129985824*sin(sine*-1),3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.05*sin(sine*1),-1+0.2*sin(sine*-2),-0.1+0.175*sin((sine - 2.15)*2))*angles(-1.3962634015954636+0.08726646259971647*sin(sine*-2),1.4311699866353502+0.04363323129985824*sin(sine*-1),1.2217304763960306),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1+0.2*sin(sine*2),0.2 * sin((sine-0.5)*2))*angles(-1.5707963267948966+0.08726646259971647*sin(sine*2),0.04363323129985824*sin(sine*1),3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.05*sin(sine*1),-1+0.2*sin(sine*-2),-0.1+0.175*sin((sine + 1)*2))*angles(1.7453292519943295+0.08726646259971647*sin(sine*-2),-1.6580627893946132+0.04363323129985824*sin(sine*1),1.7889624832941877),deltaTime) 
		end
	})
	addmode("i", {
		idle = function()
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,-0.25+0.25*sin(sine*-1.5),-0.5)*angles(-1.0471975511965976,1.0471975511965976+0.5235987755982988*sin((sine+3)*1.5),2.0943951023931953),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(0.95,-1,-0.75)*angles(-0.8726646259971648+0.3490658503988659*sin((sine+1)*-1.5),1.2217304763960306,0.17453292519943295),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0.5,0)*angles(3.141592653589793,-0.6981317007977318,0.6981317007977318),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.17453292519943295*sin((sine+5)*-1.5),0,3.490658503988659),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,2-0.75*sin(sine*1.5),0)*angles(-2.2689280275926285+0.17453292519943295*sin((sine+5)*1.5),0,2.792526803190927+0.04363323129985824*sin((sine+1)*1.5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.25,-0.5,-0.5)*angles(-0.17453292519943295-0.3490658503988659*sin((sine-1)*-1.5),-1.2217304763960306,0),deltaTime) 
		end,
	})
	addmode("o", {
		idle = function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.5+0.15*sin((sine + 0.2)*2.5),0.5)*angles(1.5707963267948966+0.08726646259971647*sin((sine-0.3)*2.5),-0.6981317007977318,2.0943951023931953),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.0943951023931953+0.08726646259971647*sin((sine+0.6)*-2.5),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.075+0.15*sin((sine + 0.25)*-2.5),0.2 * sin((sine-0.7)*-2.5))*angles(-0.5235987755982988+0.08726646259971647*sin((sine+0.3)*-2.5),-1.0471975511965976,-0.2792526803190927),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,0.5+0.15*sin((sine + 0.2)*2.5),0.5)*angles(-1.5707963267948966+0.08726646259971647*sin((sine-0.3)*2.5),2.443460952792061,1.0471975511965976),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1.075+0.15*sin((sine + 0.225)*-2.5),0.2 * sin((sine+0.65)*2.5))*angles(-0.5235987755982988+0.08726646259971647*sin((sine+0.3)*-2.5),1.2217304763960306,0.22689280275926285),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1+0.15*sin((sine + 0.4)*2.5),0.15 * sin((sine-0.4)*2.5))*angles(-1.2217304763960306+0.08726646259971647*sin((sine+0.3)*2.5),0,3.141592653589793),deltaTime) 
		end
	})
	addmode("p", {
		idle = function()
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1+0.15*sin((sine - 0.6)*2),0.1 * sin((sine-0.2)*2))*angles(-1.5707963267948966+0.10471975511965978*sin((sine+0.4)*2),0,3.141592653589793),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-0.9+0.15*sin((sine - 0.5)*-2),-0.2+0.12*sin((sine + 2.5)*-2))*angles(1.0471975511965976+0.10471975511965978*sin((sine+0.4)*-2),-1.6580627893946132,1.1519173063162575),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.3+0.15*sin((sine + 1)*-2),0)*angles(-1.5707963267948966,1.3089969389957472+0.2617993877991494*sin((sine+1.5)*-2),1.5707963267948966+0.08726646259971647*sin(sine*-2)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.3+0.15*sin((sine - 0.5)*2),0)*angles(1.5707963267948966,-1.8325957145940461+0.2617993877991494*sin((sine+1.5)*-2),1.5707963267948966+0.08726646259971647*sin(sine*2)),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.5707963267948966+0.10471975511965978*sin((sine+0.6)*-2),0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-0.9+0.15*sin((sine - 0.5)*-2),-0.2+0.12*sin((sine + 2.5)*-2))*angles(-1.0471975511965976+0.10471975511965978*sin((sine+0.4)*-2),1.4486232791552935,1.0471975511965976),deltaTime) 
		end
	})
	addmode("f", {
		idle = function()
			RightHip.C0=RightHip.C0:Lerp(cf(1+0.015*sin((sine + 0.1)*-7),-1.1+0.21*sin((sine + 0.325)*-7),0.045 * sin((sine+1)*-7))*angles(-1.0471975511965976+0.04363323129985824*sin(sine*-7),1.2217304763960306+0.017453292519943295*sin(sine*-7),1.0471975511965976),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,-0.1+0.2*sin((sine + 0.3)*7),-0.1+0.1*sin(sine*7))*angles(-1.7453292519943295+0.04363323129985824*sin(sine*7),0,2.792526803190927),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.7453292519943295+0.04363323129985824*sin((sine+0.5)*-7),0.08726646259971647+0.017453292519943295*sin(sine*-7),3.490658503988659),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5,-0.5+0.3*sin((sine + 0.25)*7),-0.25)*angles(0.3490658503988659*sin(sine*-7),2.792526803190927,1.4835298641951802+0.2617993877991494*sin((sine+0.5)*-7)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.25+0.3*sin((sine + 0.25)*7),-0.25)*angles(0.3490658503988659*sin(sine*-7),-2.6179938779914944,-1.3962634015954636+0.2617993877991494*sin((sine+0.5)*7)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1+0.015*sin((sine + 0.1)*-7),-0.9+0.1975*sin((sine + 0.3)*-7),-0.2+0.045*sin((sine + 1)*-7))*angles(-0.4363323129985824+0.04363323129985824*sin(sine*-7),-1.2217304763960306+0.017453292519943295*sin(sine*-7),-0.7417649320975901),deltaTime) 
		end
	})
	addmode("g", {
		idle = function()
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.75)*2),0.2 * sin((sine+0.25)*2))*angles(-1.4835298641951802+0.05235987755982989*sin(sine*2),0.03490658503988659*sin((sine+0.5)*2),3.6651914291880923-0.05235987755982989*sin(sine*2)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-0.85,-1.1-0.1*sin((sine + 0.75)*2),-0.5-0.1*sin((sine + 0.25)*2))*angles(-0.8726646259971648-0.05235987755982989*sin(sine*2),-1.0471975511965976-0.05235987755982989*sin((sine+0.5)*2),-0.7853981633974483),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-1,0.35+0.1*sin((sine + 0.5)*2),0)*angles(0.6981317007977318,-1.1344640137963142+0.08726646259971647*sin(sine*2),0.6981317007977318),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132+0.05235987755982989*sin(sine*2),0,2.705260340591211+0.08726646259971647*sin(sine*1.75)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1.1,-1.2-0.1*sin((sine + 0.75)*2),0.2-0.1*sin((sine + 0.25)*2))*angles(-0.7853981633974483-0.05235987755982989*sin(sine*2),1.3089969389957472-0.03490658503988659*sin((sine+0.5)*2),0.3490658503988659),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.05,-0.3+0.3*sin(sine*2),0)*angles(1.7453292519943295-0.05235987755982989*sin((sine+0.5)*2),1.9198621771937625+0.17453292519943295*sin(sine*2),-0.3490658503988659*sin((sine+0.75)*2)),deltaTime) 
		end
	})
	addmode("h", {
		idle = function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.6580627893946132-0.03490658503988659*sin((sine+0.75)*2.5),0,3.5779249665883754),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.9,0.25+0.1*sin((sine + 0.5)*2.5),0.2+0.1*sin(sine*2.5))*angles(-0.8726646259971648,-1.2217304763960306-0.05235987755982989*sin(sine*2.5),-0.7853981633974483-0.2181661564992912*sin((sine+0.75)*2.5)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.1 * sin((sine+0.75)*2.5),0.2 * sin(sine*2.5))*angles(-1.4835298641951802+0.05235987755982989*sin(sine*2.5),0,2.705260340591211),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1.1-0.025*sin(sine*2.5),-1.1-0.09*sin((sine + 0.75)*2.5),-0.2-0.15*sin(sine*2.5))*angles(-0.6981317007977318-0.05235987755982989*sin(sine*2.5),-1.0471975511965976,-0.6108652381980153),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1-0.025*sin(sine*2.5),-1.1-0.1*sin((sine + 0.75)*2.5),0.1-0.15*sin(sine*2.5))*angles(-0.6981317007977318-0.05235987755982989*sin(sine*2.5),1.0471975511965976,0.6108652381980153),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1,0.5,0)*angles(1.4835298641951802-0.03490658503988659*sin((sine+0.75)*2.5),2.0943951023931953,1.5707963267948966),deltaTime)
		end
	})
	addmode("j", {
		idle = function()
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.4398966328953218+0.06981317007977318*sin((sine-0.3)*-4),0,3.141592653589793),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.2*sin((sine + 0.3)*-4),-0.2+0.125*sin(sine*-4))*angles(-1.0471975511965976+0.08726646259971647*sin(sine*-4),1.2217304763960306,0.8726646259971648),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.1+0.2*sin((sine + 0.3)*-4),-0.4+0.1*sin(sine*-4))*angles(1.0471975511965976+0.08726646259971647*sin(sine*-4),-1.6580627893946132,1.1344640137963142),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.4,-0.25+0.2*sin((sine - 1.5)*4),-0.8)*angles(-1.9198621771937625+0.17453292519943295*sin((sine-0.5)*4),-0.8726646259971648,1.5707963267948966),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.75,-0.3+0.2*sin((sine - 3)*4),-0.25)*angles(0,2.9670597283903604,1.5707963267948966+0.17453292519943295*sin((sine-2)*4)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0,0.2 * sin((sine+0.3)*4),0.2 * sin(sine*4))*angles(-1.5707963267948966+0.08726646259971647*sin(sine*4),0,3.141592653589793),deltaTime) 
		end
	})
	addmode("k", {
		idle = function()
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1,-0.25+0.1*sin((sine + 0.8)*1.5))*angles(-1.8500490071139892+0.1308996938995747*sin((sine+1.3)*1.5),1.2217304763960306+0.04363323129985824*sin((sine+0.25)*1.5),1.7453292519943295),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-2.2689280275926285+0.1308996938995747*sin((sine+0.4)*-1.5),-0.17453292519943295+0.04363323129985824*sin((sine-0.25)*1.5),3.3161255787892263+0.04363323129985824*sin((sine+0.5)*-1.5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(1.1,0.8+0.1*sin((sine + 1.75)*-1.5),-0.25+0.1*sin((sine - 0.75)*1.5))*angles(4.014257279586958+0.08726646259971647*sin((sine+0.5)*-1.5),2.007128639793479,-0.5235987755982988+0.08726646259971647*sin((sine-0.75)*1.5)),deltaTime) 
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.75,0.25,-0.25)*angles(0.17453292519943295,-2.443460952792061,-2.443460952792061+0.17453292519943295*sin((sine+0.4)*1.5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-0.9+0.1*sin((sine + 0.75)*1.5),-0.2+0.1*sin((sine - 0.25)*-1.5),-0.5)*angles(-0.5235987755982988,-1.2217304763960306+0.08726646259971647*sin((sine+0.5)*1.5),-1.0471975511965976),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin((sine+0.75)*1.5),-0.75+0.1*sin((sine - 0.25)*1.5),0.1 * sin((sine-0.5)*1.5))*angles(-2.2689280275926285+0.08726646259971647*sin((sine-0.5)*1.5),0.04363323129985824*sin((sine-1)*-1.5),2.792526803190927),deltaTime) 
		end
	})
	addmode("l", {
		idle = function()
			LeftShoulder.C0=LeftShoulder.C0:Lerp(cf(-0.5,0.2 * sin((sine-0.25)*1.5),0)*angles(-0.17453292519943295+0.17453292519943295*sin((sine+0.25)*1.5),-2.6179938779914944+0.08726646259971647*sin((sine-0.5)*1.5),-2.0943951023931953+0.17453292519943295*sin((sine+0.75)*1.5)),deltaTime) 
			RootJoint.C0=RootJoint.C0:Lerp(cf(0.1 * sin((sine-0.5)*1.5),-0.25+0.1*sin((sine + 1.25)*1.5),0.2 * sin(sine*1.5))*angles(-1.3962634015954636+0.10471975511965978*sin((sine+0.5)*1.5),0.17453292519943295+0.04363323129985824*sin((sine-0.75)*1.5),2.9670597283903604+0.1308996938995747*sin((sine+1)*1.5)),deltaTime) 
			LeftHip.C0=LeftHip.C0:Lerp(cf(-1,-1.2+0.2*sin((sine + 0.8)*-1.5),-0.5)*angles(0.3490658503988659+0.08726646259971647*sin((sine-0.75)*1.5),-1.4835298641951802+0.08726646259971647*sin((sine-1)*-1.5),0.5235987755982988),deltaTime) 
			Neck.C0=Neck.C0:Lerp(cf(0,1,0)*angles(-1.8325957145940461+0.1308996938995747*sin((sine-0.75)*1.5),-0.17453292519943295+0.08726646259971647*sin((sine+0.75)*1.5),3.3161255787892263+0.08726646259971647*sin((sine-0.5)*1.5)),deltaTime) 
			RightHip.C0=RightHip.C0:Lerp(cf(1,-1+0.15*sin((sine - 0.75)*1.5),-0.9)*angles(-1.7453292519943295,1.0471975511965976+0.08726646259971647*sin((sine+0.5)*1.5),1.0471975511965976+0.1308996938995747*sin((sine-0.75)*1.5)),deltaTime) 
			RightShoulder.C0=RightShoulder.C0:Lerp(cf(0.5+0.1*sin((sine - 0.75)*1.5),-0.5+0.1*sin((sine - 0.25)*1.5),0.1)*angles(0.17453292519943295*sin(sine*1.5),2.792526803190927+0.08726646259971647*sin((sine-0.5)*1.5),1.5707963267948966+0.08726646259971647*sin((sine+0.5)*1.5)),deltaTime) 
		end
	})
end)
btn("Neko", function()
	local t=reanimate()
	if type(t)~="table" then return end
	local addmode=t.addmode
	local getJoint=t.getJoint
	local RootJoint=getJoint("RootJoint")
	local RightShoulder=getJoint("Right Shoulder")
	local LeftShoulder=getJoint("Left Shoulder")
	local RightHip=getJoint("Right Hip")
	local LeftHip=getJoint("Left Hip")
	local Neck=getJoint("Neck")
	addmode("default",{
		idle=function()
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295-0.05235987755982989*sin((sine+0.75)*3),0,3.3597588100890845+0.03490658503988659*sin(sine*3)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.1-0.0625*sin(sine*3),0)*angles(-1.1344640137963142,-1.3962634015954636,-0.9599310885968813),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0.075 * sin(sine*1.5),0.0625 * sin(sine*3),0)*angles(-1.5707963267948966,0.017453292519943295*sin(sine*1.5),2.8361600344907854+0.017453292519943295*sin(sine*1.5)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.075*sin((sine+0.5)*3),0)*angles(0,0.3490658503988659,-0.6981317007977318+0.05235987755982989*sin(sine*3)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1-0.025*sin(sine*1.5),-1.1-0.0625*sin(sine*3),-0.015 * sin(sine*1.5))*angles(-1.1344640137963142,1.3962634015954636-0.017453292519943295*sin(sine*1.5),1.0471975511965976-0.017453292519943295*sin(sine*1.5)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2-0.075*sin((sine+0.5)*3),0)*angles(0,-0.3490658503988659,0.6981317007977318-0.05235987755982989*sin(sine*3)),deltaTime) 
		end,
		walk=function()
			t.setWalkSpeed(16)
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4,0.35 * sin((sine+0.05)*7))*angles(0,-1.5707963267948966+0.08726646259971647*sin(sine*7),0.6981317007977318*sin(sine*7)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,0.0625 * sin((sine+0.075)*14),0)*angles(-1.7453292519943295+0.03490658503988659*sin(sine*14),0,3.141592653589793+0.03490658503988659*sin(sine*7)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.4,-0.35 * sin((sine+0.05)*7))*angles(0,1.5707963267948966+0.08726646259971647*sin(sine*7),0.6981317007977318*sin(sine*7)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3962634015954636-0.03490658503988659*sin(sine*14),-0.03490658503988659*sin((sine+0.25)*7),3.141592653589793-0.03490658503988659*sin(sine*7)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.2*sin((sine+0.625)*7),0.2 * sin(sine*7))*angles(0,1.5707963267948966,-0.7853981633974483*sin(sine*7)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.2*sin((sine+0.625)*7),-0.2 * sin(sine*7))*angles(0,-1.5707963267948966,-0.7853981633974483*sin(sine*7)),deltaTime) 
		end,
	})
	addmode("f", {
		idle = function()
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-2.5,0)*angles(-3.141592653589793,0.03490658503988659*sin(sine*3),3.141592653589793-0.03490658503988659*sin((sine+0.625)*3)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1,0)*angles(0,1.5707963267948966-0.2617993877991494*sin((sine+0.625)*3),-0.9599310885968813+0.39269908169872414*sin(sine*3)),deltaTime) 
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-0.7,0.5,-0.2)*angles(1.5707963267948966,-2.181661564992912,-1.5707963267948966),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(0.7,0.5,-0.2)*angles(1.5707963267948966,2.181661564992912,1.5707963267948966),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-0.3490658503988659,-0.05235987755982989*sin(sine*3),3.141592653589793),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1,0)*angles(0,-1.5707963267948966-0.2617993877991494*sin((sine+0.625)*3),0.9599310885968813+0.39269908169872414*sin(sine*3)),deltaTime) 
		end
	})
	addmode("q", {
		idle = function()
			
		Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.7453292519943295-0.05235987755982989*sin((sine+0.75)*3),0,3.3597588100890845+0.03490658503988659*sin(sine*3)),deltaTime) 
		LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1.1-0.0625*sin(sine*3),0)*angles(-1.1344640137963142,-1.3962634015954636,-0.9599310885968813),deltaTime) 
		RootJoint.C0=Lerp(RootJoint.C0,cf(0.075 * sin(sine*1.5),0.0625 * sin(sine*3),0)*angles(-1.5707963267948966,0.017453292519943295*sin(sine*1.5),2.8361600344907854+0.017453292519943295*sin(sine*1.5)),deltaTime) 
		RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.2-0.075*sin((sine+0.5)*3),0)*angles(0,0.3490658503988659,-0.6981317007977318+0.05235987755982989*sin(sine*3)),deltaTime) 
		RightHip.C0=Lerp(RightHip.C0,cf(1-0.025*sin(sine*1.5),-1.1-0.0625*sin(sine*3),-0.015 * sin(sine*1.5))*angles(-1.1344640137963142,1.3962634015954636-0.017453292519943295*sin(sine*1.5),1.0471975511965976-0.017453292519943295*sin(sine*1.5)),deltaTime) 
		LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.2-0.075*sin((sine+0.5)*3),0)*angles(0,-0.3490658503988659,0.6981317007977318-0.05235987755982989*sin(sine*3)),deltaTime) 

		end,
		walk=function()
			t.setWalkSpeed(30)
			LeftShoulder.C0=Lerp(LeftShoulder.C0,cf(-1,0.4-0.075*sin(sine*24),0.2)*angles(0,-1.3089969389957472,1.3962634015954636-0.06981317007977318*sin(sine*24)),deltaTime) 
			RootJoint.C0=Lerp(RootJoint.C0,cf(0,-0.075 * sin((sine+0.75)*24),0)*angles(-1.7889624832941877+0.05235987755982989*sin(sine*24),0,3.141592653589793+0.05235987755982989*sin(sine*12)),deltaTime) 
			LeftHip.C0=Lerp(LeftHip.C0,cf(-1,-1-0.5*sin((sine+0.625)*12),0.75 * sin(sine*12))*angles(0,-1.5707963267948966,1.8325957145940461*sin(sine*12)),deltaTime) 
			Neck.C0=Lerp(Neck.C0,cf(0,1,0)*angles(-1.3962634015954636-0.05235987755982989*sin(sine*24),0.03490658503988659*sin(sine*12),3.141592653589793-0.05235987755982989*sin(sine*12)),deltaTime) 
			RightHip.C0=Lerp(RightHip.C0,cf(1,-1+0.5*sin((sine+0.625)*12),-0.75 * sin(sine*12))*angles(0,1.5707963267948966,1.8325957145940461*sin(sine*12)),deltaTime) 
			RightShoulder.C0=Lerp(RightShoulder.C0,cf(1,0.4-0.075*sin((sine+0.05)*24),0.2)*angles(0,1.3089969389957472,-1.3962634015954636+0.06981317007977318*sin(sine*24)),deltaTime) 
		end
	})
end)
btn("stop current script",function()
	stopreanimate()
end).TextColor3=c3(0.4,0,0.6)
lbl("-----------== // Misc // ==-----------")
local function swtc(txt,options,onchanged)
	local current=0
	local swtcbtn=nil
	local function btnpressed()
		current=current+1
		if current>#options then
			current=1
		end
		local option=options[current]
		swtcbtn.Text=txt..": "..option.text
		onchanged(option.value)
	end
	swtcbtn=btn("change",btnpressed)
	btnpressed()
	return swtcbtn
end

swtc("client sided placeholders",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	placeholders=v
end)

swtc("highlight fling targets",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	highlightflingtargets=v
end)

swtc("allow shiftlock",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	allowshiftlock=v
end)
swtc("click fling",{
	{value=true,text="yes"},
	{value=false,text="no"}
},function(v)
	clickfling=v
end)

local disguiscripts=nil
swtc("new gui scripts",{
	{value=true,text="disable"},
	{value=false,text="keep"}
},function(v)
	disguiscripts=v
end)
pg.DescendantAdded:Connect(function(v)
	if c and disguiscripts and v:IsA("Script") then --mind Enum.RunContext.Client
		v.Disabled=true 
	end
end)

swtc("new character scripts",{
	{value=function(v)
		if v:IsA("Script") then --mind Enum.RunContext.Client
			v.Disabled=true
		end
	end,text="disable"},
	{value=false,text="keep"}
},function(v)
	discharscripts=v
end)
local iscg,_=pcall(function()
	i9.Parent=game:FindFirstChildOfClass("CoreGui")
end)
if not iscg then
	i6.Text="Shade Hub Reborn"
	i9.Parent=pg
	twait(0.01)
end
warn[[

[ // Shade Hub Reborn Information // ]

// --------------------------- //

[ // CREDITS // ]

[ // ANIMATORS // ]
 Chip, Maximilito. 

[ // CODERS // ]
 MyWorld, Chip, RQZ
 
// --------------------------- //

[ // HUB INFO // ]
You are Currently Running V1.09
Last Updated 1/24/2024
Current Status: Unpatched
Discord Server: https://discord.gg/FFfrwxFm8C

// --------------------------- //

[ // END OF INFORMATION // ]
]]
