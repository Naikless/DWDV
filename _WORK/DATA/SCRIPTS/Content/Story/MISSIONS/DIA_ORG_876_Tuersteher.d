
instance DIA_Org_876_EXIT(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 999;
	condition = DIA_Org_876_EXIT_Condition;
	information = DIA_Org_876_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Org_876_EXIT_Condition()
{
	return 1;
};

func void DIA_Org_876_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Org_876_AmSfb(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_AmSfb_Condition;
	information = DIA_Org_876_AmSfb_Info;
	permanent = 1;
	description = "Ich bin Sch�rfer! Und ich habe Durst!";
};


func int DIA_Org_876_AmSfb_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return TRUE;
	};
};

func void DIA_Org_876_AmSfb_Info()
{
	var C_Item myarmor;
	AI_Output(other,self,"DIA_Org_876_AmSfb_15_00");	//Ich bin Sch�rfer! Und ich habe Durst!
	myarmor = Npc_GetEquippedArmor(hero);
	if(Hlp_IsItem(myarmor,sfb_armor_l))
	{
		AI_Output(self,other,"DIA_Org_876_AmSfb_06_01");	//Du siehst auch aus wie einer von den Dreckfressern.  Immer rein mit dir.
		self.aivar[AIV_PASSGATE] = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_AmSfb_NOSFB_06_00");	//Du siehst nicht aus wie ein Sch�rfer. So kommst du hier nicht rein, Junge.
	};
};


instance DIA_Org_876_Bribe(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_Bribe_Condition;
	information = DIA_Org_876_Bribe_Info;
	permanent = 1;
	description = "Was h�ltst du von etwas Erz als Eintrittsgeld?";
};


func int DIA_Org_876_Bribe_Condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_Org_876_Bribe_Info()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_15_00");	//Was h�ltst du von etwas Erz als Eintrittsgeld?
	if((Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD))
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_07_01");	//�berhaupt nichts. Vor allem nicht wenn das Erz von einem der Dreckskerle aus dem Alten Lager kommt.
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_06_01");	//Wie viel Erz ist denn 'etwas Erz'?
		Info_ClearChoices(DIA_Org_876_Bribe);
		Info_AddChoice(DIA_Org_876_Bribe,"Hundert Erzbrocken sollten reichen.",DIA_Org_876_Bribe_100Erz);
		Info_AddChoice(DIA_Org_876_Bribe,"Was denkst du �ber 50 Erz?",DIA_Org_876_Bribe_50Erz);
		Info_AddChoice(DIA_Org_876_Bribe,"Ich habe 10 Erz - hier.",DIA_Org_876_Bribe_10Erz);
	};
};

func void DIA_Org_876_Bribe_10Erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_10Erz_15_00");	//Ich habe 10 Erz - hier.
	if(Npc_HasItems(other,ItMiNugget) >= 10)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_01");	//10 Erz?  Daf�r werde ich dir erlauben, es noch mal zu versuchen.
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_10Erz_06_02");	//Wo? Ich sehe keine 10 Erz.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Org_876_Bribe_50Erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_50Erz_15_00");	//Was denkst du �ber 50 Erz?
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_01");	//Das ist ziemlich genau die H�lfte von dem, was ich als 'etwas Erz' bezeichnen w�rde.
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_50Erz_06_02");	//Wo? Ich sehe keine 50 Erz.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Org_876_Bribe_100Erz()
{
	AI_Output(other,self,"DIA_Org_876_Bribe_100Erz_15_00");	//Hundert Erzbrocken sollten reichen.
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_01");	//Ein wahres Wort - du kannst reingehen.
		self.aivar[AIV_PASSGATE] = TRUE;
		B_GiveInvItems(other,self,ItMiNugget,100);
		Info_ClearChoices(DIA_Org_876_Bribe);
	}
	else
	{
		AI_Output(self,other,"DIA_Org_876_Bribe_100Erz_06_02");	//Das stimmt. Aber so viel sehe ich bei dir nicht.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Org_876_PERM(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_PERM_Condition;
	information = DIA_Org_876_PERM_Info;
	permanent = 1;
	description = "Wie l�uft das Schnapsgesch�ft?";
};


func int DIA_Org_876_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) || (Npc_GetAttitude(self,hero) == ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_Org_876_PERM_Info()
{
	AI_Output(other,self,"DIA_Org_876_PERM_15_00");	//Wie l�uft das Schnapsgesch�ft?
	AI_Output(self,other,"DIA_Org_876_PERM_06_01");	//Geh rein und frag Silas. WIR k�nnen uns nicht beklagen.
};


instance DIA_Org_876_ScSld(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_ScSld_Condition;
	information = DIA_Org_876_ScSld_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Org_876_ScSld_Condition()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF))
	{
		return 1;
	};
};

