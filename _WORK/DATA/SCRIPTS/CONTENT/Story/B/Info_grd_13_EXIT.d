
instance Info_grd_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_grd_13_EXIT_Condition;
	information = Info_grd_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_grd_13_EXIT_Condition()
{
	return 1;
};

func void Info_grd_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_grd_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_grd_13_EinerVonEuchWerden_Condition;
	information = Info_grd_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will Gardist werden.";
};


func int Info_grd_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_GRD) && (Npc_GetTrueGuild(other) != GIL_KDF) && (Npc_GetTrueGuild(other) != GIL_EBR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00");	//Ich will Gardist werden.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01");	//Da hast du aber noch einiges vor dir, Junge!
};


instance Info_grd_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_grd_13_WichtigePersonen_Condition;
	information = Info_grd_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	if(Npc_GetTrueGuild(other) == GIL_EBR)
	{
		AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_02");	//Da du gerade der einzige Erzbaron im Au�enring bist, hast du hier das Sagen.
		AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_03");	//Gibt's neue Anweisungen von Gomez?
	}
	else
	{
		AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01");	//Ich hab hier das Sagen. Und ich sage: Sei vorsichtig, was du sagst, Junge!
	};
};


instance Info_grd_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_grd_13_DasLager_Condition;
	information = Info_grd_13_DasLager_Info;
	permanent = 1;
	description = "Wie komme ich in die Burg?";
};


func int Info_grd_13_DasLager_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00");	//Wie komme ich in die Burg?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01");	//Gar nicht. Nur Gomez' Leute kommen in die Burg.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Verstehe.",Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"Und wenn ich die Wachen besteche?",Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Und wenn ich mit Gomez sprechen will?",Info_grd_13_DasLager_GomezSprechen);
};

func void Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00");	//Verstehe.
	Info_ClearChoices(Info_grd_13_DasLager);
};

func void Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00");	//Und wenn ich die Wachen besteche?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01");	//Ganz sch�n dreist, Kleiner. Sch�tze f�r die richtige Menge Erz k�nntest du sie �berzeugen, mal wegzusehen.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02");	//Aber wenn Gomez erf�hrt, dass sie einen Frischling einfach so in seine Burg gelassen haben, l�sst er sie in den Kerker werfen.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03");	//Das steigert nat�rlich den Preis.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04");	//Aber selbst wenn du reinkommst, was w�rdest du drinnen machen? Alle Geb�ude sind streng bewacht.
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05");	//Ich war nur neugierig.
};

func void Info_grd_13_DasLager_GomezSprechen()
{
	var C_Npc Thorus;
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00");	//Und wenn ich mit Gomez sprechen will?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01");	//Gomez hat kein Interesse an dahergelaufenen Neuen, die sich noch nicht bew�hrt haben.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02");	//Rede mit Thorus, wenn es dir ernst ist.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_grd_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_grd_13_DieLage_Condition;
	information = Info_grd_13_DieLage_Info;
	permanent = 1;
	description = "Wie l�uft's?";
};


func int Info_grd_13_DieLage_Condition()
{
	if(!C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00");	//Wie l�uft's?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01");	//Ruhig. Ab und zu gibt's Scherereien mit dem Neuen Lager oder ein paar von den Sektenspinnern.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02");	//Solange du noch neu bist, hast du kein Problem damit, aber wenn du dich erst mal f�r ein Lager entschieden hast, steckst du mittendrin - wie wir alle.
};

func void B_AssignAmbientInfos_grd_13(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_grd_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

