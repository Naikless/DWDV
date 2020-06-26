
instance DIA_Grim_Exit(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 999;
	condition = DIA_Grim_Exit_Condition;
	information = DIA_Grim_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Grim_Exit_Condition()
{
	return 1;
};

func void DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grim_Falle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Falle_Condition;
	information = DIA_Grim_Falle_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_Falle_Condition()
{
	if((Grim_ProtectionBully == TRUE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Grim_Falle_Info()
{
	AI_Output(self,other,"DIA_Grim_Falle_06_00");	//Hey, du! Du bist doch der Typ, der hier im Lager aufgenommen werden will?
	AI_Output(other,self,"DIA_Grim_Falle_15_01");	//Und wenn es so wäre?
	AI_Output(self,other,"DIA_Grim_Falle_06_02");	//Ich könnte dir dabei helfen ...
	AI_Output(other,self,"DIA_Grim_Falle_15_03");	//Und wie?
	AI_Output(self,other,"DIA_Grim_Falle_06_04");	//Draußen vorm Lager sitzen zwei Typen rum, von denen einer die Erzbarone bestohlen hat. Es ist ein wertvolles Amulett, das mit dem letzten Konvoi gekommen sein sollte.
	AI_Output(self,other,"DIA_Grim_Falle_06_05");	//Einer von ihnen müsste das Amulett noch haben. Wenn wir beide auf sie draufgehen, schaffen wir sie - alleine kann ich's nicht machen. Was sagst du?
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"Kein Interesse - such dir einen anderen.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Was passiert, wenn wir das Amulett haben?",DIA_Grim_Falle_HowShare);
	Info_AddChoice(DIA_Grim_Falle,"Ich bin dabei!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output(other,self,"DIA_Grim_Falle_Deny_15_00");	//Kein Interesse - such dir einen anderen.
	AI_Output(self,other,"DIA_Grim_Falle_Deny_06_01");	//Mit der Einstellung kommst du hier nicht weit - sag mir Bescheid, falls du's dir doch noch überlegen solltest!
	Info_ClearChoices(DIA_Grim_Falle);
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output(other,self,"DIA_Grim_Falle_HowShare_15_00");	//Was passiert, wenn wir das Amulett haben?
	AI_Output(self,other,"DIA_Grim_Falle_HowShare_06_01");	//Ganz einfach! Ich geb's zurück und kassier die Belohnung - dabei sag' ich, dass du mir geholfen hast. Damit hast du bei Gomez 'nen Stein in Brett.
	Info_ClearChoices(DIA_Grim_Falle);
	Info_AddChoice(DIA_Grim_Falle,"Kein Interesse - such dir einen anderen.",DIA_Grim_Falle_Deny);
	Info_AddChoice(DIA_Grim_Falle,"Wir machen Halbe-Halbe! Oder du kannst dich alleine mit den Typen anlegen!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice(DIA_Grim_Falle,"Ich bin dabei!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output(other,self,"DIA_Grim_Falle_HalfHalf_15_00");	//Nein! Wir machen halbe-halbe! Oder du kannst dich alleine mit den Typen anlegen!
	AI_Output(self,other,"DIA_Grim_Falle_HalfHalf_06_01");	//Okay, okay, halbe-halbe. Wird schon genug dabei rausspringen. Also - bist du dabei?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output(other,self,"DIA_Grim_Falle_Accepr_15_00");	//Ich bin dabei!
	AI_Output(self,other,"DIA_Grim_Falle_Accepr_06_01");	//Gut, sag Bescheid, sobald wir losgehen können!
	Info_ClearChoices(DIA_Grim_Falle);
};


instance DIA_Grim_ReadyToGo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_ReadyToGo_Condition;
	information = DIA_Grim_ReadyToGo_Info;
	permanent = 0;
	description = "Ich bin bereit, mit dir zu gehen - lass uns das Amulett holen!";
};


func int DIA_Grim_ReadyToGo_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

func void DIA_Grim_ReadyToGo_Info()
{
	AI_Output(other,self,"DIA_Grim_ReadyToGo_15_00");	//Ich bin bereit, mit dir zu gehen - lass uns das Amulett holen!
	AI_Output(self,other,"DIA_Grim_ReadyToGo_06_01");	//Gut! Dann wollen wir mal ...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_Grim_AtOCdraussen(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_AtOCdraussen_Condition;
	information = DIA_Grim_AtOCdraussen_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_AtOCdraussen_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo) && (Npc_GetDistToWP(hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500))
	{
		return 1;
	};
};

func void DIA_Grim_AtOCdraussen_Info()
{
	var C_Npc Bu520;
	var C_Npc Bu534;
	AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_00");	//So, hier sind wir. Schön weit weg von deinem Freund Diego.
	if(((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520)) || ((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534)))
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_01");	//Wir sollen dir schöne Grüße von Bloodwyn bestellen!
	}
	else
	{
		AI_Output(self,other,"DIA_Grim_AtOCdraussen_06_02");	//Ich soll dir schöne Grüße von Bloodwyn bestellen ...
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
	Bu520 = Hlp_GetNpc(VLK_520_Buddler);
	Bu534 = Hlp_GetNpc(VLK_534_Buddler);
	if((Npc_GetDistToNpc(self,Bu520) < 1000) && !Npc_IsDead(Bu520))
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_Attack,1,"");
	};
	if((Npc_GetDistToNpc(self,Bu534) < 1000) && !Npc_IsDead(Bu534))
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_Attack,1,"");
	};
};


