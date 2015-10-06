
instance DIA_Harlok_Exit(C_Info)
{
	npc = NOV_1358_Harlok;
	nr = 999;
	condition = DIA_Harlok_Exit_Condition;
	information = DIA_Harlok_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Harlok_Exit_Condition()
{
	return 1;
};

func void DIA_Harlok_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Harlok_FetchHarlok(C_Info)
{
	npc = NOV_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_FetchHarlok_Condition;
	information = DIA_Harlok_FetchHarlok_Info;
	permanent = 0;
	description = "Ghorim schickt mich.";
};


func int DIA_Harlok_FetchHarlok_Condition()
{
	if(Ghorim_KickHarlok == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Harlok_FetchHarlok_Info()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_15_00");	//Ghorim schickt mich.
	AI_OutputSVM(self,other,"$AWAKE");
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_01_01");	//Was?
	Info_ClearChoices(DIA_Harlok_FetchHarlok);
	Info_AddChoice(DIA_Harlok_FetchHarlok,DIALOG_BACK,DIA_Harlok_FetchHarlok_BACK);
	Info_AddChoice(DIA_Harlok_FetchHarlok,"Schwing deinen Hintern zu den Krautstampfern, oder es gibt saures.",DIA_Harlok_FetchHarlok_OrElse);
	Info_AddChoice(DIA_Harlok_FetchHarlok,"Ich soll dich daran erinnern, dass du ihn ablösen sollst.",DIA_Harlok_FetchHarlok_Please);
};

func void DIA_Harlok_FetchHarlok_Please()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_Please_15_00");	//Ich soll dich daran erinnern, dass du ihn ablösen sollst.
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_Please_01_01");	//Das ist aber nett von dir. Erinnere mich doch noch mal, wenn ich ausgeschlafen habe, ja?
};

func void DIA_Harlok_FetchHarlok_OrElse()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_OrElse_15_00");	//Schwing deinen Hintern zu den Krautstampfern, oder es gibt Saures.
	AI_Output(self,other,"DIA_Harlok_FetchHarlok_OrElse_01_01");	//VERSUCH doch mal, dich mit mir anzulegen, du Penner!
	AI_StopProcessInfos(self);
};

func void DIA_Harlok_FetchHarlok_BACK()
{
	AI_Output(other,self,"DIA_Harlok_FetchHarlok_BACK_15_00");	//Schon gut.
	Info_ClearChoices(DIA_Harlok_FetchHarlok);
};


instance DIA_Harlok_HarlokAgain(C_Info)
{
	npc = NOV_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_HarlokAgain_Condition;
	information = DIA_Harlok_HarlokAgain_Info;
	permanent = 0;
	description = "Ich wollte dich nochmal dran erinnern, deinen Kumpel abzulösen!";
};


func int DIA_Harlok_HarlokAgain_Condition()
{
	if((self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && Npc_KnowsInfo(hero,DIA_Harlok_FetchHarlok))
	{
		return 1;
	};
};

func void DIA_Harlok_HarlokAgain_Info()
{
	AI_Output(other,self,"DIA_Harlok_HarlokAgain_15_00");	//Ich wollte dich noch mal dran erinnern, deinen Kumpel abzulösen!
	AI_Output(self,other,"DIA_Harlok_HarlokAgain_01_01");	//Hör zu! Ich habe gesagt, mach, dass du wegkommst!
	B_LogEntry(CH1_GhorimsRelief,"Harlok scheint ein uneinsichtiger Faulenzer zu sein. Ich glaube ich sollte seiner Einsicht etwas auf die Sprünge helfen...");
};


instance DIA_Harlok_SendHarlok(C_Info)
{
	npc = NOV_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_SendHarlok_Condition;
	information = DIA_Harlok_SendHarlok_Info;
	permanent = 0;
	description = "Hast du langsam Lust bekommen, deinen Freund abzulösen?";
};


func int DIA_Harlok_SendHarlok_Condition()
{
	if((self.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,DIA_Harlok_FetchHarlok))
	{
		return 1;
	};
};

func void DIA_Harlok_SendHarlok_Info()
{
	var C_Npc Ghorim;
	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_00");	//Na, hast du langsam Lust bekommen, deinen Freund abzulösen?
	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_01");	//Du verdammter Mistkerl! Wieso mischst du dich überhaupt in unsere Angelegenheiten?
	AI_Output(other,self,"DIA_Harlok_SendHarlok_15_02");	//Ich will dich einfach stampfen sehen.
	AI_Output(self,other,"DIA_Harlok_SendHarlok_01_03");	//Ist ja schon gut - ich gehe ja ...  Mistkerl!
	B_LogEntry(CH1_GhorimsRelief,"Harlok -traf- die Einsicht. Er will nun Ghorim ablösen.");
	B_GiveXP(XP_SentHarlok);
	Npc_ExchangeRoutine(self,"START");
	Ghorim = Hlp_GetNpc(NOV_1310_Ghorim);
	Npc_ExchangeRoutine(Ghorim,"START");
	Ghorim_KickHarlok = LOG_SUCCESS;
	Npc_SetPermAttitude(Ghorim,ATT_FRIENDLY);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos(self);
};


instance DIA_Harlok_Angry(C_Info)
{
	npc = NOV_1358_Harlok;
	nr = 1;
	condition = DIA_Harlok_Angry_Condition;
	information = DIA_Harlok_Angry_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Harlok_Angry_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Ghorim_KickHarlok == LOG_SUCCESS))
	{
		return 1;
	};
};

func void DIA_Harlok_Angry_Info()
{
	AI_Output(self,other,"DIA_Harlok_Angry_01_00");	//Lass mich in Ruhe! Ich mach' ja schon ...
	AI_StopProcessInfos(self);
};

