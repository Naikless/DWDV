
instance Info_Vlk_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_2_EXIT_Condition;
	information = Info_Vlk_2_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_2_EinerVonEuchWerden_Condition;
	information = Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will bei euch mitmachen.";
};


func int Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00");	//Ich will bei euch mitmachen.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01");	//Ich kann mir nicht vorstellen, dass du freiwillig in den Minen schuften willst. Einer wie du kann schon bald in der Burg leben.
};


instance Info_Vlk_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_2_WichtigePersonen_Condition;
	information = Info_Vlk_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_03");	//Du hast hier das Sagen, schätze ich. Du bist doch einer der Erzbarone oder nicht?
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_04");	//Ich mach keinen Ärger, keine Sorge.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01");	//Hier im äußeren Ring treiben Fletcher, Bloodwyn und Jackal das Schutzgeld ein. Jedem gehört ein Viertel.
		AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02");	//Wenn du dich mit ihnen gut stellst, kann dir nichts passieren.
	};
};


instance Info_Vlk_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_2_DasLager_Condition;
	information = Info_Vlk_2_DasLager_Info;
	permanent = 1;
	description = "Ich will mehr über dieses Lager erfahren.";
};


func int Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00");	//Ich will mehr über dieses Lager erfahren.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01");	//Dann solltest du mit den Schatten reden, sie können dir noch am ehesten sagen, was du wissen willst. Aber sei vorsichtig. Den meisten von ihnen kannst du nicht trauen.
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		AI_Output(self,other,"Info_Vlk_2_DasLager_02_02");	//Aber das müsstest du als einer von ihnen ja am besten wissen.
	};
};


instance Info_Vlk_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_2_DieLage_Condition;
	information = Info_Vlk_2_DieLage_Info;
	permanent = 1;
	description = "Wie ist das Leben hier?";
};


func int Info_Vlk_2_DieLage_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		return 1;
	};
};

func void Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00");	//Wie ist das Leben hier?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_05");	//Ein Erzbaron! Ich will keinen Ärger!
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_06");	//Die Gardisten bekommen immer ihr Schutzgeld und ich arbeite auch so gut ich kann in der Mine.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_01");	//Wenn die Erzbarone dich schicken, sag ihnen, ich will keinen Ärger. Von mir bekommt keiner was zu hören.
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_02");	//Ich bin zufrieden mit dem, was sie uns geben.
		AI_Output(other,self,"Info_Vlk_2_DieLage_15_03");	//Niemand schickt mich. Ich bin neu hier.
		AI_Output(self,other,"Info_Vlk_2_DieLage_02_04");	//Ein Neuer ... Neue kriegen hier immer schnell Ärger. Ich will in nichts reingezogen werden, klar?
	};
};

func void B_AssignAmbientInfos_Vlk_2(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc = Hlp_GetInstanceID(slf);
};