instance DIA_Grim_NACHFalle(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_NACHFalle_Condition;
	information = DIA_Grim_NACHFalle_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_NACHFalle_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen) && (Npc_GetDistToNpc(self,other) < ZivilAnquatschDist))
	{
		return 1;
	};
};

func void DIA_Grim_NACHFalle_Info()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_15_01");	//Du Penner wolltest mir also nur 'ne Falle stellen ...
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_02");	//Hey, Mann! Wir spielen beide dasselbe Spiel! Ich hab' auch keine Lust, in den Minen buddeln zu gehen.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_03");	//Also werd' ich tun, was mir die Gardisten sagen, dann werde ich hier bald aufgenommen.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_04");	//Dass ich ausgerechnet DIR aufs Maul hauen sollte, hast du dir im Grunde selber zuzuschreiben. Warum legst du dich auch mit den Gardisten an.
	AI_Output(self,other,"DIA_Grim_NACHFalle_06_05");	//Persönlich hab' ich nichts gegen dich. Also was ist - Frieden oder weiterprügeln?
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Info_AddChoice(DIA_Grim_NACHFalle,"Weiterprügeln.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice(DIA_Grim_NACHFalle,"Frieden.",DIA_Grim_NACHFalle_Frieden);
};

func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00");	//Mir ist eher nach Weiterprügeln!
	AI_Output(self,other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01");	//Oh Mann, du schaffst mich ...
	Info_ClearChoices(DIA_Grim_NACHFalle);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output(other,self,"DIA_Grim_NACHFalle_Frieden_15_00");	//Frieden klingt gut.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_01");	//Freut mich, dass du das Ganze durch meine Augen sehen kannst. Die Sache ist vergessen. Ab jetzt bin ich auf deiner Seite.
	AI_Output(self,other,"DIA_Grim_NACHFalle_Frieden_06_02");	//Wenn du noch mal Ärger haben solltest - kannst du auf mich zählen - schließlich schulde ich dir was.
	Info_ClearChoices(DIA_Grim_NACHFalle);
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};


var int FirstOver;

instance DIA_Grim_Hallo(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_Hallo_Condition;
	information = DIA_Grim_Hallo_Info;
	permanent = 0;
	description = "Ich bin neu hier!";
};


