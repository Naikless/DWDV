
instance Info_Xardas_EXIT(C_Info)
{
	npc = KDF_404_Xardas;
	nr = 999;
	condition = Info_Xardas_EXIT_Condition;
	information = Info_Xardas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Xardas_EXIT_Condition()
{
	return 1;
};

func void Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Xardas_DISTURB(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DISTURB_Condition;
	information = Info_Xardas_DISTURB_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_DISTURB_Condition()
{
	if(!UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func void Info_Xardas_DISTURB_Info()
{
	B_WhirlAround(self,hero);
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_01");	//WER WAGT ES, MEINE STUDIEN ZU UNTERBRECHEN?
	AI_Output(hero,self,"Info_Xardas_DISTURB_15_02");	//Mein Name ist ...
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_03");	//Ich will deinen Namen nicht wissen. Er ist unwichtig.
	AI_Output(self,hero,"Info_Xardas_DISTURB_14_04");	//Wichtig ist nur, dass du der Erste seit vielen Jahren bist, der meine Golemr�tsel gel�st hat.
};


instance Info_Xardas_OTHERS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OTHERS_Condition;
	information = Info_Xardas_OTHERS_Info;
	important = 0;
	permanent = 0;
	description = "Gab es andere Besucher?";
};


func int Info_Xardas_OTHERS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_OTHERS_Info()
{
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_01");	//Gab es andere Besucher?
	AI_Output(self,hero,"Info_Xardas_OTHERS_14_02");	//Nicht viele und als sie mir l�stig wurden, machten sie Bekanntschaft mit einem meiner h�heren Wesen.
	AI_Output(hero,self,"Info_Xardas_OTHERS_15_03");	//Du bist wohl gerne ungest�rt, was?
};


instance Info_Xardas_SATURAS(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SATURAS_Condition;
	information = Info_Xardas_SATURAS_Info;
	important = 0;
	permanent = 0;
	description = "Saturas schickt mich. Wir brauchen deine Hilfe!";
};


func int Info_Xardas_SATURAS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SATURAS_Info()
{
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_01");	//Saturas schickt mich. Wir brauchen deine Hilfe!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_02");	//Die Wassermagier wollen ihren gro�en Erzhaufen ...
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_03");	//Der Erzhaufen ist NICHT die L�sung!
	AI_Output(hero,self,"Info_Xardas_SATURAS_15_04");	//Nein?
	AI_Output(self,hero,"Info_Xardas_SATURAS_14_05");	//NEIN!
};


instance Info_Xardas_KDW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_KDW_Condition;
	information = Info_Xardas_KDW_Info;
	important = 0;
	permanent = 0;
	description = "Die Feuermagier sind alle tot!";
};


func int Info_Xardas_KDW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_KDW_Info()
{
	AI_Output(hero,self,"Info_Xardas_KDW_15_01");	//Die Feuermagier sind alle tot!
	AI_Output(hero,self,"Info_Xardas_KDW_15_02");	//Gomez hat sie ermorden lassen.
	AI_Output(self,hero,"Info_Xardas_KDW_14_03");	//Das wundert mich nicht sonderlich. Diesen dummen barbarischen Schl�chtern in der Burg, allen voran Gomez, war noch nie zu trauen.
	AI_Output(self,hero,"Info_Xardas_KDW_14_04");	//Corristo und die anderen Magier haben sich ihren Henker selbst gew�hlt, als sie Gomez damals halfen, die Macht an sich zu rei�en.
};


instance Info_Xardas_SLEEPER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SLEEPER_Condition;
	information = Info_Xardas_SLEEPER_Info;
	important = 0;
	permanent = 0;
	description = "Der so genannte 'Schl�fer' soll ein �bler Erzd�mon sein.";
};


func int Info_Xardas_SLEEPER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void Info_Xardas_SLEEPER_Info()
{
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_01");	//Der so genannte "Schl�fer" soll ein �bler Erzd�mon sein.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_02");	//Das hat die Bruderschaft im Sumpf herausgefunden.
	AI_Output(hero,self,"Info_Xardas_SLEEPER_15_03");	//Die Wassermagier glauben nun, dass wir alle in der Kolonie in gro�er Gefahr seien.
	AI_Output(self,hero,"Info_Xardas_SLEEPER_14_04");	//Die Gefahr ist gr��er als irgendjemand innerhalb der Barriere erahnen kann.
};


instance Info_Xardas_DANGER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_DANGER_Condition;
	information = Info_Xardas_DANGER_Info;
	important = 0;
	permanent = 0;
	description = "Wenn die Sprengung des Erzhaufens die gro�e Gefahr nicht beseitigt...";
};


func int Info_Xardas_DANGER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_SLEEPER) && Npc_KnowsInfo(hero,Info_Xardas_SATURAS))
	{
		return TRUE;
	};
};

func void Info_Xardas_DANGER_Info()
{
	AI_Output(hero,self,"Info_Xardas_DANGER_15_01");	//Wenn die Sprengung des Erzhaufens die gro�e Gefahr nicht beseitigt ...
	AI_Output(self,hero,"Info_Xardas_DANGER_14_02");	//... Vergiss den gro�en Erzhaufen! Seine Energie wird die Barriere nicht sprengen k�nnen.
	AI_Output(self,hero,"Info_Xardas_DANGER_14_03");	//H�tten Corristo und Saturas in den letzten Jahren weniger Zeit f�r ihre t�richten und eitlen Streitereien verschwendet, dann w�ssten sie jetzt vielleicht auch das, was ich wei�.
	AI_Output(hero,self,"Info_Xardas_DANGER_15_04");	//Was denn?
	AI_Output(self,hero,"Info_Xardas_DANGER_14_05");	//Keiner der zw�lf Magier von damals scheint sich je gefragt zu haben, warum die Erschaffung der Barriere au�er Kontrolle geriet und sie diese riesigen Ausma�e annahm.
};


