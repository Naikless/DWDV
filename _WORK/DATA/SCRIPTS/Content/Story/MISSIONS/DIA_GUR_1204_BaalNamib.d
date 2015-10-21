
instance DIA_BaalNamib_EXIT(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 999;
	condition = DIA_BaalNamib_EXIT_Condition;
	information = DIA_BaalNamib_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalNamib_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalNamib_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalNamib_NoTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_NoTalk_Condition;
	information = DIA_BaalNamib_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalNamib_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalNamib_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY))
	{
		return 1;
	};
};

func void DIA_BaalNamib_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalNamib_NoTalk);
	Info_AddChoice(DIA_BaalNamib_NoTalk,DIALOG_ENDE,DIA_BaalNamib_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Alles, klar, Alter?",DIA_BaalNamib_NoTalk_Imp);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Der Schl�fer sei mit dir!",DIA_BaalNamib_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalNamib_NoTalk,"Hi! Ich bin neu hier!",DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Hi_15_00");	//Hi! Ich bin neu hier!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Hi_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Sleeper_15_00");	//Der Schl�fer sei mit dir!
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Sleeper_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalNamib_NoTalk_Imp_15_00");	//Alles, klar, Alter?
	AI_Output(self,other,"DIA_BaalNamib_NoTalk_Imp_02_01");	//
	BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


var int namib_gotocalom;

instance DIA_BaalNamib_FirstTalk(C_Info)
{
	npc = GUR_1204_BaalNamib;
	nr = 1;
	condition = DIA_BaalNamib_FirstTalk_Condition;
	information = DIA_BaalNamib_FirstTalk_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalNamib_FirstTalk_Condition()
{
	if(BaalNamib_Ansprechbar == TRUE)
	{
		return 1;
	};
};

func void DIA_BaalNamib_FirstTalk_Info()
{
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_02_01");	//Der Schl�fer hat dich erw�hlt. Ist es dir wirklich ernst mit deinem Wunsch, uns beizutreten?
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"NICHTS SAGEN",DIA_BaalNamib_FirstTalk_Mute);
	Info_AddChoice(DIA_BaalNamib_FirstTalk,"Ja, ich will den Weg des Schl�fers beschreiten!",DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Mute_15_00");	//
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Mute_02_01");	//Nun?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00");	//Ja, ich will den Weg des Schl�fers beschreiten!
	AI_Output(self,other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01");	//Geh zu Cor Kalom. Sag ihm, ich schicke ihm einen wahren Anh�nger des Glaubens!
	Info_ClearChoices(DIA_BaalNamib_FirstTalk);
	NAMIB_GOTOCALOM = TRUE;
	B_LogEntry(CH1_JoinPsi,"Lester's Schauspiel hat funktioniert. Baal Namib hat mir mir gesprochen und ist �berzeugt, dass ich nun ein wahrer Anh�nger des Glaubens bin. Ich soll nun den Guru Cor Kalom in seinem Alchemielabor aufsuchen!");
	B_GiveXP(XP_ImpressBaalNamib);
};


instance GUR_1204_NAMIB_BETTERARMOR(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_namib_betterarmor_condition;
	information = gur_1204_namib_betterarmor_info;
	important = 0;
	permanent = 1;
	description = "Ich m�chte eine bessere R�stung haben.";
};


func int gur_1204_namib_betterarmor_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void gur_1204_namib_betterarmor_info()
{
	AI_Output(hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");	//Ich m�chte eine bessere R�stung haben.
	AI_Output(self,other,"GUR_1204_Namib_BETTERARMOR_Info_06_02");	//Wenn du bewiesen hast das du es Wert bist und du eine gro�z�gige Spende leisten kannst...
	Info_ClearChoices(gur_1204_namib_betterarmor);
	Info_AddChoice(gur_1204_namib_betterarmor,DIALOG_BACK,gur_1204_namib_betterarmor_back);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBHEAVYNOVICE,VALUE_NOV_ARMOR_H),gur_1204_namib_betterarmor_h);
	Info_AddChoice(gur_1204_namib_betterarmor,B_BuildBuyArmorString(NAME_NAMIBNOVICE,VALUE_NOV_ARMOR_M),gur_1204_namib_betterarmor_m);
};