func int DIA_Grim_Hallo_Condition()
{
	if(Grim_ProtectionBully == TRUE)
	{
		FirstOver = TRUE;
	};
	if(FirstOver == FALSE)
	{
		return 1;
	};
};

func void DIA_Grim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Grim_Hallo_15_00");	//Ich bin neu hier!
	AI_Output(self,other,"DIA_Grim_Hallo_06_01");	//Gerade angekommen, was? Ich bin Grim - bin auch noch nicht so lange da. Bin eine Fuhre vor dir mit reingeworfen worden.
};


instance DIA_Grim_Leben(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 2;
	condition = DIA_Grim_Leben_Condition;
	information = DIA_Grim_Leben_Info;
	permanent = 0;
	description = "Wie ist das Leben hier so?";
};


func int DIA_Grim_Leben_Condition()
{
	return 1;
};

func void DIA_Grim_Leben_Info()
{
	AI_Output(other,self,"DIA_Grim_Leben_15_00");	//Wie ist das Leben hier so?
	AI_Output(self,other,"DIA_Grim_Leben_06_01");	//Ganz ruhig, so lange du dein Schutzgeld an die Gardisten bezahlst.
};


instance DIA_Grim_Aufnahme(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 3;
	condition = DIA_Grim_Aufnahme_Condition;
	information = DIA_Grim_Aufnahme_Info;
	permanent = 0;
	description = "Was muss ich machen, wenn ich in dieses Lager aufgenommen werden will?";
};


func int DIA_Grim_Aufnahme_Condition()
{
	return 1;
};

func void DIA_Grim_Aufnahme_Info()
{
	AI_Output(other,self,"DIA_Grim_Aufnahme_15_00");	//Was muss ich machen, wenn ich in diesem Lager aufgenommen werden will?
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_01");	//Also zuerst mal wirst du Schatten. Dazu musst du einen Fürsprecher finden. Jemand, der dir alles erklärt und für dich einsteht.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_02");	//Ich an deiner Stelle würd' mich direkt an Diego halten - hab' ich auch gemacht - der ist ganz in Ordnung.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_03");	//Er stellt dir die Prüfung des Vertrauens - die sieht bei jedem anders aus. Dann gibt's noch einige kleinere Aufgaben von anderen Schatten.
	AI_Output(self,other,"DIA_Grim_Aufnahme_06_04");	//Wenn du die gelöst hast, bist du dabei.
};


var int Grim_Tests;

instance DIA_Grim_HowFarAreYou(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 4;
	condition = DIA_Grim_HowFarAreYou_Condition;
	information = DIA_Grim_HowFarAreYou_Info;
	permanent = 1;
	description = "Und - wie weit bist du mit deinen Prüfungen?";
};


func int DIA_Grim_HowFarAreYou_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules) && (Kapitel == 1))
	{
		return 1;
	};
};

func void DIA_Grim_HowFarAreYou_Info()
{
	AI_Output(other,self,"DIA_Grim_HowFarAreYou_15_00");	//Und - wie weit bist du mit deinen Prüfungen?
	AI_Output(self,other,"DIA_Grim_HowFarAreYou_06_01");	//Ich hab' schon mit Dexter, Sly und Fingers geredet. Das sind einige der einflussreichsten Schatten hier im Lager.
	if(!Grim_Tests)
	{
		B_LogEntry(CH1_JoinOC,"Einflussreiche Schatten sind Dexter, Sly und Fingers");
		Grim_Tests = TRUE;
	};
};


instance DIA_Grim_YourPDV(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 5;
	condition = DIA_Grim_YourPDV_Condition;
	information = DIA_Grim_YourPDV_Info;
	permanent = 0;
	description = "Was ist DEINE Prüfung des Vertrauens?";
};


func int DIA_Grim_YourPDV_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

