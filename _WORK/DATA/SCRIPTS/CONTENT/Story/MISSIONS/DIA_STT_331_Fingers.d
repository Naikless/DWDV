
instance DIA_STT_331_Fingers_Exit(C_Info)
{
	npc = STT_331_Fingers;
	nr = 999;
	condition = DIA_STT_331_Fingers_Exit_Condition;
	information = DIA_STT_331_Fingers_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

func void DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Fingers_CanTeach;

instance DIA_Fingers_BecomeShadow(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_BecomeShadow_Condition;
	information = DIA_Fingers_BecomeShadow_Info;
	permanent = 1;
	description = "Ich will Schatten werden!";
};


func int DIA_Fingers_BecomeShadow_Condition()
{
	if((Fingers_CanTeach == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_BecomeShadow_Info()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_15_00");	//Ich will Schatten werden!
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_05_01");	//Und?
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
	Info_AddChoice(DIA_Fingers_BecomeShadow,DIALOG_BACK,DIA_Fingers_BecomeShadow_BACK);
	if(Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice(DIA_Fingers_BecomeShadow,"Ich suche jemanden, der mir was beibringt.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice(DIA_Fingers_BecomeShadow,"Kannst du mir dabei helfen?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_AnyTips_15_00");	//Kannst du mir dabei helfen?
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_AnyTips_05_01");	//Ich wüsste nicht, wie ...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_00");	//Ich suche jemanden, der mir was beibringt.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_01");	//Wie kommst du auf mich?
	AI_Output(other,self,"DIA_Fingers_BecomeShadow_TeachMe_15_02");	//Diego schickt mich.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_03");	//Sag das doch gleich.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_04");	//Wenn du im Lager aufgenommen werden willst, hilft es, wenn du ein geschickter Kämpfer oder Dieb bist.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_05");	//Wenn die einflussreichen Schatten in diesem Lager dich auf die Probe stellen, werden sie dir Aufträge geben, bei denen du dich besser nicht erwischen lässt.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_06");	//Deswegen ist für den Anfang der Weg des Diebes für dich vielversprechender.
	AI_Output(self,other,"DIA_Fingers_BecomeShadow_TeachMe_05_07");	//Wie es der Zufall so will, bin ich der beste Dieb im ganzen Alten Lager.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Fingers kann mir die Talente der TASCHENDIEBSTAHL und SCHLÖSSER ÖFFNEN beibringen");
	Info_ClearChoices(DIA_Fingers_BecomeShadow);
};


var int Fingers_Wherecavalorn;

instance DIA_Fingers_Lehrer(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Lehrer_Condition;
	information = DIA_Fingers_Lehrer_Info;
	permanent = 1;
	description = "Was kannst du mir beibringen?";
};


func int DIA_Fingers_Lehrer_Condition()
{
	if(Fingers_CanTeach == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_Lehrer_Info()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_15_00");	//Was kannst du mir beibringen?
	AI_Output(self,other,"DIA_Fingers_Lehrer_05_02");	//Kommt drauf an, was willst du wissen?
	Info_ClearChoices(DIA_Fingers_Lehrer);
	Info_AddChoice(DIA_Fingers_Lehrer,DIALOG_BACK,DIA_Fingers_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Fingers_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Fingers_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Fingers_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Fingers_Lehrer_Lockpick);
	};
	Info_AddChoice(DIA_Fingers_Lehrer,"Ich will lernen, mich lautlos zu bewegen.",DIA_Fingers_Lehrer_Schleichen);
};

func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Schleichen_15_00");	//Ich will lernen, mich lautlos zu bewegen.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_01");	//Ich glaube - ohne falsche Bescheidenheit - ich bin einer der besten Diebe, die sie in die Kolonie geworfen haben.
	AI_Output(self,other,"DIA_Fingers_Lehrer_Schleichen_05_02");	//Aber wenn es darum geht, zu lernen, wie man sich leise bewegt, ist Cavalorn der bessere Mann für dich!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick_15_00");	//Wie werde ich besser im Knacken von Schlössern?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_01");	//Das willst du gerne wissen, hm? Ist für den Anfang nicht so schwer.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_02");	//Du musst vor allem darauf achten, dass dir dein Dietrich nicht abbricht.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick_05_03");	//Wenn du in Zukunft mit weniger Gewalt an die Sache rangehst, wirst du merken, dass du weniger Dietriche verbrauchst!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Lockpick2_15_00");	//Wie werde ich Meister im Öffnen von Schlössern?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_01");	//Nur wer schon einige Übung hat, merkt genau, wann ihm ein Dietrich abbricht und wann nicht. Du erkennst es am Geräusch!
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_02");	//Ich denke, du bist jetzt so weit - lerne, auf das leise Klicken des Schlosses zu achten, und du wirst nur noch selten das Pech haben, einen Dietrich zu verlieren.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Lockpick2_05_03");	//Ein Meister des Fachs hat eine gute Chance, eine Truhe zu öffnen, ohne dass sein Dietrich überhaupt abbricht.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00");	//Ich will ein guter Taschendieb werden!
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01");	//So, du willst also ein paar Leute um ihre Sachen erleichtern? Nun gut.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02");	//Ich werde dir beibringen, wie du besser wirst, aber es besteht immer noch eine Chance, dass du erwischt wirst.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03");	//Das Risiko solltest du nur eingehen, wenn außer deinem Opfer niemand sonst da ist.
			AI_Output(self,other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04");	//Erst als Meister wirst du in der Lage sein, jemandem etwas aus der Tasche zu ziehen, ohne dass er es merkt!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_lehrer_Pickpocket_05_05");	//Vergiss es! Ohne dass du schleichen kannst, wirst du NIEMALS ein geschickter Dieb.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Fingers_Lehrer_Pickpocket2_15_00");	//Ich will ein Meister der Taschendiebe werden!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_01");	//Ich denke, du bist gut genug, um in die letzten Geheimnisse eingeweiht zu werden.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_02");	//Du solltest aber wissen, dass es selbst den Besten manchmal passiert, dass sie bemerkt werden.
		AI_Output(self,other,"DIA_Fingers_Lehrer_Pickpocket2_05_03");	//Also pass auf dich auf.
	};
};

