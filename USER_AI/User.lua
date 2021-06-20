-----------------------------
-- Debugging
-- /traceai, file TraceAI.txt in RO root folder
-- /hoai, to start homunculus AI
-- Main files used: User.lua, Const.lua, Util.lua
-- cache folder its to save ticks, depending on the HomunculusID which resets
--
-----------------------------
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
HOMS[SERA]={3}
HOMS[EIRA]={3}
HOMS[BAYERI]={3}
HOMS[DIETER]={3}
HOMS[ELEANOR]={3}
HOMS[LIF]={3}
HOMS[AMISTR]={3}
HOMS[FILIR]={3}
HOMS[VANILMIRTH]={3}
HOMS[LIF2]={3}
HOMS[AMISTR2]={3}
HOMS[FILIR2]={3}
HOMS[VANILMIRTH2]={3}
HOMS[LIF_H]={3}
HOMS[AMISTR_H]={3}
HOMS[LIF_H2]={3}
HOMS[AMISTR_H2]={3}
HOMS[FILIR_H2]={3}
HOMS[VANILMIRTH_H2]={3}