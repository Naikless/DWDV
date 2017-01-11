
instance STT_301_IAN_Exit(C_Info)
{
	npc = STT_301_Ian;
	nr = 999;
	condition = STT_301_IAN_Exit_Condition;
	information = STT_301_IAN_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_301_IAN_Exit_Condition()
{
	return 1;
};

func void STT_301_IAN_Exit_Info()
{
	if(Ian_gearwheel == LOG_SUCCESS)
	{
		AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//Ich schau' mich mal um.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"STT_301_IAN_Exit_Info_15_01");	//Ich schau' mich mal um.
		AI_Output(self,other,"STT_301_IAN_Exit_Info_13_02");	//Mach keinen Ärger.
		AI_StopProcessInfos(self);
	};
};


instance STT_301_IAN_HI(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_HI_Condition;
	information = STT_301_IAN_HI_Info;
	important = 0;
	permanent = 0;
	description = "Bist du Ian, der Chef der Mine?";
};


func int STT_301_IAN_HI_Condition()
{
	if(!Npc_KnowsInfo(hero,stt_301_ian_nest))
	{
		return TRUE;
	};
};

func void STT_301_IAN_HI_Info()
{
	AI_Output(other,self,"STT_301_IAN_HI_Info_15_01");	//Bist du Ian, der Chef der Mine?
	AI_Output(self,other,"STT_301_IAN_HI_Info_13_02");	//Ja, ich bin Ian. Und das hier ist meine Mine. Also fass nichts an und mach nichts kaputt.
};


instance STT_301_IAN_GOMEZ(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOMEZ_Condition;
	information = STT_301_IAN_GOMEZ_Info;
	important = 0;
	permanent = 0;
	description = "Ist das nicht Gomez' Mine?";
};


func int STT_301_IAN_GOMEZ_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GOMEZ_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOMEZ_Info_15_01");	//Ist das nicht Gomez' Mine?
	AI_Output(self,other,"STT_301_IAN_GOMEZ_Info_13_02");	//Ja, natürlich ist das die Mine des Alten Lagers. Aber hier drin gibt's nur einen Chef - und das bin ich.
};


instance STT_301_IAN_ORE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_ORE_Condition;
	information = STT_301_IAN_ORE_Info;
	important = 0;
	permanent = 0;
	description = "Kannst du mir ein paar Takte zur Erzförderung erzählen?";
};


func int STT_301_IAN_ORE_Condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_gomez))
	{
		return TRUE;
	};
};

func void STT_301_IAN_ORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_ORE_Info_15_01");	//Kannst du mir ein paar Takte zur Erzförderung erzählen?
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_02");	//Wir fördern hier rund um die Uhr Erz. Im Monat sind das über 200 Säcke Erz, die gelagert werden und noch mal 20 Säcke, die eingeschmolzen werden. 
	AI_Output(self,other,"STT_301_IAN_ORE_Info_13_03");	//Mit dem Erz, das wir dem König liefern, können hunderte von Klingen hergestellt werden.
};


instance STT_301_IAN_MORE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MORE_Condition;
	information = STT_301_IAN_MORE_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe gehört, das Erz ist magisch. Erzähl mir davon.";
};


func int STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_ore);
};

func void STT_301_IAN_MORE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MORE_Info_15_01");	//Ich habe gehört, das Erz ist magisch. Erzähl mir davon.
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_02");	//Das magische Erz besitzt besondere Qualitäten. Es macht die Waffen unzerbrechlich und die Klingen sind schärfer als gewöhnliche. 
	AI_Output(self,other,"STT_301_IAN_MORE_Info_13_03");	//Eine Armee, die mit solchen Waffen ausgestattet ist, hat einen entscheidenden Vorteil in jeder Schlacht.
};


instance STT_301_IAN_MAGIC(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MAGIC_Condition;
	information = STT_301_IAN_MAGIC_Info;
	important = 0;
	permanent = 0;
	description = "Erzähl mir mehr vom Erz.";
};


func int STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo(hero,stt_301_ian_more);
};

