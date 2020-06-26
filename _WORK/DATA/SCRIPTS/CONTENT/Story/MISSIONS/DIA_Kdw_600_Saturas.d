
instance Info_Saturas_EXIT(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 999;
	condition = Info_Saturas_EXIT_Condition;
	information = Info_Saturas_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Saturas_EXIT_Condition()
{
	return 1;
};

func void Info_Saturas_EXIT_Info()
{
	AI_Output(self,other,"Info_Saturas_EXIT_14_01");	//M�gest du in einem St�ck zur�ckkehren!
	AI_StopProcessInfos(self);
};


instance Info_Saturas_Intruder(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 1;
	condition = Info_Saturas_Intruder_Condition;
	information = Info_Saturas_Intruder_Info;
	permanent = 1;
	important = 1;
};


func int Info_Saturas_Intruder_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 3))
	{
		return 1;
	};
};

func void Info_Saturas_Intruder_Info()
{
	AI_Output(self,other,"Info_Saturas_Intruder_14_00");	//Was machst du hier? Du hast hier nichts zu suchen! Verschwinde!
	AI_StopProcessInfos(self);
};


instance Info_Saturas_NEWS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_NEWS_Condition;
	information = Info_Saturas_NEWS_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe wichtige Neuigkeiten aus dem Lager der Bruderschaft!";
};


func int Info_Saturas_NEWS_Condition()
{
	if((CorAngar_SendToNC == TRUE) && Npc_KnowsInfo(hero,Info_Cronos_SLEEPER))
	{
		return TRUE;
	};
};

func void Info_Saturas_NEWS_Info()
{
	AI_Output(other,self,"Info_Saturas_NEWS_15_01");	//Ich habe wichtige Neuigkeiten aus dem Lager der Bruderschaft!
	AI_Output(self,other,"Info_Saturas_NEWS_14_02");	//Wenn dir Cronos die Erlaubnis gab, mich aufzusuchen, m�ssen es in der Tat wichtige Nachrichten sein!
};


instance Info_Saturas_YBERION(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_YBERION_Condition;
	information = Info_Saturas_YBERION_Info;
	permanent = 0;
	important = 0;
	description = "Y'Berion ist tot.";
};


func int Info_Saturas_YBERION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_NEWS))
	{
		return TRUE;
	};
};

func void Info_Saturas_YBERION_Info()
{
	AI_Output(other,self,"Info_Saturas_YBERION_15_01");	//Y'Berion ist tot! Er starb bei einer gro�en rituellen Anrufung des Schl�fers.
	AI_Output(self,other,"Info_Saturas_YBERION_14_02");	//Y'Berion tot? Das sind schlechte Nachrichten, sehr schlechte Nachrichten!
	AI_Output(self,other,"Info_Saturas_YBERION_14_03");	//Wer hat die F�hrung der Bruderschaft �bernommen? Dieser machtgierige, verschlagene Cor Kalom?
	AI_Output(other,self,"Info_Saturas_YBERION_15_04");	//Nein! Kalom hat der Bruderschaft den R�cken gekehrt. Er hat einige Templer mitgenommen. Niemand wei�, wohin sie aufgebrochen sind.
	AI_Output(self,other,"Info_Saturas_YBERION_14_05");	//Warum das? Er war doch der zweite Mann nach Y'Berion!
	AI_Output(other,self,"Info_Saturas_YBERION_15_06");	//Gewisse Ereignisse haben die Gurus davon �berzeugt, dass der Weg ihres Gottes der falsche ist. Er scheint ein Erzd�mon zu sein, der nur B�ses im Schilde f�hrt.
	AI_Output(other,self,"Info_Saturas_YBERION_15_07");	//Einer der Gurus hat mich unter dem Einfluss des Schl�fers fast umgebracht, obwohl ich eben diesem Mann kurz zuvor das Leben gerettet hatte.
	AI_Output(other,self,"Info_Saturas_YBERION_15_08");	//Cor Kalom war der einzige Guru, der die wahre Natur der H�llenkreatur nicht sehen wollte und hat daher das Lager im Sumpf verlassen.
	AI_Output(self,other,"Info_Saturas_YBERION_14_09");	//Ich verstehe! Nun, das ist Gl�ck im Ungl�ck, denn Cor Angar ist ein guter Mann. Hart, aber ehrlich.
	AI_Output(self,other,"Info_Saturas_YBERION_14_10");	//Wenn jemand den Zerfall der Bruderschaft nach dieser spirituellen Katastrophe verhindern kann, ist er es.
	B_LogEntry(CH3_EscapePlanNC,"Ich habe Saturas von den Ereignissen im Sumpflager berichtet. Er zeigte sich froh, dass Cor Angar die F�hrung der Bruderschaft �bernommen hat.");
};


instance Info_Saturas_BOOK(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BOOK_Condition;
	information = Info_Saturas_BOOK_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe diesen Almanach hier.";
};


func int Info_Saturas_BOOK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_YBERION) && Npc_HasItems(hero,ItWrFokusbuch))
	{
		return TRUE;
	};
};

func void Info_Saturas_BOOK_Info()
{
	AI_Output(other,self,"Info_Saturas_BOOK_15_01");	//Ich habe diesen Almanach hier ...
	AI_Output(other,self,"Info_Saturas_BOOK_15_02");	//Y'Berion hatte ihn benutzt, um den Fokus aufzuladen.
	AI_Output(self,other,"Info_Saturas_BOOK_14_03");	//Sehr gut. Wir ben�tigen das Wissen aus diesem Buch, um alle f�nf der urspr�nglichen Fokussteine aufzuladen.
	AI_Output(self,other,"Info_Saturas_BOOK_14_04");	//Ich werde den Almanach an mich nehmen!
	B_GiveInvItems(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem(self,ItWrFokusbuch);
	B_GiveXP(XP_DeliverBookToSaturas);
};


instance Info_Saturas_FOCUS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_FOCUS_Condition;
	information = Info_Saturas_FOCUS_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe diesen Fokus hier.";
};


func int Info_Saturas_FOCUS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_YBERION) && Npc_HasItems(hero,Focus_1))
	{
		return TRUE;
	};
};

