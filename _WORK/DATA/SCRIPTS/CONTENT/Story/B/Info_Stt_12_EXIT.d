
instance Info_Stt_12_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Stt_12_EXIT_Condition;
	information = Info_Stt_12_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Stt_12_EXIT_Condition()
{
	return 1;
};

func void Info_Stt_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Stt_12_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Stt_12_EinerVonEuchWerden_Condition;
	information = Info_Stt_12_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich würde mich gerne den Schatten anschliessen.";
};


func int Info_Stt_12_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Stt_12_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_00");	//Ich würde mich gerne den Schatten anschließen.
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_01");	//So? Dann solltest du wissen, dass Gomez kein Versagen duldet. Wenn du einer von uns werden willst, musst du für ihn durchs Feuer gehen!
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_02");	//Nur die Hälfte derer, die es versucht haben, sind aufgenommen worden.
	AI_Output(other,self,"Info_Stt_12_EinerVonEuchWerden_15_03");	//Was ist mit dem Rest passiert?
	AI_Output(self,other,"Info_Stt_12_EinerVonEuchWerden_12_04");	//Vermutlich sitzen die im Neuen Lager und fressen Reis. He he he.
};


instance Info_Stt_12_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Stt_12_WichtigePersonen_Condition;
	information = Info_Stt_12_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer ist hier der Boss?";
};


func int Info_Stt_12_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Stt_12_WichtigePersonen_Info()
{
	var C_Npc diego;
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Stt_12_WichtigePersonen_15_00");	//Wer ist hier der Boss?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_02");	//Du bist hier der Boss. Wenn du was zu tun hast, raus damit.
	}
	else
	{
		AI_Output(self,other,"Info_Stt_12_WichtigePersonen_12_01");	//Diego ist unter den Schatten so was wie der Anführer. Aber Thorus entscheidet, wer zu Gomez vorgelassen wird.
		diego = Hlp_GetNpc(PC_Thief);
		diego.aivar[AIV_FINDABLE] = TRUE;
		Thorus = Hlp_GetNpc(GRD_200_Thorus);
		Thorus.aivar[AIV_FINDABLE] = TRUE;
	};
};


instance Info_Stt_12_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Stt_12_DasLager_Condition;
	information = Info_Stt_12_DasLager_Info;
	permanent = 1;
	description = "Ich will wissen, was es hier im Lager alles gibt.";
};


func int Info_Stt_12_DasLager_Condition()
{
	return 1;
};

func void Info_Stt_12_DasLager_Info()
{
	AI_Output(other,self,"Info_Stt_12_DasLager_15_00");	//Ich will wissen, was es hier im Lager alles gibt.
	AI_Output(self,other,"Info_Stt_12_DasLager_12_01");	//Frag am besten die Buddler. Die haben sowieso den ganzen Tag nichts zu tun.
};


instance Info_Stt_12_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Stt_12_DieLage_Condition;
	information = Info_Stt_12_DieLage_Info;
	permanent = 1;
	description = "Na, wie steht's?";
};


func int Info_Stt_12_DieLage_Condition()
{
	return 1;
};

func void Info_Stt_12_DieLage_Info()
{
	AI_Output(other,self,"Info_Stt_12_DieLage_15_00");	//Na, wie steht's?
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_15_01");	//Ich red' nicht mit Dreckskerlen aus dem Neuen Lager.
		AI_Output(self,other,"Info_Stt_10_DieLage_15_02");	//Also geh' wieder dahin zurück, wo du hergekommen bist.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Stt_12_DieLage_14_01");	//Alles bestens. Könnte mir nichts besseres vorstellen als zu Gomez' Männen zu gehören. Hab' ich nicht recht? Hehe.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Stt_10_DieLage_77_03");	//Was soll das werden, Sektenspinner?
		AI_Output(self,other,"Info_Stt_10_DieLage_85_04");	//Willst du mich mit der Lehre des Schläfers vollquatschen? Mann geh' mir nicht auf den Sack.
	}
	else
	{
		AI_Output(self,other,"Info_Stt_12_DieLage_12_01");	//Was genau willst du von mir?
	};
};

func void B_AssignAmbientInfos_Stt_12(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Stt_12_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Stt_12_DieLage.npc = Hlp_GetInstanceID(slf);
};

