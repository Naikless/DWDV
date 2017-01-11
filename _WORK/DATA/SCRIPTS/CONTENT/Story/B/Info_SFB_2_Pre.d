
instance Info_SFB_2_Pre(C_Info)
{
	nr = 1;
	condition = Info_SFB_2_Pre_Condition;
	information = Info_SFB_2_Pre_Info;
	permanent = 0;
	important = 1;
};


func int Info_SFB_2_Pre_Condition()
{
	return 1;
};

func void Info_SFB_2_Pre_Info()
{
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00");	//Was willst du hier. Ich habe keine Lust, irgendwelchen Ärger zu bekommen.
};


instance Info_SFB_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_SFB_2_EXIT_Condition;
	information = Info_SFB_2_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_SFB_2_EXIT_Condition()
{
	return 1;
};

func void Info_SFB_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_SFB_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_SFB_2_EinerVonEuchWerden_Condition;
	information = Info_SFB_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Was muss ich tun, um bei euch mitzumachen?";
};


func int Info_SFB_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_SFB_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00");	//Was muss ich tun, um bei euch mitzumachen?
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01");	//Ich kann dir da nicht weiterhelfen. Ich bin hier nur 'ne kleine Nummer. Sprich mit Swiney.
};


instance Info_SFB_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_SFB_2_WichtigePersonen_Condition;
	information = Info_SFB_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier was zu sagen?";
};


func int Info_SFB_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_SFB_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00");	//Wer hat hier was zu sagen?
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01");	//Hier im Kessel haben die Söldner das Sagen. Im Neuen Lager sieht das schon anders aus.
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02");	//Also pass gut auf, mit wem du dich anlegst.
};


instance Info_SFB_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_SFB_2_DasLager_Condition;
	information = Info_SFB_2_DasLager_Info;
	permanent = 1;
	description = "Ich will mehr über dieses Lager erfahren.";
};


func int Info_SFB_2_DasLager_Condition()
{
	return 1;
};

func void Info_SFB_2_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_2_DasLager_15_00");	//Ich will mehr über dieses Lager erfahren.
	AI_Output(self,other,"Info_SFB_2_DasLager_02_01");	//Ich weiß nicht, ob ich dir da weiterhelfen kann, sprich am besten mit Swiney oder mit den Söldnern.
};


instance Info_SFB_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_SFB_2_DieLage_Condition;
	information = Info_SFB_2_DieLage_Info;
	permanent = 1;
	description = "Wie ist das Leben hier?";
};


func int Info_SFB_2_DieLage_Condition()
{
	return 1;
};

func void Info_SFB_2_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_2_DieLage_15_00");	//Wie ist das Leben hier?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_01");	//Ich will mich nicht beklagen. Wir haben alle unseren Teil zu tragen.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_02");	//Aber zumindest ist es hier besser als im Alten Lager.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_03");	//Kommst du aus dem Alten Lager?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_04");	//Wenn du aus dem Alten Lager kommst, ich will keinen Ärger!
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_SFB_2(var C_Npc slf)
{
	Info_SFB_2_Pre.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_SFB_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