func void Info_Saturas_FOCUS_Info()
{
	AI_Output(other,self,"Info_Saturas_FOCUS_15_01");	//Ich habe diesen Fokus hier ...
	AI_Output(self,other,"Info_Saturas_FOCUS_14_02");	//Du h�ltst einen der Schl�ssel f�r die Zerst�rung unser aller Fesseln in H�nden.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_03");	//Es handelt sich um einen der f�nf Fokussteine, mit deren Hilfe die magische Barriere erschaffen wurde.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_04");	//Und mit der fokussierenden Kraft genau dieser Steine werden wir die Mauern aus Energie auch wieder niederrei�en.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_05");	//Aber kostet das nicht unglaublich viel magische Energie?
	AI_Output(self,other,"Info_Saturas_FOCUS_14_06");	//Richtig, doch wir haben �ber all die Jahre unerm�dlich Erz gesammelt, anstatt es mit unseren Kerkermeistern gegen Annehmlichkeiten zu tauschen.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_07");	//Wie du sicher schon wei�t, enth�lt jeder Erzbrocken etwas magische Energie. Mit Hilfe dieser Energie, die in unserem gro�en Erzhaufen schlummert, k�nnen wir die magische Barriere in Fetzen sprengen.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_08");	//Das h�rt sich gef�hrlich an.
	AI_Output(self,other,"Info_Saturas_FOCUS_14_09");	//Die Explosion wird rein magischer Natur sein und wird ausschlie�lich alles magisch Ver�nderte innerhalb der Barriere zerst�ren. F�r uns Menschen besteht keine Gefahr.
	AI_Output(other,self,"Info_Saturas_FOCUS_15_10");	//Hier, nimm den Fokus. Hoffentlich hilft er dem Plan mit dem Erzhaufen auch wirklich!
	B_GiveInvItems(hero,self,Focus_1,1);
	Npc_RemoveInvItem(self,Focus_1);
	B_GiveXP(XP_DeliverFocusToSaturas);
};


instance Info_Saturas_WHATNOW(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_WHATNOW_Condition;
	information = Info_Saturas_WHATNOW_Info;
	permanent = 0;
	important = 0;
	description = "Was machst du jetzt mit Fokus und Almanach?";
};


func int Info_Saturas_WHATNOW_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_FOCUS) && Npc_KnowsInfo(hero,Info_Saturas_BOOK))
	{
		return TRUE;
	};
};

func void Info_Saturas_WHATNOW_Info()
{
	AI_Output(other,self,"Info_Saturas_WHATNOW_15_01");	//Was machst du jetzt mit Fokus und Almanach?
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_03");	//Nichts. Wir ben�tigen vorher die vier restlichen Fokussteine!
	AI_Output(self,other,"Info_Saturas_WHATNOW_14_04");	//Dummerweise befindet sich kein einziger dieser vier magischen Steine in unserem Besitz.
};


instance Info_Saturas_OFFER(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_OFFER_Condition;
	information = Info_Saturas_OFFER_Info;
	permanent = 0;
	important = 0;
	description = "Ich bin bereit diese vier Foki f�r euch zu suchen!";
};


func int Info_Saturas_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_WHATNOW))
	{
		return TRUE;
	};
};

func void Info_Saturas_OFFER_Info()
{
	AI_Output(other,self,"Info_Saturas_OFFER_15_01");	//Ich bin bereit diese vier Foki f�r euch zu suchen!
	AI_Output(other,self,"Info_Saturas_OFFER_15_02");	//Schlie�lich will ich auch hier irgendwann wieder raus.
	AI_Output(self,other,"Info_Saturas_OFFER_14_03");	//Ich muss dich warnen. Die Suche wird gleicherma�en schwierig und gef�hrlich.
	AI_Output(self,other,"Info_Saturas_OFFER_14_04");	//Da die Spannungen mit dem Alten Lager immer st�rker werden, kann ich hier auch keinen der S�ldner entbehren.
	AI_Output(self,other,"Info_Saturas_OFFER_14_05");	//Du w�rest ganz auf dich alleine gestellt.
	AI_Output(other,self,"Info_Saturas_OFFER_15_06");	//Na ja ... Das ist nun wirklich nichts Neues! Ich werde diese Dinger schon irgendwo auftreiben.
	AI_Output(self,other,"Info_Saturas_OFFER_14_07");	//Deine Zuversicht ehrt dich, aber du wirst einige Gegenst�nde ben�tigen.
	AI_Output(self,other,"Info_Saturas_OFFER_14_08");	//Nimm diese Karte hier. Sie ist alt, aber auf ihr sind die urspr�nglichen Standorte der Fokussteine w�hrend der Erschaffung der Barriere verzeichnet.
	AI_Output(self,other,"Info_Saturas_OFFER_14_09");	//Dar�ber hinaus sollte diese Spruchrolle dir eine schnellere Reise zur�ck in unser Lager erm�glichen.
	AI_Output(self,other,"Info_Saturas_OFFER_14_10");	//Zu guter Letzt sprich mit Riordian. Er braut die Tr�nke f�r das Lager.
	AI_Output(self,other,"Info_Saturas_OFFER_14_11");	//Du findest ihn in seiner H�tte hier auf der obersten Ebene.
	B_Story_BringFoci();
};

func void B_DeliverFocus()
{
	if(Saturas_BringFoci == 1)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_01");	//Hm, das ist ein Anfang. Du schl�gst dich gut.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_02");	//Es fehlen noch drei Fokussteine, um unseren gro�en Plan durchzuf�hren.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_03");	//Gehe nun und suche die restlichen Fokussteine.
		Saturas_BringFoci = 2;
		B_GiveXP(XP_DeliverSecondFocus);
	}
	else if(Saturas_BringFoci == 2)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_04");	//Gut, das ist schon der zweite Fokusstein, den du uns bringst.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_05");	//Wir kommen unserem gro�en Ziel immer n�her.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_06");	//Schlag dich tapfer und suche nun die restlichen zwei Fokussteine.
		Saturas_BringFoci = 3;
		B_GiveXP(XP_DeliverThirdFocus);
	}
	else if(Saturas_BringFoci == 3)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_07");	//Unglaublich, nun haben wir schon insgesamt vier Fokussteine.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_08");	//Nur noch ein Einziger fehlt uns, dann haben wir alle urspr�nglichen Steine in unserem Besitz.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_09");	//Du hast unserer Gemeinschaft schon jetzt sehr viel Ehre erwiesen. Finde den letzten Fokusstein und unsere Befreiung steht kurz bevor.
		Saturas_BringFoci = 4;
		B_GiveXP(XP_DeliverFourthFocus);
	}
	else if(Saturas_BringFoci == 4)
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_10");	//Fantastisch, nun haben wir alle f�nf Fokussteine in unserem Besitz.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_11");	//Deine Taten sind von unsch�tzbarem Wert f�r unser Lager. Sei dir meines ewigen Dankes gewiss.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_12");	//Gehe nun zu Riordian. Er wird dir einen Ausgleich f�r deine unermesslichen M�hen geben.
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_13");	//Sprich auch mit Cronos, dem H�ter des Erzes. Auch er wird dir ein Geschenk unserer Gemeinschaft �berreichen.
		Saturas_BringFoci = 5;
		B_GiveXP(XP_DeliverFifthFocus);
		B_LogEntry(CH3_BringFoci,"Es ist mir gelungen, alle vier fehlenden Fokussteine zu finden. Saturas ist �bergl�cklich. Ich glaube ich habe jetzt einiges gut im Neuen Lager.");
		B_LogEntry(CH3_BringFoci,"Die Wassermagier Cronos und Riordian halten jeweils eine Belohnung f�r die Wiederbeschaffung aller vier Fokussteine f�r mich bereit. Ich sollte mal bei ihnen vorbeischauen.");
		Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);
		Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);
	};
	if(!Npc_HasItems(hero,ItArScrollTeleport2) && (Saturas_BringFoci < 5))
	{
		AI_Output(self,other,"Info_Saturas_BRINGFOCUS_14_14");	//Du hast die Teleport-Spruchrolle verbraucht, wie ich sehe. Hier, nimm eine neue.
		CreateInvItem(self,ItArScrollTeleport2);
		B_GiveInvItems(self,other,ItArScrollTeleport2,1);
	};
};