func void DIA_Grim_YourPDV_Info()
{
	AI_Output(other,self,"DIA_Grim_YourPDV_15_00");	//Was ist DEINE Prüfung des Vertrauens?
	AI_Output(self,other,"DIA_Grim_YourPDV_06_01");	//Das kann ich dir nicht sagen, Mann. Über solche Dinge musst du hier schweigen!
};


instance DIA_Grim_INEXTREMO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMO_Condition;
	information = DIA_Grim_INEXTREMO_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Grim_INEXTREMO_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMO_Info()
{
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_01");	//Hey, hast du schon gehört?
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_02");	//In Extremo ist hier. Sie sind drüben auf der Bühne.
	AI_Output(self,other,"DIA_Grim_INEXTREMO_06_03");	//Schnell, sonst versäumst du noch den Auftritt!
	Npc_ExchangeRoutine(self,"InExtremo");
	AI_StopProcessInfos(self);
};


instance DIA_GRIM_SCHATTEN(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = dia_grim_schatten_condition;
	information = dia_grim_schatten_info;
	permanent = 1;
	important = 0;
	description = "Du bist Schatten?";
};


func int dia_grim_schatten_condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void dia_grim_schatten_info()
{
	AI_Output(other,self,"DIA_Grim_SCHATTEN_06_01");	//Du bist Schatten?
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_02");	//Ja, ich wurd' vor kurzem aufgenommen.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_03");	//Ist echt ein gutes Leben, dass man als einer von Gomez' Leuten hat.
	AI_Output(self,other,"DIA_Grim_SCHATTEN_06_04");	//Könnt' mir nichts besseres vorstellen.
	if(Npc_GetTrueGuild(hero) == GIL_STT)
	{
		AI_Output(self,other,"DIA_Grim_SCHATTEN_06_05");	//Du scheinst das ja genauso zu sehen, Kollege.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Grim_INEXTREMOAWAY(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = DIA_Grim_INEXTREMOAWAY_Condition;
	information = DIA_Grim_INEXTREMOAWAY_Info;
	permanent = 0;
	important = 0;
	description = "Wo sind InExtremo?";
};


func int DIA_Grim_INEXTREMOAWAY_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_INEXTREMO) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output(hero,self,"DIA_Grim_INEXTREMOAWAY_15_01");	//Wo sind InExtremo?
	AI_Output(self,hero,"DIA_Grim_INEXTREMOAWAY_06_02");	//Sie sind weitergezogen. Schade, ich hatte mich an die Abende vor der Bühne gewöhnt.
	AI_StopProcessInfos(self);
};


var int grim_member;
var int grim_kumpel;

instance DIA_GRIM_LETSGO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_letsgo_condition;
	information = dia_grim_letsgo_info;
	permanent = 0;
	description = "Du hast gesagt, ich kann von nun an auf deine Hilfe zählen.";
};


func int dia_grim_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Grim_NACHFalle))
	{
		return 1;
	};
};

func void dia_grim_letsgo_info()
{
	AI_Output(other,self,"DIA_Grim_LetsToGo_15_00");	//Du hast gesagt, ich kann von nun an auf deine Hilfe zählen.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_01");	//Du meinst wegen der Sache mit dem Amulett? Ich halt' mein Wort, keine Sorge.
	AI_Output(self,other,"DIA_Grim_LetsToGo_06_02");	//Wenn du irgendwas hast, komm' zu mir und ich werd' dich in den Kampf begleiten.
	GRIM_KUMPEL = TRUE;
};


instance DIA_GRIM_GOGO(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_gogo_condition;
	information = dia_grim_gogo_info;
	permanent = 1;
	description = "Komm mit.";
};


func int dia_grim_gogo_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_letsgo) && (GRIM_KUMPEL == TRUE) && (GRIM_MEMBER == FALSE))
	{
		return 1;
	};
};