func void gur_1204_namib_betterarmor_m()
{
	AI_Output(hero,self,"GUR_1204_Namib_BETTERARMOR_Info_M_13_02");	//Ich m�chte die Novizenrobe haben.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_01_05");	//Es ist noch nicht an der Zeit f�r dich, die Novizenrobe zu tragen.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_NOV_ARMOR_M)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Komm wieder, wenn du genug Erz hast.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Diese R�stung sch�tzt deinen K�rper, wie der Schl�fer deinen Geist sch�tzt!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NOV_ARMOR_M);
		B_GiveInvItems(self,hero,nov_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_h()
{
	AI_Output(hero,self,"GRD_219_BaalNamib_BETTERARMOR_Info_H_15_01");	//Ich m�chte die schwere Novizenr�stung haben.
	if(Kapitel < 2)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");	//Es ist noch nicht an der Zeit f�r dich, die schwere R�stung der Novizen zu tragen.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_NOV_ARMOR_H)
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");	//Komm wieder, wenn du genug Erz hast.
	}
	else
	{
		AI_Output(self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");	//Diese R�stung sch�tzt deinen K�rper, wie der Schl�fer deinen Geist sch�tzt!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NOV_ARMOR_H);
		B_GiveInvItems(self,hero,nov_armor_h,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(gur_1204_namib_betterarmor);
};

func void gur_1204_namib_betterarmor_back()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Ich hab' es mir anders �berlegt!
	Info_ClearChoices(gur_1204_namib_betterarmor);
};


instance Info_BaalNamib_BROTHERHOOD(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = Info_BaalNamib_BROTHERHOOD_Condition;
	information = Info_BaalNamib_BROTHERHOOD_Info;
	important = 0;
	permanent = 0;
	description = "Gibt es Aufgaben, die ich f�r die Bruderschaft erledigen kann?";
};


func int Info_BaalNamib_BROTHERHOOD_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(hero,PC_Psionic_SEND) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void Info_BaalNamib_BROTHERHOOD_Info()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_15_01");	//Gibt es Aufgaben, die ich f�r die Bruderschaft erledigen kann?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_02_02");	//Unser Meister, der weise Y'Berion, schickt nach einem Novizen. Nun, da du ein Bruder der Gemeinschaft geworden bist, geh zu ihm und biete ihm deine Hilfe an.
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"In Ordnung, ich werde ihn sofort aufsuchen",Info_BaalNamib_BROTHERHOOD_OK);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Wo finde ich Y'Berion?",Info_BaalNamib_BROTHERHOOD_YBWO);
	Info_AddChoice(Info_BaalNamib_BROTHERHOOD,"Wei�t du, was ich f�r Y'berion erledigen soll?",Info_BaalNamib_BROTHERHOOD_YBWAS);
};

func void Info_BaalNamib_BROTHERHOOD_YBWO()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01");	//Wo finde ich Y'Berion?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02");	//Er h�lt sich im Inneren des Tempelbergs auf. Wie immer.
};

func void Info_BaalNamib_BROTHERHOOD_YBWAS()
{
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01");	//Wei�t du, was ich f�r Y'Berion erledigen soll?
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02");	//Eine gro�e Beschw�rung wird stattfinden. Allerdings brauchen wir daf�r einen magischen Gegenstand.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03");	//Y'Berion sucht M�nner, die mutig genug sind, ihm dieses Artefakt zu bringen.
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04");	//Klingt einfach.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05");	//Wenn es einfach w�re, h�tten wir den Gegenstand schon. Sprich erst mal mit Y'Berion. Er wird dir alles erkl�ren.
};

func void Info_BaalNamib_BROTHERHOOD_OK()
{
	var C_Npc YBerion;
	AI_Output(other,self,"Info_BaalNamib_BROTHERHOOD_OK_15_01");	//In Ordnung, ich werde ihn sofort aufsuchen.
	AI_Output(self,other,"Info_BaalNamib_BROTHERHOOD_OK_02_02");	//M�ge der Schl�fer dich besch�tzen.
	Info_ClearChoices(Info_BaalNamib_BROTHERHOOD);
	Log_CreateTopic(CH2_Focus,LOG_MISSION);
	Log_SetTopicStatus(CH2_Focus,LOG_RUNNING);
	B_LogEntry(CH2_Focus,"Baal Namib schickte mich zu Y'Berion um f�r ihn ein Artefakt zu suchen, dass die Bruderschaft f�r eine gro�e Anrufung ben�tigt. Wenn ich den Tempelwachen erz�hle, dass Baal Namib mich schickt, werden sie mich passieren lassen.");
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};