instance Info_Xardas_BARRIER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BARRIER_Condition;
	information = Info_Xardas_BARRIER_Info;
	important = 0;
	permanent = 0;
	description = "Hast du es herausgefunden?";
};


func int Info_Xardas_BARRIER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DANGER))
	{
		return TRUE;
	};
};

func void Info_Xardas_BARRIER_Info()
{
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_01");	//Hast du es herausgefunden?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_02");	//Eins ist auf jeden Fall klar! Die Antwort liegt tief unter der Stadt der Orks.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_03");	//Die Stadt der Orks?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_04");	//Die Orks sind nicht etwa, wie viele glauben, Tiere. Ihre Kultur reicht fast ebenso weit zur�ck, wie die der Menschen.
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_05");	//Vor vielen hundert Jahren beschw�rten f�nf Ork-Schamanen einen uralten Erzd�monen, um ihrem Klan die Macht zu verleihen, ihre Feinde zu vernichten.
	AI_Output(hero,self,"Info_Xardas_BARRIER_15_06");	//War dieser Erzd�mon der Schl�fer?
	AI_Output(self,hero,"Info_Xardas_BARRIER_14_07");	//Diesen Namen gaben ihm die Orks erst viel sp�ter. Doch warum sie das taten und warum sie heute vor diesem �berwesen in Furcht erzittern, werde ich dir nicht erz�hlen!
};


instance Info_Xardas_EVENT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENT_Condition;
	information = Info_Xardas_EVENT_Info;
	important = 0;
	permanent = 0;
	description = "Warum nicht?";
};


func int Info_Xardas_EVENT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_BARRIER))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENT_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENT_15_01");	//Warum nicht?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_02");	//Ich glaube du k�nntest der ... NEIN, um mir ganz sicher zu sein, musst du noch eine weitere Aufgabe l�sen!
	AI_Output(hero,self,"Info_Xardas_EVENT_15_03");	//Was f�r eine Aufgabe?
	AI_Output(self,hero,"Info_Xardas_EVENT_14_04");	//H�r gut zu: Die Orks haben einen ihrer Schamanen aus ihrer Stadt verbannt.
};


instance Info_Xardas_EVENTWHY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHY_Condition;
	information = Info_Xardas_EVENTWHY_Info;
	important = 0;
	permanent = 0;
	description = "Warum haben sie ihn verbannt?";
};


func int Info_Xardas_EVENTWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHY_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHY_15_01");	//Warum haben sie ihn verbannt?
	AI_Output(self,hero,"Info_Xardas_EVENTWHY_14_02");	//Das konnte der sterbende Ork-Krieger, der von einem meiner D�monen befragt wurde, nicht mehr von sich geben.
};


instance Info_Xardas_EVENTHOW(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTHOW_Condition;
	information = Info_Xardas_EVENTHOW_Info;
	important = 0;
	permanent = 0;
	description = "Was hat dieser Ork Schamane mit meiner Aufgabe zu tun?";
};


func int Info_Xardas_EVENTHOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTHOW_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_01");	//Was hat dieser Ork-Schamane mit meiner Aufgabe zu tun?
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_02");	//Er wird dir den fehlenden Teil der Geschichte �ber den Schl�fer erz�hlen.
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_03");	//Ein Ork-Schamane wird sich wohl kaum mit mir unterhalten!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_04");	//Willst du nun meine Hilfe oder willst du sie nicht?
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_05");	//Doch schon, aber ...
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_06");	//Dann stelle meine Worte nie wieder in Frage!
	AI_Output(self,hero,"Info_Xardas_EVENTHOW_14_07");	//Suche den Schamanen. Er ist nicht gut auf seine Br�der in der Orkstadt zu sprechen, also wird er dir vielleicht zuh�ren, bevor er dich zu einer lebenden Fackel macht!
	AI_Output(hero,self,"Info_Xardas_EVENTHOW_15_08");	//Sehr beruhigend!
};


instance Info_Xardas_EVENTWHERE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_EVENTWHERE_Condition;
	information = Info_Xardas_EVENTWHERE_Info;
	important = 0;
	permanent = 0;
	description = "Wo h�lt sich dieser Verbannte auf?";
};


func int Info_Xardas_EVENTWHERE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENT))
	{
		return TRUE;
	};
};

func void Info_Xardas_EVENTWHERE_Info()
{
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_01");	//Wo h�lt sich dieser Verbannte auf?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_02");	//Gehe zum alten Kastell �stlich von hier. Es ist nicht zu �bersehen, denn es steht auf dem Gipfel eines hohen Berges, der schon von weitem zu sehen ist.
	AI_Output(hero,self,"Info_Xardas_EVENTWHERE_15_03");	//Kann man es so einfach betreten?
	AI_Output(self,hero,"Info_Xardas_EVENTWHERE_14_04");	//Es wird zwar noch Altes Kastell genannt, aber genau genommen stehen da nur noch die Grundmauern. Es ist schon seit vielen Jahrzehnten eine Ruine.
};


instance Info_Xardas_ACCEPT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ACCEPT_Condition;
	information = Info_Xardas_ACCEPT_Info;
	important = 0;
	permanent = 0;
	description = "Ich werde mir die Antworten von diesem Schamanen holen!";
};


