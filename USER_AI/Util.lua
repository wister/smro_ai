
require "AI_sakray\\USER_AI\\Const"

--------------------------------------------
-- List utility
--------------------------------------------
List = {}

function List.new ()
	return { first = 0, last = -1}
end

function List.pushleft (list, value)
	local first = list.first-1
	list.first  = first
	list[first] = value
end

function List.pushright (list, value)
	local last = list.last + 1
	list.last = last
	list[last] = value
end

function List.popleft (list)
	local first = list.first
	if first > list.last then 
		return nil
	end
	local value = list[first]
	list[first] = nil         -- to allow garbage collection
	list.first = first+1
	return value
end

function List.popright (list)
	local last = list.last
	if list.first > last then
		return nil
	end
	local value = list[last]
	list[last] = nil
	list.last = last-1
	return value 
end

function List.clear (list)
	for i,v in ipairs(list) do
		list[i] = nil
	end
--[[
	if List.size(list) == 0 then
		return
	end
	local first = list.first
	local last  = list.last
	for i=first, last do
		list[i] = nil
	end
--]]
	list.first = 0
	list.last = -1
end

function List.size (list)
	local size = list.last - list.first + 1
	return size
end

-------------------------------------------------







function	GetDistance (x1,y1,x2,y2)
	return math.floor(math.sqrt((x1-x2)^2+(y1-y2)^2))
end




function	GetDistance2 (id1, id2)
	local x1, y1 = GetV (V_POSITION,id1)
	local x2, y2 = GetV (V_POSITION,id2)
	if (x1 == -1 or x2 == -1) then
		return -1
	end
	return GetDistance (x1,y1,x2,y2)
end




function	GetOwnerPosition (id)
	return GetV (V_POSITION,GetV(V_OWNER,id))
end





function	GetDistanceFromOwner (id)
	local x1, y1 = GetOwnerPosition (id)
	local x2, y2 = GetV (V_POSITION,id)
	if (x1 == -1 or x2 == -1) then
		return -1
	end
	return GetDistance (x1,y1,x2,y2)
end




function	IsOutOfSight (id1,id2)
	local x1,y1 = GetV (V_POSITION,id1)
	local x2,y2 = GetV (V_POSITION,id2)
	if (x1 == -1 or x2 == -1) then
		return true
	end
	local d = GetDistance (x1,y1,x2,y2)
	if d > 20 then
		return true
	else
		return false
	end
end





function	IsInAttackSight (id1,id2)
	local x1,y1 = GetV (V_POSITION,id1)
	local x2,y2 = GetV (V_POSITION,id2)
	if (x1 == -1 or x2 == -1) then
		return false
	end
	local d		= GetDistance (x1,y1,x2,y2)
	local a     = 0
	if (MySkill == 0) then
		a     = GetV (V_ATTACKRANGE,id1)
	else
		a     = GetV (V_SKILLATTACKRANGE_LEVEL, id1, MySkill, MySkillLevel)
	end

	if a >= d then
		return true
	else
		return false
	end
end


function HPPercent(id)
	local maxHP=GetV(V_MAXHP,id)
	local curHP=GetV(V_HP,id)
	percHP=100*curHP/maxHP
	return percHP
end


function canAutoBuff (tick)
	--SkillInfo[id][1] = CD for recast and logic gate (ms)
	--SkillInfo[id][2] = level (integer)
	--SkillInfo[id][3] = skill id (integer)
	--SkillInfo[id][4] = range (squares)
	local distance = GetDistanceFromOwner(MyID)
	TraceAI ("Casting AutoBuff in: "..(tick - LastAutoBuffTick - MyAutoBuff[1]))
	if((tick > (LastAutoBuffTick + AutoBuffTimer) or LastAutoBuffTick == 0) and tick > (LastAutoBuffTick + MyAutoBuff[1]) and distance <= MyAutoBuff[4]) then 
		return true
	end
	--else
		--return false
	--end
end


function canAutoHeal (tick)
	local homun_hp = HPPercent(MyID)
	local owner_hp=HPPercent(GetV(V_OWNER,MyID))
	local distance = GetDistanceFromOwner(MyID)
	if((owner_hp < AutoHealThreshold or homun_hp < AutoHealThreshold) and OldHomunType == VANILMIRTH and (tick > (LastAutoHealTick + SkillInfo[HVAN_CHAOTIC][1]) or LastAutoHealTick == 0) and distance <= SkillInfo[HVAN_CHAOTIC][2]) then --vanilmirth heal hard coded for now
		return true
	end
	--else
		--return false
	--end
end

function getAutoBuff (homType)
	if (GetV(V_HOMUNTYPE,MyID) == SERA) then
		return SkillInfo[MH_PAIN_KILLER]
	elseif (GetV(V_HOMUNTYPE,MyID) == EIRA) then
		return SkillInfo[MH_OVERBOOST]
	else

	end
end

function saveAutoBuffTick(tick)
	local autoBuffFile = io.open("./AI_sakray/USER_AI/cache/AutoBuffTick_"..MyID..".txt","w")
	autoBuffFile:write(tick)
	autoBuffFile:close()
end

function loadAutoBuffTick()
	--[[
		Loads AutoBuffTick_118827619.txt(example) if it exists
	]]--
	if (io.open("./AI_sakray/USER_AI/cache/AutoBuffTick_"..MyID..".txt","r") ~= nil) then
		local autoBuffFile = io.open("./AI_sakray/USER_AI/cache/AutoBuffTick_"..MyID..".txt","r")
		local lastTick = autoBuffFile:read("*a")
		autoBuffFile:close()
		return lastTick
	else
		return 0
	end
end

function BetterMoveToOwner(myid,range)
	TraceAI("Better moving to owner")
	if (range==nil) then
		range=1
	end
	local x,y = GetV(V_POSITION,myid)
	local ox,oy = GetV(V_POSITION,GetV(V_OWNER,myid))
	local destx,desty=0,0
	if (x > ox+range) then
		destx=ox+range
	elseif (x < ox - range) then
		destx=ox-range
	else
		destx=x
	end
	if (y > oy+range) then
		desty=oy+range
	elseif (y < oy - range) then
		desty=oy-range
	else
		desty=y
	end
	MyDestX,MyDestY=destx,desty
	Move(myid,MyDestX,MyDestY)
	return
end


function shuffle(t)
	local tbl = {}
	for i = 1, #t do
	  tbl[i] = t[i]
	end
	for i = #tbl, 2, -1 do
	  local j = math.random(i)
	  tbl[i], tbl[j] = tbl[j], tbl[i]
	end
	return tbl
  end

function tablefind(tab,el)
	for index, value in pairs(tab) do
		if value == el then
			return index
		end
	end
end
	