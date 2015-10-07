
instance DIA_Fletcher_EXIT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 999;
	condition = DIA_Fletcher_EXIT_Condition;
	information = DIA_Fletcher_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

func void DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fletcher_First(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_First_Condition;
	information = DIA_Fletcher_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fletcher_First_Condition()
{
	if(Wld_IsTime(0,0,6,0))
	{
		return 1;
	};
};

func void DIA_Fletcher_First_Info()
{
	AI_Output(self,other,"DIA_Fletcher_First_06_00");	//Hey, du!
	AI_Output(other,self,"DIA_Fletcher_First_15_01");	//Wer? Ich?
	AI_Output(self,other,"DIA_Fletcher_First_06_02");	//Du weißt genau, mit wem ich rede, Bürschchen!
	AI_Output(self,other,"DIA_Fletcher_First_06_03");	//Ich will dir mal was sagen: Das hier ist MEIN Viertel. Und ich will hier keinen Ärger!
	AI_Output(self,other,"DIA_Fletcher_First_06_04");	//Aber neue Typen wie du bedeuten immer Ärger. Vor allem, wenn sie hier mitten in der Nacht rumlaufen.
	AI_Output(self,other,"DIA_Fletcher_First_06_05");	//Also, warum sorgst du nicht dafür, dass ich dich hier nicht mehr sehe. Die Hütte gegenüber der Arena mit dem Vordach ist frei. Leg dich 'ne Runde ins Bett.
	AI_Output(self,other,"DIA_Fletcher_First_06_06");	//Wenn ich dich in einer der anderen Hütten erwische, zieh ich dir das Fell über die Ohren.
	AI_StopProcessInfos(self);
};


var int fletcher_whytalk;

instance DIA_Fletcher_Hello(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 2;
	condition = DIA_Fletcher_Hello_Condition;
	information = DIA_Fletcher_Hello_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Fletcher_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void DIA_Fletcher_Hello_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_15_00");	//Hey, du!
	AI_Output(self,other,"DIA_Fletcher_Hello_06_01");	//Wenn du dein Schutzgeld loswerden willst - heute ist nicht der Tag.
	AI_Output(other,self,"DIA_Fletcher_Hello_15_02");	//So? Und warum nicht?
	AI_Output(self,other,"DIA_Fletcher_Hello_06_03");	//Weil ich gar nicht da bin.
	Info_ClearChoices(DIA_Fletcher_Hello);
	Info_AddChoice(DIA_Fletcher_Hello,"Verstehe.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice(DIA_Fletcher_Hello,"Wie kommt es dann, dass wir beide uns unterhalten?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice(DIA_Fletcher_Hello,"Wo bist du denn?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhereElse_15_00");	//Wo bist du denn?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhereElse_06_01");	//Eigentlich bin ich in der Burg, am großen Lagerfeuer, und trinke ein Bier.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_WhyTalk_15_00");	//Wie kommt es dann, dass wir beide uns unterhalten?
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_01");	//Nek ist verschwunden. Er ist normalerweise für dieses Viertel verantwortlich.
	AI_Output(self,other,"DIA_Fletcher_Hello_WhyTalk_06_02");	//Bis er wieder da ist, hat Thorus MICH hier eingesetzt.
	fletcher_whytalk = TRUE;
	Info_ClearChoices(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output(other,self,"DIA_Fletcher_Hello_ISee_15_00");	//Verstehe.
	Info_ClearChoices(DIA_Fletcher_Hello);
};


instance DIA_Fletcher_WoNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WoNek_Condition;
	information = DIA_Fletcher_WoNek_Info;
	permanent = 0;
	description = "Weißt du, wo Nek geblieben ist?";
};


func int DIA_Fletcher_WoNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Hello) && (Sly_LostNek == LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Fletcher_WoNek_Info()
{
	AI_Output(other,self,"DIA_Fletcher_WoNek_15_00");	//Weißt du, wo Nek geblieben ist?
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_01");	//Nein, und ich werde es auch nicht rausfinden.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_02");	//Wenn einer was weiß, dann die Buddler aus diesem Viertel. Aber die Buddler reden nicht mit Gardisten.
	AI_Output(self,other,"DIA_Fletcher_WoNek_06_03");	//Vor allem nicht jetzt, denn sie wissen, dass ich diese Drecksarbeit hier verabscheue, und insgeheim lachen sie sich über mich tot!
	B_LogEntry(CH1_LostNek,"Die Buddler im Arenaviertel wissen vielleicht, wohin Nek verschwunden ist.");
};


instance DIA_Fletcher_TroSchu(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_TroSchu_Condition;
	information = DIA_Fletcher_TroSchu_Info;
	permanent = 0;
	description = "Warum sammelst du nicht trotzdem Schutzgeld?";
};


func int DIA_Fletcher_TroSchu_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Hello) && (fletcher_whytalk == TRUE))
	{
		return 1;
	};
};