func void STT_301_IAN_MAGIC_Info()
{
	AI_Output(other,self,"STT_301_IAN_MAGIC_Info_15_01");	//Erzähl mir mehr vom Erz.
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_02");	//Leider geht die magische Wirkung des Erzes beim Schmelzen verloren. In den Hochöfen von Nordmar, da kennen sie die richtige Schmelztechnik. 
	AI_Output(self,other,"STT_301_IAN_MAGIC_Info_13_03");	//Aber selbst ohne die magische Wirkung sind Waffen aus diesem Erz extrem widerstandsfähig und richten mehr Schaden an als gewöhnliche Waffen.  
};


instance STT_301_IAN_MINE(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_MINE_Condition;
	information = STT_301_IAN_MINE_Info;
	important = 0;
	permanent = 0;
	description = "Erzähl mir von der Mine.";
};


func int STT_301_IAN_MINE_Condition()
{
	if((Kapitel < 3) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void STT_301_IAN_MINE_Info()
{
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_01");	//Erzähl mir von der Mine.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_02");	//Wenn du dich hier weiter umsehen willst, sei vorsichtig. In den Höhlen sind Minecrawler. Am besten du bleibst in diesem Hauptschacht.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_03");	//Und lass die Templer in Ruhe. Sie lungern zwar die meiste Zeit nur rum, aber wenn die Crawler kommen,gibt es keinen besseren Kämpfer an deiner Seite.  
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_04");	//Ich werd's mir merken.
	AI_Output(self,other,"STT_301_IAN_MINE_Info_13_05");	//Ich hab' noch zu tun. Und halte meine Jungs nicht von der Arbeit ab.
	AI_Output(other,self,"STT_301_IAN_MINE_Info_15_06");	//Ich sehe mich nur mal um.   
};


instance STT_301_IAN_WANTLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_WANTLIST_Condition;
	information = STT_301_IAN_WANTLIST_Info;
	important = 0;
	permanent = 0;
	description = "Ich wollte die Liste fürs Lager abholen.";
};


func int STT_301_IAN_WANTLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && !Npc_KnowsInfo(hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};
};

func void STT_301_IAN_WANTLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_WANTLIST_Info_15_01");	//Ich wollte die Liste fürs Lager abholen.
	AI_Output(self,other,"STT_301_IAN_WANTLIST_Info_13_02");	//Da könnte ja jeder kommen. Verpiss dich.
};


instance STT_301_IAN_GETLIST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GETLIST_Condition;
	information = STT_301_IAN_GETLIST_Info;
	important = 0;
	permanent = 0;
	description = "Diego schickt mich. Ich soll die Liste abholen.";
};


func int STT_301_IAN_GETLIST_Condition()
{
	if((Diego_BringList == LOG_RUNNING) && Npc_KnowsInfo(hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};
};

func void STT_301_IAN_GETLIST_Info()
{
	AI_Output(other,self,"STT_301_IAN_GETLIST_Info_15_01");	//Diego schickt mich. Ich soll die Liste abholen.
	AI_Output(self,other,"STT_301_IAN_GETLIST_Info_13_02");	//Alle klar, hier ist die Liste. Sie sollen sich mit dem Liefern beeilen.
	B_LogEntry(CH1_BringList,"Ian hat mir die Liste ohne Probleme übergeben.");
	B_GiveInvItems(self,hero,TheList,1);
};


instance STT_301_IAN_NEST(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NEST_Condition;
	information = STT_301_IAN_NEST_Info;
	important = 0;
	permanent = 0;
	description = "Es muss hier irgendwo ein Nest der Minecrawler geben.";
};


func int STT_301_IAN_NEST_Condition()
{
	if((CorKalom_BringMCQBalls == LOG_RUNNING) && Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return 1;
	};
};

func void STT_301_IAN_NEST_Info()
{
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_01");	//Es muss hier irgendwo ein Nest der Minecrawler geben.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_02");	//Hier gibt's wahrscheinlich Dutzende von Nestern.
	AI_Output(other,self,"STT_301_IAN_NEST_Info_15_03");	//Hör zu, ich muss zu diesem Nest...
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_04");	//Ich habe jetzt keine Zeit, mich darum zu kümmern. Unser Stampfer ist kaputt. Vor ein paar Stunden ist das Zahnrad gebrochen. 
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_05");	//Ich hab' noch keine Idee, wo ich ein neues herbekommen kann.
	AI_Output(self,other,"STT_301_IAN_NEST_Info_13_06");	//Besorg mir doch einfach eins, dann kümmere ich mich um dein Problem.
	B_LogEntry(CH2_MCEggs,"Ian der Minenboss will mir nicht helfen das Nest zufinden Ich soll ihm erst ein neues Zahnrad für ihren kaputten Erzstampfer besorgen. Er erwähnte einen verlassenen Nebenstollen, in dem sich noch ein alter Stampfer befinden soll.");
	Ian_gearwheel = LOG_RUNNING;
};


