
instance Info_Yberion_EXIT(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 999;
	condition = Info_Yberion_EXIT_Condition;
	information = Info_Yberion_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Yberion_EXIT_Condition()
{
	return 1;
};

func void Info_Yberion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_YBerion_Wache(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Wache_Condition;
	information = DIA_YBerion_Wache_Info;
	permanent = 0;
	important = 1;
};


func int DIA_YBerion_Wache_Condition()
{
	if(Kapitel == 1)
	{
		return 1;
	};
};

func void DIA_YBerion_Wache_Info()
{
	AI_Output(self,other,"DIA_YBerion_Wache_12_00");	//Was machst du hier? Wer hat dich hereingelassen? Wache!
	B_IntruderAlert(self,other);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_YBerion_Kennen(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = DIA_YBerion_Kennen_Condition;
	information = DIA_YBerion_Kennen_Info;
	permanent = 0;
	description = "Sei gegrüßt, Meister Y'Berion.";
};


func int DIA_YBerion_Kennen_Condition()
{
	if(Kapitel == 2)
	{
		return 1;
	};
};

func void DIA_YBerion_Kennen_Info()
{
	AI_Output(other,self,"DIA_YBerion_Kennen_15_00");	//Sei gegrüßt, Meister Y'Berion.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_01");	//Ah! Du kommst mir bekannt vor!
	AI_Output(other,self,"DIA_YBerion_Kennen_15_02");	//Unmöglich. Wir haben uns noch nie gesehen.
	AI_Output(self,other,"DIA_YBerion_Kennen_12_03");	//Und ich dachte ... Nun gut - was willst du?
};


instance Info_YBerion_BringFocus(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = Info_YBerion_BringFocus_Condition;
	information = Info_YBerion_BringFocus_Info;
	permanent = 1;
	description = "Mir kam zu Ohren, du suchst etwas";
};


func int Info_YBerion_BringFocus_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_YBerion_Kennen) && (Npc_GetTrueGuild(hero) != GIL_None) && (YBerion_BringFocus != LOG_RUNNING) && (YBerion_BringFocus != LOG_SUCCESS))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Info()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01");	//Mir kam zu Ohren, du suchst etwas.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02");	//Das ist richtig. Wir brauchen einen magischen Fokus.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03");	//Wir haben den Novizen Nyras losgeschickt, um den Fokus zu holen. Doch er ist bisher nicht zurückgekehrt.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04");	//Du könntest für mich nachsehen, was passiert ist!
	Info_ClearChoices(Info_YBerion_BringFocus);
	Info_AddChoice(Info_YBerion_BringFocus,DIALOG_BACK,Info_YBerion_BringFocus_BACK);
	Info_AddChoice(Info_YBerion_BringFocus,"Ich werde den Fokus zurückbringen!",Info_YBerion_BringFocus_OK);
	Info_AddChoice(Info_YBerion_BringFocus,"Wo soll ich suchen?",Info_YBerion_BringFocus_WO);
	Info_AddChoice(Info_YBerion_BringFocus,"Was hat es mit dem Fokus auf sich?",Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK()
{
	Info_ClearChoices(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01");	//Ich werde den Fokus zurückbringen!
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02");	//Nimm diese Karte hier, dort ist der Ort des Fokus verzeichnet.
	B_Story_BringFirstFocus();
	B_LogEntry(CH2_Focus,"Y'Berion hat den Novizen Nyras ausgesand, um den magischen Fokus zu holen, doch er kam bisher nicht zurück. Der Guru gab mir eine Karte, auf der der Weg zum Fokus eingezeichnet ist.");
};

func void Info_YBerion_BringFocus_WO()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01");	//Wo soll ich suchen?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02");	//Wenn du das Lager verlässt, wende dich nach rechts und steige hinauf zur großen Klippe. Dort, hinter dem Wald, wo du das Meer sehen kannst, wirst du den Fokus finden.
};

