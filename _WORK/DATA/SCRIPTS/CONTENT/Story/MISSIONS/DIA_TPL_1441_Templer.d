
const string TPL_1441_CHECKPOINT = "PSI_TEMPLE_IN";

instance Info_TPL_1441_FirstWarn(C_Info)
{
	npc = TPL_1441_Templer;
	nr = 1;
	condition = Info_TPL_1441_FirstWarn_Condition;
	information = Info_TPL_1441_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_TPL_1441_FirstWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_TPL_1441_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_13_01");	//HALT! Betreten des Tempelberges nur mit Erlaubnis eines Gurus!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	if(Npc_KnowsInfo(hero,PC_Psionic_BROTHERHOOD_TODO))
	{
		Info_ClearChoices(Info_TPL_1441_FirstWarn);
		Info_AddChoice(Info_TPL_1441_FirstWarn,"Y'Berion h�chstpers�nlich hat mir die Erlaubnis gegeben.",Info_TPL_1441_FirstWarn_Condition_YBERION);
		if(Npc_GetTrueGuild(hero) != GIL_NOV)
		{
			Info_AddChoice(Info_TPL_1441_FirstWarn,"Der Novize Lester schickt mich.",Info_TPL_1441_FirstWarn_Condition_LESTER);
		};
		if(Npc_GetTrueGuild(hero) == GIL_NOV)
		{
			Info_AddChoice(Info_TPL_1441_FirstWarn,"Baal Namib schickt mich.",info_tpl_1441_firstwarn_condition_namib);
		};
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void Info_TPL_1441_FirstWarn_Condition_YBERION()
{
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_YBERION_15_01");	//Y'Berion h�chstpers�nlich hat mir die Erlaubnis gegeben
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_YBERION_13_02");	//L�gner verlieren sehr schnell ihre Zunge, also pass besser auf, was du sagst.
};

func void Info_TPL_1441_FirstWarn_Condition_LESTER()
{
	var C_Npc Templer;
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_LESTER_15_01");	//Der Novize Lester schickt mich. Ich soll Y'Berion meine Dienste anbieten.
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_LESTER_13_02");	//Lester ist vertrauensw�rdig. Ich kenne ihn. Du kannst passieren.
	Info_ClearChoices(Info_TPL_1441_FirstWarn);
	Templer = Hlp_GetNpc(TPL_1442_Templer);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
	Templer.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1441_firstwarn_condition_namib()
{
	var C_Npc Templer;
	AI_Output(hero,self,"Info_TPL_1441_FirstWarn_Condition_NAMIB_15_01");	//Baal Namib schickt mich. Y'Berion k�nnte die Hilfe eines Novizen gebrauchen.
	AI_Output(self,hero,"Info_TPL_1441_FirstWarn_Condition_NAMIB_13_02");	//Baal Namib hat uns bereits informiert. Du kannst passieren.
	Info_ClearChoices(Info_TPL_1441_FirstWarn);
	Templer = Hlp_GetNpc(TPL_1442_Templer);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
	Templer.aivar[AIV_PASSGATE] = TRUE;
};


instance Info_TPL_1441_LastWarn(C_Info)
{
	npc = TPL_1441_Templer;
	nr = 1;
	condition = Info_TPL_1441_LastWarn_Condition;
	information = Info_TPL_1441_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_TPL_1441_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_TPL_1441_LastWarn_Info()
{
	AI_Output(self,hero,"Info_TPL_1441_LastWarn_13_01");	//Noch einen Schritt weiter und du trittst deinem Sch�pfer gegen�ber!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_TPL_1441_Attack(C_Info)
{
	npc = TPL_1441_Templer;
	nr = 1;
	condition = Info_TPL_1441_Attack_Condition;
	information = Info_TPL_1441_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_TPL_1441_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int Info_TPL_1441_Attack_Info()
{
	hero.aivar[AIV_LASTDISTTOWP] = 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_PUNISH;
	B_FullStop(self);
	AI_StopProcessInfos(self);
	B_IntruderAlert(self,other);
	B_SetAttackReason(self,AIV_AR_INTRUDER);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
};