instance Info_Saturas_BRINGFOCUS2(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS2_Condition;
	information = Info_Saturas_BRINGFOCUS2_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe in der Trollschlucht einen Fokus gefunden!";
};


func int Info_Saturas_BRINGFOCUS2_Condition()
{
	if(Npc_HasItems(hero,Focus_2) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS2_15_01");	//Ich habe in der Trollschlucht einen Fokus gefunden!
	B_LogEntry(CH3_TrollCanyon,"Der Fokus aus der Trollschlucht liegt nun sicher verwahrt bei Saturas.");
	Log_SetTopicStatus(CH3_TrollCanyon,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_2,1);
	Npc_RemoveInvItem(self,Focus_2);
	B_DeliverFocus();
};


instance Info_Saturas_BRINGFOCUS3(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS3_Condition;
	information = Info_Saturas_BRINGFOCUS3_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe in der Bergfestung einen Fokus gefunden!";
};


func int Info_Saturas_BRINGFOCUS3_Condition()
{
	if(Npc_HasItems(hero,Focus_3) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS3_15_01");	//Ich habe in der Bergfestung einen Fokus gefunden!
	B_LogEntry(CH3_Fortress,"Saturas hat von mir den Fokus aus der Bergfestung erhalten.");
	Log_SetTopicStatus(CH3_Fortress,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_3,1);
	Npc_RemoveInvItem(hero,Focus_3);
	B_DeliverFocus();
};


instance Info_Saturas_BRINGFOCUS4(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS4_Condition;
	information = Info_Saturas_BRINGFOCUS4_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe in der Klosterruine einen Fokus gefunden!";
};


func int Info_Saturas_BRINGFOCUS4_Condition()
{
	if(Npc_HasItems(hero,Focus_4) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_01");	//Ich habe in der Klosterruine einen Fokus gefunden!
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS4_15_02");	//Gorn, der S�ldner, war dort und hat mich bei der Suche unterst�tzt.
	B_LogEntry(CH3_MonasteryRuin,"Endlich konnte ich Saturas den Fokus aus der Klosterruine �bergeben.");
	Log_SetTopicStatus(CH3_MonasteryRuin,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_4,1);
	Npc_RemoveInvItem(hero,Focus_4);
	B_DeliverFocus();
};


instance Info_Saturas_BRINGFOCUS5(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_BRINGFOCUS5_Condition;
	information = Info_Saturas_BRINGFOCUS5_Info;
	permanent = 0;
	important = 0;
	description = "Ich habe unter dem Stonehenge einen Fokus gefunden!";
};


func int Info_Saturas_BRINGFOCUS5_Condition()
{
	if(Npc_HasItems(hero,Focus_5) && (Saturas_BringFoci > 0))
	{
		return TRUE;
	};
};

func void Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output(other,self,"Info_Saturas_BRINGFOCUS5_15_01");	//Ich habe unter dem Stonehenge einen Fokus gefunden!
	B_LogEntry(CH3_Stonehenge,"Ich habe Saturas den Fokus aus der Gruft unter dem Stonehenge �berreicht.");
	Log_SetTopicStatus(CH3_Stonehenge,LOG_SUCCESS);
	B_GiveInvItems(hero,self,Focus_5,1);
	Npc_RemoveInvItem(hero,Focus_5);
	B_DeliverFocus();
};


instance Info_Saturas_ALLFOCI(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_ALLFOCI_Condition;
	information = Info_Saturas_ALLFOCI_Info;
	permanent = 0;
	important = 0;
	description = "Kann nun die Sprengung des Erzhaufens beginnen?";
};


func int Info_Saturas_ALLFOCI_Condition()
{
	if((Saturas_BringFoci == 5) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void Info_Saturas_ALLFOCI_Info()
{
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_01");	//Kann nun die Sprengung des Erzhaufens beginnen?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_02");	//Wir haben jetzt alle Artefakte zusammen, die unser gro�es Vorhaben ben�tigt.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_03");	//Doch die Erschaffung der Barriere wurde von zw�lf Magiern durchgef�hrt.
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_04");	//Um die gewaltigen Energien zu kontrollieren und in die richtigen Bahnen lenken zu k�nnen, sind wir Wassermagier nicht genug.
	AI_Output(other,self,"Info_Saturas_ALLFOCI_15_05");	//Was machen wir dann?
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_06");	//Mir ist bewusst, dass du schon sehr viel f�r unsere Gemeinschaft getan hast und wir stehen tief in deiner Schuld ...
	AI_Output(self,other,"Info_Saturas_ALLFOCI_14_07");	//... Doch im Interesse aller Koloniebewohner muss ich dich noch um einen weiteren Gefallen bitten.
};


instance Info_Saturas_FAVOR(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_FAVOR_Condition;
	information = Info_Saturas_FAVOR_Info;
	permanent = 0;
	important = 0;
	description = "Ein weiterer Gefallen?";
};


func int Info_Saturas_FAVOR_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};
};

func void Info_Saturas_FAVOR_Info()
{
	AI_Output(other,self,"Info_Saturas_FAVOR_15_01");	//Ein weiterer Gefallen?
	AI_Output(self,other,"Info_Saturas_FAVOR_14_02");	//Ja. Begib dich ins Alte Lager und versuche, einige der Feuermagier f�r unsere Sache zu gewinnen.
	AI_Output(other,self,"Info_Saturas_FAVOR_15_03");	//DIE FEUERMAGIER??? Warum sollten die Maden den Speck verlassen wollen?
	AI_Output(other,self,"Info_Saturas_FAVOR_15_04");	//Ein Zusammenbruch der Barriere w�rde ihre Machtposition  zunichte machen!
	AI_Output(self,other,"Info_Saturas_FAVOR_14_05");	//Genau aus diesem Grunde musst DU dich um diese schwierige Mission k�mmern. Du kennst Leute aus allen Lagern der Kolonie.
	AI_Output(self,other,"Info_Saturas_FAVOR_14_06");	//Erinnere die Feuermagier an die alten Zeiten, als wir noch gemeinsam die magischen K�nste studierten.
};


instance Info_Saturas_ACCEPT(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_ACCEPT_Condition;
	information = Info_Saturas_ACCEPT_Info;
	permanent = 0;
	important = 0;
	description = "Nun gut, ich werde versuchen, die Feuermagier zu �berreden!";
};


func int Info_Saturas_ACCEPT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};
};