func void Info_YBerion_BringFocus_FOKUS()
{
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01");	//Was hat es mit dem Fokus auf sich?
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02");	//Es ist ein magischer Gegenstand, der unsere geistigen Kräfte vereinigen wird.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03");	//Es handelt sich dabei um einen der fünf Fokussteine, den die Magier zum Errichten der Barriere benutzt haben.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04");	//In einer Vision sah ich, dass wir uns die Kraft eines Fokus zu Nutze machen müssen.
	AI_Output(other,self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05");	//War wohl eine ziemlich spannende Vision.
	AI_Output(self,other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06");	//Meine Vision war ein Zeichen vom Schläfer. Mit dem Fokus können wir ihn erreichen!
};


instance Info_YBerion_BringFocus_RUNNING(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_RUNNING_Condition;
	information = Info_YBerion_BringFocus_RUNNING_Info;
	permanent = 0;
	description = "Ich habe den Fokus immer noch nicht gefunden.";
};


func int Info_YBerion_BringFocus_RUNNING_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && !Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_YBerion_BringFocus_RUNNING_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_RUNNING_15_01");	//Ich habe den Fokus immer noch nicht gefunden.
	AI_Output(self,other,"Info_YBerion_BringFocus_RUNNING_12_02");	//Dann suche weiter. Der Schläfer wird dir den Weg weisen.
};


instance Info_YBerion_BringFocus_Success(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_BringFocus_Success_Condition;
	information = Info_YBerion_BringFocus_Success_Info;
	permanent = 0;
	description = "Ich habe den Fokus gefunden";
};