instance STT_301_IAN_GEAR_RUN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_RUN_Condition;
	information = STT_301_IAN_GEAR_RUN_Info;
	important = 0;
	permanent = 0;
	description = "Ein Zahnrad? Wo soll ich das herkriegen?";
};


func int STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt(PD_MISSION,"Ian_gearwheel: ",Ian_gearwheel);
	if((Ian_gearwheel == LOG_RUNNING) && !Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GEAR_RUN_Info_15_01");	//Ein Zahnrad? Wo soll ich das herkriegen?
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_02");	//Keine Ahnung. Ich bin so ratlos wie du!
	AI_Output(self,other,"STT_301_IAN_GEAR_RUN_Info_13_03");	//Aber es gibt in einem Nebenschacht noch einen alten, kaputten Stampfer. Vielleicht hast du ja dort Glück.
};


instance STT_301_IAN_GEAR_SUC(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GEAR_SUC_Condition;
	information = STT_301_IAN_GEAR_SUC_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe das Zahnrad.";
};


func int STT_301_IAN_GEAR_SUC_Condition()
{
	if(Npc_HasItems(hero,ItMi_Stuff_Gearwheel_01) && (Ian_gearwheel == LOG_RUNNING))
	{
		return 1;
	};
};

func void STT_301_IAN_GEAR_SUC_Info()
{
	var C_Npc Sklave;
	B_GiveInvItems(hero,self,ItMi_Stuff_Gearwheel_01,1);
	Npc_RemoveInvItem(self,ItMi_Stuff_Gearwheel_01);
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP(XP_BringGearWheel);
	Sklave = Hlp_GetNpc(Orc_2001_Sklave);
	Npc_ExchangeRoutine(Sklave,"Stomper");
	AI_Output(other,self,"STT_301_IAN_GEAR_SUC_Info_15_01");	//Ich habe das Zahnrad.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_02");	//Hey, gut gemacht. Ich denke, das wird klappen. Nun zu dir, du suchst das Nest der Minecrawler...hm...
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_03");	//Geh mal zu Asghan, er soll das Tor öffnen, damit du die dunklen Schächte durchsuchen kannst.
	AI_Output(self,other,"STT_301_IAN_GEAR_SUC_Info_13_04");	//Sag ihm einfach, "Alles wird gut". Dann wird er wissen, das ich die Erlaubnis gegeben habe.
	B_LogEntry(CH2_MCEggs,"Ich habe Ian das Zahnrad des verlassenen Erzstampfers gebracht. Ian sagte mir, wenn ich Asgahn die Worte ALLES WIRD GUT sagen, dann wird er das Tor zu den dunklen Schächten öffnen.");
};


instance STT_301_IAN_GOTOASGHAN(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_GOTOASGHAN_Condition;
	information = STT_301_IAN_GOTOASGHAN_Info;
	important = 0;
	permanent = 0;
	description = "Ich suche immer noch das Nest der Crawler.";
};


func int STT_301_IAN_GOTOASGHAN_Condition()
{
	if((Ian_gearwheel == LOG_SUCCESS) && !Npc_KnowsInfo(hero,Grd_263_Asghan_NEST))
	{
		return 1;
	};
};

