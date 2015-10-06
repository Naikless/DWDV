
instance Info_Tpl_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_8_EXIT_Condition;
	information = Info_Tpl_8_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Tpl_8_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Tpl_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_8_EinerVonEuchWerden_Condition;
	information = Info_Tpl_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "K�nnt ihr noch einen guten Mann brauchen?";
};


func int Info_Tpl_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && (Npc_GetTrueGuild(other) != GIL_GUR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//K�nnt ihr noch einen guten Mann brauchen?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//Gute Leute suchen wir immer. Aber du wirst hart an dir arbeiten m�ssen. Erst ein fortgeschrittener Novize kann zum Templer bef�rdert werden.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//Es ist die h�chste Ehre f�r einen Anh�nger der Bruderschaft des Schl�fers.
};


instance Info_Tpl_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_8_WichtigePersonen_Condition;
	information = Info_Tpl_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Tpl_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_8_WichtigePersonen_Info()
{
	var C_Npc YBerion;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//Wir tun alles, was uns die Gurus sagen. Es ist unsere Pflicht, ihnen zu dienen.
		AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02");	//Wer sind eure Gurus?
		if(Npc_GetTrueGuild(other) == GIL_GUR)
		{
			AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_13");	//Ihr Meister, seit einer unserer Gurus.
			AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_14");	//Ich hoffe ich erf�lle meine Pflicht so, wie ihr es w�nscht.
		};
		if(Npc_GetTrueGuild(other) != GIL_GUR)
		{
			AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//Y'Berion der Erleuchtete ist der Oberste Guru. Unter ihm folgen Cor Kalom und Cor Angar und noch einige weitere.
			YBerion = Hlp_GetNpc(GUR_1200_YBerion);
			CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
			CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
			YBerion.aivar[AIV_FINDABLE] = TRUE;
			CorKalom.aivar[AIV_FINDABLE] = TRUE;
			CorAngar.aivar[AIV_FINDABLE] = TRUE;
		};
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_02");	//Cor Angar ist der Einzige der uns noch geblieben ist.
		AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_03");	//Trotz allem was passiert ist, dienen wir ihm weiterhin.
	};
};


instance Info_Tpl_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_8_DasLager_Condition;
	information = Info_Tpl_8_DasLager_Info;
	permanent = 1;
	description = "Was kannst du mir �ber dieses Lager erz�hlen?";
};


func int Info_Tpl_8_DasLager_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//Was kannst du mir �ber dieses Lager erz�hlen?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//Als Neuling darfst du dich fast �berall aufhalten. Aber es ist Ungl�ubigen untersagt, den Tempel des Schl�fers zu betreten.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02");	//Also halt dich nur da auf, wo es dir gestattet ist. Und st�re nicht unsere Meister bei der Meditation.
};


instance Info_Tpl_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_8_DieLage_Condition;
	information = Info_Tpl_8_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Tpl_8_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//Ich warne dich. Sei nicht respektlos. Du redest mit einem Auserw�hlten Besch�tzer der Propheten.
};

func void B_AssignAmbientInfos_Tpl_8(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_8_DieLage.npc = Hlp_GetInstanceID(slf);
};