func int Info_Xardas_ACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_EVENTWHY) && Npc_KnowsInfo(hero,Info_Xardas_EVENTHOW) && Npc_KnowsInfo(hero,Info_Xardas_EVENTWHERE))
	{
		return TRUE;
	};
};

func void Info_Xardas_ACCEPT_Info()
{
	AI_Output(hero,self,"Info_Xardas_ACCEPT_15_01");	//Ich werde mir die Antworten von diesem Schamanen holen!
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_02");	//Mein Diener hat dir ja bereits eine Teleportations-Rune f�r das Pentagramm einen Stock tiefer gegeben.
	AI_Output(self,hero,"Info_Xardas_ACCEPT_14_03");	//Damit sollte es kein Problem f�r dich sein, wieder hierher zur�ck zu kehren.
	B_Story_CordsPost();
	B_Story_FindOrcShaman();
	AI_StopProcessInfos(self);
};


var int xardas_trade;

instance Kdf_404_Xardas_SELLMAGICSTUFF(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information = Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important = 0;
	permanent = 1;
	trade = 1;
	description = "Ich suche magisches Wissen.";
};


func int Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

func void Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output(other,self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01");	//Ich suche magisches Wissen.
	if(XARDAS_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Xardas der D�monenbeschw�rer handelt mit magischen Spruchrollen, Runen und Tr�nken.");
		XARDAS_TRADE = TRUE;
	};
};


instance KDF_404_XARDAS_TEACH(C_Info)
{
	npc = KDF_404_Xardas;
	condition = kdf_404_xardas_teach_condition;
	information = kdf_404_xardas_teach_info;
	important = 0;
	permanent = 0;
	description = "Kannst du mich unterrichten?";
};


func int kdf_404_xardas_teach_condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ACCEPT))
	{
		return TRUE;
	};
};

func void kdf_404_xardas_teach_info()
{
	AI_Output(other,self,"Kdf_404_Xardas_TEACH_Info_15_01");	//Kannst du mich unterrichten?
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_01");	//Kannst du mich unterrichten?
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_02");	//Die Grundlagen musst du in einem der Lager gelernt haben.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_03");	//Du musst dich entweder f�r die Feuer-, Wasser- oder Schl�fermagie entschieden haben.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_04");	//Egal f�r welchen Weg der Magie du dich entschieden hast, es macht keinen Unterschied.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_05");	//Jeder dieser verschiedenen Wege f�hrt dich am Ende zum gleichen Ziel. Den sechsten Kreis der Magie.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_06");	//Der sechste Kreis der Magie beinhaltet das Wissen einer dunklen Magie, der Magie Beliars.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_07");	//Du wirst dir damit also m�chtiges Wissen aneignen.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_08");	//Geh�rst du der Feuer- oder Wassermagie an, bedeutet der sechste Kreis f�r dich auch die Aufnahme bei den D�monenbeschw�rern.
	AI_Output(self,other,"Kdf_404_Xardas_TEACH_Info_15_09");	//Nur als Guru des Sumpflagers bleibt dir die Aufnahme verwehrt.
};


instance Info_Xardas_RETURN(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_RETURN_Condition;
	information = Info_Xardas_RETURN_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe mir die Antworten vom Ork-Schamanen geholt!";
};


func int Info_Xardas_RETURN_Condition()
{
	if(UrShak_SpokeOfUluMulu && !EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_RETURN_Info()
{
	AI_Output(hero,self,"Info_Xardas_RETURN_15_01");	//Ich habe mir die Antworten vom Ork-Schamanen geholt!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_02");	//Gut, dann berichte!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_03");	//Die f�nf Ork-Schamanen, die den Schl�fer riefen, erbauten ihm einen unterirdischen Tempel, dessen Zugang in der Ork-Stadt liegt.
	AI_Output(self,hero,"Info_Xardas_RETURN_14_04");	//Das ist richtig!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_05");	//Undankbarerweise entriss er ihnen ihre Herzen und verfluchte sie und die Arbeiter zu ewigem Untoten-Dasein!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_06");	//Sehr gut, sehr gut!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_07");	//Die Orks verschlossen den Tempel und bringen ihm seitdem Opfer, um ihn zu bes�nftigen!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_08");	//Hast du einen Weg gefunden, wie du in den Tempel gelangst?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_09");	//Ja, es gibt da einen Ork, der ...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_10");	//Keine Einzelheiten! Begib dich zum unterirdischen Tempel! Dort wirst du den einzigen Weg finden, die Barriere zu zerst�ren!
	AI_Output(hero,self,"Info_Xardas_RETURN_15_11");	//Ich verstehe nicht!
	AI_Output(self,hero,"Info_Xardas_RETURN_14_12");	//War es nicht die Zerst�rung der Barriere, weswegen du mich aufgesucht hast?
	AI_Output(hero,self,"Info_Xardas_RETURN_15_13");	//Richtig, aber ...
	AI_Output(self,hero,"Info_Xardas_RETURN_14_14");	//DANN GEH! Es ist schon genug Zeit verstrichen! Geh und such die Antwort im unterirdischen Tempel!
	B_Story_ReturnedFromUrShak();
};


instance Info_Xardas_FOUNDTEMPLE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FOUNDTEMPLE_Condition;
	information = Info_Xardas_FOUNDTEMPLE_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe einen Weg in den unterirdischen Tempel gefunden!";
};


func int Info_Xardas_FOUNDTEMPLE_Condition()
{
	if(EnteredTemple)
	{
		return TRUE;
	};
};

func void Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output(other,self,"Info_Xardas_FOUNDTEMPLE_15_01");	//Ich habe einen Weg in den unterirdischen Tempel gefunden!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_02");	//DU HAST ... DU ... Bemerkenswert!
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_03");	//Du bist sehr stark geworden! St�rker als jeder andere innerhalb der Barriere.
	AI_Output(self,other,"Info_Xardas_FOUNDTEMPLE_14_04");	//Vielleicht bist du doch derjenige, von dem die alten orkischen Prophezeiungen sprechen!
};