func int Info_YBerion_BringFocus_Success_Condition()
{
	if((YBerion_BringFocus == LOG_RUNNING) && Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_BringFocus_Success_Info()
{
	AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_01");	//Ich habe den Fokus gefunden.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_02");	//Hervorragend. Du hast uns einen großen Dienst erwiesen.
	AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_03");	//Bring nun den Fokus zu Cor Kalom. Er wird wissen, was zu tun ist.
	if(Kalom_TalkedTo == FALSE)
	{
		AI_Output(other,self,"Info_YBerion_BringFocus_Success_15_04");	//Wo kann ich diesen Cor Kalom finden?
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_05");	//Er hält sich die meiste Zeit im Alchemielabor auf der oberen Stegebene auf.
		AI_Output(self,other,"Info_YBerion_BringFocus_Success_12_06");	//Frag Lester am Eingang des Lagers ... Er führt öfter Neulinge herum.
		B_LogEntry(CH2_Focus,"Y'Berion hat mich beauftragt, den Fokus zu einem anderen Guru namens 'Cor Kalom' zu bringen. Dieser Cor Kalom soll sich den ganzen Tag im Alchemielabor aufhalten.");
	}
	else
	{
		B_LogEntry(CH2_Focus,"Y'Berion hat mich beauftragt, den Fokus zu Cor Kalom zu bringen. Welch eine 'Freude' diesen überaus liebenswürdigen Menschen wieder zu treffen.");
	};
	TPL_1406_Templer.aivar[AIV_PASSGATE] = TRUE;
	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP(XP_BringFocusToYBerion);
};


instance Info_YBerion_NYRAS(C_Info)
{
	npc = GUR_1200_YBerion;
	nr = 1;
	condition = Info_YBerion_NYRAS_Condition;
	information = Info_YBerion_NYRAS_Info;
	permanent = 0;
	description = "Der Novize Nyras hat den Verstand verloren!";
};


func int Info_YBerion_NYRAS_Condition()
{
	if(Npc_HasItems(hero,Focus_1))
	{
		return 1;
	};
};

func void Info_YBerion_NYRAS_Info()
{
	AI_Output(other,self,"Info_YBerion_NYRAS_15_01");	//Der Novize Nyras hat den Verstand verloren!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_02");	//Er faselte davon, dass der Schläfer zu ihm gesprochen habe und ihn als einzigen Diener auserwählte!
	AI_Output(other,self,"Info_YBerion_NYRAS_15_03");	//Dann griff er mich sogar an und wollte mich töten!
	AI_Output(self,other,"Info_YBerion_NYRAS_12_04");	//Die Macht des Schläfers ist so gewaltig, dass sie unvorbereitete Seelen in Verwirrung stürzen kann.
	AI_Output(self,other,"Info_YBerion_NYRAS_12_05");	//Nur wir Gurus haben durch jahrelanges Meditieren die seelische Stärke gewonnen, die Stimme des allmächtigen Schläfers zu ertragen!
};


instance GUR_1200_Yberion_EARN(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = GUR_1200_Yberion_EARN_Condition;
	information = GUR_1200_Yberion_EARN_Info;
	important = 0;
	permanent = 0;
	description = "Wie siehts mit einer Belohnung aus?";
};


func int GUR_1200_Yberion_EARN_Condition()
{
	if((YBerion_BringFocus == LOG_SUCCESS) && ((Npc_GetTrueGuild(hero) != GIL_NOV) && (Npc_GetTrueGuild(hero) != GIL_GUR) && (Npc_GetTrueGuild(hero) != GIL_TPL)) && C_IsChapter(2))
	{
		return 1;
	};
};

func void GUR_1200_Yberion_EARN_Info()
{
	AI_Output(other,self,"GUR_1200_Yberion_EARN_Info_15_01");	//Wie sieht's mit einer Belohnung aus?
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_02");	//Da du kein Bruder unserer Gemeinschaft bist, werde ich dich entlohnen.
	AI_Output(self,other,"GUR_1200_Yberion_EARN_Info_12_03");	//Nimm dieses Amulett als Zeichen meiner Dankbarkeit.
	CreateInvItem(self,Schutzamulett_Feuer);
	B_GiveInvItems(self,hero,Schutzamulett_Feuer,1);
};


instance GUR_1200_YBERION_WANNBEGURU(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_wannbeguru_condition;
	information = gur_1200_yberion_wannbeguru_info;
	important = 0;
	permanent = 1;
	description = "Du wolltest mich sprechen?";
};


func int gur_1200_yberion_wannbeguru_condition()
{
	if(Npc_KnowsInfo(hero,gur_1204_baalnamib_guraufnahme) && (YBERION_GURAUFNAHME != 1) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void gur_1200_yberion_wannbeguru_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_WANNBEGURU_Info_20_01");	//Du wolltest mich sprechen?
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_02");	//Ich habe gehört was in der alten Mine geschehen ist.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_03");	//Du hast dich als würdig erwiesen und dem Schläfer ehrenvoll gedient.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_04");	//Wir haben uns beraten und sind der Meinung, dass du bereit bist eine Chance zu bekommen, einer der unseren zu werden. Ein Guru.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_13");	//Normalerweise erfordert dies eine jahrelange Ausbildung, aber deine bisherigen Taten und deine Erfahrung haben uns gezeigt, dass der Schläfer mit dir ist.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_21_05");	//Doch du solltest vorher wissen, dass du als einer von uns dein bisheriges Leben hinter dir lassen musst. Sobald du ein Guru bist, wirst du ein Diener des Schläfers sein.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_06");	//Du wirst den unwissenden Seelen vom Schläfer predigen und ihnen zeigen, dass es nur einen wahren Gott gibt. Das der Schläfer der Erlöser unser aller Seelen ist!
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_07");	//Es ist ein Leben mit vielen Entbehrungen, aber der Weg lohnt sich. Sobald du die Stimme des Schläfers vernehmen kannst, wirst du wissen, dass jede dieser Entbehrungen es Wert war.
	AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_08");	//Bevor du dich uns anschliessen kannst, wirst du dich aber noch einer letzten Prüfung unterziehen müssen.
	if(hero.level < 15)
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_05");	//Aber du bist noch nicht soweit. Komm wieder wenn du meinst, dass sich dein Glaube gefestigt hat.
		AI_StopProcessInfos(self);
		B_PrintGuildCondition(15);
	}
	else
	{
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_10");	//Dein Glaube an den Schläfer ist gefestigt und du hast bewiesen das du würdig bist.
		AI_Output(self,other,"GUR_1200_YBerion_WANNBEGURU_Info_20_20");	//Du bist bereit für die Prüfung. Wenn du es wünscht, kannst du direkt anfangen.
		YBERION_GURAUFNAHME = 1;
		gur_1200_yberion_wannbeguru.permanent = 0;
		Info_ClearChoices(gur_1200_yberion_wannbeguru);
		Log_CreateTopic(GE_BECOMEGURU,LOG_NOTE);
		B_LogEntry(GE_BECOMEGURU,"Bevor Y'Berion mich zu einem der Gurus ernennen kann, muss ich mich einer Prüfung unterziehen.");
	};
};


