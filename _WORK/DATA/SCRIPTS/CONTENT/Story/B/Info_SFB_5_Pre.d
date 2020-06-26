
instance Info_SFB_5_Pre(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_Pre_Condition;
	information = Info_SFB_5_Pre_Info;
	permanent = 0;
	important = 1;
};


func int Info_SFB_5_Pre_Condition()
{
	return 1;
};

func void Info_SFB_5_Pre_Info()
{
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00");	//Hallo!
};


instance Info_SFB_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_SFB_5_EXIT_Condition;
	information = Info_SFB_5_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_SFB_5_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_SFB_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_SFB_5_EinerVonEuchWerden_Condition;
	information = Info_SFB_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Was ist wenn ich hier mitmachen will?";
};


func int Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00");	//Was ist, wenn ich hier mitmachen will?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01");	//Hier mitmachen? Als was, Wassertr�ger?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02");	//Nein, als Sch�rfer?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03");	//Pass mal auf, lass dir eins gesagt sein: Niemand wird FREIWILLIG Sch�rfer.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04");	//Aber bitte, wenn du unbedingt willst. Geh mal zu Swiney, der hat bestimmt 'ne Spitzhacke �brig, die er dir gerne zur Verf�gung stellt.
};


instance Info_SFB_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_SFB_5_WichtigePersonen_Condition;
	information = Info_SFB_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer ist hier wichtig?";
};


func int Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00");	//Wer ist hier wichtig?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01");	//Wer hier wichtig ist? -Ich!
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02");	//Aber ich glaube, du willst wissen, wer hier das Sagen hat.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03");	//Also, ich denke, du solltest dich an die S�ldner oder an die Banditen wenden. An die Wassermagier wirst du nicht rankommen.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04");	//Der aufgeblasene Swiney tut wichtiger, als er wirklich ist. Er verteilt nur die Spitzhacken und gehorcht ansonsten nur Okyls Befehlen.
};


instance Info_SFB_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_SFB_5_DasLager_Condition;
	information = Info_SFB_5_DasLager_Info;
	permanent = 1;
	description = "Was gibt es hier im Lager?";
};


func int Info_SFB_5_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00");	//Was gibt es hier im Lager?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01");	//Kommt drauf an was man draus macht. F�r einige nur viel Arbeit, f�r andere gibt's auch 'ne ganze Menge Spa�.
};


instance Info_SFB_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_SFB_5_DieLage_Condition;
	information = Info_SFB_5_DieLage_Info;
	permanent = 1;
	description = "Wie ist das Leben hier?";
};


func int Info_SFB_5_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00");	//Wie ist das Leben hier?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01");	//Toll!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02");	//Und weil es uns so gut geht, versuchen wir m�glichst schnell von hier abzuhauen.
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03");	//Was glaubst du wo wir sind? Wir sind im Knast und niemand ist gerne im Knast.
};

func void B_AssignAmbientInfos_SFB_5(var C_Npc slf)
{
	Info_SFB_5_Pre.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

