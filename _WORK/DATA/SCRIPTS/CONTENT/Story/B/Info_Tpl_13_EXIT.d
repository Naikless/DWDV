
instance Info_Tpl_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Tpl_13_EXIT_Condition;
	information = Info_Tpl_13_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

func void Info_Tpl_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Tpl_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Tpl_13_EinerVonEuchWerden_Condition;
	information = Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will ein Templer werden - so wie du.";
};


func int Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_TPL) && (Npc_GetTrueGuild(other) != GIL_GUR) && !C_NpcBelongsToNewCamp(other) && !C_NpcBelongsToOldCamp(other))
	{
		return TRUE;
	};
};

func void Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Ich will ein Templer werden - so wie du.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//Hast du eine Ahnung wie viele Entbehrungen ich auf mich nehmen musste, um den Auserw�hlten des Schl�fers als Tempelw�chter dienen zu d�rfen?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Glaub blo� nicht, du kannst hier einfach reinspazieren und bekommst so mir nichts dir nichts die h�chsten Auszeichnungen.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Bevor du �berhaupt dar�ber nachdenkst, solltest du dich mit der Lehre des Schl�fers vertraut machen.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//Das wird einige Zeit in Anspruch nehmen und es wird dir auch sicher die Flausen aus dem Kopf treiben.
};


instance Info_Tpl_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Tpl_13_WichtigePersonen_Condition;
	information = Info_Tpl_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Unsere Gurus sind die Auserw�hlten des Schl�fers! Der Schl�fer bestimmt unser Schicksal und die Gurus verk�nden es uns.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_02");	//Cor Angar hat jetzt die Kontrolle �ber das Lager. Nach Y'Berion und Cor Kalom, ist er der Einzige der in der Lage dazu ist.
	};
};


instance Info_Tpl_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Tpl_13_DasLager_Condition;
	information = Info_Tpl_13_DasLager_Info;
	permanent = 1;
	description = "Ich w�rde gerne mal in den Tempel des Schl�fers gehen...";
};


func int Info_Tpl_13_DasLager_Condition()
{
	if(Kapitel <= 1)
	{
		return 1;
	};
};

func void Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00");	//Ich w�rde gerne mal in den Tempel des Schl�fers gehen ...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01");	//Undenkbar! Ein Ungl�ubiger im Tempel! Bevor du dich nicht in den Dienst des Schl�fers gestellt hast, wird dir der Zutritt zum Tempel verwehrt bleiben!
};


instance Info_Tpl_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Tpl_13_DieLage_Condition;
	information = Info_Tpl_13_DieLage_Info;
	permanent = 1;
	description = "Wie l�uft's?";
};


func int Info_Tpl_13_DieLage_Condition()
{
	if(!C_NpcBelongsToPsiCamp(other))
	{
		return 1;
	};
};

func void Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Wie l�uft's?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//Seit ich ein auserw�hlter Besch�tzer des Glaubens bin, f�hle ich mich besser als je zuvor in meinem Leben.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//H�rt sich wichtig an ...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Du bist ein Ungl�ubiger. Du verstehst davon nichts.
};

func void B_AssignAmbientInfos_Tpl_13(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Tpl_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc = Hlp_GetInstanceID(slf);
};