instance Info_Xardas_PROPHECY(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_PROPHECY_Condition;
	information = Info_Xardas_PROPHECY_Info;
	important = 0;
	permanent = 0;
	description = "Prophezeiungen? Welche Prophezeiungen?";
};


func int Info_Xardas_PROPHECY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FOUNDTEMPLE))
	{
		return TRUE;
	};
};

func void Info_Xardas_PROPHECY_Info()
{
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_01");	//Prophezeiungen? Welche Prophezeiungen?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_02");	//Uralte orkische Schriften aus der Zeit kurz nach der Versiegelung des unterirdischen Tempels sprechen von einem 'Heiligen Feind'.
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_03");	//Ein Heiliger Feind?
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_04");	//Einer, der kommen wird, um den SCHL�FER f�r immer aus unserer Welt zu verbannen!
	AI_Output(other,self,"Info_Xardas_PROPHECY_15_05");	//Ich soll der Gegenstand einer uralten Prophezeiung sein??? Du musst dich irren!
	AI_Output(self,other,"Info_Xardas_PROPHECY_14_06");	//Vielleicht ... aber vielleicht auch nicht!
};


instance Info_Xardas_LOADSWORD(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD_Condition;
	information = Info_Xardas_LOADSWORD_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe dieses seltsame Schwert hier gefunden.";
};


func int Info_Xardas_LOADSWORD_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD_15_01");	//Ich habe dieses seltsame Schwert hier gefunden.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_02");	//Zeig mal her.
	CreateInvItem(self,Mythrilklinge01);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_03");	//Interessant ... hier steht 'URIZIEL'.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_04");	//Ich habe schon von diesem Schwert geh�rt, es ist eine Waffe aus alten Tagen, als die Menschheit noch jung war.
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_05");	//Die Waffe ist aus einem v�llig unbekannten Material geschmiedet. Auch �ber den Erschaffer steht nichts geschrieben!
	AI_Output(self,other,"Info_Xardas_LOADSWORD_14_06");	//Angeblich soll diese Klinge unglaubliche Kr�fte besessen haben, aber ich kann keinerlei magische Aura feststellen!
	Npc_RemoveInvItem(hero,Mythrilklinge);
	CreateInvItem(hero,Mythrilklinge01);
};


instance Info_Xardas_LOADSWORD01(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD01_Condition;
	information = Info_Xardas_LOADSWORD01_Info;
	important = 0;
	permanent = 0;
	description = "URIZIEL besa� unglaubliche Kr�fte?";
};


func int Info_Xardas_LOADSWORD01_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem(self,Mythrilklinge01);
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_01");	//URIZIEL besa� unglaubliche Kr�fte?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_02");	//Es steht geschrieben, dass der Tr�ger dieser Waffe die st�rksten Panzerungen durchbohren und die m�chtigsten Schutzzauber �berwinden kann.
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_03");	//Wie konnte diese m�chtige Waffe in den Besitz der Orks gelangen?
	AI_Output(self,other,"Info_Xardas_LOADSWORD01_14_04");	//Es hei�t, dass die Orks dieses Schwert damals einem m�chtigen Feldherren der Menschen geraubt hatten. Sie konnten es zwar nicht benutzen, aber sie konnten es gut verstecken!
	AI_Output(other,self,"Info_Xardas_LOADSWORD01_15_05");	//Nicht gut genug!
};


instance Info_Xardas_LOADSWORD02(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD02_Condition;
	information = Info_Xardas_LOADSWORD02_Info;
	important = 0;
	permanent = 0;
	description = "Kann man die damaligen Kr�fte der Waffe wiederherstellen?";
};


func int Info_Xardas_LOADSWORD02_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD01))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD02_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_01");	//Kann man die damaligen Kr�fte der Waffe wiederherstellen?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_02");	//Daf�r w�rdest du eine sehr starke magische Energiequelle ben�tigen.
	AI_Output(other,self,"Info_Xardas_LOADSWORD02_15_03");	//In etwa SO stark, dass man die magische Barriere damit sprengen k�nnte?
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_04");	//In etwa ...
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_05");	//Au�erdem wirst du eine sehr spezielle Zauberformel ben�tigen, die den Energietransfer vollbringen kann.
	AI_Output(self,other,"Info_Xardas_LOADSWORD02_14_06");	//Gib mir ein wenig Zeit und ich kann dir die magische Formel herstellen.
	B_Story_ShowedUrizielToXardas();
};


instance Info_Xardas_BETTERARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_BETTERARMOR_Condition;
	information = Info_Xardas_BETTERARMOR_Info;
	important = 0;
	permanent = 0;
	description = "Ich werde mich in der Zwischenzeit nach einer besseren R�stung umsehen!";
};


func int Info_Xardas_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_LOADSWORD02))
	{
		return TRUE;
	};
};

