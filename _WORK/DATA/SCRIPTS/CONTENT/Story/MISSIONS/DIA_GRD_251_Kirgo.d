
instance Info_Kirgo_Exit(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 999;
	condition = Info_Kirgo_Exit_Condition;
	information = Info_Kirgo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Kirgo_Exit_Condition()
{
	return 1;
};

func void Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Kirgo_What(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_What_Condition;
	information = Info_Kirgo_What_Info;
	permanent = 0;
	description = "Hi! Ich bin neu hier.";
};


func int Info_Kirgo_What_Condition()
{
	if(Kapitel <= 2)
	{
		return 1;
	};
};

func void Info_Kirgo_What_Info()
{
	AI_Output(other,self,"Info_Kirgo_What_15_00");	//Hi! Ich bin neu hier.
	AI_Output(self,other,"Info_Kirgo_What_05_01");	//Ein Neuer! Erz�hl mir was von drau�en! Es ist schon �ber einen Monat her, dass ich Neuigkeiten aus der Au�enwelt geh�rt hab.
	AI_Output(self,other,"Info_Kirgo_What_05_02");	//Ich bin Kirgo. Ich k�mpfe in der Arena.
};


instance Info_Kirgo_Good(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Good_Condition;
	information = Info_Kirgo_Good_Info;
	permanent = 0;
	description = "Bist du gut?";
};


func int Info_Kirgo_Good_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func void Info_Kirgo_Good_Info()
{
	AI_Output(other,self,"Info_Kirgo_Good_15_00");	//Bist du gut?
	AI_Output(self,other,"Info_Kirgo_Good_05_01");	//Im K�mpfen? Ich bin noch nicht lange dabei, aber ich habe schon einen Kampf gewonnen!
};


instance Info_Kirgo_Charge(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_Charge_Condition;
	information = Info_Kirgo_Charge_Info;
	permanent = 0;
	description = "Ich fordere dich zum Kampf in der Arena!";
};


func int Info_Kirgo_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kirgo_What) && (Kapitel <= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_Charge_Info()
{
	AI_Output(other,self,"Info_Kirgo_Charge_15_00");	//Ich fordere dich zum Kampf in der Arena!
	AI_Output(self,other,"Info_Kirgo_Charge_05_01");	//Was? Aber ich hab' gerade keine Lust zu k�mpfen. Lass uns doch lieber ein Bier zusammen trinken und erz�hl mir was von drau�en.
	Info_ClearChoices(Info_Kirgo_Charge);
	Info_AddChoice(Info_Kirgo_Charge,"Nein! Ich will gegen dich k�mpfen. Jetzt!",Info_Kirgo_Charge_NOW);
	Info_AddChoice(Info_Kirgo_Charge,"Okay, gib ein Bier r�ber!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output(other,self,"Info_Kirgo_Charge_NOW_15_00");	//Nein! Ich will gegen dich k�mpfen. Jetzt!
	AI_Output(self,other,"Info_Kirgo_Charge_NOW_05_01");	//Wie du willst ... Ich bin bereit, wenn du es bist.
	Info_ClearChoices(Info_Kirgo_Charge);
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_00");	//Okay, gib mir ein Bier r�ber!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_01");	//Hier nimm!
	AI_UseItem(hero,ItFoBeer);
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_02");	//Danke! Ich f�rchte, von drau�en kann ich nicht viel erz�hlen - sie haben mich fast zwei Monate in einem dunklen Loch gefangen gehalten, bevor sie mich hier reingeworfen haben.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_03");	//Schade ... Na, was soll's ... Hey, f�r zwei Monate Kerker siehst du aber noch ziemlich gut aus.
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_04");	//Ich werde zusehen, dass das so bleibt.
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_05");	//Warum willst du dann unbedingt gegen einen von uns antreten?
	AI_Output(other,self,"Info_Kirgo_Charge_Beer_15_06");	//Ich will Anerkennung im Lager finden!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_07");	//Bei Scatty, meinst du? Hm, er ist einer der einflussreichsten Leute hier im Au�enring ... Wenn du mich besiegst, k�nnte ihn das schon beeindrucken ...
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_08");	//Aber wenn du ihm richtig imponieren willst, m�sstest du Kharim umhauen. Ich f�rchte nur, er ist viel zu gut f�r dich!
	AI_Output(self,other,"Info_Kirgo_Charge_Beer_05_09");	//Falls du immer noch gegen mich k�mpfen willst - sag mir Bescheid! Aber ich werd' dir nicht gerne die Fresse polieren.
	CreateInvItem(self,ItFoBeer);
	B_GiveInvItems(self,hero,ItFoBeer,1);
	self.npcType = npctype_friend;
	Info_ClearChoices(Info_Kirgo_Charge);
};


var int Kirgo_Charged;

instance Info_Kirgo_ChargeREAL(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_ChargeREAL_Condition;
	information = Info_Kirgo_ChargeREAL_Info;
	permanent = 0;
	description = "Lass uns k�mpfen - Bist du bereit?";
};


func int Info_Kirgo_ChargeREAL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Kirgo_Charge) && (Kapitel >= 1))
	{
		return 1;
	};
};

func void Info_Kirgo_ChargeREAL_Info()
{
	AI_Output(other,self,"Info_Kirgo_ChargeREAL_15_00");	//Lass uns k�mpfen - Bist du bereit?
	AI_Output(self,other,"Info_Kirgo_ChargeREAL_05_01");	//Folge mir!
	AI_StopProcessInfos(self);
	Kirgo_Charged = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance Info_Kirgo_InArena(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 1;
	condition = Info_Kirgo_InArena_Condition;
	information = Info_Kirgo_InArena_Info;
	permanent = 0;
	important = 1;
};


func int Info_Kirgo_InArena_Condition()
{
	if((Kirgo_Charged == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void Info_Kirgo_InArena_Info()
{
	if(Kapitel >= 1)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_5_LetsForgetOurLittleFight");	//Den kleinen Streit vergessen wir, okay?
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};


instance INFO_KIRGO_ARENAFIGHT(C_Info)
{
	npc = GRD_251_Kirgo;
	nr = 0;
	condition = info_kirgo_arenafight_condition;
	information = info_kirgo_arenafight_info;
	important = 1;
	permanent = 1;
};


func int info_kirgo_arenafight_condition()
{
	if((KIRGO_FIGHT == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500) && ((GRD_251_Kirgo.aivar[AIV_HASDEFEATEDSC] == FALSE) || (GRD_251_Kirgo.aivar[AIV_WASDEFEATEDBYSC] == FALSE)))
	{
		return 1;
	};
};

func void info_kirgo_arenafight_info()
{
	AI_Output(self,other,"Info_Kirgo_InArena_05_00");	//So, dann wollen wir mal. M�ge der Bessere gewinnen!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