func void DIA_Fletcher_TroSchu_Info()
{
	AI_Output(other,self,"DIA_Fletcher_TroSchu_15_00");	//Warum sammelst du nicht trotzdem Schutzgeld?
	AI_Output(self,other,"DIA_Fletcher_TroSchu_06_01");	//Kurz bevor er verschwunden ist, hat Nek noch einmal alle kräftig zur Kasse gebeten. Da ist nicht mehr viel zu holen.
};


instance DIA_Fletcher_WegenNek(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_WegenNek_Condition;
	information = DIA_Fletcher_WegenNek_Info;
	permanent = 0;
	description = "Wegen Nek...";
};


func int DIA_Fletcher_WegenNek_Condition()
{
	if(Sly_LostNek == LOG_SUCCESS)
	{
		return 1;
	};
};

func void DIA_Fletcher_WegenNek_Info()
{
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_00");	//Wegen Nek ...
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_03");	//Was? Wo ist er?
	AI_Output(other,self,"DIA_Fletcher_WegenNek_15_04");	//Er ist Futter für die Ratten.
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_05");	//Nein! Verdammt! Dann muss ICH jetzt den Laden hier schmeißen. Ich hatte gehofft, er kommt wieder.
	AI_Output(self,other,"DIA_Fletcher_WegenNek_06_06");	//Jetzt hab' ich ein Problem ...
};


instance DIA_Fletcher_Problem(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = DIA_Fletcher_Problem_Condition;
	information = DIA_Fletcher_Problem_Info;
	permanent = 0;
	description = "Was ist dein Problem?";
};


func int DIA_Fletcher_Problem_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_WegenNek))
	{
		return 1;
	};
};

func void DIA_Fletcher_Problem_Info()
{
	AI_Output(other,self,"DIA_Fletcher_Problem_15_00");	//Was ist dein Problem?
	AI_Output(self,other,"DIA_Fletcher_Problem_06_01");	//Ich habe Schulden bei Scatty. 'Ne Menge Schulden. Jetzt, wo er weiß, dass ich Neks Job mache, wird er jeden Tag bei mir auf der Matte stehen ...
};


instance DIA_FLETCHER_REDEN(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_reden_condition;
	information = dia_fletcher_reden_info;
	permanent = 0;
	description = "Ich könnte mich ja mal mit Scatty unterhalten.";
};


func int dia_fletcher_reden_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fletcher_Problem))
	{
		return 1;
	};
};

func void dia_fletcher_reden_info()
{
	AI_Output(other,self,"DIA_Fletcher_Reden_15_00");	//Ich könnte mich ja mal mit Scatty unterhalten.
	AI_Output(self,other,"DIA_Fletcher_Reden_06_01");	//Tu das, aber ich sag dir jetzt schon, meine Schulden wird er mit mit Sicherheit nicht einfach so erlassen.
	FLETCHER_SCHULDEN = LOG_RUNNING;
	Log_CreateTopic(CH1_FLETCHER_SCHULDEN,LOG_MISSION);
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Fletcher hat mir erzählt, dass er Schulden bei Scatty hat. Vielleicht sollte ich mich mal mit dem darüber unterhalten.");
	Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_RUNNING);
};


instance DIA_FLETCHER_GOTTOFIGHT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_gottofight_condition;
	information = dia_fletcher_gottofight_info;
	permanent = 0;
	description = "Ich hab mit Scatty geredet.";
};


func int dia_fletcher_gottofight_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_remember) || (SCATTY_IDOIT == TRUE))
	{
		return 1;
	};
};

