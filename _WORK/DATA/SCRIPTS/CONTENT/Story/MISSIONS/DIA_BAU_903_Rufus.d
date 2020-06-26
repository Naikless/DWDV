
instance DIA_Rufus_EXIT(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 999;
	condition = DIA_Rufus_EXIT_Condition;
	information = DIA_Rufus_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Rufus_EXIT_Condition()
{
	return 1;
};

func void DIA_Rufus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Rufus_Wasser(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 800;
	condition = Info_Rufus_Wasser_Condition;
	information = Info_Rufus_Wasser_Info;
	permanent = 1;
	description = "Lefty schickt mich. Ich hab' Wasser für dich.";
};


func int Info_Rufus_Wasser_Condition()
{
	if((Lefty_Mission == LOG_RUNNING) && Npc_HasItems(other,ItFo_Potion_Water_01) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return 1;
	};
};

func void Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00");	//Lefty schickt mich. Ich hab' Wasser für dich.
	if(Npc_HasItems(other,ItFo_Potion_Water_01) >= 1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01");	//Danke, Mann. Ich sterbe vor Durst.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
		AI_UseItem(self,ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt + 1;
		if(An_Bauern_verteilt >= DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay() + 1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00");	//Wasser! Hey, Mann! Du hast nichts mehr! Haben wieder alle was gekriegt bis auf mich?
	};
};


instance DIA_Rufus_Hello(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Hello_Condition;
	information = DIA_Rufus_Hello_Info;
	permanent = 0;
	description = "Hi! Ich bin neu hier. Wollte mal fragen, was hier so läuft.";
};


func int DIA_Rufus_Hello_Condition()
{
	return 1;
};

func void DIA_Rufus_Hello_Info()
{
	AI_Output(other,self,"DIA_Rufus_Hello_15_00");	//Hi! Ich bin neu hier. Wollte mal fragen, was hier so läuft.
	AI_Output(self,other,"DIA_Rufus_Hello_02_01");	//Frag jemand anderen. Ich arbeite den ganzen Tag auf den Feldern und krieg nichts von dem mit, was hier läuft.
	AI_Output(self,other,"DIA_Rufus_Hello_02_02");	//Mann, wie gerne würd' ich zum Reislord gehen und ihm sagen, er soll seinen Scheiß alleine machen!
};


instance DIA_Rufus_Why(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = DIA_Rufus_Why_Condition;
	information = DIA_Rufus_Why_Info;
	permanent = 0;
	description = "Wenn's dir nicht gefällt, warum arbeitest du dann hier? ";
};


func int DIA_Rufus_Why_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Why_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Why_15_00");	//Wenn's dir nicht gefällt, warum arbeitest du dann hier?
	AI_Output(self,other,"DIA_Rufus_Why_02_01");	//Es war am ersten Tag als ich hier war. Lefty, einer der Schläger, die für den Reislord arbeiten, kam zu mir und fragte mich, ob ich mal kurz auf den Reisfeldern helfen könnte.
	AI_Output(self,other,"DIA_Rufus_Why_02_02");	//Klar, hab' ich gesagt. Ich war neu und wollte mich nützlich machen.
	AI_Output(self,other,"DIA_Rufus_Why_02_03");	//Als ich mich am nächsten Tag von der Arbeit ausruhte, steht der Typ schon wieder vor mir.
	AI_Output(self,other,"DIA_Rufus_Why_02_04");	//'Du willst doch nicht deine Kollegen ganz alleine schuften lassen?', hat er gesagt.
	AI_Output(self,other,"DIA_Rufus_Why_02_05");	//Ich hab' ihm erklärt, dass ich kaputt bin vom Tag vorher, dass ich mich ausruhen muss und so. Aber er hat mir nicht zugehört.
	AI_Output(self,other,"DIA_Rufus_Why_02_06");	//Er hat mich am Kragen gepackt und auf die Felder geschleift.
	AI_Output(self,other,"DIA_Rufus_Why_02_07");	//Seit dem Tag stand er jeden Morgen vor meiner Tür - irgendwann bin ich dann von alleine gekommen - ich wollte keinen Ärger mit den Typen.
	AI_Output(self,other,"DIA_Rufus_Why_02_08");	//Das sind richtige Halsabschneider, mit denen legst du dich besser nicht an.
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance DIA_Rufus_Ricelord(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 2;
	condition = DIA_Rufus_Ricelord_Condition;
	information = DIA_Rufus_Ricelord_Info;
	permanent = 1;
	description = "Wer ist der Reislord?";
};


func int DIA_Rufus_Ricelord_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void DIA_Rufus_Ricelord_Info()
{
	var C_Npc Ricelord;
	AI_Output(other,self,"DIA_Rufus_Ricelord_15_00");	//Wer ist der Reislord?
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_01");	//Er war einer der Ersten hier. Hat das Lager mit gegründet und die Reisfelder angelegt.
	AI_Output(self,other,"DIA_Rufus_Ricelord_02_02");	//Heute steht er nur noch vor seinem Lagerhaus und streckt seine Wampe raus, der alte Fettsack!
	Ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;
};


instance DIA_RUFUS_NEEDHELP(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_needhelp_condition;
	information = dia_rufus_needhelp_info;
	permanent = 0;
	description = "Kann ich dir irgendwie helfen?";
};


func int dia_rufus_needhelp_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Rufus_Hello))
	{
		return 1;
	};
};

