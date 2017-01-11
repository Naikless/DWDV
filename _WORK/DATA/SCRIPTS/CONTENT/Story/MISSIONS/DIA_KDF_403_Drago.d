
instance KDF_403_Drago_RUNE(C_Info)
{
	npc = KDF_403_Drago;
	condition = KDF_403_Drago_RUNE_Condition;
	information = KDF_403_Drago_RUNE_Info;
	important = 1;
	permanent = 0;
};


func int KDF_403_Drago_RUNE_Condition()
{
	if(Npc_KnowsInfo(hero,KDF_402_Corristo_ROBE))
	{
		return TRUE;
	};
};

func void KDF_403_Drago_RUNE_Info()
{
	AI_Output(self,other,"KDF_403_Drago_RUNE_Info_13_01");	//Nimm diese Rune als Geschenk von Innos. Sie schütze dich auf deinem Weg.  
	CreateInvItem(self,ItArRuneFirebolt);
	B_GiveInvItems(self,other,ItArRuneFirebolt,1);
	AI_StopProcessInfos(self);
};


instance KDF_403_Drago_Exit(C_Info)
{
	npc = KDF_403_Drago;
	nr = 999;
	condition = KDF_403_Drago_Exit_Condition;
	information = KDF_403_Drago_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int KDF_403_Drago_Exit_Condition()
{
	return TRUE;
};

func void KDF_403_Drago_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance KDF_403_DRAGO_GESCHAH(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_geschah_condition;
	information = kdf_403_drago_geschah_info;
	important = 0;
	permanent = 0;
	description = "Hast du eine Aufgabe für mich?";
};


func int kdf_403_drago_geschah_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_KDF))
	{
		return TRUE;
	};
};

func void kdf_403_drago_geschah_info()
{
	AI_Output(other,self,"KDF_403_Drago_Geschah_Info_13_01");	//Hast du eine Aufgabe für mich?
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_02");	//Es gibt da eine Aufgabe.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_03");	//Es handelt sich dabei um eine Artefaktsuche.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_04");	//Diese Artefakte sind wichtig für unsere Studien, da sie eine uns unbekannte Magie enthalten.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_05");	//Vor einiger Zeit schickte ich schon einmal einige Männer auf die Suche, doch sie kehrten nie wieder zurück.
	AI_Output(self,other,"KDF_403_Drago_Geschah_Info_13_06");	//Also könnte diese Suche sehr gefährlich werden.
};


var int joinoc_aufgabe;

instance KDF_403_DRAGO_ARTEFAKTE(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_artefakte_condition;
	information = kdf_403_drago_artefakte_info;
	important = 0;
	permanent = 0;
	description = "Was für Artefakte?";
};


func int kdf_403_drago_artefakte_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_geschah))
	{
		return TRUE;
	};
};

func void kdf_403_drago_artefakte_info()
{
	AI_Output(other,self,"KDF_403_Drago_Artefakte_Info_13_01");	//Was waren das für Artefakte nach denen sie suchten?
	if((Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_STT)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_GRD)) || (Npc_KnowsInfo(hero,kdf_403_drago_geschah) && (Npc_GetTrueGuild(hero) == GIL_KDF)))
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_02");	//Es waren magische Runen aus einer längst vergessenen Zeit der Magie.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_03");	//Eine alte Legende sagt, dass einst Mönche in der Klosterruine am Meer lebten, die fähig waren sich in Tiere zu verwandeln.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_04");	//Diese Artefakte sind wichtig für uns, da sie gefährlich sein könnten wenn sie in die falschen Hände geraten würden.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_05");	//Allerdings haben wir die Ruine schon vor vielen Jahren durchsucht und damals dort keine Artefakte gefunden.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_06");	//Deswegen schickte ich die Männer an die anderen Orte, die in unseren Schriften erwähnt werden.
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_07");	//Was aber offenbar vergebens war...
		JOINOC_AUFGABE = TRUE;
	}
	else
	{
		AI_Output(self,other,"KDF_403_Drago_Artefakte_Info_13_08");	//Ich bin nicht sicher ob wir dir vertrauen können. Erst wenn du dich unserem Lager angeschlossen hast, kann ich dir diese Aufgabe anvertrauen.
		AI_StopProcessInfos(self);
	};
};


