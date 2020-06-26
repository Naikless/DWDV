
instance Info_FreemineOrc_EXIT(C_Info)
{
	npc = FreemineOrc;
	nr = 999;
	condition = Info_FreemineOrc_EXIT_Condition;
	information = Info_FreemineOrc_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

func void Info_FreemineOrc_EXIT_Info()
{
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_01");	//Ich muss weiter!
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_02");	//Fremder kommen wieder!
	}
	else
	{
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Ich danke dir. Ich werde mich jetzt wieder auf den Weg machen.
		AI_Output(self,hero,"Info_FreemineOrc_EXIT_17_04");	//Fremder haben gute Reise!
	};
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_INTRO(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_INTRO_Condition;
	information = Info_FreemineOrc_INTRO_Info;
	important = 1;
	permanent = 0;
};


func int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output(self,hero,"Info_FreemineOrc_INTRO_17_01");	//Tarrok brauchen Hilfe! Tarrok verletzt!
};


instance Info_FreemineOrc_WASPASSIERT(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASPASSIERT_Condition;
	information = Info_FreemineOrc_WASPASSIERT_Info;
	important = 0;
	permanent = 0;
	description = "Was ist geschehen?";
};


func int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASPASSIERT_15_01");	//Was ist geschehen?
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_02");	//Tarrok hier gefangen von blauen Soldaten. Pl�tzlich �berall rote Soldaten.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_03");	//Rote Soldaten t�ten alles.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_04");	//Tarrok hierhin geflohen. Rote Soldaten nicht gehen hierhin. Rote Soldaten f�rchten GACH LUG.
	AI_Output(self,hero,"Info_FreemineOrc_WASPASSIERT_17_05");	//Bitte helfen, Tarrok verletzt.
};


instance Info_FreemineOrc_WASTUN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_WASTUN_Condition;
	information = Info_FreemineOrc_WASTUN_Info;
	important = 0;
	permanent = 0;
	description = "Was kann ich f�r dich tun?";
};


func int Info_FreemineOrc_WASTUN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_WASTUN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_01");	//Was kann ich f�r dich tun?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_02");	//Tarrok brauchen starke Medizin. Tarrok sonst sterben.
	AI_Output(hero,self,"Info_FreemineOrc_WASTUN_15_03");	//Was f�r Medizin?
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_04");	//GACH LUG mich vergiftet. Tarrok brauchen Medizin!
	AI_Output(self,hero,"Info_FreemineOrc_WASTUN_17_05");	//Tarrok haben Medizin, aber Tarrok verlieren. Tarrok nicht finden!
};


instance Info_FreemineOrc_OFFER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_OFFER_Condition;
	information = Info_FreemineOrc_OFFER_Info;
	important = 0;
	permanent = 0;
	description = "Ich werde die Medizin wiederfinden!";
};


func int Info_FreemineOrc_OFFER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_OFFER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_OFFER_15_01");	//Ich werde die Medizin wiederfinden!
	AI_Output(self,hero,"Info_FreemineOrc_OFFER_17_02");	//Tarrok sehr schwach. Fremder beeilen, sonst Tarrok sterben!
	AI_StopProcessInfos(self);
	B_Story_FoundOrcSlave();
};


instance Info_FreemineOrc_CRAWLER(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_CRAWLER_Condition;
	information = Info_FreemineOrc_CRAWLER_Info;
	important = 0;
	permanent = 0;
	description = "Was bedeutet GACH LUG?";
};


func int Info_FreemineOrc_CRAWLER_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_01");	//Was bedeutet GACH LUG?
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_02");	//Seien gro�e Tiere auf vielen Beinen.
	AI_Output(self,hero,"Info_FreemineOrc_CRAWLER_17_03");	//GACH LUG gef�hrlich! Orks und Menschen fressen!
	AI_Output(hero,self,"Info_FreemineOrc_CRAWLER_15_04");	//Du meinst wohl die Minecrawler hier unten!
};