instance GUR_1200_YBERION_GURUTEST(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_gurutest_condition;
	information = gur_1200_yberion_gurutest_info;
	important = 0;
	permanent = 0;
	description = "Ich bin bereit mich der letzten Prüfung zu unterziehen.";
};


func int gur_1200_yberion_gurutest_condition()
{
	if(YBERION_GURAUFNAHME == 1)
	{
		return TRUE;
	};
};

func void gur_1200_yberion_gurutest_info()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_Info_15_01");	//Ich bin bereit mich der letzten Prüfung zu unterziehen.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_02");	//So sei es.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_Info_14_03");	//Weswegen hast du dich für die Bruderschaft des schläfers entschieden?
	BECOME_GURU = LOG_RUNNING;
	Log_CreateTopic(CH2_GURU,LOG_MISSION);
	Log_SetTopicStatus(CH2_GURU,LOG_RUNNING);
	B_LogEntry(CH2_GURU,"Ich habe die letzte Prüfung von Y'Berion angenommen. Wenn ich diese Aufgabe jetzt schaffe, werde ich zu einem Guru befördert.");
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Das hat sich so ergeben.",gur_1200_yberion_gurutest_nurso);
	Info_AddChoice(gur_1200_yberion_gurutest,"Weil ich auf der Suche nach Erlösung war.",gur_1200_yberion_gurutest_erlÖsung);
	Info_AddChoice(gur_1200_yberion_gurutest,"Wegen des Sumpfkrauts.",gur_1200_yberion_gurutest_kraut);
};

func void gur_1200_yberion_gurutest_nurso()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_NURSO_Info_15_01");	//Das hat sich so ergeben.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_03");	//Nun, ich denke das ich mich in dir getäuscht habe. Ich dachte du hättest dich uns als wahrer Anhänger des Glaubens angeschlossen.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_04");	//Unter diesen Umständen, kann ich dich leider nicht in die Ränge der Gurus aufnehmen.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_NURSO_Info_14_05");	//Geh nun, ich habe dir nichts mehr zu sagen.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_erlÖsung()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_15_01");	//Weil ich auf der Suche nach Erlösung war.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_03");	//Du hattest wie wir alle genug von diesem Ort und kamst als wahrer Anhänger des Schläfers in unser Lager.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_04");	//Das ist gut. Hier wirst du deine Erlösung finden. Der Schläfer ist unser Erlöser und er wird uns den Weg weisen.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_05");	//Kommen wir zur nächsten Frage. Wenn du den Worten von Baal Cadar gelauscht hast, wird sie kein Problem für dich sein.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ERLÖSUNG_Info_14_06");	//Wann offenbarte sich mir der Schläfer zum ersten mal?
	YBERION_GURAUFNAHME = 2;
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Vor 3 Jahren.",gur_1200_yberion_gurutest_three);
	Info_AddChoice(gur_1200_yberion_gurutest,"Vor 5 Jahren.",gur_1200_yberion_gurutest_five);
	Info_AddChoice(gur_1200_yberion_gurutest,"Vor 4 Jahren.",gur_1200_yberion_gurutest_four);
	Info_AddChoice(gur_1200_yberion_gurutest,"Ich weiß es nicht.",gur_1200_yberion_gurutest_dontknow);
};