func void dia_rufus_needhelp_info()
{
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_01");	//Kann ich dir irgendwie helfen?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_02");	//Ich denke nicht nein... wobei, wenn du mich schon so fragst.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_03");	//Ich hätte da was zu tun für dich. Ich will das du dem Reislord und seinen Schlägern eine Lektion erteilst.
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_04");	//Was denn? Ich soll es mit allen gleichzeitig aufnehmen?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_05");	//Nein, nein. Du sollst denen nicht auf's Maul hauen. 
	AI_Output(other,self,"DIA_Rufus_NeedHelp_02_06");	//Sondern?
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_07");	//Sie sollen sich gegenseitig die Fresse polieren. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_08");	//Der Reislord besitzt eine Truhe, in der er einige Dinge aufbewahrt. Darunter einen wertvollen Ring. Ich will das du diesen aus der Truhe stiehlst.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_09");	//Anschliessend musst du dafür sorgen, dass Lefty irgendwie in den Besitz dieses Ringes kommt.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_10");	//Danach "erwähnst" du in einem Gespräch mit dem Reislord, dass Lefty im Besitz eines neuen Ringes ist.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_11");	//Ich freu' mich schon darauf anschliessend Leftys dummes Gesicht zu sehen. Hehe.
	AI_Output(self,other,"DIA_Rufus_NeedHelp_02_12");	//Achja, den Schlüssel zur Truhe des Reislords musst du dir irgendwie besorgen. Den hat er irgendwo in seinem Haus liegen.
	AI_StopProcessInfos(self);
	RIOT_RICELORD = LOG_RUNNING;
	Log_CreateTopic(CH1_RICELORD,LOG_MISSION);
	Log_SetTopicStatus(CH1_RICELORD,LOG_RUNNING);
	B_LogEntry(CH1_RICELORD,"Rufus, ein Bauer der auf den Feldern des Neuen Lagers arbeitet, will dem Reislord und seinen Schlägern eine Lektion erteilen. Er will, dass ich mir den Schlüssel für die Truhe des Reislords besorge. Nachdem ich das geschafft habe, soll ich einen wertvollen Ring aus der Truhe nehmen und diesen Lefty in die Taschen stecken. Anschliessend soll ich den Reislord darüber informieren und Lefty als - Dieb - enttarnen.");
};


instance DIA_RUFUS_DONE(C_Info)
{
	npc = BAU_903_Rufus;
	nr = 1;
	condition = dia_rufus_done_condition;
	information = dia_rufus_done_info;
	permanent = 0;
	description = "Ich hab' mich um Lefty gekümmert.";
};


func int dia_rufus_done_condition()
{
	if(Npc_KnowsInfo(hero,dia_ricelord_lefty))
	{
		return 1;
	};
};

func void dia_rufus_done_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Rufus_Done_02_01");	//Ich hab' mich um Lefty gekümmert.
	AI_Output(self,other,"DIA_Rufus_Done_02_02");	//Das hab' ich schon gesehen. Hehe.
	AI_Output(self,other,"DIA_Rufus_Done_02_03");	//Endlich hat der Mistkerl da bekommen, was er verdient hat.
	AI_Output(self,other,"DIA_Rufus_Done_02_06");	//Hier, ich hab' mir etwas Reisschnaps besorgt, den ich dir geben kann.
	AI_Output(other,self,"DIA_Rufus_Done_02_07");	//Danke, mach's gut!
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItFoMutton,1);
		B_GiveInvItems(self,other,ItFoMutton,1);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItFoApple,2);
		B_GiveInvItems(self,other,ItFoApple,2);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,5);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,5);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItMw_1H_Scythe_01,1);
		B_GiveInvItems(self,other,ItMw_1H_Scythe_01,1);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItMw_1H_Sword_Short_02,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_Short_02,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMiNugget,40);
		B_GiveInvItems(self,other,ItMiNugget,40);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItFoBooze,3);
		B_GiveInvItems(self,other,ItFoBooze,3);
	};
	AI_StopProcessInfos(self);
	RIOT_RICELORD = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_RICELORD,LOG_SUCCESS);
	B_LogEntry(CH1_RICELORD,"Rufus war begeistert und freute sich, dass Lefty das bekommen hat, was er verdient hat. Sogar eine Belohnung winkte mir für meine Arbeit.");
	B_GiveXP(XP_LEFTYRICELORD);
};