func void Info_Saturas_ACCEPT_Info()
{
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_01");	//Nun gut, ich werde versuchen, die Feuermagier zu �berreden!
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_02");	//Aber ich kann nichts versprechen! Es scheint mir fast unm�glich.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_03");	//Du musst es versuchen. Wenn du keinen Erfolg hast, dann gibt es nur noch einen ...
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_04");	//Einen ...
	AI_Output(other,self,"Info_Saturas_ACCEPT_15_05");	//... Einen WAS?
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_06");	//Vergiss das! Du MUSST Erfolg haben!
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_07");	//Hier, nimm diese Zauberrune. �berbringe sie Corristo, dem obersten Feuermagier, als Zeichen unseres Vertrauens.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_08");	//Damit kann er sich jederzeit vorbei an allen Wachen mitten in diesen Raum teleportieren.
	AI_Output(self,other,"Info_Saturas_ACCEPT_14_09");	//Ich hoffe, das �berzeugt unsere ehemaligen Freunde von unseren guten Absichten.
	B_Kapitelwechsel(4);
};


instance Info_Saturas_AMBUSH(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_AMBUSH_Condition;
	information = Info_Saturas_AMBUSH_Info;
	permanent = 0;
	important = 1;
};


func int Info_Saturas_AMBUSH_Condition()
{
	if(FMTaken && !FindXardas)
	{
		return TRUE;
	};
};

func void Info_Saturas_AMBUSH_Info()
{
	var C_Npc gorn;
	gorn = Hlp_GetNpc(PC_Fighter);
	AI_TurnToNPC(gorn,hero);
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_01");	//Gut, dass du wieder zur�ck bist. Es ist etwas Schreckliches passiert!
	AI_Output(hero,self,"Info_Saturas_AMBUSH_15_02");	//Lass mich raten, die Freie Mine wurde von Gardisten aus dem Alten Lager �berfallen, die niemand kommen sah?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_03");	//Moment ... woher ... aber nat�rlich ... Du hast es im Alten Lager erfahren!
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_04");	//Gorn kam kurz vor dir hier an.
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_05");	//Was kann Gomez nur veranlasst haben, solch einen aggressiven Schritt zu wagen?
	AI_Output(self,hero,"Info_Saturas_AMBUSH_14_06");	//Ihm m�sste klar sein, dass dieser hinterh�ltige �berfall einen Krieg heraufbeschw�rt.
};


instance Info_Saturas_COLLAPSE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_COLLAPSE_Condition;
	information = Info_Saturas_COLLAPSE_Info;
	permanent = 0;
	important = 0;
	description = "Die Alte Mine wurde nach einem Wassereinbruch versch�ttet!";
};


func int Info_Saturas_COLLAPSE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Saturas_COLLAPSE_Info()
{
	AI_Output(hero,self,"Info_Saturas_COLLAPSE_15_01");	//Die Alte Mine wurde nach einem Wassereinbruch versch�ttet!
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_02");	//... Versch�ttet ... nat�rlich ... dann gibt das Ganze langsam einen Sinn.
	AI_Output(self,hero,"Info_Saturas_COLLAPSE_14_03");	//Gomez steht mit dem R�cken zur Wand. Er ist gef�hrlicher denn je geworden, denn nun, wo er nichts mehr zu verlieren hat, wird er zu allem f�hig sein!
};


instance Info_Saturas_MURDER(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_MURDER_Condition;
	information = Info_Saturas_MURDER_Info;
	permanent = 0;
	important = 0;
	description = "Gomez hat alle Feuermagier t�ten lassen!";
};


func int Info_Saturas_MURDER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_AMBUSH))
	{
		return TRUE;
	};
};

func void Info_Saturas_MURDER_Info()
{
	AI_Output(hero,self,"Info_Saturas_MURDER_15_01");	//Gomez hat alle Feuermagier t�ten lassen!
	AI_Output(self,hero,"Info_Saturas_MURDER_14_02");	//T�TEN LASSEN??? Wieso bei Beliar hat er so etwas getan?
	AI_Output(hero,self,"Info_Saturas_MURDER_15_03");	//Sie waren gegen den �berfall auf die Freie Mine und stellten sich gegen Gomez.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_04");	//Dann sind wir alle verloren. Ohne die anderen sechs Magier werden wir die geballte Kraft des gro�en Erzhaufens nicht kontrollieren k�nnen.
	AI_Output(self,hero,"Info_Saturas_MURDER_14_05");	//Ich danke dir trotzdem daf�r, dass du diese gef�hrliche Botschaft an mich �berbracht hast.
	B_GiveXP(XP_ReportToSaturas);
	B_LogEntry(CH4_Firemages,"Saturas war garnicht erfreut, als ich ihm �ber die Ereignisse im Alten Lager berichtet habe. Wie immer es jetzt mit der Sprengung der magischen Barriere weitergeht... es wird auf jeden Fall OHNE die Feuermagier geschehen m�ssen.");
	Log_SetTopicStatus(CH4_Firemages,LOG_SUCCESS);
};


instance KDW_600_Saturas_NOMOREOC(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_NOMOREOC_Condition;
	information = KDW_600_Saturas_NOMOREOC_Info;
	important = 0;
	permanent = 0;
	description = "Das Alte Lager hat mich verbannt, weil ich euch geholfen habe!";
};