func void STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output(other,self,"STT_301_IAN_GOTOASGHAN_Info_15_01");	//Ich suche immer noch das Nest der Crawler.
	AI_Output(self,other,"STT_301_IAN_GOTOASGHAN_Info_13_02");	//Ich sagte doch, geh zu Asghan. Er ist der Anführer der Gardisten. Du findest in irgendwo auf der untersten Ebene.
	B_LogEntry(CH2_MCEggs,"Wenn ich das Minecrawlernest finden will, sollte ich mit Asghan reden.");
};


instance STT_301_IAN_AFTERALL(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_AFTERALL_Condition;
	information = STT_301_IAN_AFTERALL_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe das Nest gefunden!";
};


func int STT_301_IAN_AFTERALL_Condition()
{
	if(Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};

func void STT_301_IAN_AFTERALL_Info()
{
	AI_Output(other,self,"STT_301_IAN_AFTERALL_Info_15_01");	//Ich habe das Nest gefunden!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_02");	//Dann kehrt jetzt hier endlich wieder Ruhe ein. Hahaha!
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_03");	//Nichts für ungut. Gute Arbeit, Kleiner! 
	AI_Output(self,other,"STT_301_IAN_AFTERALL_Info_13_04");	//Hier, nimm diese Kiste Bier für deine Mühen.
	CreateInvItems(self,ItFo_OM_Beer_01,6);
	B_GiveInvItems(self,hero,ItFo_OM_Beer_01,6);
};


instance STT_301_IAN_NOTENOUGH(C_Info)
{
	npc = STT_301_Ian;
	condition = STT_301_IAN_NOTENOUGH_Condition;
	information = STT_301_IAN_NOTENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe das Nest gefunden! Und Eier von der Minecrawler-Königin!";
};


func int STT_301_IAN_NOTENOUGH_Condition()
{
	if((Npc_HasItems(hero,ItAt_Crawlerqueen) > 1) && (Npc_HasItems(hero,ItAt_Crawlerqueen) < 3))
	{
		return TRUE;
	};
};

func void STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output(other,self,"STT_301_IAN_NOTENOUGH_Info_15_01");	//Ich habe das Nest gefunden! Und Eier von der Minecrawler-Königin!
	AI_Output(self,other,"STT_301_IAN_NOTENOUGH_Info_13_02");	//Wie? Nur so wenig Eier? Na, was soll's. Du hast bewiesen, dass du kämpfen kannst.
};


instance STT_301_IAN_LOSTDIGGER(C_Info)
{
	npc = STT_301_Ian;
	condition = stt_301_ian_lostdigger_condition;
	information = stt_301_ian_lostdigger_info;
	important = 1;
	permanent = 0;
};


func int stt_301_ian_lostdigger_condition()
{
	if(Npc_KnowsInfo(hero,stt_301_ian_hi))
	{
		return TRUE;
	};
};

func void stt_301_ian_lostdigger_info()
{
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_01");	//Wart' mal Junge. Wenn du dich hier nützlich machen willst, hätt' ich was zu tun für dich.
	AI_Output(other,self,"STT_301_IAN_LOSTDIGGER_Info_13_02");	//Und was?
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_02");	//Vor einiger Zeit ist einer der Buddler verschwunden. Der Typ hieß Garret.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_03");	//Er arbeitete 'ne Zeit lang im Hauptschacht unten beim Schmelzer. Als wir vor einiger Zeit von einigen Minecrawlern angegriffen wurden, verschwand er.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_04");	//Wenn er irgendein Buddler wäre, wär's mir egal, dass er weg ist. Leider hat der Kerl aber 'ne Menge Erfahrung gehabt und deswegen brauchen wir ihn.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_05");	//Hör' dich mal um und sieh ob du ihn findest. Würde mir sogar 'ne Belohnung wert sein.
	AI_Output(self,other,"STT_301_IAN_LOSTDIGGER_Info_15_06");	//Fang am besten bei den Buddlern an, die wissen am besten bescheid.
	LOST_DIGGER = LOG_RUNNING;
	Log_CreateTopic(CH1_LOSTDIGGER,LOG_MISSION);
	Log_SetTopicStatus(CH1_LOSTDIGGER,LOG_RUNNING);
	B_LogEntry(CH1_LOSTDIGGER,"Ian, der Chef der alten Mine, erzählte mir von einem Buddler namens Garret. Er sei vor einiger Zeit verschwunden, nachdem der Hauptschacht der alten Mine von Minecrawlern angegriffen wurde. Er weiß nicht wo Garret jetzt stecken könnte, aber wenn jemand was weiß, dann sind es die Buddler die in der Mine arbeiten.");
};