func void dia_grim_gogo_info()
{
	AI_Output(other,self,"DIA_Grim_GoGo_15_00");	//Komm mit.
	AI_Output(self,other,"DIA_Grim_GoGo_06_01");	//Alles klar. Bin direkt hinter dir.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	GRIM_MEMBER = TRUE;
};


instance DIA_GRIM_STOP(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 9;
	condition = dia_grim_stop_condition;
	information = dia_grim_stop_info;
	permanent = 1;
	description = "Hier trennen sich unsere Wege.";
};


func int dia_grim_stop_condition()
{
	if(Npc_KnowsInfo(hero,dia_grim_letsgo) && (GRIM_MEMBER == TRUE))
	{
		return 1;
	};
};

func void dia_grim_stop_info()
{
	AI_Output(other,self,"DIA_Grim_Stop_15_00");	//Hier trennen sich unsere Wege.
	AI_Output(self,other,"DIA_Grim_Stop_06_01");	//Wie du willst. Wenn du mich suchst, du weißt ja wo du mich findest.
	AI_StopProcessInfos(self);
	if((Kapitel == 1) || (Kapitel >= 3))
	{
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Kapitel == 2)
	{
		Npc_ExchangeRoutine(self,"INEXTREMO");
	};
	GRIM_MEMBER = FALSE;
};


instance INFO_GRIM_NCWAIT(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_ncwait_condition;
	information = info_grim_ncwait_info;
	important = 1;
	permanent = 0;
};


func int info_grim_ncwait_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_174") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_ncwait_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_NCWAIT_09_01");	//Warte mal...
	AI_Output(self,other,"Info_Grim_NCWAIT_09_02");	//Ich kann dir zwar nicht sagen wieso, aber irgendwas ist an dem Turm unheimlich. Das spüre ich.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_03");	//Wenn du da rein willst, können wir das gern' machen. Aber ich bin mir nicht sicher, ob wir da wieder lebend herauskommen.
	AI_Output(self,other,"Info_Grim_NCWAIT_15_04");	//Sag also nicht ich hätte dich nicht gewarnt.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_PSI(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_psi_condition;
	information = info_grim_psi_info;
	important = 1;
	permanent = 0;
};


func int info_grim_psi_condition()
{
	if(Npc_GetDistToWP(self,"PSI_START") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_psi_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_PSI_09_01");	//Das ist also das Lager der Sekte...
	AI_Output(self,other,"Info_Grim_PSI_09_02");	//Ich war noch nie hier, aber ich hab' gehört, dass die Jungs alle ganz in Ordnung sind.
	AI_Output(self,other,"Info_Grim_PSI_15_03");	//Nur einige von denen sind ziemlich weich in der Birne, weil sie zu viel von ihrem zeug geraucht haben.
	AI_Output(self,other,"Info_Grim_PSI_15_04");	//Gehen wir rein und schauen uns das an.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_SHIP(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_ship_condition;
	information = info_grim_ship_info;
	important = 1;
	permanent = 0;
};


func int info_grim_ship_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_25_01") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_ship_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Ship_09_01");	//Ein Schiff...
	AI_Output(self,other,"Info_Grim_Ship_09_02");	//Meinst du da drin ist was zu holen?
	AI_Output(self,other,"Info_Grim_Ship_15_03");	//Bevor ich hier reingeworfen wurde, hab' ich Geschichten über Piraten gehört.
	AI_Output(self,other,"Info_Grim_Ship_15_04");	//Könnte vielleicht eins ihrer Schiffe gewesen sein. Keine Ahnung wie lang das schon hier steht.
	AI_Output(self,other,"Info_Grim_Ship_15_05");	//Wie auch immer. Drinnen könnte was wertvolles sein.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_ORC(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_orc_condition;
	information = info_grim_orc_info;
	important = 1;
	permanent = 0;
};