func int KDW_600_Saturas_NOMOREOC_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_MURDER) && ((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF) || (oldHeroGuild == GIL_EBR)))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_NOMOREOC_Info_15_01");	//Das Alte Lager hat mich verbannt, weil ich euch geholfen habe!
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_02");	//Du geh�rst nicht l�nger zum Alten Lager?
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Dann hei�e ich dich in unserer Gemeinschaft willkommen.
	Log_CreateTopic(CH4_BannedFromOC,LOG_MISSION);
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_RUNNING);
	B_LogEntry(CH4_BannedFromOC,"Nachdem ich aus dem Alten Lager verbannt wurde hat mich Saturas im Neuen Lager wilkommen geheissen.");
};


instance KDW_600_Saturas_GOTOLEE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_GOTOLEE_Condition;
	information = KDW_600_Saturas_GOTOLEE_Info;
	important = 0;
	permanent = 0;
	description = "Hei�t das, die S�ldner werden mich aufnehmen?";
};


func int KDW_600_Saturas_GOTOLEE_Condition()
{
	if(((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_EBR)) && Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_GOTOLEE_Info_15_01");	//Hei�t das, die S�ldner werden mich aufnehmen?
	AI_Output(self,other,"KDW_600_Saturas_GOTOLEE_Info_14_02");	//Sprich mit Lee. Er wird sich darum k�mmern. Danach komm wieder zu mir.
	B_LogEntry(CH4_BannedFromOC,"Lee, der Anf�hrer der S�ldner, will in dieser Angelegenheit mit mir sprechen. Ich soll ihn aufsuchen und anschlie�end wieder zu Saturas zur�ckkehren.");
};


instance KDW_600_Saturas_OATH(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_OATH_Condition;
	information = KDW_600_Saturas_OATH_Info;
	important = 0;
	permanent = 0;
	description = "Hei�t das, ich geh�re jetzt in die Gilde der Wassermagier?";
};


func int KDW_600_Saturas_OATH_Condition()
{
	if((oldHeroGuild == GIL_KDF) && Npc_KnowsInfo(hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_OATH_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Hei�t das, ich geh�re jetzt in die Gilde der Wassermagier?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Noch nicht. Du musst erst den Eid des Wassers ablegen.
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_03");	//Aber ich habe mich bereits dem Feuer verschworen!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_04");	//Hmmm ....
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_05");	//Du brichst den Schwur ja nicht!
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_06");	//�hh ... Ich verstehe nicht ...
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_07");	//Du erweiterst deinen Schwur. Damit wirst du zum Magier der beiden Elemente!
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_08");	//Sowohl die Macht des Feuers als auch das Wissen des Wassers stehen dir dann zur Verf�gung!
	B_LogEntry(CH4_BannedFromOC,"Saturas bot mir an, mich in den Kreis der Wassermagier aufzunehmen, ohne dass ich meinen alten Schwur des Feuers brechen muss.");
};


instance KDW_600_Saturas_KDWAUFNAHME(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_KDWAUFNAHME_Condition;
	information = KDW_600_Saturas_KDWAUFNAHME_Info;
	important = 0;
	permanent = 0;
	description = "Ich bin bereit, den Eid abzulegen.";
};


func int KDW_600_Saturas_KDWAUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KDWAUFNAHME_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Ich bin bereit, den Eid abzulegen.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02");	//Diener des Feuers, du wirst nun den Segen des Wassers empfangen!
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Sprich nun die Worte des Eides:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Ich schw�re bei den M�chten der G�tter ... 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Ich schw�re bei den M�chten der G�tter ... 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... und bei der Kraft des heiligen Wassers ... 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... und bei der Kraft des heiligen Wassers ... 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12");	//Mit diesem Schwur einst du die Kraft des Feuers und den Segen des Wassers in dir.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13");	//Du verbindest das, was vorher getrennt war. M�ge dein Leben ein Zeichen des Bundes der Elemente sein.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Trage diese Robe als Zeichen deiner Verbundenheit zum heiligen Wasser und zu Adanos.
	CreateInvItem(self,kdw_armor_l);
	B_GiveInvItems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	B_LogEntry(CH4_BannedFromOC,"Er hat mich in den Kreis der Wassermagier aufgenommen. Von nun an habe ich Zugriff auf beide Schulen der Magie.");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};


instance KDW_600_Saturas_LESSON(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_LESSON_Condition;
	information = KDW_600_Saturas_LESSON_Info;
	important = 0;
	permanent = 0;
	description = "Kannst du mich unterrichten?";
};


func int KDW_600_Saturas_LESSON_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_LESSON_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_LESSON_Info_15_01");	//Kannst du mich unterrichten?
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 3)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_02");	//Es gibt noch viel zu lernen f�r dich. Wenn du bereit bist, werde ich dich unterrichten.
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_03");	//Es gibt noch einen weiteren Kreis, den du nicht kennst. Wenn du bereit bist, werde ich dich unterrichten.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_04");	//Du beherrscht bereits den f�nften Kreis der Magie! Du wei�t alles, was ich wei�.
		AI_Output(self,other,"KDW_600_Saturas_LESSON_Info_14_05");	//Ich kann dir nichts mehr beibringen!
	};
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Saturas, der Anf�hrer der Wassermagier lehrt die magischen KREISE. Er h�lt sich stets am Pentagramm auf der obersten Ebene auf.");
};


instance KDW_600_Saturas_KREIS1(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS1_Condition;
	information = KDW_600_Saturas_KREIS1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0);
};


func int KDW_600_Saturas_KREIS1_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS1_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS1_Info_15_01");	//Ich bin bereit, in den ersten Kreis aufgenommen zu werden.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_02");	//Den ersten der magischen Kreise zu betreten, bedeutet die Anwendung magischer Runen lernen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_03");	//Jede Rune birgt in sich die Struktur eines speziellen Zaubers.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_04");	//Durch den Einsatz deiner eigenen magischen Energie, bist du in der Lage, den Zauber der Rune zu wirken.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_05");	//Doch anders als Spruchrollen, die auch eine Zauberformel sind, sorgt die magische Kraft, die der Rune innewohnt, daf�r, dass die Struktur des Zaubers erhalten bleibt.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_06");	//Jede Rune ist eine Quelle magischer Kraft, auf die du immer wieder zur�ckgreifen kannst.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_07");	//Deine eigene magische Kraft verbraucht sich beim Benutzen der Rune, wie bei einer Spruchrolle.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_08");	//Mit jedem Kreis, den du lernst, lernst du auch die M�glichkeit, weitere Runen zu benutzen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS1_Info_14_09");	//Nutze die Kraft der Runen, um dich selber zu erkennen.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS2(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS2_Condition;
	information = KDW_600_Saturas_KREIS2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0);
};