func void gur_1200_yberion_gurutest_kraut()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_15_01");	//Wegen des Sumpfkrauts.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_03");	//Wie du weißt, benutzen wir das Sumpfkraut um dem Schläfer nah zu sein. Es verhilft uns zu Visionen und nebenbei steht es hoch im Handel mit den anderen Lagern.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_04");	//Doch Leute die nur wegen des Sumpfkrauts bei uns sind, haben wir genug. Guru-Anwärter müssen eine reine Seelen haben und festen Glauben.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_KRAUT_Info_14_05");	//Da dies bei dir nicht der Fall ist, bleibt dir der Weg zum Baal verwehrt. Unter diesen Umständen können wir dich nicht mehr aufnehmen.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_three()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_THREE_Info_15_01");	//Vor 3 Jahren.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_03");	//Das ist nicht richtig. Ich merke das du deine Studien vernachlässigt hast. Wir können niemanden gebrauchen, der nicht die Geschichte der Bruderschaft kennt.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_THREE_Info_14_04");	//Tut mir leid, wir können dich nicht aufnehmen. 
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_five()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FIVE_Info_15_01");	//Vor 5 Jahren.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_03");	//Wahre Worte. Es ist wichtig für einen Novizen, sich mit der Geschichte der Bruderschaft des Schläfers zu befassen.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_04");	//Zu den Aufgaben eines Gurus gehört den Unwissenden die Lehre des Schläfers zu verkünden. Dazu gehört auch die Geschichte der Bruderschaft des Schläfers.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_05");	//Du kennst unsere Geschichte. Das bringt dich auf dem Pfad des Lichts ein großes Stück weiter.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FIVE_Info_14_06");	//Eine letzte Frage noch. Wie viele Männer gehören dem Kreis der Baals an?
	YBERION_GURAUFNAHME = 3;
	Info_ClearChoices(gur_1200_yberion_gurutest);
	Info_AddChoice(gur_1200_yberion_gurutest,"Es sind acht.",gur_1200_yberion_gurutest_acht);
	Info_AddChoice(gur_1200_yberion_gurutest,"Es sind sieben.",gur_1200_yberion_gurutest_sieben);
	Info_AddChoice(gur_1200_yberion_gurutest,"Es sind sechs.",gur_1200_yberion_gurutest_sechs);
	Info_AddChoice(gur_1200_yberion_gurutest,"Es sind fünf.",gur_1200_yberion_gurutest_fuenf);
};