instance Info_FreemineOrc_TONGUE(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TONGUE_Condition;
	information = Info_FreemineOrc_TONGUE_Info;
	important = 0;
	permanent = 0;
	description = "Du sprichst unsere Sprache?";
};


func int Info_FreemineOrc_TONGUE_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TONGUE_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TONGUE_15_01");	//Du sprichst unsere Sprache?
	AI_Output(self,hero,"Info_FreemineOrc_TONGUE_17_02");	//Tarrok schon lange Sklave von Menschen. Tarrok gut zuh�ren!
};


instance Info_FreemineOrc_SEARCHPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SEARCHPOTION_Condition;
	information = Info_FreemineOrc_SEARCHPOTION_Info;
	important = 0;
	permanent = 1;
	description = "Ich kann die Medizin nicht finden!";
};


func int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER) && !Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION) && !Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SEARCHPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SEARCHPOTION_15_01");	//Ich kann die Medizin nicht finden!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_02");	//Fremder suchen weiter! Medizin hier unten sein!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_03");	//Torrok fliehen vor GACH LUG! Tarrok sich bei Flucht verstecken!
	AI_Output(self,hero,"Info_FreemineOrc_SEARCHPOTION_17_04");	//Fremder auch suchen in Nischen!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_SUCHEULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SUCHEULUMULU_Condition;
	information = Info_FreemineOrc_SUCHEULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Bist du ein Freund von Ur-Shak, dem Schamanen?";
};


func int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_01");	//Bist du ein Freund von Ur-Shak, dem Schamanen?
	AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_02");	//Ur-Shak waren Sklave wie Tarrok. Ur-Shak gelaufen weg! Seien viele Winter her!
	AI_Output(hero,self,"Info_FreemineOrc_SUCHEULUMULU_15_03");	//Dein Freund sagte, du k�nntest mir ein Ulu-Mulu machen!
	if(FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_04");	//Du mir geholfen, also ich dir helfen!
	}
	else
	{
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_05");	//Tarrok sehr schwach. Tarrok ohne Medizin sterben.
		AI_Output(self,hero,"Info_FreemineOrc_SUCHEULUMULU_17_06");	//Fremder bringen Medizin, dann Tarrok helfen!
	};
};


instance Info_FreemineOrc_GIVEPOTION(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_GIVEPOTION_Condition;
	information = Info_FreemineOrc_GIVEPOTION_Info;
	important = 0;
	permanent = 0;
	description = "Hier, ich habe deine Medizin gefunden!";
};


func int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN) && Npc_HasItems(hero,OrcMedicine))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_01");	//Hier, ich habe deine Medizin gefunden!
	B_GiveInvItems(hero,self,OrcMedicine,1);
	EquipItem(self,OrcMedicine);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	AI_UseItemToState(self,OrcMedicine,1);
	AI_UseItemToState(self,OrcMedicine,-1);
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_02");	//Fremder nicht b�se wie andere Menschen! Fremder gut!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_03");	//Tarrok schulden Dank!
	AI_Output(hero,self,"Info_FreemineOrc_GIVEPOTION_15_04");	//Kannst du mir jetzt ein Ulu-Mulu geben?
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_05");	//Fremder helfen Tarrok, also Tarrok auch helfen Fremder!
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_06");	//Fremder brauchen KROTAHK, KHAZ-TAK, DWACHKARR und ORTH-ANTAK.
	AI_Output(self,hero,"Info_FreemineOrc_GIVEPOTION_17_07");	//Fremder bringen, dann Tarrok machen Ulu-Mulu!
	if(!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER))
	{
		B_Story_FoundOrcSlave();
	};
	B_Story_CuredOrc();
};


instance Info_FreemineOrc_FIREWARAN(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN_Condition;
	information = Info_FreemineOrc_FIREWARAN_Info;
	important = 0;
	permanent = 0;
	description = "Was ist ein KROTAHK?";
};


