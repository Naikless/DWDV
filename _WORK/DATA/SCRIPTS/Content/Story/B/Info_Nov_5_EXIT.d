
instance Info_Nov_5_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_5_EXIT_Condition;
	information = Info_Nov_5_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Nov_5_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_5_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_5_EinerVonEuchWerden_Condition;
	information = Info_Nov_5_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Wie werde ich in diesem Lager aufgenommen?";
};


func int Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00");	//Wie werde ich in diesem Lager aufgenommen?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01");	//Nichts leichter als das. Rede einfach mit einigen der niederen Gurus. Sie werden dir weiterhelfen.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02");	//Es wird dir hier gefallen - wirst schon sehen.
};


instance INFO_NOV_5_GURUWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_5_guruwerden_condition;
	information = info_nov_5_guruwerden_info;
	permanent = 1;
	description = "Wie werde ich Guru?";
};


func int info_nov_5_guruwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_nov_5_guruwerden_info()
{
	AI_Output(other,self,"Info_Nov_5_GuruWerden_15_00");	//Wie werde ich Guru?
	AI_Output(self,other,"Info_Nov_5_GuruWerden_05_01");	//Das ist ziemlich schwierig. Am besten ist es, wenn du dich einfach n�tzlich machst und als Novize bewehrst.
	AI_Output(self,other,"Info_Nov_5_GuruWerden_05_02");	//Eines Tages wird dich Y'Berion dann auserw�hlen.
};


instance Info_Nov_5_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_5_WichtigePersonen_Condition;
	information = Info_Nov_5_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	if(Kapitel <= 2)
	{
		if(Npc_GetTrueGuild(other) != GIL_GUR)
		{
			AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01");	//Die Gurus haben alles unter Kontrolle. Aber wenn man nicht auff�llt, lassen sie einen in Ruhe.
		}
		else if(Npc_GetTrueGuild(other) == GIL_GUR)
		{
			AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_03");	//Meister. Ihr seit hier derjenige, der das Sagen hat.
			AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_04");	//Ich hoffe ich erf�lle meine Aufgaben zufriedenstellend und erf�lle euch mit Stolz.
		};
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_02");	//Cor Angar ist der Einzige der uns noch geblieben sind. Y'Berion ist tot und Cor Kalom ist fort.
	};
};


instance Info_Nov_5_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_5_DasLager_Condition;
	information = Info_Nov_5_DasLager_Info;
	permanent = 1;
	description = "Was kannst du mit �ber dieses Lager erz�hlen?";
};


func int Info_Nov_5_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_5_DasLager_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00");	//Was kannst du mir �ber dieses Lager erz�hlen?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01");	//Es ist der beste Ort, an dem du in dieser gottverdammten Kolonie sein kannst.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02");	//Selbst wenn du nicht an die Lehren des Schl�fers glaubst, bekommst du deine t�gliche Ration Essen und Sumpfkraut. Du brauchst nur zu Fortuno zu gehen.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03");	//Und wo finde ich den?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04");	//Unten an Cor Kaloms Labor. In der N�he des gro�en Tempelplatzes.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_5_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_5_DieLage_Condition;
	information = Info_Nov_5_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Nov_5_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01");	//Kann mich nicht beklagen. Bist du neu hier?
	if(Kapitel == 1)
	{
		AI_Output(other,self,"Info_Nov_5_DieLage_15_02");	//Ich bin vor kurzem angekommen.
	}
	else
	{
		AI_Output(other,self,"Info_Nov_5_DieLage_15_03");	//Nein, ich bin schon etwas l�nger hier.
	};
};

func void B_AssignAmbientInfos_Nov_5(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_5_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	info_nov_5_guruwerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc = Hlp_GetInstanceID(slf);
};