func void gur_1200_yberion_gurutest_four()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FOUR_Info_15_01");	//Vor 4 Jahren.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_03");	//Das entspricht nicht der Wahrheit. Ich habe mich getäuscht. Du bist wahrscheinlich doch noch nicht bereit, in den Kreis der Baals aufgenommen zu werden.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FOUR_Info_14_04");	//Geh und widme dich lieber wieder einen Studien.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_dontknow()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_15_01");	//Ich weiß es nicht.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_03");	//Von Jemandem, der in den Kreis der Baals aufgenommen werden möchte, kann ich eine solche Antwort nicht akzeptieren.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_04");	//Es wird besser sein, wenn du dich lieber wieder deinen täglichen Aufgaben widmest.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_DONTKNOW_Info_14_05");	//Der Weg eines Gurus ist wohl doch nicht für dich bestimmt.
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_acht()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_ACHT_Info_15_01");	//Es sind acht.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_03");	//Das ist Richtig.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_04");	//Du hast jede meiner Fragen richtig beantwortet und die Prüfung damit bestanden.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_ACHT_Info_14_05");	//Folge mir nun in die große Halle. Dort werden wir ein altes Ritual durchführen, durch das du Kontakt zum Schläfer herstellen und dein Bewusstsein erweitern kannst.
	YBERION_GURAUFNAHME = 4;
	b_story_guruaufnahme();
	BECOME_GURU = LOG_SUCCESS;
	B_GiveXP(XP_GETBAAL);
	Log_SetTopicStatus(CH2_GURU,LOG_SUCCESS);
	B_LogEntry(CH2_GURU,"Ich habe die Prüfung von Y'Berion gemeistert. Jetzt werde ich bei den Baals der Bruderschaft des Schläfers aufgenommen werden.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sieben()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_15_01");	//Es sind sieben.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_03");	//Das ist nicht wahr. Während deiner Zeit im Lager solltest du eigentlich alle unsere Baals kennengelernt haben.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SIEBEN_Info_14_04");	//Scheinbar habe ich mich in dir getäuscht...
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_sechs()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_SECHS_Info_15_01");	//Es sind sechs.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_03");	//Einen Baal Anwärter, der nicht weiß wie viele Baals wir haben, den können wir hier nicht gebrauchen.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_SECHS_Info_14_04");	//Vielleicht solltest du dich lieber wieder deinen anderen Aufgaben widmen.  
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};

func void gur_1200_yberion_gurutest_fuenf()
{
	AI_Output(other,self,"GUR_1200_YBerion_GURUTEST_FUENF_Info_15_01");	//Es sind fünf.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_02");	//Soso...
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_03");	//Das ist falsch. Mir scheint, dass du einige hochrangige Mitglieder unserer Bruderschaft vergessen hast.
	AI_Output(self,other,"GUR_1200_YBerion_GURUTEST_FUENF_Info_14_04");	//Das ist traurig. Ich denke du bist besser weiterhin bei den Novizen aufgehoben. 
	BECOME_GURU = LOG_FAILED;
	Log_SetTopicStatus(CH2_GURU,LOG_FAILED);
	B_LogEntry(CH2_GURU,"Ich habe versagt und Y'Berion wird mich nicht mehr bei den Gurus aufnehmen.");
	AI_StopProcessInfos(self);
};


instance GUR_1200_YBERION_RITUAL(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_ritual_condition;
	information = gur_1200_yberion_ritual_info;
	important = 1;
	permanent = 0;
};


func int gur_1200_yberion_ritual_condition()
{
	if((YBERION_GURAUFNAHME == 4) && (Npc_GetDistToWP(hero,"PSI_TEMPLE_IN_05") < 1000))
	{
		return 1;
	};
};

func void gur_1200_yberion_ritual_info()
{
	YBERION_GURAUFNAHME = 5;
	AI_UnequipWeapons(hero);
	AI_SetWalkMode(hero,NPC_WALK);
	AI_GotoNpc(hero,self);
	b_story_guruaufnahme();
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_01");	//Unter den wachsamen Augen des Schläfers, haben wir uns zusammen gefunden um diese Bruder in den Kreis der unseren aufzunehmen.
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_02");	//Dieser Mann hat im Namen des Schläfers großes Vollbracht. Er hat vielen Unwissenden den Weg gewiesen. Er hat ihnen gezeigt, welche Kraft ihm der Schläfer verliehen hat.
	Snd_Play("howling_01");
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_03");	//Schläfer! Nimm diesen Mann als deinen Diener an!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_04");	//Schütze ihn auf seinen zukünftigen Reisen und sei im Geiste eins mit ihm!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_05");	//Verleihe ihm die Kraft zu sehen!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_06");	//Lass auch ihn sehen, wie du uns den Weg in die Freiheit weist!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_07");	//Erleuchte seinen Geist und führe ihn auf deinen Pfad des Lichts!
	AI_Output(self,other,"GUR_1200_Yberion_RITUAL_Info_12_08");	//Schläfer erhöre mich!
	AI_StopProcessInfos(self);
};


