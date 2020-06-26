
instance Info_Org_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Org_7_EXIT_Condition;
	information = Info_Org_7_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Org_7_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Org_7_EinerVonEuchWerden_Condition;
	information = Info_Org_7_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Was muß ich tun, wenn ich mich dem Lager anschließen will?";
};


func int Info_Org_7_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Org_7_EinerVonEuchWerden_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00");	//Was muss ich tun, wenn ich mich dem Lager anschließen will?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01");	//Du kannst dich unserer Bande anschließen. Aber dazu musst du beweisen, dass du gegen Gomez bist.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02");	//Und wie soll ich das machen?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03");	//Wenn ich du wäre, würde ich Lares irgendwas Wichtiges aus dem Alten Lager oder der Alten Mine bringen.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_7_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Org_7_WichtigePersonen_Condition;
	information = Info_Org_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer ist euer Anführer?";
};


func int Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Org_7_WichtigePersonen_Info()
{
	var C_Npc Lares;
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00");	//Wer ist euer Anführer?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01");	//Lares ist das Oberhaupt der Bande. Die meisten akzeptieren ihn.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02");	//Aber er sagt uns nicht, was wir machen sollen.
	Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Org_7_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Org_7_DasLager_Condition;
	information = Info_Org_7_DasLager_Info;
	permanent = 1;
	description = "Was kannst du mir über dieses Lager sagen?";
};


func int Info_Org_7_DasLager_Condition()
{
	return 1;
};

func void Info_Org_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00");	//Was kannst du mir über dieses Lager sagen?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01");	//Es ist 'ne Art Zweckgemeinschaft, die wir hier haben. Jeder macht im Grunde, was er will, aber wir sind so viele, dass Gomez uns nicht einfach ausrotten kann.
	if(Kapitel <= 4)
	{
		AI_Output(self,other,"Info_Org_7_DasLager_07_02");	//Obwohl er das sicher am liebsten tun würde.
		AI_Output(other,self,"Info_Org_7_DasLager_15_03");	//Was habt ihr mit Gomez zu schaffen?
		AI_Output(self,other,"Info_Org_7_DasLager_07_04");	//Wir stehlen ihm sein Zeug!
	}
	else if(Kapitel >= 5)
	{
		AI_Output(self,other,"Info_Org_7_DasLager_07_05");	//Das dachten die meisten von uns zumindest, bis er sich die Freie Mine unter den Nagel reißen wollte.
	};
};


instance Info_Org_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Org_7_DieLage_Condition;
	information = Info_Org_7_DieLage_Info;
	permanent = 1;
	description = "Was läuft denn so?";
};


func int Info_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00");	//Was läuft denn so?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Org_7_DieLage_06_04");	//Bist wohl neu in der Bande, was?
		AI_Output(self,other,"Info_Org_7_DieLage_06_05");	//Hehe. Vielleicht überfallen wir beide ja demnächst zusammen Gomez' Leute.
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Org_7_DieLage_07_06");	//Verpiss dich!
		AI_Output(self,other,"Info_Org_7_DieLage_07_07");	//Ich red' nicht mit Gomez' Leuten.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Org_7_DieLage_06_08");	//Siehst aus wie aus dem Lager der Sektenspinner.
		AI_Output(self,other,"Info_Org_7_DieLage_06_09");	//Du brauchst mit dem Mist vom Schläfer gar nicht erst anfangen, aber wenn du was zu rauchen hast, bin ich dein Mann.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Org_7_DieLage_06_10");	//Oh, einer von Lee's Leuten.
		AI_Output(self,other,"Info_Org_7_DieLage_06_11");	//Was ist los? Willst du mich kontrollieren, ob ich was von eurem Erz gestohlen hab?
		AI_Output(self,other,"Info_Org_7_DieLage_06_12");	//Keine Sorge man, ich weiß auch so wie ich an Erz komme.
	}
	else
	{
		AI_Output(self,other,"Info_Org_7_DieLage_07_01");	//Du bist wohl noch nicht lange hier, was?
		AI_Output(self,other,"Info_Org_7_DieLage_07_02");	//Die Magier bereiten sich schon seit Jahren auf die Sprengung des Erzhaufens vor. Es heißt, der große Tag ist nicht mehr weit entfernt.
		AI_Output(self,other,"Info_Org_7_DieLage_07_03");	//Zumindest sollte man das annehmen, wenn man sich den Riesenhaufen ansieht, den die Schürfer bis jetzt zusammengekratzt haben.
	};
};


instance Info_Org_7_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Org_7_Krautprobe_Condition;
	information = Info_Org_7_Krautprobe_Info;
	permanent = 1;
	description = "Willst du etwas Sumpfkraut?";
};


func int Info_Org_7_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Org_7_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00");	//Willst du etwas Sumpfkraut?
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
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01");	//Ich geb dir 10 Erz dafür - hier.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02");	//Wenn du mal wieder was loswerden willst, komm zu mir.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Org_7_Krautprobe_No_Joint_07_00");	//Wo? Ich sehe kein Kraut.
	};
};


instance INFO_ORG_7_KAMPF(C_Info)
{
	nr = 90;
	condition = info_org_7_kampf_condition;
	information = info_org_7_kampf_info;
	permanent = 1;
	description = "(Kampf provozieren)";
};


func int info_org_7_kampf_condition()
{
	return 1;
};

func void info_org_7_kampf_info()
{
	AI_Output(other,self,"Info_Org_7_Kampf_15_00");	//Ich glaub' dir hat schon lange keiner mehr so richtig auf's Maul gehauen.
	AI_Output(self,other,"Info_Org_7_Kampf_07_01");	//Was? Komm her du Penner. Dir zeig' ich wer hier wem auf's Maul haut.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Org_7(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);
	info_org_7_kampf.npc = Hlp_GetInstanceID(slf);
	Info_Org_7_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