func void dia_fletcher_gottofight_info()
{
	AI_Output(other,self,"DIA_Fletcher_GottoFight_15_00");	//Ich hab' mit Scatty geredet.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_01");	//Und was hat er gesagt?
	AI_Output(other,self,"DIA_Fletcher_GottoFight_06_02");	//Er wird dir deine Schulden erlassen, wenn ich es schaffe Gor Hanis in der Arena zu besiegen.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_03");	//Da hast du dir aber einen ganz schön harten Brocken als Gegner ausgesucht.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_04");	//Gor Hanis ist einer der Templer aus dem Lager der Sektenspinner.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_05");	//Diese Typen wissen wie man mit einem Schwert umgeht.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_06");	//Ich würde an deiner Stelle erst gegen ihn kämpfen, wenn du gut im Umgang mit dem Schwert bist.
	AI_Output(self,other,"DIA_Fletcher_GottoFight_06_07");	//Es ist im Interesse von uns beiden.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Ich habe Fletcher von dem Angebot erzählt. Er meinte ich solle erst ordentlich trainiert sein, bevor ich gegen Gor Hanis antrete.");
};


instance DIA_FLETCHER_RESULT(C_Info)
{
	npc = GRD_255_Fletcher;
	nr = 1;
	condition = dia_fletcher_result_condition;
	information = dia_fletcher_result_info;
	permanent = 0;
	description = "Ich habe in der Arena gekämpft.";
};


func int dia_fletcher_result_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((HANIS_HERAUSFORDERUNG == TRUE) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_fletcher_result_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Fletcher_Result_15_00");	//Ich habe in der Arena gekämpft.
	if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_01_01");	//Wie ist es gelaufen?
		AI_Output(other,self,"DIA_Fletcher_Result_01_02");	//Ich habe Gor Hanis besiegt.
		AI_Output(self,other,"DIA_Fletcher_Result_01_03");	//Sehr gut. Damit bin ich meine Schulden bei Scatty los. Hier ich geb' dir einen Teil des Erzes, dass ich gesammelt hab als Belohnung.
		AI_Output(other,self,"DIA_Fletcher_Result_01_04");	//Nur ein paar Brocken Erz?
		AI_Output(self,other,"DIA_Fletcher_Result_01_05");	//Mehr hab' ich momentan nicht. Aber ich sag' dir, irgendwann werde ich mich noch erkenntlich zeigen.
		B_GiveInvItems(self,other,ItMiNugget,75);
		AI_StopProcessInfos(self);
	}
	else if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Fletcher_Result_02_01");	//Wie ist es gelaufen?
		AI_Output(other,self,"DIA_Fletcher_Result_02_02");	//Gor Hanis hat mich geschlagen.
		AI_Output(self,other,"DIA_Fletcher_Result_02_03");	//Verdammt! Jetzt muss ich weiter das Erz für Scatty sammeln.
		AI_Output(other,self,"DIA_Fletcher_Result_02_04");	//Achja, übrigens ist die Summe jetzt die Doppelte...
		AI_Output(self,other,"DIA_Fletcher_Result_02_05");	//WAS?! Wieso hast du mir das nicht vorher gesagt? Ich kann es nicht leiden wenn man mich verarscht...
		AI_Output(other,self,"DIA_Fletcher_Result_02_06");	//Nun...
		AI_Output(self,other,"EXTRA_FICKDICHSELBER");	//Fick dich selber du Arschloch!
		AI_StopProcessInfos(self);
		Npc_SetPermAttitude(self,ATT_ANGRY);
	};
};


instance Grd_255_Fletcher_WELCOME(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Grd_255_Fletcher_WELCOME_Condition;
	information = Grd_255_Fletcher_WELCOME_Info;
	important = 1;
	permanent = 0;
};


func int Grd_255_Fletcher_WELCOME_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output(self,other,"Grd_255_Fletcher_WELCOME_Info_06_01");	//Du hast ziemlich schnell kapiert, wie es hier läuft. Willkommen bei der Garde!
};


instance GRD_255_FLETCHER_WHATSUP(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_whatsup_condition;
	information = grd_255_fletcher_whatsup_info;
	important = 0;
	permanent = 0;
	description = "Was ist los?";
};


