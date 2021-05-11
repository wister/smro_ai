

--  c function

--[[
function	TraceAI (string) end
function	MoveToOwner (id) end
function 	Move (id,x,y) end
function	Attack (id,id) end
function 	GetV (V_,id) end
function	GetActors () end
function	GetTick () end
function	GetMsg (id) end
function	GetResMsg (id) end
function	SkillObject (id,level,skill,target) end
function	SkillGround (id,level,skill,x,y) end
function	IsMonster (id) end								-- id�� �����ΰ�? yes -> 1 no -> 0

--]]





-------------------------------------------------
-- constants
-------------------------------------------------


--------------------------------
V_OWNER				=	0		-- ������ ID			
V_POSITION			=	1		-- ��ü�� ��ġ 
V_TYPE				=	2		-- �̱��� 
V_MOTION			=	3		-- ���� 
V_ATTACKRANGE		=	4		-- ���� ���� ���� 
V_TARGET			=   5		-- ����, ��ų ��� ��ǥ�� ID 
V_SKILLATTACKRANGE	=	6		-- ��ų ��� ���� 
V_HOMUNTYPE			=   7		-- ȣ��Ŭ�罺 ����
V_HP				=	8		-- HP (ȣ��Ŭ�罺�� ���ο��Ը� ����)
V_SP				=	9		-- SP (ȣ��Ŭ�罺�� ���ο��Ը� ����)
V_MAXHP				=   10		-- �ִ� HP (ȣ��Ŭ�罺�� ���ο��Ը� ����)
V_MAXSP				=   11		-- �ִ� SP (ȣ��Ŭ�罺�� ���ο��Ը� ����)
V_MERTYPE		  =		12    -- �뺴 ����	
V_POSITION_APPLY_SKILLATTACKRANGE = 13	-- SkillAttackange�� ������ ��ġ
V_SKILLATTACKRANGE_LEVEL = 14	-- ���� �� SkillAttackange
---------------------------------	





--------------------------------------------
-- ȣ��Ŭ�罺 ���� 
--------------------------------------------

LIF				= 1
AMISTR			= 2
FILIR			= 3
VANILMIRTH		= 4
LIF2			= 5
AMISTR2			= 6
FILIR2			= 7
VANILMIRTH2		= 8
LIF_H			= 9
AMISTR_H		= 10
FILIR_H			= 11
VANILMIRTH_H	= 12
LIF_H2			= 13
AMISTR_H2		= 14
FILIR_H2		= 15
VANILMIRTH_H2	= 16

EIRA			= 48
BAYERI			= 49
SERA			= 50
DIETER			= 51
ELEANOR			= 52

--------------------------------------------



--------------------------------------------
-- �뺴 ���� 
--------------------------------------------
ARCHER01	= 1		
ARCHER02	= 2			
ARCHER03	= 3	
ARCHER04	= 4
ARCHER05	= 5
ARCHER06	= 6
ARCHER07	= 7
ARCHER08	= 8
ARCHER09	= 9
ARCHER10	= 10
LANCER01	= 11
LANCER02	= 12
LANCER03	= 13
LANCER04	= 14
LANCER05	= 15
LANCER06	= 16
LANCER07	= 17
LANCER08	= 18
LANCER09	= 19
LANCER10	= 20
SWORDMAN01	= 21		
SWORDMAN02	= 22	
SWORDMAN03	= 23
SWORDMAN04	= 24
SWORDMAN05	= 25
SWORDMAN06	= 26
SWORDMAN07	= 27
SWORDMAN08	= 28
SWORDMAN09	= 29
SWORDMAN10	= 30
--------------------------------------------



--------------------------
MOTION_STAND	= 0
MOTION_MOVE		= 1
MOTION_ATTACK	= 2
MOTION_DEAD     = 3
MOTION_ATTACK2	= 9 
--------------------------




--------------------------
-- command  
--------------------------
NONE_CMD			= 0
MOVE_CMD			= 1
STOP_CMD			= 2
ATTACK_OBJECT_CMD	= 3
ATTACK_AREA_CMD		= 4
PATROL_CMD			= 5
HOLD_CMD			= 6
SKILL_OBJECT_CMD	= 7
SKILL_AREA_CMD		= 8
FOLLOW_CMD			= 9
--------------------------


-- Homunculus Skills
HLIF_HEAL		= 8001
HLIF_AVOID		= 8002
HLIF_CHANGE		= 8004
HAMI_CASTLE		= 8005
HAMI_DEFENCE	= 8006
HAMI_BLOODLUST	= 8008
HFLI_MOON		= 8009
HFLI_FLEET		= 8010
HFLI_SPEED		= 8011
HFLI_SBR44		= 8012
HVAN_CAPRICE		= 8013
HVAN_CHAOTIC		= 8014
HVAN_SELFDESTRUCT	= 8016

--Homun S Skills
MUTATION_BASEJOB 	= 8017
MH_SUMMON_LEGION 	= 8018
MH_NEEDLE_OF_PARALYZE 	= 8019
MH_POISON_MIST 		= 8020
MH_PAIN_KILLER 		= 8021
MH_LIGHT_OF_REGENE 	= 8022
MH_OVERBOOST		= 8023
MH_ERASER_CUTTER 	= 8024
MH_XENO_SLASHER 	= 8025
MH_SILENT_BREEZE 	= 8026
MH_STYLE_CHANGE 	= 8027
MH_SONIC_CRAW 		= 8028
MH_SONIC_CLAW 		= 8028
MH_SILVERVEIN_RUSH 	= 8029
MH_MIDNIGHT_FRENZY 	= 8030
MH_STAHL_HORN 		= 8031
MH_GOLDENE_FERSE 	= 8032
MH_STEINWAND		= 8033
MH_HEILIGE_STANGE 	= 8034
MH_ANGRIFFS_MODUS 	= 8035
MH_TINDER_BREAKER 	= 8036
MH_CBC 				= 8037
MH_EQC 				= 8038
MH_MAGMA_FLOW 		= 8039
MH_GRANITIC_ARMOR 	= 8040
MH_LAVA_SLIDE 		= 8041
MH_PYROCLASTIC 		= 8042
MH_VOLCANIC_ASH 	= 8043

--Skills CD for AI
SkillInfo = {}
--SkillInfo[id][1] = CD for recast and logic gate (ms)
--SkillInfo[id][2] = level (integer)
--SkillInfo[id][3] = skill id (integer)
--SkillInfo[id][4] = range (squares)
SkillInfo[HVAN_CHAOTIC] = {2000, 5, HVAN_CHAOTIC, 10}
SkillInfo[MH_OVERBOOST] = {90000, 5, MH_OVERBOOST, 10}
SkillInfo[MH_PAIN_KILLER] = {60000, 10, MH_PAIN_KILLER, 5}