instance STT_301_IAN_FOUNDDIGGER(C_Info)
{
	npc = STT_301_Ian;
	condition = stt_301_ian_founddigger_condition;
	information = stt_301_ian_founddigger_info;
	important = 0;
	permanent = 0;
	description = "Ich hab' Garret gefunden.";
};


func int stt_301_ian_founddigger_condition()
{
	if((LOST_DIGGER == LOG_RUNNING) && Npc_HasItems(hero,garrets_pickaxe))
	{
		return TRUE;
	};
};

func void stt_301_ian_founddigger_info()
{
	var int zufallsbelohnung;
	AI_Output(other,self,"STT_301_IAN_FOUNDDIGGER_Info_15_01");	//Ich hab' Garret gefunden.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_13_02");	//Und wo ist er?
	AI_Output(other,self,"STT_301_IAN_FOUNDDIGGER_Info_15_02");	//Er ist tot. Ich hab' ihn in einem der Schächte gefunden.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_15_03");	//Was? Hast du Beweise dafür?
	AI_Output(other,self,"STT_301_IAN_FOUNDDIGGER_Info_15_04");	//Hier ist seine Spitzhacke.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_15_05");	//Verdammt. DAS ist ein Problem. Jetzt muss ich schauen, dass die Jungs aus dem alten Lager mir einen weiteren Buddler schicken.
	AI_Output(self,other,"STT_301_IAN_FOUNDDIGGER_Info_15_06");	//Naja, trotzdem danke für deine Hilfe. Hier, dass ist etwas für dich.
	LOST_DIGGER = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_LOSTDIGGER,LOG_SUCCESS);
	B_LogEntry(CH1_LOSTDIGGER,"Ian war nicht gerade erfreut, dass ich Garret tot aufgefunden habe. Er erzählte mir, dass es ein Problem darstellt und ihm jetzt ein Buddler fehlt. Trotzdem bekam ich eine Belohnung dafür, dass ich ihm geholfen hatte.");
	B_GiveXP(XP_LOSTDIGGER);
	zufallsbelohnung = Hlp_Random(100);
	if(zufallsbelohnung >= 75)
	{
		CreateInvItems(self,ItAt_Wolf_02,2);
		B_GiveInvItems(self,other,ItAt_Wolf_02,2);
	}
	else if(zufallsbelohnung >= 60)
	{
		CreateInvItems(self,ItMw_1H_LightGuardsSword_03,1);
		B_GiveInvItems(self,other,ItMw_1H_LightGuardsSword_03,1);
	}
	else if(zufallsbelohnung >= 50)
	{
		CreateInvItem(self,ItMi_Stuff_OldCoin_01);
		B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,8);
	}
	else if(zufallsbelohnung >= 40)
	{
		CreateInvItems(self,ItFoBeer,6);
		B_GiveInvItems(self,other,ItFoBeer,6);
	}
	else if(zufallsbelohnung >= 30)
	{
		CreateInvItems(self,ItFoLoaf,5);
		B_GiveInvItems(self,other,ItFoLoaf,5);
	}
	else if(zufallsbelohnung >= 20)
	{
		CreateInvItems(self,ItArScrollHeal,1);
		B_GiveInvItems(self,other,ItArScrollHeal,1);
	}
	else if(zufallsbelohnung >= 10)
	{
		CreateInvItems(self,ItArScrollLight,1);
		B_GiveInvItems(self,other,ItArScrollLight,1);
	};
	B_GiveInvItems(hero,self,garrets_pickaxe,1);
	Npc_RemoveInvItem(self,garrets_pickaxe);
};

