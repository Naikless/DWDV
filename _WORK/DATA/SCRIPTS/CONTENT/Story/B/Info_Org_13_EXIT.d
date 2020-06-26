
instance Info_Org_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_13_EXIT_Condition;
	information = Info_Org_13_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Org_13_EXIT_Condition()
{
	return 1;
};

func void Info_Org_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Org_13_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_13_EinerVonEuchWerden_Condition;
	information = Info_Org_13_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Was muß ich tun, wenn ich mich dem Lager anschließen will?";
};


func int Info_Org_13_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00");	//Was muss ich tun, wenn ich mich dem Lager anschließen will?
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01");	//Geh auf die Felder und hilf den Bauern beim Reispflücken.
};


instance Info_Org_13_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_13_WichtigePersonen_Condition;
	information = Info_Org_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_13_WichtigePersonen_Info()
{
	var C_Npc Lee;
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01");	//Lee führt die Söldner an, wenn du DAS wissen wolltest. Aber ich bin kein Söldner und ich lasse mir von den Pennern auch bestimmt nichts sagen!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_13_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_13_DasLager_Condition;
	information = Info_Org_13_DasLager_Info;
	permanent = 1;
	description = "Ich will mehr über dieses Lager erfahren.";
};


func int Info_Org_13_DasLager_Condition()
{
	return 1;
};

func void Info_Org_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_13_DasLager_15_00");	//Ich will mehr über dieses Lager erfahren.
	AI_Output(self,other,"Info_Org_13_DasLager_13_01");	//Dann geh rein und schau es dir an. Solange du nicht einer von Gomez' Leuten bist, wird dich keiner aufhalten.
};


instance Info_Org_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_13_DieLage_Condition;
	information = Info_Org_13_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Org_13_DieLage_Condition()
{
	return 1;
};

func void Info_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_13_DieLage_15_00");	//Wie sieht's aus?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Org_13_DieLage_06_04");	//Lares hat dich aufgenommen was?
		AI_Output(self,other,"Info_Org_13_DieLage_06_05");	//Gut. Noch einer mehr, der uns hilft Gomez in die Suppe zu spucken. Hehe.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Org_13_DieLage_07_06");	//Mach das du wegkommst!
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Org_13_DieLage_06_08");	//Willst du mir was zu rauchen andrehen?
		AI_Output(self,other,"Info_Org_13_DieLage_06_09");	//Oder willst du mir was von der Lehre des Schläfers erzählen? Wenn ja, dann mach dich vom Acker.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Org_13_DieLage_06_10");	//Was will ein Söldner denn von mir?
		AI_Output(self,other,"Info_Org_13_DieLage_06_11");	//Ich bin auf meiner Seite der Höhle, keine Sorge. Aber dann sieh du wenigstens zu, dass du auch auf deiner bist.
	}
	else
	{
		AI_Output(self,other,"Info_Org_13_DieLage_13_01");	//Was willst DU denn von mir?
	};
};


instance Info_Org_13_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_13_Krautprobe_Condition;
	information = Info_Org_13_Krautprobe_Info;
	permanent = 1;
	description = "Du siehst aus, als wenn du etwas Sumpfkraut haben wolltest.";
};


func int Info_Org_13_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_13_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00");	//Du siehst aus, als wenn du etwas Sumpfkraut haben wolltest.
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
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01");	//Hast du was? Ich nehm einen Stengel für 10 Erz.
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02");	//Kannst jederzeit wieder kommen, Bruder.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_13_Krautprobe_No_Joint_13_00");	//Aber du hast nichts. Mach keine dummen Späße mit mir, klar?
	};
};


instance INFO_ORG_13_KAMPF(C_Info)
{
	nr = 90;
	condition = info_org_13_kampf_condition;
	information = info_org_13_kampf_info;
	permanent = 1;
	description = "(Kampf provozieren)";
};


func int info_org_13_kampf_condition()
{
	return 1;
};

func void info_org_13_kampf_info()
{
	AI_Output(other,self,"Info_Org_13_Kampf_15_00");	//Na? Wie wärs wenn ich dir mal ein paar auf' Maul haue?
	AI_Output(self,other,"Info_Org_13_Kampf_07_01");	//Klingt gut. Hehe. Allerdings werde ich DIR was auf's Maul hauen.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Org_13(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_DieLage.npc = Hlp_GetInstanceID(slf);
	info_org_13_kampf.npc = Hlp_GetInstanceID(slf);
	Info_Org_13_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

