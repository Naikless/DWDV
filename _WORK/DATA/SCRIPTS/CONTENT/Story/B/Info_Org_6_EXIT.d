
instance Info_Org_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_6_EXIT_Condition;
	information = Info_Org_6_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Org_6_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_6_EinerVonEuchWerden_Condition;
	information = Info_Org_6_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will bei euch mitmachen!";
};


func int Info_Org_6_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_6_EinerVonEuchWerden_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_00");	//Ich will bei euch mitmachen!
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_01");	//Lares entscheidet, wer in die Bande aufgenommen wird.
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_02");	//Aber wenn du zu ihm willst, musst du schon 'nen guten Grund haben.
	AI_Output(other,self,"Info_Org_6_EinerVonEuchWerden_15_03");	//Zum Beispiel?
	AI_Output(self,other,"Info_Org_6_EinerVonEuchWerden_06_04");	//Zum Beispiel jemand, der dich zu ihm schickt.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_6_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_6_WichtigePersonen_Condition;
	information = Info_Org_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer ist hier der Boss?";
};


func int Info_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_6_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_6_WichtigePersonen_15_00");	//Wer ist hier der Boss?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_01");	//Kommst wohl gerade aus dem Alten Lager, was?
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_02");	//Hier ist niemand der Boss. Der verdammte Lee versucht zwar immer, uns an der Leine zu halten, aber wir machen, was wir wollen.
	AI_Output(self,other,"Info_Org_6_WichtigePersonen_06_03");	//Wenn es so was wie einen Anführer unter uns gibt, dann ist das Lares. Aber der ist schlau genug, niemandem in seine Sache reinzuquatschen!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_6_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_6_DasLager_Condition;
	information = Info_Org_6_DasLager_Info;
	permanent = 1;
	description = "Was muß ich über diesen Ort wissen?";
};


func int Info_Org_6_DasLager_Condition()
{
	return 1;
};

func void Info_Org_6_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_6_DasLager_15_00");	//Was muss ich über diesen Ort wissen?
	AI_Output(self,other,"Info_Org_6_DasLager_06_01");	//Im Zentrum der Höhle ist ein riesiges Loch voll Erz. Wenn du darüber nachdenkst, wie du da rankommen kannst - vergiss es!
	AI_Output(self,other,"Info_Org_6_DasLager_06_02");	//Ich hab's selber mal probiert, aber die Söldner passen Tag und Nacht auf.
};


instance Info_Org_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_6_DieLage_Condition;
	information = Info_Org_6_DieLage_Info;
	permanent = 1;
	description = "Wie steht's?";
};


func int Info_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_6_DieLage_15_00");	//Wie steht's?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_03");	//Ich warte darauf, dass dich der Nächste Überfall ankündigt.
		AI_Output(self,other,"Info_Org_6_DieLage_06_04");	//Würde ich an deiner Stelle auch machen, Kollege. 
		AI_Output(self,other,"Info_Org_6_DieLage_06_05");	//Das Erz versaufen wir dann zusammen in der Kneipe, was? Hehe.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_06");	//Das geht dich einen Dreck an Du Penner!
		AI_Output(self,other,"Info_Org_6_DieLage_06_07");	//Wenn du hier irgendjemandem vollquatschen willst, dann geh' doch wieder zurück zu deinen Freunden ins alte Lager.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_08");	//Du bist einer von den Sektenspinnern, was?
		AI_Output(self,other,"Info_Org_6_DieLage_06_09");	//Man, gib' mir bescheid wenn du was zu rauchen dabei hast, ich bräuchte mal wieder was.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_10");	//Warum fragt mich das denn einer von Lee's Söldnern? Keine Sorge, ich lass meine Finger vom Erzhaufen.
		AI_Output(self,other,"Info_Org_6_DieLage_06_11");	//Pass lieber auf, dass sich keiner von den Schweinen aus dem Alten Lager daran bereichert.
	}
	else
	{
		AI_Output(self,other,"Info_Org_6_DieLage_06_01");	//Mann! Wie soll's schon aussehen. Den ganzen Tag Reis fressen und darauf warten, dass sich 'ne Gelegenheit bietet, an Erz zu kommen.
		AI_Output(self,other,"Info_Org_6_DieLage_06_02");	//Dann kann man sich mal wieder richtig in der Kneipe mit Reisschnaps voll laufen lassen!
	};
};


instance Info_Org_6_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_6_Krautprobe_Condition;
	information = Info_Org_6_Krautprobe_Info;
	permanent = 1;
	description = "Ich hab ein bißchen Sumpfkraut dabei. Willst du was?";
};


func int Info_Org_6_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_6_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_6_Krautprobe_15_00");	//Ich hab ein bißchen Sumpfkraut dabei. Willst du was?
	if((Npc_HasItems(other,ItMiJoint_1) > 0) || (Npc_HasItems(other,ItMiJoint_2) > 0) || (Npc_HasItems(other,ItMiJoint_3) > 0))
	{
		if(Npc_HasItems(other,ItMiJoint_1))
		{
			B_GiveInvItems(other,self,ItMiJoint_1,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_2))
		{
			B_GiveInvItems(other,self,ItMiJoint_2,1);
		}
		else if(Npc_HasItems(other,ItMiJoint_3))
		{
			B_GiveInvItems(other,self,ItMiJoint_3,1);
		};
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_01");	//Klar. Hier sind 10 Erz. Gib her.
		AI_Output(self,other,"Info_Org_6_Krautprobe_06_02");	//Wenn du mal wieder was hast, komm vorbei.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_6_Krautprobe_No_Joint_06_00");	//Wo? Ich sehe kein Kraut.
	};
};


instance INFO_ORG_6_KAMPF(C_Info)
{
	nr = 90;
	condition = info_org_6_kampf_condition;
	information = info_org_6_kampf_info;
	permanent = 1;
	description = "(Kampf provozieren)";
};


func int info_org_6_kampf_condition()
{
	return 1;
};

func void info_org_6_kampf_info()
{
	AI_Output(other,self,"Info_Org_6_Kampf_15_00");	//Du könntest sicher mal wieder Schläge vertragen was?
	AI_Output(self,other,"Info_Org_6_Kampf_07_01");	//Dir werd' ich das Fell über die Ohren ziehen, kleiner.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Org_6(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
	info_org_6_kampf.npc = Hlp_GetInstanceID(slf);
	Info_Org_6_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

