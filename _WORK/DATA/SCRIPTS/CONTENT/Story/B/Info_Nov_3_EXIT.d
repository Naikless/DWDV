
instance Info_Nov_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_3_EXIT_Condition;
	information = Info_Nov_3_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Nov_3_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_3_EinerVonEuchWerden_Condition;
	information = Info_Nov_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Wie kann ich mich diesem Lager anschliessen?";
};


func int Info_Nov_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00");	//Wie kann ich mich diesem Lager anschlie�en?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01");	//Das ist ganz einfach. Du musst einfach loslassen, Mann.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02");	//Sprich mit den Gurus, sie werden dich leiten!
};


instance INFO_NOV_3_GURUWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_3_guruwerden_condition;
	information = info_nov_3_guruwerden_info;
	permanent = 1;
	description = "Wie kann ich Guru werden?";
};


func int info_nov_3_guruwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_nov_3_guruwerden_info()
{
	AI_Output(other,self,"Info_Nov_3_GuruWerden_15_00");	//Wie kann ich Guru werden?
	AI_Output(self,other,"Info_Nov_3_GuruWerden_03_01");	//Der Schl�fer ist derjenige der das entscheidet.
	AI_Output(self,other,"Info_Nov_3_GuruWerden_03_02");	//Lausche einfach seinen Worten, Mann.
};


instance Info_Nov_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_3_WichtigePersonen_Condition;
	information = Info_Nov_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer ist hier der Boss?";
};


func int Info_Nov_3_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00");	//Wer ist hier der Boss?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01");	//Y'Berion! Der Schl�fer sei gepriesen! Er hat uns an diesen wunderbaren Ort gebracht.
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02");	//Durch seine Visionen ist das alles hier entstanden.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_03");	//Y'Berion wurde vom Schl�fer erleuchtet und ist jetzt bei ihm, Mann!
		AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_04");	//Jetzt sind wir eine freie Gemeinschaft ohne Anf�hrer. Solange wir genug Sumpfkraut haben, ist's mir egal.
	};
};


instance Info_Nov_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_3_DasLager_Condition;
	information = Info_Nov_3_DasLager_Info;
	permanent = 1;
	description = "Was gibt es hier f�r wichtige Orte?";
};


func int Info_Nov_3_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_3_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00");	//Was gibt es hier f�r wichtige Orte?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01");	//Es gibt Fortuno, er verteilt freies Sumpfkraut f�r alle Anh�nger der Sekte.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02");	//Du findest ihn unter Cor Kaloms Alchemielabor.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_3_DieLage_Condition;
	information = Info_Nov_3_DieLage_Info;
	permanent = 1;
	description = "Wie steht's?";
};


func int Info_Nov_3_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00");	//Wie steht's?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01");	//Ich bin total high, Mann!
};

func void B_AssignAmbientInfos_Nov_3(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	info_nov_3_guruwerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

