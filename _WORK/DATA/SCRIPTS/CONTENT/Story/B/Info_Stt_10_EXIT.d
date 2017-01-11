
instance Info_Stt_10_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Stt_10_EXIT_Condition;
	information = Info_Stt_10_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Stt_10_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_10_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Stt_10_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Stt_10_EinerVonEuchWerden_Condition;
	information = Info_Stt_10_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will ein Schatten werden.";
};


func int Info_Stt_10_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Stt_10_EinerVonEuchWerden_Info()
{
	var C_Npc diego;
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_15_00");	//Ich will ein Schatten werden.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_10_01");	//So? Hast du schon mit Diego geredet?
	diego = Hlp_GetNpc(PC_Thief);
	diego.aivar[AIV_FINDABLE] = TRUE;
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Nein.",Info_Stt_10_EinerVonEuchWerden_Nein);
	Info_AddChoice(Info_Stt_10_EinerVonEuchWerden,"Ja.",Info_Stt_10_EinerVonEuchWerden_Ja);
};

func void Info_Stt_10_EinerVonEuchWerden_Nein()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Nein_15_00");	//Bis jetzt noch nicht.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Nein_10_01");	//Dann mach das, du findest ihn am Eingang der Burg.
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};

func void Info_Stt_10_EinerVonEuchWerden_Ja()
{
	AI_Output(other,self,"Info_Stt_10_EinerVonEuchWerden_Ja_15_00");	//Ja, habe ich.
	AI_Output(self,other,"Info_Stt_10_EinerVonEuchWerden_Ja_10_01");	//Gut. Tu einfach, was er sagt. Das hat mir auch nicht geschadet. Jedenfalls nicht wirklich .
	Info_ClearChoices(Info_Stt_10_EinerVonEuchWerden);
};


instance Info_Stt_10_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Stt_10_WichtigePersonen_Condition;
	information = Info_Stt_10_WichtigePersonen_Info;
	permanent = 1;
	description = "Wen von den Leuten hier sollte ich kennen?";
};


func int Info_Stt_10_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_10_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Stt_10_WichtigePersonen_15_00");	//Wen von den Leuten hier sollte ich kennen?
	AI_Output(self,other,"Info_Stt_10_WichtigePersonen_10_01");	//Wenn du mal Probleme mit den Gardisten hast, geh zu Gravo. Du findest ihn am Waschplatz beim Burgtor. Er kümmert sich um Leute, die Ärger haben. Besonders bei Neuen passiert das hier schneller, als du denkst.
};


instance Info_Stt_10_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Stt_10_DasLager_Condition;
	information = Info_Stt_10_DasLager_Info;
	permanent = 1;
	description = "Was kannst du mir über das Lager sagen?";
};


func int Info_Stt_10_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_10_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_10_DasLager_15_00");	//Was kannst du mir über das Lager sagen?
	AI_Output(self,other,"Info_Stt_10_DasLager_10_01");	//Am interessantesten hier ist wohl der Marktplatz. Wenn du mal was Bestimmtes suchst - da kriegst du fast alles.
	AI_Output(self,other,"Info_Stt_10_DasLager_10_02");	//Es ist der Platz unter dem großen Dach im Süden des äußeren Rings.
};


instance Info_Stt_10_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Stt_10_DieLage_Condition;
	information = Info_Stt_10_DieLage_Info;
	permanent = 1;
	description = "Hi!";
};


func int Info_Stt_10_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_10_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_10_DieLage_15_00");	//Hi!
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_15_01");	//Ich red' nicht mit Dreckskerlen aus dem Neuen Lager.
		AI_Output(self,other,"Info_Stt_10_DieLage_15_02");	//Also geh' wieder dahin zurück, wo du hergekommen bist.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_10_02");	//Alles klar, Kollege?
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_15_03");	//Was willst du von mir?
		AI_Output(self,other,"Info_Stt_10_DieLage_15_04");	//Wenn du versuchen willst, mich vom Schläfer zu überzeugen, dann bist du hier am falschen Ort, Sektenspinner.
	}
	else
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_10_01");	//Was willst du?
	};
};

func void B_AssignAmbientInfos_Stt_10(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Stt_10_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_10_DieLage.npc = Hlp_GetInstanceID(slf);
};