instance GUR_1200_YBERION_ROBE(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_robe_condition;
	information = gur_1200_yberion_robe_info;
	important = 1;
	permanent = 0;
};


func int gur_1200_yberion_robe_condition()
{
	if(YBERION_GURAUFNAHME == 5)
	{
		return 1;
	};
};

func void gur_1200_yberion_robe_info()
{
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_07");	//Du bist ab jetzt würdig, die Robe eines Baals zu tragen.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_08");	//Nimm diese Robe und trage sie, um deine Verbundenheit mit dem Schläfer zu zeigen.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_09");	//Jetzt wo du ein Baal bist, hast du dir das Recht erworben die Magie des Schläfers zu erlernen.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_10");	//Wenn du lernwillig bist, solltest du mit Baal Cadar sprechen. Er wird dich in der Magie des Schläfers unterrichten.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_11");	//Nun wird es Zeit.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_12");	//Verkünde den Unwissenden dort draußen die Wahrheit.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_13");	//Erzähle ihnen vom Weg des Schläfers. Sag ihnen wie der Weg in die Freiheit aussehen wird.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_14");	//Führe unsere Brüder ihn die Freiheit und zeige ihnen das jedes ihrer Opfer die sie bis dahin bringen, ein Opfer für den Schläfer ist.
	AI_Output(self,other,"GUR_1200_YBerion_ROBE_Info_14_15");	//Denn deine Kraft liegt im Glauben an den Schläfer.
	YBERION_GURAUFNAHME = 6;
	b_story_guruaufnahme();
	Snd_Play("MFX_Heal_Cast");
	CreateInvItem(hero,gur_armor_m);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	Npc_SetTrueGuild(hero,GIL_GUR);
	hero.guild = GIL_GUR;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_EquipBestArmor(hero);
	AI_UnequipWeapons(hero);
	Wld_AssignRoomToGuild("hütte26",GIL_VLK);
	Wld_AssignRoomToGuild("NLHU25",GIL_SLD);
	B_LogEntry(GE_BECOMEGURU,"Ich habe die letzte Prüfung auf dem Weg zum Guru bestanden. Ich habe damit die höchste Gilde der Bruderschaft erreicht und darf mich ab jetzt mit der Magie des Schläfers beschäftigen. Baal Cadar kann mich darin unterrichten.");
	B_LogEntry(GE_BecomeTemplar,"Jetzt wo ich mich für den Weg eines Gurus entschieden habe, kann ich mich nicht mehr den Templern anschliessen.");
	AI_StopProcessInfos(self);
};


instance GUR_1200_YBERION_LASTWORDS(C_Info)
{
	npc = GUR_1200_YBerion;
	condition = gur_1200_yberion_lastwords_condition;
	information = gur_1200_yberion_lastwords_info;
	important = 1;
	permanent = 0;
};


func int gur_1200_yberion_lastwords_condition()
{
	if(Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};
};

func void gur_1200_yberion_lastwords_info()
{
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_01");	//Das Ende...der Schläfer...ich sah...IHN!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_02");	//Wer...?...du bist es, gut. Hör mir zu....
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_03");	//Du darfst den Schläfer nicht wecken,... die Wassermagier, ...
	AI_Output(other,self,"GUR_1200_Yberion_LASTWORDS_Info_15_04");	//Was ist mit den Wassermagiern?
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_05");	//Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_06");	//Der Schläfer...Ich sah ihn. Er ist ein ...ein ....Dämon!
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_07");	//Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_08");	//...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr müsst ....
	AI_Output(self,other,"GUR_1200_Yberion_LASTWORDS_Info_12_09");	//...das Böse....darf nicht erwachen .... 
	AI_StopProcessInfos(self);
};