instance KDF_403_DRAGO_WONOCH(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_wonoch_condition;
	information = kdf_403_drago_wonoch_info;
	important = 0;
	permanent = 0;
	description = "Gibt es weitere Orte?";
};


func int kdf_403_drago_wonoch_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_artefakte) && (JOINOC_AUFGABE == TRUE))
	{
		return TRUE;
	};
};

func void kdf_403_drago_wonoch_info()
{
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_01");	//Gibt es noch weitere Orte an denen sich die Artefakte befinden könnten?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_02");	//Ja, es gibt noch einen Ort an dem wir noch nicht gesucht haben.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_03");	//Es handelt sich um eine alte Kultstätte ganz in der nähe.
	AI_Output(other,self,"KDF_403_Drago_WoNoch_Info_13_04");	//Warum habt ihr sie noch nicht erforscht?
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_05");	//Diese Kultstätte wird von den Orks benutzt. Es wäre sehr gefährlich, da sich dort einige der mächtigsten Schamanen der Orks aufhalten.
	AI_Output(self,other,"KDF_403_Drago_WoNoch_Info_13_06");	//Es gab schon damals einige Männer die versuchten diese Kultstätte aufzusuchen. Es ist nie jemand von dort zurückgekehrt.
};


instance KDF_403_DRAGO_VERSUCHEN(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_versuchen_condition;
	information = kdf_403_drago_versuchen_info;
	important = 0;
	permanent = 0;
	description = "Ich werde es versuchen.";
};


func int kdf_403_drago_versuchen_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_artefakte) && (JOINOC_AUFGABE == TRUE))
	{
		return TRUE;
	};
};

func void kdf_403_drago_versuchen_info()
{
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_01");	//Ich werde es versuchen.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_02");	//Was?! Bist du dir da sicher?
	AI_Output(other,self,"KDF_403_Drago_versuchen_Info_13_03");	//Wenn es einen Weg gibt an diese Artefakte ranzukommen, werde ich ihn finden.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_04");	//Also gut. Ich werde hier auf dich warten. Wenn du es schaffst, bring mir die Artefakte und ich werde dich entlohnen.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_05");	//Nimm diese Heiltränke mit. Sie werden deine Wunden heilen, wenn du im Kampf verletzt wirst.
	AI_Output(self,other,"KDF_403_Drago_versuchen_Info_13_06");	//Möge Innos dich schützen.
	Log_CreateTopic(ARTEFACTS,LOG_MISSION);
	Log_SetTopicStatus(ARTEFACTS,LOG_RUNNING);
	B_LogEntry(ARTEFACTS,"Drago einer der Feuermagier aus dem alten Lager, bat mich eine Kultstätte der Orks aufzusuchen und mich dort nach einem Artefakt umzusehen.");
	MAGIC_ARTEFACTS = LOG_RUNNING;
	Wld_InsertNpc(orc_5047_shaman,"OW_PATH_ORCRUIN_GOLEM");
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItFo_Potion_Health_02,2);
	B_GiveInvItems(self,other,ItFo_Potion_Health_02,2);
};


instance KDF_403_DRAGO_WO(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_wo_condition;
	information = kdf_403_drago_wo_info;
	important = 0;
	permanent = 0;
	description = "Wo genau befindet sich die Kultstätte?";
};


func int kdf_403_drago_wo_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_versuchen))
	{
		return TRUE;
	};
};