func int KDW_600_Saturas_KREIS2_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS2_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS2_Info_15_01");	//Ich bin bereit, in den zweiten Kreis aufgenommen zu werden.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_02");	//Du hast das Verst�ndnis der Runen gelernt. Nun ist es an der Zeit, dieses Verst�ndnis zu vertiefen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_03");	//Mit dem zweiten Kreis lernst du die Grunds�tze st�rkerer Kampfzauber und vor allem das Geheimnis der Heilung.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_04");	//Doch du musst noch viel lernen, willst du die tats�chlichen Geheimnisse der Magie ergr�nden.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_05");	//Du wei�t, dass du jede Rune solange einsetzen kannst, bis deine eigene Kraft verbraucht ist.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_06");	//Aber frage dich, ob es sinnvoll ist. Du hast Macht verliehen bekommen, mit der es dir ein Leichtes ist, Tod und Verderben zu bringen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_07");	//Doch der wahrhafte Magier zaubert nur dann, wenn es angebracht ist.
		AI_Output(self,other,"KDW_600_Saturas_KREIS2_Info_14_08");	//Erkenne die Situation, dann wirst du die Macht der Runen erkennen.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS3(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS3_Condition;
	information = KDW_600_Saturas_KREIS3_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0);
};


func int KDW_600_Saturas_KREIS3_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS3_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS3_Info_15_01");	//Ich bin bereit, den dritten Kreis zu betreten
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_02");	//Der dritte Kreis der Magie ist einer der wichtigsten Schritte im Leben eines Magiers. Nicht l�nger bist du ein Suchender.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_03");	//Du bist bereits ein St�ck des magischen Weges gegangen. Du hast gelernt die Runen zu nutzen.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_04");	//Dieses Wissen ist das Fundament f�r deinen weiteren Weg. Nutze die Runen mit Bedacht.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_05");	//Du kannst eine Rune nutzen oder nicht. Aber entscheide dich f�r eine der M�glichkeiten.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_06");	//Z�gere nicht, deine Macht einzusetzen, wenn du dich einmal entschieden hast.
		AI_Output(self,other,"KDW_600_Saturas_KREIS3_Info_14_07");	//Erkenne deinen Weg, dann wirst du die Macht der Entscheidung erkennen.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS4(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS4_Condition;
	information = KDW_600_Saturas_KREIS4_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0);
};


func int KDW_600_Saturas_KREIS4_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS4_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS4_Info_15_01");	//Ich bin bereit f�r den vierten der Kreise.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_02");	//Du hast die ersten drei Kreise durchschritten. Nun ist es an der Zeit, dass du die Geheimnisse der Magie kennen lernst.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_03");	//Die Magie der Runen ruht in ihrem Stein. Es sind magische Steine, gewonnen aus magischem Erz.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_04");	//Das gleiche Erz, das hier abgebaut wird. Dieses Erz wird in den Tempeln mit den Formeln der Magie versehen. Dort werden die Runen zu den Instrumenten unserer Macht geformt.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_05");	//Mit allen Runen, die du nun beherrschen kannst, steht dir das gesammelte Wissen der Tempel des Reiches zur Verf�gung.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_07");	//Erkenne die Magie, dann wirst du das Geheimnis von Macht erkennen.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};


instance KDW_600_Saturas_KREIS5(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_KREIS5_Condition;
	information = KDW_600_Saturas_KREIS5_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_5,LPCOST_TALENT_MAGE_5,0);
};


func int KDW_600_Saturas_KREIS5_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_LESSON) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Npc_GetTrueGuild(hero) == GIL_KDW))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_KREIS5_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_KREIS5_Info_15_01");	//Ich bin bereit f�r den f�nften Kreis.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,5,LPCOST_TALENT_MAGE_5))
	{
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_02");	//So soll es geschehen. Ich werde dich die Macht des f�nften Kreises lehren.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_03");	//Der Sturm des Feuers, die Welle aus Eis und die Macht, Untote zu vernichten, sind wahrhaft m�chtige Spr�che, deren Runen dir nun untertan sind.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_04");	//Doch der m�chtigste Zauber des f�nften Kreises ist die Welle des Todes. Solltest du in den Besitz dieser Rune gelangen, dann bist du im Besitz gef�hrlicher Macht.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_05");	//H�te dich vor dem Einsatz dieser Magie. Sie ist eine Gabe des dunklen Gottes.
		AI_Output(self,other,"KDW_600_Saturas_KREIS4_Info_14_06");	//Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output(self,other,"KDW_600_Saturas_KREIS5_Info_14_06");	//Erkenne deine Grenzen, dann wirst du deine wahre Macht erkennen
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};


instance KDW_600_Saturas_HEAVYARMOR(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 100;
	condition = KDW_600_Saturas_HEAVYARMOR_Condition;
	information = KDW_600_Saturas_HEAVYARMOR_Info;
	important = 0;
	permanent = 1;
	description = B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H);
};


func int KDW_600_Saturas_HEAVYARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_KDW)
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01");	//Ich m�chte die hohe Robe des Wassers tragen.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 4) && (Kapitel < 5))
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02");	//Es ist noch nicht an der Zeit, dass du die hohe Robe tragen kannst.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03");	//Dein bisschen Erz deckt ja nicht mal die Herstellungskosten.
	}
	else
	{
		AI_Output(self,other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04");	//Die Zeit ist gekommen. Du bist w�rdig, die hohe Robe des Wassers zu tragen.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_KDW_ARMOR_H);
		CreateInvItem(hero,kdw_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
	};
};


instance Info_Saturas_NOWSLD(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_NOWSLD_Condition;
	information = Info_Saturas_NOWSLD_Info;
	permanent = 0;
	important = 0;
	description = "Lee hat mich bei den S�ldnern aufgenommen.";
};


func int Info_Saturas_NOWSLD_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_CHANGESIDE))
	{
		return TRUE;
	};
};

func void Info_Saturas_NOWSLD_Info()
{
	AI_Output(hero,self,"Info_Saturas_NOWSLD_15_01");	//Lee hat mich bei den S�ldnern aufgenommen.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_02");	//Gut. Sehr gut. Dann geh�rst du nun offiziell zu unserer Gemeinschaft.
	AI_Output(self,hero,"Info_Saturas_NOWSLD_14_03");	//Sei herzlich willkommen!
	B_LogEntry(CH4_BannedFromOC,"Auch Saturas hat mich nun als neuer S�ldner offiziell begr��t.");
	Log_SetTopicStatus(CH4_BannedFromOC,LOG_SUCCESS);
};