instance GUR_1204_BAALNAMIB_GURAUFNAHME(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = gur_1204_baalnamib_guruaufnahme_condition;
	information = gur_1204_baalnamib_guruaufnahme_info;
	important = 1;
	permanent = 0;
};


func int gur_1204_baalnamib_guruaufnahme_condition()
{
	if(((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_NOV) && (Npc_GetDistToNpc(hero,self) < 1000) && Npc_KnowsInfo(hero,DIA_BaalTondral_SendToKalom) && Npc_KnowsInfo(hero,DIA_BaalTyon_Vision) && Npc_KnowsInfo(hero,dia_baallukor_hypnoticteacher) && Npc_KnowsInfo(hero,DIA_BaalNamib_FirstTalk) && Npc_KnowsInfo(hero,DIA_BaalCadar_SleepSpell) && Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		return TRUE;
	};
};

func void gur_1204_baalnamib_guruaufnahme_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_15_01");	//Warte einen Moment!
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_15_02");	//Deine Taten in der Mine haben uns gezeigt, dass der Schl�fer mit dir ist.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_15_03");	//Dir wird die Ehre zuteil, einen besonderen Platz in unserer Gemeinschaft einzunehmen.
	AI_Output(self,other,"Gur_1204_BaalNamib_GURAUFNAHME_Info_15_04");	//Begib dich zu Y'Berion, er wird dir mehr dazu erz�hlen.
	Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
	B_LogEntry(GE_BECOMEGURU,"Baal Namib erz�hlte mir, dass der Schl�fer mich erw�hlt h�tte und mir die Ehre zuteil wird, einen besonderen Platz im Lager der Bruderschaft einzunehmen. Ich soll mich zu Y'Berion begeben, er k�nne mir mehr erz�hlen.");
};


instance INFO_BAALNAMIB_TATTOOS(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_tattoos_condition;
	information = info_baalnamib_tattoos_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_tattoos_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_baalnamib_tattoos_info()
{
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_01");	//Wie ich sehe, hat dich Cor Kalom zu mir geschickt.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_02_01");	//Worum geht's denn?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_02");	//Es geht um ein Ritual. Ein Ritual mit dem du deine Zugeh�rigkeit zur Bruderschaft besiegeln wirst.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_03");	//Jeder neue Anh�nger unserer Gemeinschaft nimmt an einem solchen Ritual teil.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_04");	//Bevor wir jedoch beginnen, muss ich dir allerdings noch eine letzte Frage stellen.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_15_05");	//Warum hast du dich f�r den Weg des Schl�fers entschieden?
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"Weil...",info_baalnamib_tattoos_weil);
};

func void info_baalnamib_tattoos_weil()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	Info_AddChoice(info_baalnamib_tattoos,"...mich das Kraut davon �berzeugt hatte.",info_baalnamib_tattoos_kraut);
	Info_AddChoice(info_baalnamib_tattoos,"...ich wusste das ich in den anderen Lagern niemals frei sein kann.",info_baalnamib_tattoos_frei);
	Info_AddChoice(info_baalnamib_tattoos,"...es sich einfach so ergeben hatte. ",info_baalnamib_tattoos_ergeben);
	Info_AddChoice(info_baalnamib_tattoos,"...ich den Schl�fer als meinen wahren Erl�ser erkannt habe.",info_baalnamib_tattoos_erl�ser);
	Info_AddChoice(info_baalnamib_tattoos,"...ich keine andere Wahl hatte.",info_baalnamib_tattoos_wahl);
	Info_AddChoice(info_baalnamib_tattoos,"...ich eine Vision vom Schl�fer empfing.",info_baalnamib_tattoos_vision);
};