func void DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Fingers_Lehrer);
};


instance DIA_Fingers_WhereCavalorn(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_WhereCavalorn_Condition;
	information = DIA_Fingers_WhereCavalorn_Info;
	permanent = 1;
	description = "Wo finde ich Cavalorn?";
};


func int DIA_Fingers_WhereCavalorn_Condition()
{
	if(Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

func void DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output(other,self,"DIA_Fingers_WhereCavalorn_15_00");	//Wo finde ich Cavalorn?
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_01");	//Er jagt in der Wildnis. Du findest ihn auf dem Weg zum Neuen Lager. Westlich des Alten Lagers beginnt eine breite Schlucht.
	AI_Output(self,other,"DIA_Fingers_WhereCavalorn_05_02");	//In dieser Schlucht steht eine alte Holzfällerhütte. Dort findest du ihn.
	B_LogEntry(GE_TeacherOW,"Cavalorn kann mir Schleichen beibringen. Seine Hütte steht in einer Schlucht westlich des Alten Lagers, auf dem Weg zum Neuen Lager.");
};


var int Fingers_Learnt;

instance DIA_Fingers_Learnt(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = DIA_Fingers_Learnt_Condition;
	information = DIA_Fingers_Learnt_Info;
	permanent = 1;
	description = "Du würdest nicht zufällig bei Diego ein gutes Wort für mich einlegen?";
};


func int DIA_Fingers_Learnt_Condition()
{
	if((Fingers_Learnt != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Fingers_Learnt_Info()
{
	AI_Output(other,self,"DIA_Fingers_Learnt_15_00");	//Du würdest nicht zufällig bei Diego ein gutes Wort für mich einlegen?
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) + Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) + Npc_GetTalentSkill(other,NPC_TALENT_SNEAK)) > 0)
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_01");	//Ja. Du hast was gelernt, was dich wertvoll für uns macht.
		AI_Output(self,other,"DIA_Fingers_Learnt_05_02");	//Geschickte Diebe können wir hier im Lager brauchen. Meine Stimme ist dir sicher.
		Fingers_Learnt = LOG_SUCCESS;
		B_GiveXP(XP_Fingerstrain);
		B_LogEntry(CH1_JoinOC,"Fingers ist sehr zufrieden mit meinen Fortschritten.");
	}
	else
	{
		AI_Output(self,other,"DIA_Fingers_Learnt_05_03");	//Kommt drauf an ...
		AI_Output(self,other,"DIA_Fingers_Learnt_05_04");	//Wenn du zeigst, dass du als Dieb was gelernt hast, könnten wir dich schon brauchen!
		AI_Output(other,self,"DIA_Fingers_Learnt_15_05");	//Wie soll ich das machen?
		AI_Output(self,other,"DIA_Fingers_Learnt_05_06");	//Lerne ein Diebestalent! Werde geschickter im Schleichen, im Taschendiebstahl oder im Öffnen von Schlössern. Dann werde ich dich dir meine Stimme geben.
		Fingers_Learnt = LOG_RUNNING;
		B_LogEntry(CH1_JoinOC,"Fingers wird ein gutes Wort für mich einlegen, wenn ich ein Diebestalent lerne.");
	};
};