instance Info_Saturas_XARDAS(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDAS_Condition;
	information = Info_Saturas_XARDAS_Info;
	permanent = 0;
	important = 0;
	description = "Bei der Sache mit den Feuermagiern, erw�hntest du einen weiteren... JEMAND";
};


func int Info_Saturas_XARDAS_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_COLLAPSE) && Npc_KnowsInfo(hero,Info_Saturas_MURDER))
	{
		if((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_KDF) && (Npc_GetTrueGuild(hero) != GIL_EBR))
		{
			return TRUE;
		};
	};
};

func void Info_Saturas_XARDAS_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_01");	//Als du mich zu den Feuermagiern schicktest, erw�hntest du einen weiteren ... JEMAND
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_02");	//Nun, ich hoffte wir w�rden ohne seine Hilfe auskommen, aber so wie die Dinge stehen ...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_03");	//Wer ist dieser JEMAND?
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_04");	//Also gut, also gut!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_05");	//Vor vielen, vielen Jahren ...
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_06");	//Bitte die Kurzform!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_07");	//Geduld! Also, als wir - die zw�lf Magier - damals die Barriere erschufen, wurden unsere magischen Kr�fte von einem 13. Zauberer gelenkt und geleitet.
	AI_Output(hero,self,"Info_Saturas_XARDAS_15_08");	//Ein 13. Zauberer? Ich dachte, es h�tte nur zw�lf gegeben!
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_09");	//Die meisten, die die ersten Tage der Kolonie nicht miterlebt haben, glauben das.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_10");	//Dieser 13. Zauberer war einst unser Anf�hrer. Das alles war, bevor wir uns in den Feuer- und Wasserkreis zerstritten haben.
	AI_Output(self,hero,"Info_Saturas_XARDAS_14_11");	//Doch er verlie� das Alte Lager, das damals noch das einzige Lager in der Kolonie war.
};


instance Info_Saturas_XARDASWHO(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHO_Condition;
	information = Info_Saturas_XARDASWHO_Info;
	permanent = 0;
	important = 0;
	description = "Wie hei�t dieser 13. Zauberer?";
};


func int Info_Saturas_XARDASWHO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHO_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHO_15_01");	//Wie hei�t dieser 13. Zauberer?
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_02");	//Sein Name ist Xardas. Kaum einer kennt noch die alten Geschichten �ber ihn!
	AI_Output(self,hero,"Info_Saturas_XARDASWHO_14_03");	//Die, die es tun, nennen ihn nur den D�MONENBESCHW�RER!
};


instance Info_Saturas_XARDASWHY(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHY_Condition;
	information = Info_Saturas_XARDASWHY_Info;
	permanent = 0;
	important = 0;
	description = "Warum verlie� er das Alte Lager?";
};


func int Info_Saturas_XARDASWHY_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHY_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_01");	//Warum verlie� er das Alte Lager?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_02");	//Er begann sich intensiv mit der Beschw�rung untoter und magischer Wesen zu besch�ftigen.
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_03");	//Das beunruhigte nicht nur Gomez. Selbst die meisten der anderen Magier lehnten sich gegen ihn und sein unheiliges Treiben auf.
	AI_Output(hero,self,"Info_Saturas_XARDASWHY_15_04");	//Was passierte dann?
	AI_Output(self,hero,"Info_Saturas_XARDASWHY_14_05");	//Er war - anders als Gomez - kein Schl�chter, also ging er dem Konflikt aus dem Weg und verlie� die anderen.
};


instance Info_Saturas_XARDASWHERE(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASWHERE_Condition;
	information = Info_Saturas_XARDASWHERE_Info;
	permanent = 0;
	important = 0;
	description = "Wo kann man diesen Zauberer finden?";
};


func int Info_Saturas_XARDASWHERE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDAS))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASWHERE_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASWHERE_15_01");	//Wo kann man diesen Zauberer finden?
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_02");	//Er lebt heute zur�ckgezogen in seinem Turm mitten im Orkgebiet.
	AI_Output(self,hero,"Info_Saturas_XARDASWHERE_14_03");	//Das ist so ziemlich der s�dlichste Ort der Kolonie.
};


instance Info_Saturas_XARDASHELP(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASHELP_Condition;
	information = Info_Saturas_XARDASHELP_Info;
	permanent = 0;
	important = 0;
	description = "Ich werde zu Xardas aufbrechen und ihn um Hilfe bitten!";
};


func int Info_Saturas_XARDASHELP_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASWHO) && Npc_KnowsInfo(hero,Info_Saturas_XARDASWHY) && Npc_KnowsInfo(hero,Info_Saturas_XARDASWHERE))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASHELP_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_01");	//Ich werde zu Xardas aufbrechen und ihn um Hilfe bitten!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_02");	//Er ist der einzige, der uns jetzt noch helfen kann.
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_03");	//Wenn er keinen Rat wei� oder uns nicht helfen will ...
	AI_Output(hero,self,"Info_Saturas_XARDASHELP_15_04");	//ER WIRD!
	AI_Output(self,hero,"Info_Saturas_XARDASHELP_14_05");	//Da w�re noch ein Problem ...
	B_Story_FindXardas();
};


instance Info_Saturas_XARDASPROBLEM(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASPROBLEM_Condition;
	information = Info_Saturas_XARDASPROBLEM_Info;
	permanent = 0;
	important = 0;
	description = "Ein Problem?";
};


func int Info_Saturas_XARDASPROBLEM_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASHELP))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_01");	//Ein Problem?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_02");	//Ja. Wir haben in den vergangenen Jahren �fters versucht, mit Xardas Kontakt aufzunehmen.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_03");	//Doch er scheint wohl lieber ungest�rt zu bleiben.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_04");	//Was bedeutet das?
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_05");	//Keiner der Boten kehrte je von seinem Turm zur�ck.
	AI_Output(self,hero,"Info_Saturas_XARDASPROBLEM_14_06");	//Du wirst einen Weg finden m�ssen, an seinen Kreaturen vorbeizukommen.
	AI_Output(hero,self,"Info_Saturas_XARDASPROBLEM_15_07");	//Es scheint also weiterhin interessant zu bleiben!
	B_LogEntry(CH4_FindXardas,"Saturas warnte mich vor den magischen Kreaturen des D�monenbeschw�rers Xardas. In der Bibliothek der Wassermagier gibt es Schriften �ber die Gefahren und Schw�chen solcher Wesen. Ich sollte mir etwas Zeit nehmen, um dort herumzust�bern.");
};