func void Info_Xardas_BETTERARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_01");	//Ich werde mich in der Zwischenzeit nach einer besseren R�stung umsehen!
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if(armorInstance == crw_armor_h)
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_02");	//Die paar zusammengeflickten Minecrawler-Platten haben im unterirdischen Tempel einfach zu viel Hiebe durchgelassen!
	}
	else if((armorInstance == kdw_armor_h) || (armorInstance == kdw_armor_l))
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_03");	//Die paar blauen Stofflaken hier haben mich im unterirdischen Tempel nicht ausreichend gesch�tzt!
	}
	else
	{
		AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_04");	//Die Untoten im Tempel haben gewaltige Beulen in meinen Panzer gehauen!
	};
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_05");	//Du solltest meinen alten Turm aufsuchen.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_06");	//Deinen alten Turm?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_07");	//Er versank bei einem dieser Beben in einem See im Osten. Die Turmspitzen ragen noch immer aus dem Wasser heraus.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_08");	//Dort lagern noch einige Artefakte. Ich hatte mir nie die M�he gemacht, sie zu bergen.
	AI_Output(other,self,"Info_Xardas_BETTERARMOR_15_09");	//Wie gelange ich hinein?
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_10");	//Ich war nach dem Beben nicht mehr dort, du musst also selbst einen Weg hinein finden.
	AI_Output(self,other,"Info_Xardas_BETTERARMOR_14_11");	//Aber nimm diesen Schl�ssel. Er �ffnet eine Truhe, in der ich besonders seltene Artefakte aufbewahrte.
	B_Story_ExploreSunkenTower();
};


instance Info_Xardas_OREARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_OREARMOR_Condition;
	information = Info_Xardas_OREARMOR_Info;
	important = 1;
	permanent = 0;
};


func int Info_Xardas_OREARMOR_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h))
	{
		return TRUE;
	};
};

func void Info_Xardas_OREARMOR_Info()
{
	var C_Item armor;
	var int armorInstance;
	armor = Npc_GetEquippedArmor(hero);
	armorInstance = Hlp_GetInstanceID(armor);
	if((armorInstance == ore_armor_m) || (armorInstance == ore_armor_h))
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_01");	//Ahh, wie ich sehe tr�gst du die Erzr�stung.
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_OREARMOR_14_02");	//Ahh, wie ich sehe, hast du die Erzr�stung gefunden.
	};
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_03");	//Ich habe sie in einer der Kisten im versunkenen Turm gefunden.
	AI_Output(self,other,"Info_Xardas_OREARMOR_14_04");	//Sie geh�rte dem Feldherren der einst URIZIEL in die Schlacht gegen die Orks f�hrte.
	AI_Output(other,self,"Info_Xardas_OREARMOR_15_05");	//Ich hoffe, sie bringt mir mehr Gl�ck als ihm!
};


instance Info_Xardas_FORMULA(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_FORMULA_Condition;
	information = Info_Xardas_FORMULA_Info;
	important = 0;
	permanent = 0;
	description = "Hast du die magische Formel f�r das Aufladen von URIZIEL fertiggestellt?";
};


func int Info_Xardas_FORMULA_Condition()
{
	if(Npc_HasItems(hero,ore_armor_m) || Npc_HasItems(hero,ore_armor_h) || Npc_HasItems(hero,ItArRuneTeleport1))
	{
		return TRUE;
	};
};

func void Info_Xardas_FORMULA_Info()
{
	AI_Output(other,self,"Info_Xardas_FORMULA_15_01");	//Hast du die magische Formel f�r das Aufladen von URIZIEL fertig gestellt?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_02");	//Sie ist vollendet. Aber du wirst sie nicht alleine benutzen k�nnen.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_03");	//Warum nicht?
	AI_Output(self,other,"Info_Xardas_FORMULA_14_04");	//Sie muss von einem Magier gesprochen werden, w�hrend du das Schwert mit der Kraftquelle in Ber�hrung bringst.
	AI_Output(other,self,"Info_Xardas_FORMULA_15_05");	//Dann werde ich mich nach Unterst�tzung umschauen m�ssen!
	AI_Output(self,other,"Info_Xardas_FORMULA_14_06");	//Nimm die Formel an dich und gib der Waffe ihre alte Macht zur�ck. Du wirst sie brauchen!
	B_Story_LoadSword();
};


instance Info_Xardas_ALTRUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_ALTRUNE_Condition;
	information = Info_Xardas_ALTRUNE_Info;
	important = 0;
	permanent = 0;
	description = "Als Magier werde ich mich schwertun, URIZIEL wirksam zu f�hren!";
};