func int Info_FreemineOrc_FIREWARAN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN_15_01");	//Was ist ein KROTAHK?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN_17_02");	//Seien Flammenzunge! Seien Zunge von Feuerechse! 
};


instance Info_FreemineOrc_FIREWARAN2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_FIREWARAN2_Condition;
	information = Info_FreemineOrc_FIREWARAN2_Info;
	important = 0;
	permanent = 0;
	description = "Wo finde ich eine Feuerechse?";
};


func int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN) && !Npc_HasItems(hero,ItAt_Waran_01) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_FIREWARAN2_15_01");	//Wo finde ich eine Feuerechse?
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_02");	//Feuerechsen in Heimat leben. Heimat von Tarrok. Fremder suchen m�ssen! 
	AI_Output(self,hero,"Info_FreemineOrc_FIREWARAN2_17_03");	//Auch k�nnen finden Feuerechse auf Sand bei Meer.
	B_LogEntry(CH4_UluMulu,"Tarrok ben�tigt f�r das Ulu-Mulu die Zunge eines Feuerwarans. Sie leben vor allem im Orkgebiet und an sandigen Str�nden. Gab es da nicht dieses Schiffswrack, bei dem es vor Waranen nur so wimmelte?");
};


instance Info_FreemineOrc_SHADOWBEAST(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST_Condition;
	information = Info_FreemineOrc_SHADOWBEAST_Info;
	important = 0;
	permanent = 0;
	description = "Was bedeutet KHAZ-TAK?";
};


func int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01");	//Was bedeutet KHAZ-TAK?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02");	//Seien Horn von Schattenl�ufer. Horn spitz wie Dolch und hart wie Stein. 
};


instance Info_FreemineOrc_SHADOWBEAST2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SHADOWBEAST2_Condition;
	information = Info_FreemineOrc_SHADOWBEAST2_Info;
	important = 0;
	permanent = 0;
	description = "Wo findet man Schattenl�ufer?";
};


func int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST) && !Npc_HasItems(hero,ItAt_Shadow_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01");	//Wo findet man Schattenl�ufer?
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02");	//Leben in Wald oder in H�hle. Nicht m�gen Licht.
	AI_Output(self,hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03");	//Seien sehr gef�hrlich. Fremder aufpassen!
	B_LogEntry(CH4_UluMulu,"Tarrok ben�tigt f�r das Ulu-Mulu das Horns eines Schattenl�ufers. Sie leben vor allem in dunklen W�ldern und H�hlen. Soviel ich wei�, liegt der gr��te Wald in der Kolonie zwischen Altem Lager und Sumpflager.");
};


instance Info_FreemineOrc_SWAMPSHARK(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK_Condition;
	information = Info_FreemineOrc_SWAMPSHARK_Info;
	important = 0;
	permanent = 0;
	description = "DWACHKARR? Was ist das denn?";
};


func int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK_15_01");	//DWACHKARR? Was ist das denn?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK_17_02");	//Seien Z�hne von Sumpfhai. Wenn Z�hne bei�en Opfer, dann nie wieder loslassen.
};


instance Info_FreemineOrc_SWAMPSHARK2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_SWAMPSHARK2_Condition;
	information = Info_FreemineOrc_SWAMPSHARK2_Info;
	important = 0;
	permanent = 0;
	description = "Wo finde ich Sumpfhaie?";
};


func int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK) && !Npc_HasItems(hero,ItAt_Swampshark_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_SWAMPSHARK2_15_01");	//Wo finde ich Sumpfhaie?
	AI_Output(self,hero,"Info_FreemineOrc_SWAMPSHARK2_17_02");	//Viele Sumpfhaie bei Lager von Menschen. Lager in Sumpf nat�rlich!
	B_LogEntry(CH4_UluMulu,"Tarrok ben�tigt f�r das Ulu-Mulu Z�hne eines Sumpfhais. Im Sumpf hinter dem Lager der Bruderschaft gibt es massenhaft Unget�me dieser Art.");
};


