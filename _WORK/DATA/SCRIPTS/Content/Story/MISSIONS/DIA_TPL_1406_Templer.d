
instance DIA_KalomsGuard_Exit(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 999;
	condition = DIA_KalomsGuard_Exit_Condition;
	information = DIA_KalomsGuard_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_KalomsGuard_Exit_Condition()
{
	return 1;
};

func void DIA_KalomsGuard_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KalomsGuard_PERM(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = DIA_KalomsGuard_PERM_Condition;
	information = DIA_KalomsGuard_PERM_Info;
	permanent = 1;
	description = "Du hast doch nichts dagegen, wenn ich da reingehe?";
};


func int DIA_KalomsGuard_PERM_Condition()
{
	if((TPL_1406_Templer.aivar[AIV_PASSGATE] == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_KalomsGuard_PERM_Info()
{
	AI_Output(other,self,"DIA_KalomsGuard_PERM_15_00");	//Du hast doch nichts dagegen, wenn ich da reingehe?
	AI_Output(self,other,"DIA_KalomsGuard_PERM_13_01");	//Wenn du meinem Meister keinen Respekt entgegen bringst, werde ich dich töten.
	AI_StopProcessInfos(self);
};


instance DIA_KALOMSGUARD_HOUSE(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = dia_kalomsguard_house_condition;
	information = dia_kalomsguard_house_info;
	permanent = 0;
	description = "Was machst du denn hier?";
};


func int dia_kalomsguard_house_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GUR) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_kalomsguard_house_info()
{
	AI_Output(other,self,"DIA_KalomsGuard_HOUSE_15_00");	//Was machst du denn hier?
	AI_Output(self,other,"DIA_KalomsGuard_HOUSE_13_01");	//Bevor mein Meister fort ging, gab er mir den Befehl über sein Haus zu wachen.
	AI_Output(self,other,"DIA_KalomsGuard_HOUSE_13_02");	//Ich soll aufpassen das niemand an seine Truhe geht. Das wird auch niemand, weil ich der Einzige bin der den Schlüssel hat.
	CreateInvItem(self,itkey_kalom_gur_01);
};


instance DIA_KALOMSGUARD_TRUHE(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = dia_kalomsguard_truhe_condition;
	information = dia_kalomsguard_truhe_info;
	permanent = 0;
	description = "Was ist so besonders an seiner Truhe?";
};


func int dia_kalomsguard_truhe_condition()
{
	if(Npc_KnowsInfo(hero,dia_kalomsguard_house))
	{
		return TRUE;
	};
};

func void dia_kalomsguard_truhe_info()
{
	AI_Output(other,self,"DIA_KalomsGuard_TRUHE_15_00");	//Was ist so besonders an seiner Truhe?
	AI_Output(self,other,"DIA_KalomsGuard_TRUHE_13_01");	//Dort befinden sich die persönlichen Sachen meines Meisters, Cor Kalom.
	AI_Output(self,other,"DIA_KalomsGuard_TRUHE_13_02");	//Mehr brauchst du nicht zu wissen.
	AI_StopProcessInfos(self);
};


const string TPL_1406_CHECKPOINT = "PSI_LABOR_IN";

instance INFO_TPL_1406_FIRSTWARN(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_firstwarn_condition;
	information = info_tpl_1406_firstwarn_info;
	permanent = 1;
	important = 1;
};


var int guard_psi;

func int info_tpl_1406_firstwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_tpl_1406_firstwarn_info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_13_01");	//HALT! Niemand darf meinen Meister bei seinen Experimenten stören!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	KALOMS_GUARD = LOG_RUNNING;
	if(GUARD_PSI == FALSE)
	{
		Log_CreateTopic(CH1_KALOMSGUARD,LOG_MISSION);
		B_LogEntry(CH1_KALOMSGUARD,"Am Eingang zu Cor Kaloms Labor hielt mich seine Leibwache auf. Ich werde einen Weg finden müssen, wie ich an ihm vorbei und zu Kalom komme.");
		Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_RUNNING);
		GUARD_PSI = TRUE;
	};
	if(Npc_HasItems(hero,ItAt_Crawler_01))
	{
		Info_ClearChoices(info_tpl_1406_firstwarn);
		Info_AddChoice(info_tpl_1406_firstwarn,"Ich habe Crawlerzangen für Cor Kalom.",info_tpl_1406_firstwarn_condition_crawler);
	}
	else if(NAMIB_GOTOCALOM == TRUE)
	{
		Info_AddChoice(info_tpl_1406_firstwarn,"Baal Namib gab mir die Erlaubnis Cor Kalom aufzusuchen.",info_tpl_1406_firstwarn_condition_namib);
	}
	else if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		Info_AddChoice(info_tpl_1406_firstwarn,"Ich bringe Cor Kalom die Sumpfkrauternte.",info_tpl_1406_firstwarn_condition_weed);
	}
	else if(!Npc_HasItems(hero,ItAt_Crawler_01) || (NAMIB_GOTOCALOM != TRUE) || (BaalOrun_FetchWeed != LOG_RUNNING))
	{
		AI_StopProcessInfos(self);
	};
};

func void info_tpl_1406_firstwarn_condition_crawler()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_CRAWLER_15_01");	//Ich habe Crawlerzangen für Cor Kalom.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_CRAWLER_13_02");	//Gut, du darfst ihm die Crawlerzangen bringen.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	KALOMS_GUARD = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Ich habe einige Crawlerzangen für Cor Kalom mitgebracht. Daraufhin lies mich die Wache zu Cor Kalom.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1406_firstwarn_condition_namib()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_NAMIB_15_01");	//Baal Namib gab mir die Erlaubnis Cor Kalom aufzusuchen.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_NAMIB_13_02");	//Wenn Baal Namib dir die Erlaubnis gegeben hat, darfst du zu Cor Kalom.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	KALOMS_GUARD = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Dank der Erlaubnis von Baal Namib, lies mich Cor Kaloms Leibwache passieren.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void info_tpl_1406_firstwarn_condition_weed()
{
	AI_Output(hero,self,"Info_Tpl_1406_FirstWarn_Condition_WEED_15_01");	//Ich bringe Cor Kalom die Sumpfkrauternte.
	AI_Output(self,hero,"Info_Tpl_1406_FirstWarn_Condition_WEED_13_02");	//In Ordnung, du darfst rein.
	Info_ClearChoices(info_tpl_1406_firstwarn);
	AI_StopProcessInfos(self);
	KALOMS_GUARD = LOG_SUCCESS;
	B_LogEntry(CH1_KALOMSGUARD,"Nachdem Baal Orun mir den Auftrag gab, die Sumpfkrauternte zu Cor Kalom zu bringen, lies mich seine Leibwache passieren.");
	Log_SetTopicStatus(CH1_KALOMSGUARD,LOG_SUCCESS);
	B_GiveXP(XP_KALOMSGUARD);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance INFO_TPL_1406_LASTWARN(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_lastwarn_condition;
	information = info_tpl_1406_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_tpl_1406_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 75)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_tpl_1406_lastwarn_info()
{
	AI_Output(self,hero,"Info_Tpl_1406_LastWarn_13_01");	//Dein nächster Schritt wird dein Letzter sein.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,TPL_1441_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_TPL_1406_ATTACK(C_Info)
{
	npc = TPL_1406_Templer;
	nr = 1;
	condition = info_tpl_1406_attack_condition;
	information = info_tpl_1406_attack_info;
	permanent = 1;
	important = 1;
};


func int info_tpl_1406_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,TPL_1406_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 75)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func int info_tpl_1406_attack_info()
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