func void info_baalnamib_tattoos_kraut()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE1 = TRUE;
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Kraut_02_01");	//Weil mich das Kraut davon �berzeugt hatte.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_01");	//Dann hoffe ich, dass dich das Kraut auch dem Schl�fer n�her bringen wird.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_02");	//Wir werden nun das Ritual durchf�hren, was dich an dem Schicksal unser aller binden wird.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_03");	//Hier ist ein Trank aus dem Sekret des Schl�fers. Trinke ihn, bevor wir uns in Meditation begeben.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_04");	//Nimm anschlie�end deinen Platz neben mir ein.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Kraut_02_02");	//Wie du w�nschst, Meister.
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_02");
	AI_TurnToNpc(hero,self);
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Kraut_02_03");	//Was ist das f�r ein Portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_05");	//Dieses Portal ist ein heiliges Artefakt unserer Bruderschaft und wird es dir erm�glichen dem Schl�fer nahe zu sein.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_06");	//Au�erdem wird es dir die Zeichen des Schl�fers auf den K�rper setzen.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_07");	//Durch diese Zeichen, wirst du als ein Diener des Schl�fers erkannt werden.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Kraut_15_08");	//Lass uns nun mit dem Ritual beginnen.
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_frei()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE2 = TRUE;
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Frei_02_01");	//Weil ich wusste das ich in den anderen Lagern niemals frei sein kann.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_01");	//Gut. Der Schl�fer wird uns den Weg in die Freiheit weisen.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_02");	//Wir werden nun das Ritual durchf�hren, was dich an dem Schicksal unser aller binden wird.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_03");	//Hier ist ein Trank aus dem Sekret des Schl�fers. Trinke ihn, bevor wir uns in Meditation begeben.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_04");	//Nimm anschlie�end deinen Platz neben mir ein.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Frei_02_02");	//Wie du w�nschst, Meister.
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_02");
	AI_TurnToNpc(hero,self);
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Frei_02_03");	//Was ist das f�r ein Portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_05");	//Dieses Portal ist ein heiliges Artefakt unserer Bruderschaft und wird es dir erm�glichen dem Schl�fer nahe zu sein.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_06");	//Au�erdem wird es dir die Zeichen des Schl�fers auf den K�rper setzen.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_07");	//Durch diese Zeichen, wirst du als ein Diener des Schl�fers erkannt werden.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Frei_15_08");	//Lass uns nun mit dem Ritual beginnen.
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_ergeben()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE3 = TRUE;
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Ergeben_02_01");	//Weil es sich einfach so ergeben hatte.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_01");	//Vielleicht wird sich mit der Zeit auch der Kontakt mit dem Schl�fer ergeben.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_02");	//Wir werden nun das Ritual durchf�hren, was dich an dem Schicksal unser aller binden wird.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_03");	//Hier ist ein Trank aus dem Sekret des Schl�fers. Trinke ihn, bevor wir uns in Meditation begeben.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_04");	//Nimm anschlie�end deinen Platz neben mir ein.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Ergeben_02_02");	//Wie du w�nschst, Meister.
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_02");
	AI_TurnToNpc(hero,self);
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Ergeben_02_03");	//Was ist das f�r ein Portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_05");	//Dieses Portal ist ein heiliges Artefakt unserer Bruderschaft und wird es dir erm�glichen dem Schl�fer nahe zu sein.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_06");	//Au�erdem wird es dir die Zeichen des Schl�fers auf den K�rper setzen.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_07");	//Durch diese Zeichen, wirst du als ein Diener des Schl�fers erkannt werden.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Ergeben_15_08");	//Lass uns nun mit dem Ritual beginnen.
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_erl�ser()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE4 = TRUE;
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Erl�ser_02_01");	//Weil ich den Schl�fer als meinen wahren Erl�ser erkannt habe.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_01");	//Dann bist du ein wahrer Anh�nger unseres Glaubens und vor dir liegt ein Pfad voller Erkenntnis.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_02");	//Wir werden nun das Ritual durchf�hren, was dich an dem Schicksal unser aller binden wird.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_03");	//Hier ist ein Trank aus dem Sekret des Schl�fers. Trinke ihn, bevor wir uns in Meditation begeben.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_04");	//Nimm anschlie�end deinen Platz neben mir ein.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Erl�ser_02_02");	//Wie du w�nschst, Meister.
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_02");
	AI_TurnToNpc(hero,self);
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Erl�ser_02_03");	//Was ist das f�r ein Portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_05");	//Dieses Portal ist ein heiliges Artefakt unserer Bruderschaft und wird es dir erm�glichen dem Schl�fer nahe zu sein.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_06");	//Au�erdem wird es dir die Zeichen des Schl�fers auf den K�rper setzen.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_07");	//Durch diese Zeichen, wirst du als ein Diener des Schl�fers erkannt werden.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Erl�ser_15_08");	//Lass uns nun mit dem Ritual beginnen.
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_wahl()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE5 = TRUE;
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Wahl_02_01");	//Weil ich keine andere Wahl hatte.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_01");	//Ich hoffe, dass du auch noch die Erkenntnis finden wirst, dass man als Anh�nger unseres Glaubens besser lebt, als an jedem anderen Ort in der Kolonie.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_02");	//Wir werden nun das Ritual durchf�hren, was dich an dem Schicksal unser aller binden wird.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_03");	//Hier ist ein Trank aus dem Sekret des Schl�fers. Trinke ihn, bevor wir uns in Meditation begeben.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_04");	//Nimm anschlie�end deinen Platz neben mir ein.
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Wahl_02_02");	//Wie du w�nschst, Meister.
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_02");
	AI_TurnToNpc(hero,self);
	AI_Output(other,self,"Info_BaalNamib_TATTOOS_Wahl_02_03");	//Was ist das f�r ein Portal?
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_05");	//Dieses Portal ist ein heiliges Artefakt unserer Bruderschaft und wird es dir erm�glichen dem Schl�fer nahe zu sein.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_06");	//Au�erdem wird es dir die Zeichen des Schl�fers auf den K�rper setzen.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_07");	//Durch diese Zeichen, wirst du als ein Diener des Schl�fers erkannt werden.
	AI_Output(self,other,"Info_BaalNamib_TATTOOS_Wahl_15_08");	//Lass uns nun mit dem Ritual beginnen.
	AI_StopProcessInfos(self);
};

