require "AI_sakray\\USER_AI\\Const"
-----------------------------
-- User defined configurations
-----------------------------
HOMUNCULUS_STATE = 0 --Passive state, ignore everything only FOLLOW_ST
UseSeraPainkiller = 1 --1 = yes, always spam when IDLE_ST
AutoBuff = true
AutoBuffTimer = 20*1000 --Every 20 seconds
AutoHeal = true
AutoHealThreshold = 95 --%

-----------------------------
-- Operative variables
-----------------------------
LastAutoBuffTick = 0 --ms
LastAutoHealTick = 0 --ms
--autoBuffCD = 0 --ms
--autoHealCD = 0 --ms
FollowTryCount = 0 --tries
FollowTryLimit = 3 --tries then change to idle


HOMS = {} --Homunculus configurations
--HOMS[id][1] = Minimum distance (squares/grids)
HOMS[SERA]={1}
HOMS[EIRA]={3}