instance Info_Saturas_XARDASGO(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = Info_Saturas_XARDASGO_Condition;
	information = Info_Saturas_XARDASGO_Info;
	permanent = 0;
	important = 0;
	description = "Wie werde ich mit seinen Kreaturen fertig?";
};


func int Info_Saturas_XARDASGO_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_XARDASPROBLEM))
	{
		return TRUE;
	};
};

func void Info_Saturas_XARDASGO_Info()
{
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_01");	//Wie werde ich mit seinen Kreaturen fertig?
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_02");	//Wenn ich es w�sste, w�rde ich es dir sagen!
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_03");	//Am besten, du betreibst etwas Nachforschung in unserer Bibliothek.
	AI_Output(self,hero,"Info_Saturas_XARDASGO_14_04");	//Vielleicht wissen die alten B�cher etwas �ber St�rken und Schw�chen von magisch beschw�rten Kreaturen.
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_05");	//Ich werde die Bibliothek durchst�bern. Und mach dir keine Sorgen ...
	AI_Output(hero,self,"Info_Saturas_XARDASGO_15_06");	//Ich komme wieder!
	B_LogEntry(CH4_FindXardas,"In der Bibliothek der Wassermagier gibt es Schriften �ber die Gefahren und Schw�chen solcher Wesen. Ich sollte mir etwas Zeit nehmen, um dort herumzust�bern.");
};


instance KDW_600_Saturas_TIMESUP(C_Info)
{
	npc = Kdw_600_Saturas;
	condition = KDW_600_Saturas_TIMESUP_Condition;
	information = KDW_600_Saturas_TIMESUP_Info;
	important = 1;
	permanent = 0;
};


func int KDW_600_Saturas_TIMESUP_Condition()
{
	if((FindOrcShaman == LOG_RUNNING) || (FindOrcShaman == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_00");	//Hast du mit Xardas gesprochen?
	Info_ClearChoices(KDW_600_Saturas_TIMESUP);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Nun...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Nein...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice(KDW_600_Saturas_TIMESUP,"Die ganze Sache ist anders, als du denkst...",KDW_600_Saturas_TIMESUP_JA3);
};

func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_01");	//Nun ...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_02");	//Nun ..? Nun was?
};

func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_05");	//Nein...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_06");	//Warum nicht?
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_07");	//Ich kam bisher nicht in diese Gegend ...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_08");	//Du musst ihn finden und um Rat fragen!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos(self);
};

func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_09");	//Die ganze Sache ist anders, als du denkst ...
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_10");	//Was hei�t anders? Er muss einen Weg finden, wie wir den Erzhaufen sprengen k�nnen!
	AI_Output(other,self,"KDW_600_Saturas_TIMESUP_Info_15_11");	//Der Erzhaufen ... �h ... �h ...  ist mittlerweile sehr gro�!
	AI_Output(self,other,"KDW_600_Saturas_TIMESUP_Info_14_12");	//Suche Xardas, er muss uns helfen!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos(self);
};


instance KDW_600_Saturas_HogeAUFNAHME(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHME_Condition;
	information = KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent = 0;
	description = "Nefarius sagte, ich sei bereit die Robe der Wassermagier zu tragen.";
};


func int KDW_600_Saturas_HogeAUFNAHME_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero) == GIL_SLD) && (NEFARIUS_KDW == TRUE))
	{
		return 1;
	};
};

func void KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other,self,"KDW_600_Saturas_HogeAUFNAHME_15_00");	//Nefarius sagte, ich sei bereit die Robe der Wassermagier zu tragen.
	AI_Output(self,other,"KDW_600_Saturas_NOMOREOC_Info_14_03");	//Dann hei�e ich dich in unserer Gemeinschaft willkommen.
	AI_Output(other,self,"KDW_600_Saturas_OATH_Info_15_01");	//Hei�t das, ich geh�re jetzt in die Gilde der Wassermagier?
	AI_Output(self,other,"KDW_600_Saturas_OATH_Info_14_02");	//Noch nicht. Du musst erst den Eid des Wassers ablegen.
};


instance KDW_600_Saturas_HogeAUFNAHMETeil2(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 10;
	condition = KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information = KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent = 0;
	description = "Ich bin bereit, den Eid abzulegen.";
};


func int KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return 1;
	};
};

func void KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc(hero,self);
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01");	//Ich bin bereit, den Eid abzulegen.
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03");	//Sprich nun die Worte des Eides:
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04");	//Ich schw�re bei den M�chten der G�tter ... 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05");	//Ich schw�re bei den M�chten der G�tter ... 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06");	//... und bei der Kraft des heiligen Wassers ... 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07");	//... und bei der Kraft des heiligen Wassers ... 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08");	//... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09");	//... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10");	//... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	AI_Output(other,self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11");	//... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	AI_Output(self,other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14");	//Trage diese Robe als Zeichen deiner Verbundenheit zum heiligen Wasser und zu Adanos.
	CreateInvItem(self,kdw_armor_l);
	B_GiveInvItems(self,other,kdw_armor_l,1);
	AI_EquipBestArmor(hero);
	Snd_Play("MFX_Heal_Cast");
	Npc_SetTrueGuild(hero,GIL_KDW);
	hero.guild = GIL_KDW;
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	Log_CreateTopic(CH4_SldToKdW,LOG_NOTE);
	B_LogEntry(CH4_SldToKdW,"Saturas hat mich in den Kreis der Wassermagier aufgenommen.");
	AI_StopProcessInfos(self);
};


instance DIA_KDW_SATURAS_HERODMB(C_Info)
{
	npc = Kdw_600_Saturas;
	nr = 3;
	condition = dia_kdw_saturas_herodmb_condition;
	information = dia_kdw_saturas_herodmb_info;
	permanent = 0;
	important = 1;
};


func int dia_kdw_saturas_herodmb_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_DMB)
	{
		return 1;
	};
};

func void dia_kdw_saturas_herodmb_info()
{
	AI_Output(self,other,"DIA_KDW_Saturas_HeroDMB_15_00");	//DU? Wer hat dich in der Magie Beliars unterrichtet?
	AI_Output(self,other,"DIA_KDW_Saturas_HeroDMB_15_01");	//Wei�t du was ich will das gar nicht wissen, aber ich will dich auch gar nicht mehr hier sehen.
	AI_Output(self,other,"DIA_KDW_Saturas_HeroDMB_15_02");	//Sieh zu das du hier rauskommst!
	AI_StopProcessInfos(self);
};