instance DIA_FINGERS_HUNOSSCHWERT(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_hunosschwert_condition;
	information = dia_fingers_hunosschwert_info;
	permanent = 0;
	description = "Was weißt du über Hunos Schwert?";
};


func int dia_fingers_hunosschwert_condition()
{
	if(HUNO_SWORDSOLD == TRUE)
	{
		return 1;
	};
};

func void dia_fingers_hunosschwert_info()
{
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_15_00");	//Was weißt du über Hunos Schwert?
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_01");	//Warum sollte ich was darüber wissen?
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_02");	//Fisk hat mir deinen Namen genannt.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_03");	//Wenn das so ist...
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_04");	//Ich habe vor kurzem jemanden im öffnen von Schlössern ausgebildet.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_05");	//Ich denke bei ihm könntest du das finden was du suchst.
	AI_Output(self,other,"DIA_Fingers_HunosSchwert_05_06");	//Sein Name ist Jesse.
	AI_Output(other,self,"DIA_Fingers_HunosSchwert_05_07");	//Danke, mach's gut.
	B_LogEntry(CH1_HUNOLOSTSWORD,"Fingers erzählte mir, dass ich mit einem Buddler namens Jesse reden solle. Er soll mehr darüber wissen, was mit dem Schwert passiert ist.");
};


instance DIA_FINGERS_QUEST(C_Info)
{
	npc = STT_331_Fingers;
	nr = 2;
	condition = dia_fingers_quest_condition;
	information = dia_fingers_quest_info;
	permanent = 0;
	important = 1;
};