func int Info_Xardas_ALTRUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_FORMULA) && ((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB) || (Npc_GetTrueGuild(hero) == GIL_GUR) || (oldHeroGuild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void Info_Xardas_ALTRUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_ALTRUNE_15_01");	//Als Magier werde ich mich schwer tun, URIZIEL wirksam zu f�hren!
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_02");	//Es gibt da einen Weg ...
	AI_Output(self,other,"Info_Xardas_ALTRUNE_14_03");	//Aber zuerst musst du der Klinge ihre alten Kr�fte wiedergeben! Kehre dann zur�ck!
};


instance Info_Xardas_SWORDLOADED(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_SWORDLOADED_Condition;
	information = Info_Xardas_SWORDLOADED_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe URIZIEL aufgeladen!";
};


func int Info_Xardas_SWORDLOADED_Condition()
{
	if(Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_SWORDLOADED_Info()
{
	AI_Output(other,self,"Info_Xardas_SWORDLOADED_15_01");	//Ich habe URIZIEL aufgeladen!
	AI_Output(self,other,"Info_Xardas_SWORDLOADED_14_02");	//Unglaublich, das Schwert hat seine alten Kr�fte wiedergewonnen. Nun f�hrst du eine wahrhaft m�chtige Waffe!
	Wld_InsertItem(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");
};


instance Info_Xardas_MAKERUNE(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNE_Condition;
	information = Info_Xardas_MAKERUNE_Info;
	important = 0;
	permanent = 0;
	description = "Du erw�hntest einen Weg, wie ich URIZIEL auch als Magier f�hren k�nnte!";
};


func int Info_Xardas_MAKERUNE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_ALTRUNE) && Npc_KnowsInfo(hero,Info_Xardas_SWORDLOADED))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNE_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_01");	//Du erw�hntest einen Weg, wie ich URIZIEL auch als Magier wirksam f�hren k�nnte!
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_02");	//Wenn du URIZIEL genau betrachtest, wird dir der gro�e, blau schimmernde Edelstein in der Klinge sofort auffallen.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_03");	//Er ist das Gef�� f�r die magischen Kr�fte der Klinge.
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_04");	//Wenn ich den Stein entferne, kann ich daraus eine Zauberrune herstellen, welche die Eigenschaften von URIZIEL selbst in sich tr�gt.
	AI_Output(other,self,"Info_Xardas_MAKERUNE_15_05");	//Eine Zauberrune aus URIZIEL?
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_06");	//Mit der Kraft der Rune wirst du deine Feinde ebenso besiegen wie mit der Kraft des Schwertes!
	AI_Output(self,other,"Info_Xardas_MAKERUNE_14_07");	//Aber sei gewahr, dass nur ein Meister des sechsten Kreises der Magie eine solche machtvolle Zauberrune beherrschen kann!
};


instance Info_Xardas_MAKERUNEDOIT(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_MAKERUNEDOIT_Condition;
	information = Info_Xardas_MAKERUNEDOIT_Info;
	important = 0;
	permanent = 1;
	description = "Entferne den Stein aus URIZIEL!";
};


func int Info_Xardas_MAKERUNEDOIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_MAKERUNE) && Npc_HasItems(hero,Mythrilklinge02))
	{
		return TRUE;
	};
};

func void Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_01");	//Entferne den Stein aus URIZIEL!
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6)
	{
		AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_02");	//Du beherrscht noch nicht den sechsten Kreis der Magie!
	};
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_03");	//Dieser Schritt ist endg�ltig. Soll ich den Stein wirklich aus der Klinge entfernen?
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"JA, tu es!",Info_Xardas_MAKERUNE_YES);
	Info_AddChoice(Info_Xardas_MAKERUNEDOIT,"NEIN, lieber doch nicht!",Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_04");	//JA, tu es!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_05");	//Du hast es so gewollt. Hier, nimm das leere Schwert und die Rune!
	Npc_RemoveInvItem(hero,Mythrilklinge02);
	CreateInvItems(self,UrizielRune,2);
	B_GiveInvItems(self,hero,UrizielRune,2);
	Npc_RemoveInvItem(hero,UrizielRune);
	CreateInvItem(hero,Mythrilklinge03);
	B_LogEntry(CH5_Uriziel,"Xardas entfernte den magischen Edelstein aus dem Schwert URIZIEL. Die Macht dieser Klinge schlummert nun in einer Zauberrune von unvergleichlicher Kraft.");
	Log_SetTopicStatus(CH5_Uriziel,LOG_SUCCESS);
};

func void Info_Xardas_MAKERUNE_NO()
{
	Info_ClearChoices(Info_Xardas_MAKERUNEDOIT);
	AI_Output(other,self,"Info_Xardas_MAKERUNEDOIT_15_06");	//NEIN, lieber doch nicht!
	AI_Output(self,other,"Info_Xardas_MAKERUNEDOIT_14_07");	//So sei es. Die Klinge beh�lt ihre magischen Kr�fte!
};


instance Info_Xardas_LOADSWORD09(C_Info)
{
	npc = KDF_404_Xardas;
	condition = Info_Xardas_LOADSWORD09_Condition;
	information = Info_Xardas_LOADSWORD09_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0);
};


func int Info_Xardas_LOADSWORD09_Condition()
{
	if((EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (Npc_GetTrueGuild(hero) == GIL_KDW)) || ((oldHeroGuild == GIL_KDF) && EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)))
	{
		return TRUE;
	};
};

func void Info_Xardas_LOADSWORD09_Info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Kannst du mich unterrichten?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//Ich werde dich in den sechsten der magischen Kreise aufnehmen.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//Denn wisse, nur die m�chtigsten Magier werden in den sechsten Kreis aufgenommen. Er ist denen vorbehalten, deren Leben ein Zeichen ist.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Dein Zeichen ist die Verbindung der Elemente.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//Mit dem sechsten Kreis bist du in der Lage, die Magie s�mtlicher Runen anzuwenden.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//Und vergiss nie: Fordere nicht die Macht, sondern diene ihr.
			CreateInvItem(hero,dmb_armor_m);
			AI_EquipBestArmor(hero);
			CreateInvItem(self,ItAmArrow);
			B_GiveInvItems(self,hero,ItAmArrow,1);
			Npc_RemoveInvItem(hero,ItAmArrow);
			Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
			hero.guild = GIL_DMB;
			Npc_SetTrueGuild(hero,GIL_DMB);
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_07");	//Noch nicht, du hast das Talent, aber es fehlt dir an Erfahrung. Lerne erst bei Saturas, dann werde ich dich unterweisen.
		AI_StopProcessInfos(self);
	};
};