func int grd_255_fletcher_whatsup_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GRD) && (Kapitel == 3) && (FLETCHER_SCHULDEN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_whatsup_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_01");	//Was ist los?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_02");	//Mann... ich kann dir gar nicht sagen wie sehr mir dieser Scheiss Job auf den Sack geht.
	AI_Output(other,self,"Grd_255_Fletcher_WhatsUp_Info_06_03");	//Gibt es niemanden der dich mal hier ablöst?
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_04");	//Nein, ich bin der Einzige von uns Gardisten der hier momentan das Viertel übernehmen kann.
	AI_Output(self,other,"Grd_255_Fletcher_WhatsUp_Info_06_05");	//Die anderen Jungs haben irgendwelche anderen wichtigen Aufgaben.
};


instance GRD_255_FLETCHER_ABLOESUNG(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_abloesung_condition;
	information = grd_255_fletcher_abloesung_info;
	important = 0;
	permanent = 0;
	description = "Was ist wenn ich dich ablöse?";
};


func int grd_255_fletcher_abloesung_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_whatsup))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_abloesung_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_Abloesung_Info_06_01");	//Was ist wenn ich dich ablöse?
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_02");	//Eigentlich gar keine so schlechte Idee. Du hast mir immerhin mit meinen Schulden bei Scatty geholfen.
	AI_Output(self,other,"Grd_255_Fletcher_Abloesung_Info_06_03");	//Dann werde ich dir auch diese Aufgabe anvertrauen können.
};


instance GRD_255_FLETCHER_MUSSTUN(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_musstun_condition;
	information = grd_255_fletcher_musstun_info;
	important = 0;
	permanent = 0;
	description = "Was genau muss ich tun?";
};


func int grd_255_fletcher_musstun_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_abloesung))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_musstun_info()
{
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_01");	//Was genau muss ich tun?
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_02");	//Es ist gar nicht so schwer. Das Schutzgeld wird alle fünf Tage gesammelt. Du wirst die Buddler ganz einfach nur drauf ansprechen müssen, die wissen schon bescheid.
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_03");	//Dein Viertel ist übrigens das Arenaviertel. Um die anderen Viertel brauchst du dich nicht kümmern, dafür sind Jackal und Bloodwyn da.
	AI_Output(other,self,"Grd_255_Fletcher_MussTun_Info_06_04");	//Verstehe.
	AI_Output(self,other,"Grd_255_Fletcher_MussTun_Info_06_05");	//Dann kann ich mich jetzt endlich wieder ans große Lagerfeuer stellen und erstmal ein kühles Bier trinken.
	Log_CreateTopic(GE_ORECOLLECT,LOG_NOTE);
	B_LogEntry(GE_ORECOLLECT,"Ab jetzt habe ich die Möglichkeit Schutzgeld im Arenaviertel des Alten Lagers einzusammeln. Mein Viertel ist das Arenaviertel und muss die Buddler bloß alle 5 Tage darauf ansprechen.");
	Npc_ExchangeRoutine(self,"ChapterThree");
};


instance Info_Fletcher_DIE(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = Info_Fletcher_DIE_Condition;
	information = Info_Fletcher_DIE_Info;
	permanent = 0;
	important = 1;
};