func void info_baalnamib_tattoos_vision()
{
	Info_ClearChoices(info_baalnamib_tattoos);
	HERO_FACE6 = TRUE;
	AI_Output(other,self,"Info_BaalNamib_VISION_02_01");	//Weil ich eine Vision vom Schl�fer empfing.
	AI_Output(self,other,"Info_BaalNamib_VISION_15_01");	//Dann hat dich der Schl�fer erw�hlt uns beizutreten. Dein Schicksal wird sich schon bald erf�llen.
	AI_Output(self,other,"Info_BaalNamib_VISION_15_02");	//Wir werden nun das Ritual durchf�hren, was dich an dem Schicksal unser aller binden wird.
	AI_Output(self,other,"Info_BaalNamib_VISION_15_03");	//Hier ist ein Trank aus dem Sekret des Schl�fers. Trinke ihn, bevor wir uns in Meditation begeben.
	AI_Output(self,other,"Info_BaalNamib_VISION_15_04");	//Nimm anschlie�end deinen Platz neben mir ein.
	AI_Output(other,self,"Info_BaalNamib_VISION_02_02");	//Wie du w�nschst, Meister.
	CreateInvItem(self,itfo_potion_elixier_crawler);
	B_GiveInvItems(self,hero,itfo_potion_elixier_crawler,1);
	AI_UseItem(hero,itfo_potion_elixier_crawler);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoWP(hero,"WP_PSI_RITUAL_SWAMP_02");
	AI_TurnToNpc(hero,self);
	AI_Output(other,self,"Info_BaalNamib_VISION_02_03");	//Was ist das f�r ein Portal?
	AI_Output(self,other,"Info_BaalNamib_VISION_15_05");	//Dieses Portal ist ein heiliges Artefakt unserer Bruderschaft und wird es dir erm�glichen dem Schl�fer nahe zu sein.
	AI_Output(self,other,"Info_BaalNamib_VISION_15_06");	//Au�erdem wird es dir die Zeichen des Schl�fers auf den K�rper setzen.
	AI_Output(self,other,"Info_BaalNamib_VISION_15_07");	//Durch diese Zeichen, wirst du als ein Diener des Schl�fers erkannt werden.
	AI_Output(self,other,"Info_BaalNamib_VISION_15_08");	//Lass uns nun mit dem Ritual beginnen.
	AI_StopProcessInfos(self);
};


instance INFO_BAALNAMIB_BEGINNING(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_beginning_condition;
	information = info_baalnamib_beginning_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_beginning_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_tattoos))
	{
		return TRUE;
	};
};

