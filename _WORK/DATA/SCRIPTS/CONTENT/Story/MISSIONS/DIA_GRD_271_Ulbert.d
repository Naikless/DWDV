
instance GRD_271_ULBERT_Exit(C_Info)
{
	npc = GRD_271_Ulbert;
	nr = 999;
	condition = GRD_271_ULBERT_Exit_Condition;
	information = GRD_271_ULBERT_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_KEY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_KEY_Condition;
	information = GRD_271_ULBERT_KEY_Info;
	important = 0;
	permanent = 0;
	description = "Was ist in dem Lagerschuppen?";
};


func int GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};

func void GRD_271_ULBERT_KEY_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_KEY_Info_15_01");	//Was ist in dem Lagerschuppen?
	AI_Output(self,other,"GRD_271_ULBERT_KEY_Info_07_02");	//Das geht dich nichts an.
};


instance GRD_271_ULBERT_TRICK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_TRICK_Condition;
	information = GRD_271_ULBERT_TRICK_Info;
	important = 0;
	permanent = 0;
	description = "So lange herumstehen macht bestimmt durstig";
};


func int GRD_271_ULBERT_TRICK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_key))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_TRICK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_TRICK_Info_15_01");	//So lange herumstehen macht bestimmt durstig.
	AI_Output(self,other,"GRD_271_ULBERT_TRICK_Info_07_02");	//Und wie! Mann, ich könnte wohl den ein oder anderen Schluck vertragen. Hast du was dabei?
	Log_CreateTopic(CH2_StorageShed,LOG_MISSION);
	Log_SetTopicStatus(CH2_StorageShed,LOG_RUNNING);
	B_LogEntry(CH2_StorageShed,"Der Gardist Ulbert hält Wache vor dem Lagerschuppen der Alten Mine. Ich sollte ihm was zu trinken besorgen!");
};


instance GRD_271_ULBERT_DRINK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRINK_Condition;
	information = GRD_271_ULBERT_DRINK_Info;
	important = 0;
	permanent = 0;
	description = "(Einen ausgeben)";
};


func int GRD_271_ULBERT_DRINK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_trick) && (Npc_HasItems(hero,ItFoBeer) || Npc_HasItems(hero,ItFoWine) || Npc_HasItems(hero,ItFoBooze)))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRINK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRINK_Info_15_01");	//Hier, trink einen auf mein Wohl!
	AI_Output(self,other,"GRD_271_ULBERT_DRINK_Info_07_02");	//Danke.
	if(Npc_HasItems(hero,ItFoBeer))
	{
		B_GiveInvItems(hero,self,ItFoBeer,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBeer);
	}
	else if(Npc_HasItems(hero,ItFoWine))
	{
		B_GiveInvItems(hero,self,ItFoWine,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoWine);
	}
	else if(Npc_HasItems(hero,ItFoBooze))
	{
		B_GiveInvItems(hero,self,ItFoBooze,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFoBooze);
	};
};


instance GRD_271_ULBERT_DRUNK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_DRUNK_Condition;
	information = GRD_271_ULBERT_DRUNK_Info;
	important = 0;
	permanent = 0;
	description = "Gibt es denn JETZT in dem Schuppen etwas besonderes?";
};


func int GRD_271_ULBERT_DRUNK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drink))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_DRUNK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_01");	//Gibt's denn JETZT in dem Schuppen was Besonderes?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_02");	//Ein paar Truhen, in denen wir Vorräte lagern. Allerdings ist der Schlüssel verschwunden.
	AI_Output(other,self,"GRD_271_ULBERT_DRUNK_Info_15_03");	//Verschwunden?
	AI_Output(self,other,"GRD_271_ULBERT_DRUNK_Info_07_04");	//Ich wette, Aleph hat da seine Finger im Spiel. Dem Kerl kann man nicht trauen.
	B_LogEntry(CH2_StorageShed,"Nachdem ich Ulbert was zu trinken  gegeben habe, erzählte er mir, dass er den Schlüssel für die Truhen vermißt. Angeblich soll Aleph der Buddler seine Finger im Spiel haben!");
};


instance GRD_271_ULBERT_LOCK(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_LOCK_Condition;
	information = GRD_271_ULBERT_LOCK_Info;
	important = 0;
	permanent = 0;
	description = "(Ulbert weglocken)";
};


func int GRD_271_ULBERT_LOCK_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_drunk))
	{
		return 1;
	};
};

func void GRD_271_ULBERT_LOCK_Info()
{
	AI_Output(other,self,"GRD_271_ULBERT_LOCK_Info_15_01");	//Hör zu, Ian und die anderen sitzen unten und lassen sich gebratenes Fleisch schmecken.
	AI_Output(self,other,"GRD_271_ULBERT_LOCK_Info_07_02");	//Was? Ohne mich? Na, ich werde mir meinen Anteil schon holen!
	B_LogEntry(CH2_StorageShed,"Ulbert ließ sich sehr leicht vom Lagerschuppen weglocken. Er scheint nicht gerade der Hellste zu sein!");
	Npc_ExchangeRoutine(self,"away");
	AI_StopProcessInfos(self);
};


instance GRD_271_ULBERT_ANGRY(C_Info)
{
	npc = GRD_271_Ulbert;
	condition = GRD_271_ULBERT_ANGRY_Condition;
	information = GRD_271_ULBERT_ANGRY_Info;
	important = 1;
	permanent = 0;
};


func int GRD_271_ULBERT_ANGRY_Condition()
{
	if(Npc_KnowsInfo(hero,grd_271_ulbert_lock) && (Npc_GetDistToWP(hero,"OM_CAVE1_49") < 600))
	{
		return TRUE;
	};
};

func void GRD_271_ULBERT_ANGRY_Info()
{
	AI_Output(self,other,"GRD_271_ULBERT_ANGRY_Info_07_01");	//Hey du, es gab gar kein gebratenes Fleisch!
	AI_Output(other,self,"GRD_271_ULBERT_ANGRY_Info_15_02");	//Oh ... äh ...  ... da muss ich mich wohl geirrt haben! Schönen Tag noch!
	B_GiveXP(XP_LureUlbertAway);
	B_LogEntry(CH2_StorageShed,"Habe Ulbert wiedergetroffen. Oh Mann, er hat nicht mal jetzt kapiert, dass ich ihn reingelegt habe. Wirklich naiv der Junge!");
	Log_SetTopicStatus(CH2_StorageShed,LOG_SUCCESS);
	Npc_ExchangeRoutine(self,"start");
	AI_StopProcessInfos(self);
};