var int learned_fivecircle;

instance INFO_XARDAS_LOADSWORDGUR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_loadswordgur_condition;
	information = info_xardas_loadswordgur_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0);
};


func int info_xardas_loadswordgur_condition()
{
	if((EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || (EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (oldHeroGuild == GIL_KDF)) || (EnteredTemple && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (oldHeroGuild == GIL_KDW)))
	{
		return TRUE;
	};
};

func void info_xardas_loadswordgur_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORDGUR_15_01");	//Kannst du mich unterrichten?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_02");	//Ich werde dich in den f�nften der magischen Kreise aufnehmen.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_03");	//Der Sturm des Feuers, die Welle aus Eis und die Macht, Untote zu vernichten, sind wahrhaft m�chtige Spr�che, deren Runen dir nun untertan sind.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_04");	//Doch der m�chtigste Zauber des f�nften Kreises ist die Welle des Todes. Solltest du in den Besitz dieser Rune gelangen, dann bist du im Besitz gef�hrlicher Macht.
			AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_06");	//Erkenne deine Grenzen, dann wirst du deine wahre Macht erkennen.
			LEARNED_FIVECIRCLE = TRUE;
			info_xardas_loadswordgur.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_07");	//Vorher solltest du dich mit der Magie des vierten Kreises vertraut machen. Erst dann werde ich dich weiter unterrichten.
		AI_StopProcessInfos(self);
	};
};


instance INFO_XARDAS_LOADSWORDGUR2(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_loadswordgur2_condition;
	information = info_xardas_loadswordgur2_info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_6,LPCOST_TALENT_MAGE_6,0);
};


func int info_xardas_loadswordgur2_condition()
{
	if(EnteredTemple && (Npc_GetTrueGuild(hero) == GIL_GUR) && Npc_KnowsInfo(hero,kdf_404_xardas_teach) && (LEARNED_FIVECIRCLE == TRUE))
	{
		return TRUE;
	};
};

func void info_xardas_loadswordgur2_info()
{
	AI_Output(other,self,"Info_Xardas_LOADSWORD09_15_01");	//Kannst du mich unterrichten?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		if(B_GiveSkill(other,NPC_TALENT_MAGE,6,LPCOST_TALENT_MAGE_6))
		{
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_02");	//Ich werde dich in den sechsten der magischen Kreise aufnehmen.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_03");	//Denn wisse, nur die m�chtigsten Magier werden in den sechsten Kreis aufgenommen. Er ist denen vorbehalten, deren Leben ein Zeichen ist.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_04");	//Dein Zeichen ist die Verbindung der Elemente.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_05");	//Mit dem sechsten Kreis bist du in der Lage, die Magie s�mtlicher Runen anzuwenden.
			AI_Output(self,other,"Info_Xardas_LOADSWORD09_14_06");	//Und vergiss nie: Fordere nicht die Macht, sondern diene ihr.
			info_xardas_loadswordgur2.permanent = 0;
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"Info_Xardas_LOADSWORDGUR_14_87");	//Lerne vorher die Magie des f�nften Kreises. Erst dann werde ich dich weiter unterrichten.
		AI_StopProcessInfos(self);
	};
};


instance INFO_XARDAS_ARMOR(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_armor_condition;
	information = info_xardas_armor_info;
	important = 0;
	permanent = 0;
	description = "Kannst du mir meine Roben verbessern?";
};


func int info_xardas_armor_condition()
{
	if(Npc_KnowsInfo(hero,Info_Xardas_DISTURB))
	{
		return TRUE;
	};
};

func void info_xardas_armor_info()
{
	AI_Output(other,self,"Info_Xardas_ARMOR_15_01");	//Kannst du mir meine Roben verbessern?
	AI_Output(self,other,"Info_Xardas_ARMOR_14_02");	//Ich kann es zumindest versuchen, ja. Allerdings musst du mir dazu schon die passenden bringen.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_03");	//Allerdings wird es mir nur bei Roben m�glich sein, die als Symbol einer bestimmten Magie gelten.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_04");	//Wie du wei�t, fallen darunter Wasser-, Feuer, Schl�fer- und D�monenmagie. Deswegen wirst du dich f�r einen dieser Wege entschieden haben m�ssen.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_05");	//Entweder bringst du mir eine Hohe Feuerrobe, eine hohe Wasserrobe, eine Gururobe oder eine Robe der dunklen K�nste.
	AI_Output(self,other,"Info_Xardas_ARMOR_14_06");	//Wenn du dann noch gen�gend Erz hast, kann ich dir die genannten Roben verbessern.
};


instance INFO_XARDAS_CRAFT_WHICH(C_Info)
{
	npc = KDF_404_Xardas;
	nr = 9;
	condition = info_xardas_craft_which_condition;
	information = info_xardas_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Verbessere meine Roben.";
};


func int info_xardas_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,info_xardas_armor))
	{
		return TRUE;
	};
};