instance Info_FreemineOrc_TROLL(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL_Condition;
	information = Info_FreemineOrc_TROLL_Info;
	important = 0;
	permanent = 0;
	description = "Was ist ein ORTH-ANTAK?";
};


func int Info_FreemineOrc_TROLL_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL_15_01");	//Was ist ein ORTH-ANTAK?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL_17_02");	//Hauer von gro�es Troll! Machen gro�es L�cher in Beute!
};


instance Info_FreemineOrc_TROLL2(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_TROLL2_Condition;
	information = Info_FreemineOrc_TROLL2_Info;
	important = 0;
	permanent = 0;
	description = "Wo finde ich einen Troll?";
};


func int Info_FreemineOrc_TROLL2_Condition()
{
	if(Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL) && !Npc_HasItems(hero,ItAt_Troll_02) && !Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_TROLL2_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_TROLL2_15_01");	//Wo finde ich einen Troll?
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_02");	//Troll leben in Bergen! Troll lieben viel Platz!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_03");	//Fremder gehen suchen in Nordberge! Aber passen auf auf Faust von Troll!
	AI_Output(self,hero,"Info_FreemineOrc_TROLL2_17_04");	//Faust treffen, dann Fremder fallen von Berg runter!
	B_LogEntry(CH4_UluMulu,"Tarrok ben�tigt f�r das Ulu-Mulu die Hauer eines Trolls. Solche Monstren leben in den n�rdlichen Bergen der Kolonie. Ich sollte die Schluchten dort absuchen.");
};


instance Info_FreemineOrc_LOOKINGULUMULU(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information = Info_FreemineOrc_LOOKINGULUMULU_Info;
	important = 0;
	permanent = 1;
	description = "Ich habe noch nicht alle vier Teile beisammen.";
};


func int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if(!Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02) && Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2) && Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2) && Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_LOOKINGULUMULU_15_01");	//Ich habe noch nicht alle vier Teile beisammen.
	AI_Output(self,hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02");	//Fremder suchen weiter. Tarrok hier warten!
	AI_StopProcessInfos(self);
};


instance Info_FreemineOrc_EveryUlumulu(C_Info)
{
	npc = FreemineOrc;
	condition = Info_FreemineOrc_EVERYULUMULU_Condition;
	information = Info_FreemineOrc_EVERYULUMULU_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe alle Teile f�r das Ulu-Mulu zusammen!";
};


func int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if((FreemineOrc_LookingUlumulu == LOG_RUNNING) && Npc_HasItems(hero,ItAt_Waran_01) && Npc_HasItems(hero,ItAt_Shadow_02) && Npc_HasItems(hero,ItAt_Swampshark_02) && Npc_HasItems(hero,ItAt_Troll_02))
	{
		return TRUE;
	};
};

func void Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output(hero,self,"Info_FreemineOrc_EVERYULUMULU_15_01");	//Ich habe alle Teile f�r das Ulu-Mulu zusammen!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_02");	//Fremder seien starker Krieger! Geben Teile! Tarrok machen ULU-MULU!
	AI_Output(self,hero,"Info_FreemineOrc_EVERYULUMULU_17_03");	//Hier! Fremder tragen ULU-MULU mit Stolz! Tarrok jetzt schlafen!
	CreateInvItems(hero,ItAt_Waran_01,3);
	B_GiveInvItems(hero,self,ItAt_Waran_01,4);
	Npc_RemoveInvItem(hero,ItAt_Shadow_02);
	Npc_RemoveInvItem(hero,ItAt_Swampshark_02);
	Npc_RemoveInvItem(hero,ItAt_Troll_02);
	Npc_RemoveInvItems(self,ItAt_Waran_01,4);
	B_Story_GotUluMulu();
	AI_StopProcessInfos(self);
};

