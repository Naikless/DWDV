
instance DIA_Grd_215_Torwache_Exit(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 999;
	condition = DIA_Grd_215_Torwache_Exit_Condition;
	information = DIA_Grd_215_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grd_215_Torwache_PERM(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = DIA_Grd_215_Torwache_PERM_Condition;
	information = DIA_Grd_215_Torwache_PERM_Info;
	permanent = 1;
	description = "Irgendwas Neues passiert?";
};


func int DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

func void DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_PERM_15_00");	//Irgendwas Neues passiert?
	AI_Output(self,other,"DIA_Grd_215_Torwache_PERM_06_01");	//Nein. Alles wie immer.
};


const string GRD_215_CHECKPOINT = "OCR_MAINGATE_OUTSIDE";

instance DIA_Grd_215_Torwache_First(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 2;
	condition = DIA_Grd_215_Torwache_First_Condition;
	information = DIA_Grd_215_Torwache_First_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Grd_215_Torwache_First_Condition()
{
	if(((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)) || ((other.guild == GIL_STT) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) || ((other.guild == GIL_GRD) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) || ((other.guild == GIL_EBR) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))))
	{
		return TRUE;
	};
};

func void DIA_Grd_215_Torwache_First_Info()
{
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_00");	//Wo soll's denn hingehen?
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_15_01");	//Ich will ins Lager.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_06_02");	//Du bist doch nicht hergekommen, um Ärger zu machen, oder?
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Klar, ich hatte mir vorgenommen, das ganze Lager auseinanderzunehmen!",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Ich will mich nur ein bißchen umsehen.",DIA_Grd_215_Torwache_First_JustLooking);
	if(Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Diego hat gesagt, ich soll ihn im Lager treffen.",DIA_Grd_215_Torwache_First_Diego);
	};
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Cronos_Messenger == LOG_RUNNING))
	{
		Info_AddChoice(DIA_Grd_215_Torwache_First,"Ich bin ein Bote der Wassermagier.",dia_grd_215_torwache_first_bandit);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Trouble_15_00");	//Klar, ich hatte mir vorgenommen, das ganze Lager auseinander zu nehmen!
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Trouble_06_01");	//Ein witziger Kerl ... Ich mag keine witzigen Kerle.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_JustLooking_15_00");	//Ich will mich nur ein bisschen umsehen.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_JustLooking_06_01");	//Umsehen kostet 10 Erz.
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Vergiß es.",DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice(DIA_Grd_215_Torwache_First,"Gut, hier sind deine 10 Erz.",DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Diego_15_00");	//Diego hat gesagt, ich soll ihn im Lager treffen.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Diego_06_01");	//Gut - du kannst reingehen.
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_NoPay_15_00");	//Vergiss es.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_NoPay_06_01");	//Dann zisch ab.
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_215_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_15_00");	//Gut, hier sind deine 10 Erz.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_06_01");	//Dann mal immer rein mit dir.
		B_GiveInvItems(other,self,ItMiNugget,10);
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00");	//So viel hab' ich nicht.
		AI_Output(self,other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01");	//Diesmal mach' ich noch 'ne Ausnahme - weil du neu bist .
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};

func void dia_grd_215_torwache_first_bandit()
{
	AI_Output(other,self,"DIA_Grd_215_Torwache_First_Bandit_15_00");	//Ich bin ein Bote der Wassermagier.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_01");	//Wenn das so ist. Du kannst rein.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_02");	//Aber pass auf was du tust.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_03");	//Mit Banditen geh'n wir nicht gerade freundlich um, wenn sie sich daneben benehmen.
	AI_Output(self,other,"DIA_Grd_215_Torwache_First_Bandit_06_04");	//Und jetzt verschwinde.
	self.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(DIA_Grd_215_Torwache_First);
	AI_StopProcessInfos(self);
};


instance INFO_GRD_215_LASTWARN(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = info_grd_215_lastwarn_condition;
	information = info_grd_215_lastwarn_info;
	permanent = 1;
	important = 1;
};


func int info_grd_215_lastwarn_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,GRD_215_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_215_lastwarn_info()
{
	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00");	//Du hörst wohl schlecht, Bürschchen!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,GRD_215_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance INFO_GRD_215_ATTACK(C_Info)
{
	npc = GRD_215_Torwache;
	nr = 1;
	condition = info_grd_215_attack_condition;
	information = info_grd_215_attack_info;
	permanent = 1;
	important = 1;
};


func int info_grd_215_attack_condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,GRD_215_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void info_grd_215_attack_info()
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

