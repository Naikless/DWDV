
instance DIA_Raven_Exit(C_Info)
{
	npc = EBR_105_Raven;
	nr = 999;
	condition = DIA_Raven_Exit_Condition;
	information = DIA_Raven_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Raven_Exit_Condition()
{
	return 1;
};

func void DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Raven_FirstIn(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_FirstIn_Condition;
	information = DIA_Raven_FirstIn_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_FirstIn_Condition()
{
	var C_Npc wache218;
	wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if(wache218.aivar[AIV_PASSGATE] == TRUE)
	{
		return 1;
	};
};

func void DIA_Raven_FirstIn_Info()
{
	AI_Output(self,other,"DIA_Raven_FirstIn_10_00");	//Was kann ich für dich tun?
};


instance DIA_Raven_Who(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Who_Condition;
	information = DIA_Raven_Who_Info;
	permanent = 0;
	description = "Wer bist du?";
};


func int DIA_Raven_Who_Condition()
{
	return 1;
};

func void DIA_Raven_Who_Info()
{
	AI_Output(other,self,"DIA_Raven_Who_15_00");	//Wer bist du?
	AI_Output(self,other,"DIA_Raven_Who_10_01");	//Ich bin Raven. Gomez' rechte Hand. Jeder, der hier ist, um mit Gomez zu reden, redet vorher mit MIR.
};


instance DIA_Raven_Krautbote(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Krautbote_Condition;
	information = DIA_Raven_Krautbote_Info;
	permanent = 0;
	description = "Ich habe eine Ladung Kraut für Gomez von Cor Kalom.";
};


func int DIA_Raven_Krautbote_Condition()
{
	if(Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Krautbote_Info()
{
	AI_Output(other,self,"DIA_Raven_Krautbote_15_00");	//Ich habe eine Ladung Kraut für Gomez von Cor Kalom.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_01");	//Bartholo kümmert sich um diese Sachen, Gomez selbst gibt sich nicht mit Boten ab.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_02");	//Du findest ihn in der Kammer hier rechts hinter dem Eingang oder in der Küche im großen Turm.
	AI_Output(self,other,"DIA_Raven_Krautbote_10_03");	//Nachts schläft er natürlich. Da würd' ich es nicht wagen, ihn zu stören.
	B_LogEntry(CH1_KrautBote,"Die Krautlieferung für Gomez muss bei Bartholo abgegeben werden. Ich finde ihn im Haus der Erzbarone.");
};


instance DIA_Raven_Aufnahme(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Aufnahme_Condition;
	information = DIA_Raven_Aufnahme_Info;
	permanent = 0;
	description = "Ich will zu Gomez. Thorus sagt, ich soll als Schatten aufgenommen werden.";
};


func int DIA_Raven_Aufnahme_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Raven_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Raven_Aufnahme_15_00");	//Ich will zu Gomez. Thorus sagt, ich soll als Schatten aufgenommen werden.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_01");	//Wir sind immer auf der Suche nach guten Leuten. Du scheinst mir nicht auf den Kopf gefallen zu sein. Du könntest es hier zu was bringen.
	AI_Output(self,other,"DIA_Raven_Aufnahme_10_02");	//Ich werde dich zu Gomez führen. Folge mir. Und fass nichts an!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Raven_There(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_There_Condition;
	information = DIA_Raven_There_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Raven_There_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT"))
	{
		return 1;
	};
};

func void DIA_Raven_There_Info()
{
	AI_Output(self,other,"DIA_Raven_There_10_01");	//Dort hinten ist Gomez. Wenn du ihm keinen Respekt zeigst, werde ich dir persönlich welchen beibringen, ist das klar?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Raven_PERM(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_PERM_Condition;
	information = DIA_Raven_PERM_Info;
	permanent = 1;
	description = "Wie steht der Erzhandel?";
};


func int DIA_Raven_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

func void DIA_Raven_PERM_Info()
{
	AI_Output(other,self,"DIA_Raven_PERM_15_00");	//Wie steht der Erzhandel?
	AI_Output(self,other,"DIA_Raven_PERM_10_01");	//Die Alte Mine spuckt genug aus. Die letzte Lieferung aus der Außenwelt war ziemlich fett.
};


instance DIA_Raven_BinDabei(C_Info)
{
	npc = EBR_105_Raven;
	nr = 8;
	condition = DIA_Raven_BinDabei_Condition;
	information = DIA_Raven_BinDabei_Info;
	permanent = 0;
	description = "Gomez sagt, ich bin dabei.";
};


func int DIA_Raven_BinDabei_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

func void DIA_Raven_BinDabei_Info()
{
	CreateInvItem(hero,stt_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_Output(other,self,"DIA_Raven_BinDabei_15_00");	//Gomez sagt, ich bin dabei.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_01");	//Gut! Du kannst dich gleich bei deinem ersten Auftrag bewähren.
	AI_Output(self,other,"DIA_Raven_BinDabei_10_02");	//Wenn deine Verbindungen wirklich so gut sind, wie du sagst, solltest du keine Probleme damit haben.
	AI_EquipBestArmor(hero);
};


var int Raven_SpySect;

instance DIA_Raven_SpySect(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpySect_Condition;
	information = DIA_Raven_SpySect_Info;
	permanent = 0;
	description = "Was soll ich für dich erledigen?";
};


func int DIA_Raven_SpySect_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

func void DIA_Raven_SpySect_Info()
{
	AI_Output(other,self,"DIA_Raven_SpySect_15_00");	//Was soll ich für dich erledigen?
	AI_Output(self,other,"DIA_Raven_SpySect_10_01");	//Wir stehen mit der Bruderschaft in Handelskontakt. Das bedeutet nicht, das wir ihnen unbedingt vertrauen.
	AI_Output(self,other,"DIA_Raven_SpySect_10_02");	//Mach dich auf den Weg in den Sumpf.
	AI_Output(self,other,"DIA_Raven_SpySect_10_03");	//Wenn du dort im Lager bist, halte die Ohren auf. Alles was du erfährst, kann für uns nützlich sein.
	AI_Output(self,other,"DIA_Raven_SpySect_10_04");	//Und je mehr du erfährst, desto besser. Das Ganze erfordert ein gewisses Feingefühl. Du weißt, was ich meine?
	AI_Output(other,self,"DIA_Raven_SpySect_15_05");	//Bleib ruhig, ich werde ihren Zorn nicht heraufbeschwören.
	AI_Output(self,other,"DIA_Raven_SpySect_10_06");	//Ich wusste, dass du mich verstehen würdest.
	Raven_SpySect = LOG_RUNNING;
	Log_CreateTopic(CH1_GoToPsi,LOG_MISSION);
	Log_SetTopicStatus(CH1_GoToPsi,LOG_RUNNING);
	B_LogEntry(CH1_GoToPsi,"Raven hat mich im Auftrag des Alten Lagers zur Bruderschaft im Sumpf geschickt. Ich soll mich dort umsehen und -hören. Vielleicht gibt es ein paar nützliche Informationen für die Erzbarone.");
};


instance DIA_Raven_Equipment(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_Equipment_Condition;
	information = DIA_Raven_Equipment_Info;
	permanent = 0;
	description = "Wo bekomme ich bessere Ausrüstung her?";
};


func int DIA_Raven_Equipment_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_Equipment_Info()
{
	AI_Output(other,self,"DIA_Raven_Equipment_15_00");	//Wo bekomme ich bessere Ausrüstung her?
	AI_Output(self,other,"DIA_Raven_Equipment_10_01");	//Geh zu Diego, er wird dir 'ne Rüstung geben. Damit wirst du nicht so schnell umgebracht und sie dient auch gleichzeitig als Ausweis.
	AI_Output(self,other,"DIA_Raven_Equipment_10_02");	//Mit deiner neuen Rüstung solltest du hier überall hinkommen, wo du hin musst.
	AI_Output(self,other,"DIA_Raven_Equipment_10_03");	//Und wenn du Waffen brauchst, geh zu Skip, er ist in der großen Scheune hinten links auf den Burgplatz.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Diego verteilt bessere RÜSTUNGEN für Gomez' Schatten. Er hängt vor dem Eingang zur Burg herum.");
	if(!Npc_KnowsInfo(hero,DIA_Skip_First))
	{
		B_LogEntry(GE_TraderOC,"Der Gardist Skip auf dem hinteren Burginnenhof verkauft WAFFEN. Aber nur an Gomez' Leute.");
	};
};


instance DIA_Raven_SpyBericht(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = DIA_Raven_SpyBericht_Condition;
	information = DIA_Raven_SpyBericht_Info;
	permanent = 1;
	description = "Ich will einen Zwischenbericht abgeben.";
};


func int DIA_Raven_SpyBericht_Condition()
{
	if(Raven_SpySect == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Raven_SpyBericht_Info()
{
	AI_Output(other,self,"DIA_Raven_SpyBericht_15_00");	//Ich will einen Zwischenbericht abgeben.
	AI_Output(self,other,"DIA_Raven_SpyBericht_10_01");	//Gut. Ich bin gerne gut informiert.
	if((Npc_HasItems(other,ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS))
	{
		if(Kapitel >= 3)
		{
			AI_Output(other,self,"Org_826_Mordrag_RUNNING_15_04");	//Die große Beschwörung hat stattgefunden.
			AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Du hast deine Sache gut gemacht.
			Raven_SpySect = LOG_SUCCESS;
			B_GiveXP(XP_ReportToRaven);
			Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
			B_LogEntry(CH1_GoToPsi,"Raven hat mich mit billigen Worten abgespeist! Das ist nicht die Art der großzügigen Dankbarkeit, die ich erwartet habe! Von nun an gehe ich meinen eigenen Plänen nach.");
		}
		else
		{
			AI_Output(other,self,"DIA_Raven_SpyBericht_15_02");	//Sie wollen die Eier einer Minecrawler-Königin, um daraus ein Elixier herzustellen, durch das sie Kontakt zum Schläfer aufnehmen können. Ich habe die Eier bei mir.
			if(CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_03");	//Interessant. Bin gespannt, ob die Sache funktioniert. Bring die Eier in den Tempel.
			}
			else
			{
				AI_Output(self,other,"DIA_Raven_SpyBericht_10_04");	//Du hast deine Sache gut gemacht.
				Raven_SpySect = LOG_SUCCESS;
				B_GiveXP(XP_ReportToRaven);
				Log_SetTopicStatus(CH1_GoToPsi,LOG_SUCCESS);
				B_LogEntry(CH1_GoToPsi,"Raven hat mich mit billigen Worten abgespeist! Das ist nicht die Art der großzügigen Dankbarkeit, die ich erwartet habe! Von nun an gehe ich meinen eigenen Plänen nach.");
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Raven_SpyBericht_15_05");	//Ich weiß noch nicht GENAU was sie vorhaben.
		AI_Output(self,other,"DIA_Raven_SpyBericht_10_06");	//Was belästigst du mich dann?
	};
};


var int ore_baron;

instance DIA_RAVEN_OREBARON(C_Info)
{
	npc = EBR_105_Raven;
	nr = 1;
	condition = dia_raven_orebaron_condition;
	information = dia_raven_orebaron_info;
	permanent = 0;
	important = 1;
};


func int dia_raven_orebaron_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_GRD) && (hero.level >= 20) && (Kapitel == 3) && (FLETCHER_SCHULDEN == LOG_SUCCESS) && (Fisk_GetNewHehler == LOG_SUCCESS) && (LOST_DIGGER == LOG_SUCCESS) && (MESSAGEKDF == LOG_SUCCESS) && (SCAR_QUEST == LOG_SUCCESS) && (PAUL_OC == LOG_SUCCESS) && (CONVOY_OC == LOG_SUCCESS) && (Thorus_MordragKo == LOG_SUCCESS) && (CARLOS_THINGS == LOG_SUCCESS) && (MAGIC_ARTEFACTS == LOG_SUCCESS) && (HUNO_LOSTSWORD == LOG_SUCCESS) && (ORRY_MESSAGE == LOG_SUCCESS) && (BRANDICK_BEER == LOG_SUCCESS) && (OMID_RECEPT == LOG_SUCCESS) && (MordragKO_StayAtNC != TRUE))
	{
		return 1;
	};
};

func void dia_raven_orebaron_info()
{
	AI_Output(self,other,"DIA_Raven_OreBaron_15_00");	//Hey du!
	AI_Output(other,self,"DIA_Raven_OreBaron_10_01");	//Was ist los?
	AI_Output(self,other,"DIA_Raven_OreBaron_10_02");	//Ich hab' viel von dir gehört. Du hast dir einen Namen im Lager gemacht und unserem Lager große Dienste erwiesen.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_03");	//Ich persönlich habe deine Laufbahn in diesem Lager verfolgt.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_04");	//Als ein Niemand bist du in die Kolonie gekommen.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_05");	//Mittlerweile hast du dich bis nach ganz oben hochgearbeitet und das schneller, als irgendjemand anders hier.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_06");	//Nachdem du einer Weile in der Kolonie warst, hast du dich uns als Schatten angeschlossen. Aber selbst da warst du nicht nur ein gewöhnlicher Schatten, wie die Anderen hier.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_07");	//Du warst derjenige, der uns von der Plage der Minecrawler in der Mine befreite und das im Alleingang.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_08");	//Als Gardist, hast du uns wertvolle Dienste geleistet und eine Menge Aufgaben eindrucksvoll erledigt. Keiner unserer Gardisten hat so viel geleistet wie du.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_09");	//Damit hast du deine Loyalität zum Alten Lager eindrucksvoll unter Beweis gestellt.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_11");	//Ich und die Anderen Erzbarone haben uns beraten und eine Entscheidung getroffen.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_12");	//Wir sind bereit, dir einen Platz in den Reihen der ganz Großen anzubieten.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_13");	//Einen Platz als einer von Gomez' Leibwächtern, einen Platz als Erzbaron des Alten Lagers.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_14");	//Jemanden der sein Leben für Gomez und das Lager gibt, hat sich das Recht verdient, sich einen Erzbaron nennen zu dürfen.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_15");	//Ich gebe dir eine Chance. Entweder du schliesst dich uns an und gehörst zu den ganz Großen oder du lässt dir die Chance entgehen und bleibst weiterhin ein einfacher Gardist.
	AI_Output(self,other,"DIA_Raven_OreBaron_10_16");	//Nun, wie sieht deine Entscheidung aus? Bist du bereit deinen Platz als Gomez' Leibwächter anzutreten und dir als Erzbaron einen Namen zu machen?
	ORE_BARON = LOG_RUNNING;
	Log_CreateTopic(GE_BECOMEOREBARON,LOG_MISSION);
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_RUNNING);
	B_LogEntry(GE_BECOMEOREBARON,"Raven, einer der Erzbarone des Alten Lagers, erzählte mir, wie er meine Taten verfolgt hat und das er davon überzeugt ist, dass ich zu den Großen gehören kann. Er bot mir deshalb eine Chance zu Gomez' Leibgarde zu gehören.");
	Info_ClearChoices(dia_raven_orebaron);
	Info_AddChoice(dia_raven_orebaron,"Ich bin dabei.",dia_raven_orebaron_yes);
	Info_AddChoice(dia_raven_orebaron,"Nein, ich bin nicht bereit dazu.",dia_raven_orebaron_no);
};

func void dia_raven_orebaron_yes()
{
	AI_Output(other,self,"DIA_Raven_OreBaron_YES_10_16");	//Ich bin dabei.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_17");	//Gut, dann heiße ich dich in der Reihe der Leibgarde Gomez' willkommen.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_18");	//Ab jetzt musst du keine Aufgaben mehr erledigen, sondern du bist der der die Aufgaben gibt.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_19");	//Du gehörst ab jetzt zu den ganz Großen in der Kolonie.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_20");	//Jetzt kann dir keiner mehr was.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_22");	//Gut das ausgerechnet DU jetzt einer von uns bist.
	AI_Output(self,other,"DIA_Raven_OreBaron_YES_10_23");	//Geh' nun und gehe deiner neuen Arbeit nach.
	Info_ClearChoices(dia_raven_orebaron);
	ORE_BARON = LOG_SUCCESS;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_SUCCESS);
	B_LogEntry(GE_BECOMEOREBARON,"Ich habe das Angebot von Raven angenommen und kann mich von nun an zu den Erzbaronen zählen. Damit habe ich den höchsten Rang im Alten Lager erreicht.");
	B_GiveXP(XP_OREBARON);
	CreateInvItem(hero,ebr_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_EquipBestArmor(hero);
	Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,1,-1);
	Mdl_ApplyOverlayMds(hero,"Humans_Arrogance.mds");
	Npc_SetTrueGuild(hero,GIL_EBR);
	hero.guild = GIL_EBR;
};

func void dia_raven_orebaron_no()
{
	AI_Output(other,self,"DIA_Raven_OreBaron_NO_15_00");	//Nein, ich bin nicht bereit dazu.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_01");	//WAS? Ich biete dir ein solches Angebot und du lehnst ab?
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_02");	//Ich bin wirklich enttäuscht.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_03");	//Geh' nun, du hast deine Chance verspielt zu ganz Großen zu gehören.
	AI_Output(self,other,"DIA_Raven_OreBaron_NO_11_04");	//Diese Chance wird sich dir NIE wieder bieten...
	Info_ClearChoices(dia_raven_orebaron);
	ORE_BARON = LOG_FAILED;
	Log_SetTopicStatus(GE_BECOMEOREBARON,LOG_FAILED);
	B_LogEntry(GE_BECOMEOREBARON,"Raven war enttäuscht das ich sein Angebot abgelehnt habe. Er sagte mir, dass ich eine solche Chance nie wieder bekommen würde. Schätze, dass ich mich bei den Erzbaronen nicht mehr blicken lassen brauche.");
};