func void DIA_Org_876_ScSld_Info()
{
	AI_Output(self,other,"DIA_Org_876_ScSld_06_00");	//Halt! Du kennst die Regeln. Nur Sch�rfer und Banditen!
	AI_Output(other,self,"DIA_Org_876_ScSld_15_01");	//Willst du mich aufhalten?
	AI_Output(self,other,"DIA_Org_876_ScSld_06_02");	//Nein ... Geh nur ...
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_Org_876_ScSekte(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_ScSekte_Condition;
	information = DIA_Org_876_ScSekte_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Org_876_ScSekte_Condition()
{
	if((other.guild == GIL_NOV) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		return 1;
	};
};

func void DIA_Org_876_ScSekte_Info()
{
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_00");	//Eigentlich lassen wir ja nur unsere Jungs hier rein, aber gegen die Bruderschaft kann man wirklich nichts einwenden.
	AI_Output(self,other,"DIA_Org_876_ScSekte_06_01");	//Vor allem nicht, wenn die Leute was zu rauchen dabei haben.
};


var int Org_876_GotJoint;

instance DIA_Org_876_GibKraut(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = DIA_Org_876_GibKraut_Condition;
	information = DIA_Org_876_GibKraut_Info;
	permanent = 1;
	description = "Ich habe ein paar Krautstengel bei mir - hier, nimm einen.";
};


func int DIA_Org_876_GibKraut_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Org_876_ScSekte))
	{
		return 1;
	};
};

func void DIA_Org_876_GibKraut_Info()
{
	AI_Output(other,self,"DIA_Org_876_GibKraut_15_00");	//Ich habe ein paar Krautstengel bei mir - hier, nimm einen.
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"DIA_Org_876_GibKraut_06_01");	//Du bist hier immer herzlich willkommen, Mann.
		self.aivar[AIV_PASSGATE] = TRUE;
		Org_876_GotJoint = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Org_876_GibKraut_KEIN_15_00");	//�h ... Warte mal. Hab' doch nichts. 
		AI_Output(self,other,"DIA_Org_876_GibKraut_KEIN_06_00");	//Na toll. Denk beim n�chsten Mal an mich.
		self.aivar[AIV_PASSGATE] = TRUE;
	};
};


const string Org_876_CHECKPOINT = "NC_TAVERN_BAR";

instance Info_Org_876_FirstWarn(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 2;
	condition = Info_Org_876_FirstWarn_Condition;
	information = Info_Org_876_FirstWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_876_FirstWarn_Condition()
{
	if(((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)) || ((other.guild == GIL_STT) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))) || ((other.guild == GIL_GRD) && ((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_BEGIN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))))
	{
		return TRUE;
	};
};

func void Info_Org_876_FirstWarn_Info()
{
	PrintGlobals(PD_MISSION);
	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_00");	//Wo willst DU denn hin?
	AI_Output(hero,self,"Info_Org_876_FirstWarn_Info_15_01");	//Na, da rein.
	AI_Output(self,hero,"Info_Org_876_FirstWarn_Info_06_02");	//Vergiss es! Silas will in seiner Kneipe nur Sch�rfer und Banditen sehen .
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_FIRSTWARN;
};


instance Info_Org_876_LastWarn(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = Info_Org_876_LastWarn_Condition;
	information = Info_Org_876_LastWarn_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_876_LastWarn_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (Npc_GetDistToWP(hero,Org_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Org_876_LastWarn_Info()
{
	AI_Output(self,hero,"Info_Org_876_LastWarn_06_00");	//Du h�rst wohl schlecht, B�rschchen!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,Org_876_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_LASTWARN;
	AI_StopProcessInfos(self);
};


instance Info_Org_876_Attack(C_Info)
{
	npc = ORG_876_Tuersteher;
	nr = 1;
	condition = Info_Org_876_Attack_Condition;
	information = Info_Org_876_Attack_Info;
	permanent = 1;
	important = 1;
};


func int Info_Org_876_Attack_Condition()
{
	if((hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN) && (Npc_GetAttitude(self,hero) != ATT_FRIENDLY) && (self.aivar[AIV_PASSGATE] == FALSE) && (Npc_GetDistToWP(hero,Org_876_CHECKPOINT) < (hero.aivar[AIV_LASTDISTTOWP] - 100)) && Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))
	{
		return TRUE;
	};
};

func void Info_Org_876_Attack_Info()
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