func int Info_Fletcher_DIE_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void Info_Fletcher_DIE_Info()
{
	AI_GotoNpc(self,hero);
	if((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF) || (oldHeroGuild == GIL_STT) || (oldHeroGuild == GIL_EBR))
	{
		if(oldHeroGuild == GIL_GRD)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_01");	//Du Verräter! Na dich haben wir mal zum Gardisten gemacht. PAH!
		}
		else if(oldHeroGuild == GIL_KDF)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_02");	//Da ist noch einer von diesen verräterischen Feuermagiern! PAH!
		}
		else if(oldHeroGuild == GIL_STT)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_03");	//Hallo Verräter! Auch dein früherer Status als einer von Gomez' Schatten wird dir jetzt nichts mehr helfen!
		}
		else if(oldHeroGuild == GIL_EBR)
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_07_02");	//Was Raven dazu veranlasst hat DICH zu einem Erzbaron zu machen, ist mir bis heute ein Rätsel. Schade das du uns verraten hast. Du hättest es weit bringen können. PAH!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_04");	//Moment. Wovon redest du, Fletcher?
		AI_Output(self,hero,"Info_Fletcher_DIE_06_05");	//Steckst mit diesem abtrünnigen Abschaum aus dem Neuen Lager unter einer Decke, was?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_06");	//Warte mal ...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_07");	//Hattest wohl gedacht, wir würden nicht dahinter kommen, wie?
		AI_Output(hero,self,"Info_Fletcher_DIE_15_08");	//Jetzt aber mal halblang ...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_09");	//Wir werden DICH halblang machen. Oder genauer gesagt, einen Kopf kürzer.
		AI_Output(self,hero,"Info_Fletcher_DIE_06_10");	//STIRB, VERRÄTER!!!
		if(Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
		{
			B_LogEntry(CH4_BannedFromOC,"Bloodwyn, hat sich am hinteren Tor verschanzt. Er reagierte ähnlich wie Fletcher am Haupttor. Mir ist nicht klar warum, aber es muss etwas mit meiner Fokussuche für das Neue Lager zu tun haben.");
		}
		else if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
			Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
			B_LogEntry(CH4_BannedFromOC,"Fletcher, der nun mit einer Gruppe Gardisten am Haupttor des Alten Lagers Wache hält, bezeichnete mich als Verräter und Abtrünniger. Er lies sich auf keine Diskussion ein und griff mich sofort an!");
			B_LogEntry(CH4_BannedFromOC,"Es sieht so aus, als ob ich nun aus dem alten Lager verbannt wurde!");
		};
	}
	else
	{
		if(C_NpcBelongsToNewCamp(hero))
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_11");	//Sieh mal einer an. Einer aus dem Neuen Lager!
			AI_Output(hero,self,"Info_Fletcher_DIE_15_13");	//Ja, und? Was geht dich das an?
			AI_Output(self,hero,"Info_Fletcher_DIE_06_14");	//Bald wird auch eure Mine zu uns gehören.
			AI_Output(hero,self,"Info_Fletcher_DIE_15_15");	//Davon träumst du doch nur!
			AI_Output(self,hero,"Info_Fletcher_DIE_06_16");	//Leider können wir es nicht zulassen, dass du das irgendwo herumerzählst!
		}
		else
		{
			AI_Output(self,hero,"Info_Fletcher_DIE_06_12");	//Sieh mal einer an. Einer aus dem Sumpflager!
		};
		AI_Output(hero,self,"Info_Fletcher_DIE_15_17");	//Warte mal, ich bin nicht auf Streit aus ...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_18");	//Das hättest du dir überlegen sollen, bevor du hier aufkreuzt!
		AI_Output(hero,self,"Info_Fletcher_DIE_15_19");	//He, was soll der Unfug ...
		AI_Output(self,hero,"Info_Fletcher_DIE_06_20");	//Auf ihn Jungs, den schnappen wir uns!
	};
	Npc_ExchangeRoutine(self,"FMTaken2");
	B_ExchangeRoutine(GRD_252_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_253_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_244_Gardist,"FMTaken2");
	B_ExchangeRoutine(GRD_214_Torwache,"FMTaken2");
	B_ExchangeRoutine(GRD_215_Torwache,"FMTaken2");
	B_SetPermAttitude(GRD_255_Fletcher,ATT_HOSTILE);
	B_SetPermAttitude(GRD_252_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_253_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_244_Gardist,ATT_HOSTILE);
	B_SetPermAttitude(GRD_214_Torwache,ATT_HOSTILE);
	B_SetPermAttitude(GRD_215_Torwache,ATT_HOSTILE);
	if(!Npc_KnowsInfo(hero,Info_Bloodwyn_DIE))
	{
		B_LogEntry(CH4_Firemages,"Die Tore des Alten Lagers sind nun verschlossen und werden von Gardisten bewacht. Sie attackieren jeden der dem Lager zu nahe kommt.");
	};
	AI_StopProcessInfos(self);
};


instance GRD_255_FLETCHER_NC(C_Info)
{
	npc = GRD_255_Fletcher;
	condition = grd_255_fletcher_nc_condition;
	information = grd_255_fletcher_nc_info;
	important = 1;
	permanent = 0;
};


func int grd_255_fletcher_nc_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void grd_255_fletcher_nc_info()
{
	AI_Output(self,other,"Grd_255_Fletcher_NC_Info_06_01");	//Was macht einer wie du hier in unserem Lager? Sieh' zu das du wieder zum anderen Abschaum ins Neue Lager gehst.
};