func int dia_fingers_quest_condition()
{
	if((Fingers_Learnt == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		return 1;
	};
};

func void dia_fingers_quest_info()
{
	AI_Output(self,other,"DIA_Fingers_Quest_15_00");	//Du hast es geschafft und gehört jetzt zu den Schatten? Gut gemacht. Hab' ich mich doch nicht in dir geirrt.
	AI_Output(self,other,"DIA_Fingers_Quest_15_01");	//Nun, jetzt wo du zu uns gehörst, ich hätte da was zu tun für einen guten Dieb.
	AI_Output(other,self,"DIA_Fingers_Quest_15_02");	//Du hättest was zu tun für mich? Um was geht's?
	AI_Output(self,other,"DIA_Fingers_Quest_15_03");	//Ich will das du ins neue Lager gehst. Dort gibt es einen Mann namens Lares. Er ist der Anführer der Banditen dort.
	AI_Output(self,other,"DIA_Fingers_Quest_15_04");	//Ich weiß, dass er einen magischen Ring trägt, der seine Kräfte verstärkt.
	AI_Output(self,other,"DIA_Fingers_Quest_15_05");	//Aus diesem Grund möchte ich, dass du diesen Ring von ihm stiehlst. Der Ring ist in meinem Besitz viel besser aufgehoben.
	AI_Output(self,other,"DIA_Fingers_Quest_15_06");	//Aber lass dich unter KEINEN Umständen erwischen. Wenn Lares dich bei einem Diebstahl erwischt, wird er das halbe Lager gegen dich aufhetzen.
	AI_Output(self,other,"DIA_Fingers_Quest_15_07");	//Also sei vorsichtig. Aber ich bin sicher, dass ich mich in deinen Fähigkeiten nicht getäuscht habe. Je nachdem, wie gut du die Sache meisterst, hab' ich vielleicht noch etwas zu tun.
	AI_Output(self,other,"DIA_Fingers_Quest_15_08");	//Jetzt begib' dich erst einmal ins neue Lager. Deine Aufgabe wartet auf dich.
	FINGERS_RING = LOG_RUNNING;
	Log_CreateTopic(CH1_FINGERSTHIEF,LOG_MISSION);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_RUNNING);
	B_LogEntry(CH1_FINGERSTHIEF,"Fingers bat mich, Lares, den Banditenanführer aus dem neuen Lager aufzusuchen. Er besitzt einen magischen Ring, der seine Kräfte verstärkt. Fingers will, dass ich diesen in meinen Besitz bringe.");
};


instance DIA_FINGERS_SUCCESS(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_success_condition;
	information = dia_fingers_success_info;
	permanent = 0;
	important = 0;
	description = "Ich hab' den Ring von Lares bei mir.";
};


func int dia_fingers_success_condition()
{
	if((FINGERS_RING == LOG_RUNNING) && (Npc_HasItems(other,Lares_Ring) >= 1))
	{
		return 1;
	};
};

func void dia_fingers_success_info()
{
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_00");	//Ich hab' den Ring von Lares bei mir.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_10");	//Wirklich? Ich wusste ich habe den Richtigen beauftragt...
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_20");	//Und zwar?
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_30");	//Es geht wieder um einen Banditen aus dem neuen Lager.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_40");	//Sein Name ist Wedge und er ist einer der Meisterdiebe des Lagers.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_50");	//So bezeichnet er sich zumindest.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_60");	//Nun, ich habe einen Ruf zu verlieren, also wäre es gut wenn jemand dafür sorgt, dass Wedge seinen verliert.
	AI_Output(other,self,"DIA_Fingers_SUCCESS_15_70");	//Und da komm' ich ins Spiel.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_80");	//Richtig. Im neuen Lager gibt es einen Mann, dessen Name Butch ist. Man sagt, er sei einer der übelsten Banditen.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_90");	//Ich weiß, dass er ein Amulett besitzt, wo sein Name eingraviert ist.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_11");	//Du sollst diesen Amulett stehlen und es anschliessend Wedge in die Tasche schmuggeln.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_12");	//Nachdem Wedge in den Besitz dieses Amulettes gelangt ist, erzählst du Butch davon.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_13");	//Der Rest erledigt sich anschliessend von alleine.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_14");	//Ein Dieb, der seine eigenen Verbündeten bestiehlt, wird in Zukunft keinen guten Ruf mehr haben.
	AI_Output(self,other,"DIA_Fingers_SUCCESS_15_15");	//Kehre zu mir zurück, wenn du deine Aufgabe erledigt hast.
	AI_StopProcessInfos(self);
	FINGERS_RING = LOG_SUCCESS;
	B_GiveXP(XP_FINGERSQUESTONE);
	Log_SetTopicStatus(CH1_FINGERSTHIEF,LOG_SUCCESS);
	B_LogEntry(CH1_FINGERSTHIEF,"Ich habe Fingers seinen gewünschten Ring gebracht. Er schien sehr zufrieden und belohnte mich in Form einiger Erzbrocken.");
	CreateInvItems(self,ItMiNugget,30);
	B_GiveInvItems(self,other,ItMiNugget,30);
	FINGERS_THIEF = LOG_RUNNING;
	Log_CreateTopic(CH1_THIEFS,LOG_MISSION);
	Log_SetTopicStatus(CH1_THIEFS,LOG_RUNNING);
	B_LogEntry(CH1_THIEFS,"Fingers bat mich ins neue Lager zu gehen und dort einen Banditen namens Wedge aufzusuchen. Dem soll ich ein Amulett von einem gewissen Butch in die Tasche schmuggeln. Anschliessend soll ich Butch darüber informieren, so dass Wedge eine Lektion deswegen erteilt bekommt und Fingers seinen Ruf beibehält.");
};