func void info_baalnamib_beginning_info()
{
	var C_Npc templer_1;
	var C_Npc templer_2;
	templer_1 = Hlp_GetNpc(tpl_5051_templer);
	templer_2 = Hlp_GetNpc(tpl_5052_templer);
	AI_PlayAniBS(templer_1,"T_STAND_2_PRAY",BS_SIT);
	AI_PlayAniBS(templer_2,"T_STAND_2_PRAY",BS_SIT);
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_01");	//Schl�fer, ich bringe dir einen Diener.
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_02");	//Er hat bewiesen, dass er w�rdig ist und sollte bereit sein dir zu dienen.
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_03");	//Er ist ein wahrer Anh�nger des Glaubens und will wie wir alle von diesem Ort befreit werden.
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_04");	//Weise ihm den Weg und sch�tze seinen Geist vor allerlei Gefahren.
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_05");	//Denn er soll von nun an ein Teil dieser Gemeinschaft sein.
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_06");	//Sprich mir nach.
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_07");	//Schl�fer ich unterwerfe mich hiermit...
	AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_01");	//Schl�fer ich unterwerfe mich hiermit...
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_08");	//...und bin bereit dir f�r alle Zeit zu dienen...
	AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_02");	//...und bin bereit dir f�r alle Zeit zu dienen...
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_09");	//...denn meine Seele, wird nur durch deine Macht befreit werden...
	AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_03");	//...denn meine Seele, wird nur durch deine Macht befreit werden...
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_10");	//...weise mir den Weg in die Freiheit und erleuchte mich...
	AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_04");	//...weise mir den Weg in die Freiheit und erleuchte mich...
	AI_Output(self,other,"Info_BaalNamib_BEGINNING_15_11");	//...denn dein Weg, ist der Weg der Freiheit.
	AI_Output(other,self,"Info_BaalNamib_BEGINNING_01_05");	//...denn dein Weg, ist der Weg der Freiheit.
	AI_StopProcessInfos(self);
};


instance INFO_BAALNAMIB_WILLKOMMEN(C_Info)
{
	npc = GUR_1204_BaalNamib;
	condition = info_baalnamib_willkommen_condition;
	information = info_baalnamib_willkommen_info;
	important = 1;
	permanent = 0;
};


func int info_baalnamib_willkommen_condition()
{
	if(Npc_KnowsInfo(hero,info_baalnamib_beginning))
	{
		return TRUE;
	};
};

func void info_baalnamib_willkommen_info()
{
	var C_Npc templer_1;
	var C_Npc templer_2;
	templer_1 = Hlp_GetNpc(tpl_5051_templer);
	templer_2 = Hlp_GetNpc(tpl_5052_templer);
	Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
	if(HERO_FACE1 == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",124,2,-1);
	}
	else if(HERO_FACE2 == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",118,2,-1);
	}
	else if(HERO_FACE3 == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",122,2,-1);
	}
	else if(HERO_FACE4 == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",121,2,-1);
	}
	else if(HERO_FACE5 == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",123,2,-1);
	}
	else if(HERO_FACE6 == TRUE)
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",1,1,"HUM_HEAD_BALD",125,2,-1);
	};
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_01");	//Ich hei�e dich in der Bruderschaft des Schl�fers willkommen.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_02");	//Vor dir liegt ein langer aber lohnender Weg.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_03");	//Du hast die richtige Wahl getroffen.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_04");	//Die Zeit wird zeigen, welches Schicksal der Schl�fer f�r dich vorgesehen hat.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_05");	//Vielleicht wirst auch du ein Auserw�hlter des Schl�fers, wie ich es bin.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_06");	//Oder du wirst zum H�ter des Lagers berufen, wie Cor Angar es ist.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_07");	//Wir werden es sehen.
	AI_Output(self,other,"Info_BaalNamib_WILLKOMMEN_15_08");	//M�ge der Schl�fer �ber dich wachen, Novize.
	AI_PlayAniBS(templer_1,"T_PRAY_2_STAND",BS_STAND);
	AI_PlayAniBS(templer_2,"T_PRAY_2_STAND",BS_STAND);
	NAMIB_RITUAL = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_RITUAL,LOG_SUCCESS);
	B_LogEntry(CH1_RITUAL,"Baal Namib f�hrte ein Ritual mit mir durch, bei dem ich offiziell in die Bruderschaft aufgenommen wurde.");
	B_GiveXP(XP_NAMIBRITUAL);
	Npc_ExchangeRoutine(self,"START");
	Npc_ExchangeRoutine(templer_1,"START");
	AI_ContinueRoutine(templer_1);
	Npc_ExchangeRoutine(templer_2,"START");
	AI_ContinueRoutine(templer_2);
	AI_StopProcessInfos(self);
};