func int info_grim_orc_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_016") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_orc_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_ORC_09_01");	//Man, willst du wirklich DA rein?
	AI_Output(self,other,"Info_Grim_ORC_09_02");	//Ich glaub' das Ork-Gebiet ist 'ne Nummer zu groß für uns.
	AI_Output(self,other,"Info_Grim_ORC_15_03");	//Dort wimmelt es von gefährlichen Viechern.
	AI_Output(self,other,"Info_Grim_ORC_15_04");	//Ich hab' sogar gehört das es dort eine ganze Stadt voller Orks geben soll.
	AI_Output(self,other,"Info_Grim_ORC_15_05");	//Keine Ahnung ob's stimmt. Es ist noch nie jemand von da zurückgekehrt...
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_NC(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_nc_condition;
	information = info_grim_nc_info;
	important = 1;
	permanent = 0;
};


func int info_grim_nc_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_07_21") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_nc_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_NC_09_01");	//Schau an, dass neue Lager. Der Ort, an den ich nie wollte.
	AI_Output(self,other,"Info_Grim_NC_09_02");	//Bisher hab' ich nur schlechtes von hier gehört. Soll Typen hier geben, die einem schon wegen einem Stück Brot die Kehle durchschneiden.
	AI_Output(self,other,"Info_Grim_NC_15_03");	//Wenn du reingehen willst, halt aber die Waffe bereit.
	AI_Output(self,other,"Info_Grim_NC_15_04");	//Bei den Mistkerlen hier weiß man ja nie...
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_GRAVE(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_grave_condition;
	information = info_grim_grave_info;
	important = 1;
	permanent = 0;
};


func int info_grim_grave_condition()
{
	if(Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_grave_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Grave_09_01");	//Warte!
	AI_Output(self,other,"Info_Grim_Grave_09_02");	//Ich hab' Gerüchte gehört, dass es hier von Untoten wimmeln soll.
	AI_Output(self,other,"Info_Grim_Grave_15_03");	//Angeblich sei ein Erzbaron des Alten Lagers hier hinabgestiegen, kam aber nie wieder. Sie nennen ihn "Den Wächter".
	AI_Output(self,other,"Info_Grim_Grave_15_04");	//Seitdem wird dieser Ort von jedem gemieden.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_START(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_start_condition;
	information = info_grim_start_info;
	important = 1;
	permanent = 0;
};


func int info_grim_start_condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO_FALL3") < 1000)
	{
		return TRUE;
	};
};

func void info_grim_start_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_Start_09_01");	//Noch gar nicht so lang her, als ich das letzte mal hier war.
	AI_Output(self,other,"Info_Grim_Start_09_02");	//Ich bedauere die armen Schweine jetzt schon, die als nächste hier rein geworfen werden.
	AI_StopProcessInfos(self);
};


instance INFO_GRIM_EASTEREGG(C_Info)
{
	npc = Vlk_580_Grim;
	nr = 1;
	condition = info_grim_easteregg_condition;
	information = info_grim_easteregg_info;
	important = 1;
	permanent = 0;
};


func int info_grim_easteregg_condition()
{
	if(Npc_KnowsInfo(hero,info_grim_ncwait) && Npc_KnowsInfo(hero,info_grim_psi) && Npc_KnowsInfo(hero,info_grim_nc) && Npc_KnowsInfo(hero,info_grim_orc) && Npc_KnowsInfo(hero,info_grim_grave) && Npc_KnowsInfo(hero,info_grim_start))
	{
		return TRUE;
	};
};

func void info_grim_easteregg_info()
{
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"Info_Grim_EasterEgg_09_01");	//Mit dir kommt man ja ordentlich rum.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_02");	//War gar keine schlechte Idee, dass ich mich dir angeschlossen habe.
	AI_Output(self,other,"Info_Grim_EasterEgg_09_03");	//Ich versprech' dir, wenn wir irgendwann wieder hier rauskommen sollten, dann schulde ich dir einen großen Gefallen.
	B_GiveXP(XP_GRIMGUIDE);
	AI_StopProcessInfos(self);
};