func void info_xardas_craft_which_info()
{
	AI_Output(hero,self,"Info_Xardas_CRAFT_WHICH_15_01");	//Verbessere meine Roben.
	AI_Output(self,hero,"Info_Xardas_CRAFT_WHICH_09_02");	//Welche deiner Roben soll ich verbessern?
	Info_ClearChoices(info_xardas_craft_which);
	Info_AddChoice(info_xardas_craft_which,DIALOG_BACK,info_xardas_craft_which_back);
	if(Npc_HasItems(other,dmb_armor_m) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Verbesserte Robe der Dunklen K�nste (1300 Erz)",info_xardas_craft_which_dmb);
	};
	if(Npc_HasItems(other,gur_armor_m) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Dunkle Gururobe (1300 Erz)",info_xardas_craft_which_gur);
	};
	if(Npc_HasItems(other,kdf_armor_h) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Verbesserte hohe Feuerrobe (1300 Erz)",info_xardas_craft_which_kdf);
	};
	if(Npc_HasItems(other,kdw_armor_h) >= 1)
	{
		Info_AddChoice(info_xardas_craft_which,"Verbesserte hohe Wasserrobe (1300 Erz)",info_xardas_craft_which_kdw);
	};
};

func void info_xardas_craft_which_back()
{
	Info_ClearChoices(info_xardas_craft_which);
};

func void info_xardas_craft_which_dmb()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_WHICH_Xardas_55_01");	//Ich m�chte das du meine Robe der Dunklen K�nste verbesserst.
	if((Npc_HasItems(other,dmb_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_02");	//Gib' mir die R�stung. Warte einen Moment, ich werde dir die Robe verst�rken.
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_04");	//Warte kurz, bis ich damit fertig bin.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(hero,dmb_armor_m);
		CreateInvItem(hero,dmb_armor_m_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_55_05");	//So. Hier ist deine verbesserte Robe der Dunklen K�nste.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_Xardas_15_02");	//Ich brauche mehr Erz, damit ich die R�stung verst�rken kann.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_gur()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_GUR_Xardas_55_01");	//Ich m�chte das du meine Gururobe verbesserst.
	if((Npc_HasItems(other,gur_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_02");	//Gib' mir die R�stung. Warte einen Moment, ich werde dir die Robe verst�rken.
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_04");	//Warte kurz, bis ich damit fertig bin.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,gur_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,dmb_armor_m);
		CreateInvItem(self,gur_armor_m_upgrade);
		B_GiveInvItems(self,hero,gur_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_GUR_Xardas_55_05");	//So. Hier ist deine verbesserte Gururobe.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_GUR_15_02");	//Ich brauche mehr Erz, damit ich die R�stung verst�rken kann.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_kdf()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_KDF_Xardas_55_01");	//Ich m�chte das du meine hohe Feuerrobe verbesserst.
	if((Npc_HasItems(other,kdf_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_02");	//Gib' mir die R�stung. Warte einen Moment, ich werde dir die Robe verst�rken.
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_04");	//Warte kurz, bis ich damit fertig bin.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdf_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,kdf_armor_h);
		CreateInvItem(self,kdf_armor_h_upgrade);
		B_GiveInvItems(self,hero,kdf_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDF_Xardas_55_05");	//So. Hier ist deine verbesserte Hohe Feuerrobe.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_KDF_15_02");	//Ich brauche mehr Erz, damit ich die R�stung verst�rken kann.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};

func void info_xardas_craft_which_kdw()
{
	AI_Output(other,self,",	Info_Xardas_CRAFT_KDW_Xardas_55_01");	//Ich m�chte das du meine hohe Wasserrobe verbesserst.
	if((Npc_HasItems(other,kdw_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1300))
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_02");	//Gib' mir die R�stung. Warte einen Moment, ich werde dir die Robe verst�rken.
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_04");	//Warte kurz, bis ich damit fertig bin.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdw_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1300);
		Npc_RemoveInvItem(self,kdw_armor_h);
		CreateInvItem(self,kdw_armor_h_upgrade);
		B_GiveInvItems(self,hero,kdw_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Xardas_CRAFT_KDW_Xardas_55_05");	//So. Hier ist deine verbesserte Hohe Wasserrobe.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Xardas_CRAFT_WHICH_KDW_15_02");	//Ich brauche mehr Erz, damit ich die R�stung verst�rken kann.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_xardas_craft_which);
	};
};


instance INFO_XARDAS_LEAVETOWER(C_Info)
{
	npc = KDF_404_Xardas;
	condition = info_xardas_leavetower_condition;
	information = info_xardas_leavetower_info;
	important = 0;
	permanent = 1;
	description = "Wie komme ich eigentlich wieder nach unten?";
};


func int info_xardas_leavetower_condition()
{
	return TRUE;
};

func void info_xardas_leavetower_info()
{
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_01");	//Wie komme ich eigentlich wieder nach unten?
	AI_Output(self,hero,"Info_Xardas_LeaveTower_14_02");	//Auf dem gleichen Weg, den du gekommen bist. Schliesse deine Augen!
	Info_ClearChoices(info_xardas_leavetower);
	Info_AddChoice(info_xardas_leavetower,"Ich bin bereit. (Teleport zum Eingang)",info_xardas_leavetower_yes);
	Info_AddChoice(info_xardas_leavetower,"Warte, ich habs mir �berlegt.",info_xardas_leavetower_no);
};

func void info_xardas_leavetower_yes()
{
	Info_ClearChoices(info_xardas_leavetower);
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_03");	//Ich bin bereit.
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"DT_E1_06");
	Wld_PlayEffect("SPELLFX_TELEPORT",hero,hero,0,0,0,FALSE);
};

func void info_xardas_leavetower_no()
{
	Info_ClearChoices(info_xardas_leavetower);
	AI_Output(hero,self,"Info_Xardas_LeaveTower_15_04");	//Warte, ich habs mir �berlegt.
	AI_Output(self,hero,"Info_Xardas_LeaveTower_14_05");	//Nur zu, verschwende meine Zeit.
};

