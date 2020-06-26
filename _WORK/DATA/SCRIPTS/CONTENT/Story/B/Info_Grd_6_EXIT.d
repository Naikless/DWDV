
instance Info_Grd_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Grd_6_EXIT_Condition;
	information = Info_Grd_6_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Grd_6_EXIT_Condition()
{
	return 1;
};

func void Info_Grd_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Grd_6_EinerVonEuchWerden(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_EinerVonEuchWerden_Condition;
	information = Info_Grd_6_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will Gardist werden.";
};


func int Info_Grd_6_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && (Npc_GetTrueGuild(other) != GIL_EBR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Grd_6_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Grd_6_EinerVonEuchWerden_15_00");	//Könnt ihr noch einen guten Mann brauchen?
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_01");	//Frischling, was? Wenn du ein Lager suchst, das dich aufnimmt, probier's doch bei den Sektenspinnern, die nehmen jeden.
	AI_Output(self,other,"Info_Grd_6_EinerVonEuchWerden_06_02");	//Bei uns wird nicht jeder genommen, es sei denn, du willst in der alten Mine buddeln gehen!
};


instance Info_Grd_6_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_WichtigePersonen_Condition;
	information = Info_Grd_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Grd_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Grd_6_WichtigePersonen_Info()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_Grd_6_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	if(Npc_GetTrueGuild(other) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_02");	//Der Einzige, der hier mehr zu sagen hat als du, ist Gomez.
		AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_03");	//Hast dich ganz schön hochgearbeitet.
	}
	else
	{
		AI_Output(self,other,"Info_Grd_6_WichtigePersonen_06_01");	//Thorus kümmert sich drum das alles läuft. Er ist direkt von Gomez beauftragt.
		Thorus = Hlp_GetNpc(GRD_200_Thorus);
		Thorus.aivar[AIV_FINDABLE] = TRUE;
	};
};


instance Info_Grd_6_DasLager(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_DasLager_Condition;
	information = Info_Grd_6_DasLager_Info;
	permanent = 1;
	description = "Ich bin neu hier. Was läuft denn so?";
};


func int Info_Grd_6_DasLager_Condition()
{
	if(!C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Grd_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_15_00");	//Ich bin neu hier.
	AI_Output(self,other,"Info_Grd_6_DasLager_06_01");	//Sehe ich.
	AI_Output(other,self,"Info_Grd_6_DasLager_15_02");	//Was läuft denn so?
	AI_Output(self,other,"Info_Grd_6_DasLager_06_03");	//Wer hier Ärger macht bekommt was aufs Maul.
	Info_ClearChoices(Info_Grd_6_DasLager);
	Info_AddChoice(Info_Grd_6_DasLager,"Verstehe.",Info_Grd_6_DasLager_Verstehe);
	Info_AddChoice(Info_Grd_6_DasLager,"Was verstehst du unter Ärger?",Info_Grd_6_DasLager_WasIstAerger);
};

func void Info_Grd_6_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_Verstehe_15_00");	//Verstehe.
	Info_ClearChoices(Info_Grd_6_DasLager);
};

func void Info_Grd_6_DasLager_WasIstAerger()
{
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_00");	//Was verstehst du unter Ärger?
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_01");	//Die meisten Buddler bezahlen uns, damit wir sie beschützen.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_02");	//Wenn du dich mit einem von ihnen anlegst, lernst du uns kennen.
	AI_Output(self,other,"Info_Grd_6_DasLager_WasIstAerger_06_03");	//Erwische ich dich beim rumstöbern in fremden Hütten ...
	AI_Output(other,self,"Info_Grd_6_DasLager_WasIstAerger_15_04");	//Schon gut, ich hab's verstanden.
	Info_ClearChoices(Info_Grd_6_DasLager);
};


instance Info_Grd_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Grd_6_DieLage_Condition;
	information = Info_Grd_6_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Grd_6_DieLage_Condition()
{
	return 1;
};

func void Info_Grd_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Grd_6_DieLage_15_00");	//Wie sieht's aus?
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_02");	//Verpiss dich!
		AI_Output(self,other,"Info_Grd_6_DieLage_06_03");	//Du kannst froh sein, dass ich Abschaum wie dich, aus dem Neuen Lager, nicht direkt umlege.
		AI_Output(self,other,"Info_Grd_6_DieLage_06_04");	//Also sieh zu das du verschwindest, bevor ich es mir anders überlege.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_05");	//Keiner von den Banditen aus dem Neuen Lager in Sicht.
		AI_Output(self,other,"Info_Grd_6_DieLage_06_06");	//Besser kann es doch gar nicht aussehen oder nicht, mein Freund? Hehe.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_07");	//Was willst du denn von mir?
		AI_Output(self,other,"Info_Grd_6_DieLage_06_08");	//Wenn du jemandem vollquatschen willst, versuch's mal bei den Buddlern, Sektenspinner.
	}
	else
	{
		AI_Output(self,other,"Info_Grd_6_DieLage_06_01");	//Willst du Ärger machen?
	};
};

func void B_AssignAmbientInfos_GRD_6(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Grd_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Grd_6_DieLage.npc = Hlp_GetInstanceID(slf);
};

