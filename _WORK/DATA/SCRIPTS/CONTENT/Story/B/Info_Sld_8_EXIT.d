
instance Info_Sld_8_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Sld_8_EXIT_Condition;
	information = Info_Sld_8_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Sld_8_EXIT_Condition()
{
	return 1;
};

func void Info_Sld_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Sld_8_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Sld_8_EinerVonEuchWerden_Condition;
	information = Info_Sld_8_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "K�nnt ihr noch einen guten Mann brauchen?";
};


func int Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00");	//K�nnt ihr noch einen guten Mann brauchen?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01");	//Lee wird keine Leute bei den S�ldnern zulassen, die nicht schon 'ne Zeit lang hier waren und Erfahrung gesammelt haben.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02");	//Wenn du hier im Lager bleiben willst, musst du dich zuerst mit den Banditen rumschlagen.
};


instance Info_Sld_8_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Sld_8_WichtigePersonen_Condition;
	information = Info_Sld_8_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat hier das Sagen?";
};


func int Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Sld_8_WichtigePersonen_Info()
{
	var C_Npc Lee;
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00");	//Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01");	//Wir S�ldner folgen alle Lee. Er hat den Deal mit den Magiern gemacht - wir besch�tzen sie, und sie bringen uns hier raus.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02");	//Also f�hren die Magier das Lager?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03");	//Nein. Niemand f�hrt das Lager. Die meisten hier sind einfach M�nner, die im Alten Lager nicht bleiben konnten oder wollten.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04");	//Hier kocht jeder sein eigenes S�ppchen. Die Jungs sind sich nur in einem einig: Besser das ganze Erz auf einen Haufen sch�tten und in die Luft jagen, als es dem verdammten K�nig in den Rachen zu schieben!
	Lee = Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Sld_8_DasLager_Condition;
	information = Info_Sld_8_DasLager_Info;
	permanent = 1;
	description = "Was kannst du mir �ber dieses Lager erz�hlen?";
};


func int Info_Sld_8_DasLager_Condition()
{
	if(!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};

func void Info_Sld_8_DasLager_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00");	//Was kannst du mir �ber dieses Lager erz�hlen?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01");	//Pass auf dich auf, w�hrend du hier bist. Im Lager sind 'ne Menge Halsabschneider unterwegs.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02");	//Es gibt 'ne Reihe ungeschriebener Gesetze hier. Erstens: Nur die S�ldner kommen in den Bereich der Magier.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03");	//Zweitens: Wer versucht, an den Erzhaufen ranzukommen, ist ein toter Mann. Drittens: Ich w�rde nicht versuchen, in die Kneipe auf dem See zu gehen.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04");	//Die geh�rt n�mlich den Banditen und die sehen es nicht gerne, wenn gr�ne Jungs wie du da aufkreuzen.
	Cronos = Hlp_GetNpc(KDW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Sld_8_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Sld_8_DieLage_Condition;
	information = Info_Sld_8_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Sld_8_DieLage_Condition()
{
	return 1;
};

func void Info_Sld_8_DieLage_Info()
{
	var C_Npc Cronos;
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00");	//Wie sieht's aus?
	if(Npc_GetTrueGuild(other) == GIL_ORG)
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_02");	//Was willst du von mir, Bandit?
		AI_Output(self,other,"Info_Sld_8_DieLage_08_03");	//Lass blo� meine Sachen da wo sie sind, klar?
	}
	else if((Npc_GetTrueGuild(other) == GIL_GRD) || (Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_EBR))
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_04");	//Schlecht. Solange du mir in der Sonne stehst.
		AI_Output(self,other,"Info_Sld_8_DieLage_08_05");	//Also sieh' zu das du dich verpisst.
	}
	else if((Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_06");	//Du bist aus dem Sumpflager?
		AI_Output(self,other,"Info_Sld_8_DieLage_08_07");	//Sei vorsichtig, dass du dir nicht dein Sumpfkraut von den Banditen klauen l�sst.
	}
	else if(Npc_GetTrueGuild(other) == GIL_SLD)
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_08");	//Bist du meine Wachabl�se f�r heute?
		AI_Output(other,self,"Info_Sld_8_DieLage_08_09");	//Nein, bin ich nicht.
		AI_Output(self,other,"Info_Sld_8_DieLage_08_10");	//Verdammt und ich dachte ich k�nnte mir mal einen Schluck Bier am Lagerfeuer g�nnen.
		AI_Output(self,other,"Info_Sld_8_DieLage_08_11");	//Dann lasst mir wenigstens noch was �ber, ja? Hehe.
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_DieLage_08_01");	//Wie immer - wir passen auf, dass keiner den Magiern und dem Erz zu nahe kommt.
		Cronos = Hlp_GetNpc(KDW_604_Cronos);
		Cronos.aivar[AIV_FINDABLE] = TRUE;
	};
};


instance Info_Sld_8_Krautprobe(C_Info)
{
	nr = 5;
	condition = Info_Sld_8_Krautprobe_Condition;
	information = Info_Sld_8_Krautprobe_Info;
	permanent = 1;
	description = "Ich hab Sumpfkraut dabei - willst du was?";
};


func int Info_Sld_8_Krautprobe_Condition()
{
	if(((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS)) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00");	//Ich hab Sumpfkraut dabei - willst du was?
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
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01");	//Warum nicht. Gib mir was f�r 10 Erz.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02");	//Frag mal ein paar von den anderen Jungs, die wollen sicher auch was.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Sld_8_Krautprobe_No_Joint_08_00");	//Ich will erst das Kraut sehen. Du hast doch gar nichts dabei.
	};
};

func void B_AssignAmbientInfos_Sld_8(var C_Npc slf)
{
	B_AssignFindNpc_NC(slf);
	Info_Sld_8_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc = Hlp_GetInstanceID(slf);
	Info_Sld_8_Krautprobe.npc = Hlp_GetInstanceID(slf);
};