instance DIA_FINGERS_BUTCH(C_Info)
{
	npc = STT_331_Fingers;
	nr = 1;
	condition = dia_fingers_butch_condition;
	information = dia_fingers_butch_info;
	permanent = 0;
	important = 0;
	description = "Wedge wird nie wieder als Meisterdieb bezeichnet werden.";
};


func int dia_fingers_butch_condition()
{
	if(Npc_KnowsInfo(hero,dia_butch_hey))
	{
		return 1;
	};
};

func void dia_fingers_butch_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"DIA_Fingers_Butch_15_01");	//Wedge wird nie wieder als Meisterdieb bezeichnet werden.
	AI_Output(self,other,"DIA_Fingers_Butch_15_02");	//Dann hat es also funktioniert? Gute Arbeit. Ich denke, du hast dieses mal eine etwas größere Belohnung verdient, hier.
	AI_Output(self,other,"DIA_Fingers_Butch_15_03");	//Trotzdem sollten wir unsere Zusammenarbeit vorerst beenden, bevor das neue Lager auf uns aufmerksam wird.
	AI_Output(self,other,"DIA_Fingers_Butch_15_04");	//Vielleicht benötige ich in Zukunft noch einmal deine Hilfe. Wir sehen uns bis dahin. 
	AI_Output(other,self,"DIA_Fingers_Butch_15_05");	//Danke.
	AI_Output(self,other,"DIA_Fingers_Butch_15_06");	//Und vergiss nicht, die besten Schatten erfüllen ihre Aufträge, ohne den Anschein zu erwecken als seien sie jemals dagewesen. Heimlich, still und im Verborgenen...
	AI_StopProcessInfos(self);
	B_GiveXP(XP_FINGERSQUESTTWO);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,Schutzring_Waffen1,1);
		B_GiveInvItems(self,other,Schutzring_Waffen1,1);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,Schutzring_Geschosse2,1);
		B_GiveInvItems(self,other,Schutzring_Geschosse2,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItem(self,ItMi_Alchemy_Syrianoil_01);
		B_GiveInvItems(self,hero,ItMi_Alchemy_Syrianoil_01,1);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItRw_Bow_Small_05,1);
		B_GiveInvItems(self,other,ItRw_Bow_Small_05,1);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItMw_1H_Sword_04,1);
		B_GiveInvItems(self,other,ItMw_1H_Sword_04,1);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,other,ItMiNugget,150);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItem(self,ItFo_Potion_Dex_01);
		B_GiveInvItems(self,hero,ItFo_Potion_Dex_01,1);
	};
	FINGERS_THIEF = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_THIEFS,LOG_SUCCESS);
	B_LogEntry(CH1_THIEFS,"Fingers war erfreut über meinen Erfolg und gab mir eine ordentliche Belohnung. Anschliessend erzählte er mir, dass unsere Zusammenarbeit erst einmal beendet ist, bevor das Neue Lager verdacht schöpft.");
};

