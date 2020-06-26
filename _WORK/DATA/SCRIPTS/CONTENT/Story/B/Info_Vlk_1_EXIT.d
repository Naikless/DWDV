
instance Info_Vlk_1_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_1_EXIT_Condition;
	information = Info_Vlk_1_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Vlk_1_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_1_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_1_EinerVonEuchWerden_Condition;
	information = Info_Vlk_1_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Wie werde ich in diesem Lager aufgenommen?";
};


func int Info_Vlk_1_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00");	//Wie werde ich in diesem Lager aufgenommen?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01");	//Ganz einfach. Du schnappst dir eine Spitzhacke und gehst in die Mine. Etwa die H�lfte von deinem Erz geht f�r Schutzgeld drauf, von der anderen kann man gerade so leben.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02");	//Die Preise, die Gomez f�r seine Vorr�te nimmt, sind Wucher. Ist aber immer noch besser als den ganzen Tag Reis zu fressen wie im Neuen Lager.
};


instance Info_Vlk_1_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_1_WichtigePersonen_Condition;
	information = Info_Vlk_1_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_02");	//Das m�sstest du als einer der Erzbarone doch am besten wissen.
		AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_03");	//Ich will keinen �rger...
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01");	//Die Erzbarone. Sie organisieren den Erzaustausch mit dem K�nig. Je h�her du stehst, desto mehr bekommst du.
	};
};


instance Info_Vlk_1_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_1_DasLager_Condition;
	information = Info_Vlk_1_DasLager_Info;
	permanent = 1;
	description = "Gibt es hier noch was interessanteres als H�tten?";
};


func int Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_1_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00");	//Gibt es hier noch irgendwas interessanteres als H�tten?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01");	//Abends kannst du dir in der Arena ansehen, wie sich die Gardisten gegenseitig die Fresse polieren.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02");	//Das ist den Eintritt glatt wert.
	if(Npc_GetTrueGuild(other) != GIL_None)
	{
		AI_Output(self,other,"Info_Vlk_1_DasLager_01_03");	//Du geh�rst auch einem der Lager an, was?
		AI_Output(self,other,"Info_Vlk_1_DasLager_01_04");	//Vielleicht l�sst dich Scatty auch als Arenak�mpfer arbeiten.
		AI_Output(self,other,"Info_Vlk_1_DasLager_01_05");	//Frag ihn mal, damit l�sst sich gut Erz nebenbei verdienen.
	};
};


instance Info_Vlk_1_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_1_DieLage_Condition;
	information = Info_Vlk_1_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01");	//Ich habe die letzten zwei Wochen in der Mine geschuftet. Alles, was ich will, ist meine Ruhe. Also geh mir nicht auf den Sack.
};

func void B_AssignAmbientInfos_Vlk_1(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_1_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_1_DieLage.npc = Hlp_GetInstanceID(slf);
};