func void kdf_403_drago_wo_info()
{
	AI_Output(other,self,"KDF_403_Drago_Wo_Info_13_01");	//Wo genau befindet sich die Kultstätte?
	AI_Output(self,other,"KDF_403_Drago_Wo_Info_13_02");	//Außerhalb des Lagers gibt es einen Mann namens Cavalorn. Links von seiner Hütte befindet sich eine breite Schlucht. Dieser musst du nur folgen.
	B_LogEntry(ARTEFACTS,"Die Kultstätte befindet sich in der nähe von Cavalorns Hütte. Ich muss einfach nur durch eine Schlucht laufen, dann sollte ich mein Ziel irgendwann erreichen.");
};


instance KDF_403_DRAGO_KULTSTåTTE(C_Info)
{
	npc = KDF_403_Drago;
	condition = kdf_403_drago_kultståtte_condition;
	information = kdf_403_drago_kultståtte_info;
	important = 0;
	permanent = 0;
	description = "Ich war bei der Kultstätte.";
};


func int kdf_403_drago_kultståtte_condition()
{
	if(Npc_KnowsInfo(hero,kdf_403_drago_versuchen) && Npc_HasItems(other,itarrunetrfscavenger))
	{
		return TRUE;
	};
};

func void kdf_403_drago_kultståtte_info()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_Info_13_01");	//Ich war bei der Kultstätte.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_Info_13_02");	//Und? Was hast du gefunden?
	Info_ClearChoices(kdf_403_drago_kultståtte);
	Info_AddChoice(kdf_403_drago_kultståtte,"Ich habe diese Verwandlungs-Rune gefunden.",kdf_403_drago_kultståtte_ja);
	Info_AddChoice(kdf_403_drago_kultståtte,"Dort war nichts zu finden.",kdf_403_drago_kultståtte_nein);
};

func void kdf_403_drago_kultståtte_ja()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_JA_15_00");	//Ich habe diese Verwandlungs-Rune gefunden.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_01");	//Du bist fündig geworden? Hervorragend! Zeig mir die Rune.
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_JA_11_02");	//Hier hast du sie.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_03");	//Du hast uns einen großen Dienst erwiesen. Diese Rune hätte in den falschen Händen schreckliches anrichten können.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_JA_11_04");	//Nimm dies als Zeichen meiner Annerkennung und zum Dank Innos.
	B_GiveXP(XP_MYSTERIOUSNOTICES2);
	Log_SetTopicStatus(ARTEFACTS,LOG_SUCCESS);
	B_LogEntry(ARTEFACTS,"Ich habe Drago die Rune gegeben. Er war sehr erfreut und zeigte sich mir gegenüber sehr großzügig.");
	MAGIC_ARTEFACTS = LOG_SUCCESS;
	CreateInvItem(self,Schutzring_Magie1_Fire1);
	B_GiveInvItems(self,other,Schutzring_Magie1_Fire1,1);
	B_GiveInvItems(other,self,itarrunetrfscavenger,1);
	Npc_RemoveInvItem(self,itarrunetrfscavenger);
	AI_StopProcessInfos(self);
};

func void kdf_403_drago_kultståtte_nein()
{
	AI_Output(other,self,"KDF_403_Drago_Kultstätte_NEIN_15_00");	//Dort war nichts zu finden.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_01");	//Das ist nicht gut. Ich denke, damit sind nun all unsere Bemühungen umsonst gewesen.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_02");	//Ich werde mich wieder den Schriften widmen und weiter nach Anhaltspunkten suchen.
	AI_Output(self,other,"KDF_403_Drago_Kultstätte_NEIN_11_03");	//Du kannst gehen und deine Aufgaben erledigen.
	Log_SetTopicStatus(ARTEFACTS,LOG_FAILED);
	B_LogEntry(ARTEFACTS,"Ich habe Drago die Rune nicht gegeben und ihm gesagt das ich nichts gefunden hätte.");
	MAGIC_ARTEFACTS = LOG_FAILED;
	AI_StopProcessInfos(self);
};

