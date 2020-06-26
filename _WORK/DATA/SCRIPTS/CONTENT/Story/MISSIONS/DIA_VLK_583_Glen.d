
instance VLK_583_Glen_Exit(C_Info)
{
	npc = VLK_583_Glen;
	nr = 999;
	condition = VLK_583_Glen_Exit_Condition;
	information = VLK_583_Glen_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int VLK_583_Glen_Exit_Condition()
{
	return 1;
};

func void VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance VLK_583_Glen_INFO(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_INFO_Condition;
	information = VLK_583_Glen_INFO_Info;
	important = 0;
	permanent = 1;
	description = "Worauf sollte ich in der Mine achten?";
};


func int VLK_583_Glen_INFO_Condition()
{
	return 1;
};

func void VLK_583_Glen_INFO_Info()
{
	AI_Output(other,self,"VLK_583_Glen_INFO_Info_15_01");	//Worauf sollte ich in der Mine achten?
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_02");	//Auf die Minecrawler.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_03");	//Je weiter du nach unten kommst, desto näher bist den Viechern. Die Mistdinger kommen direkt aus Beliars Reich!
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_04");	//Man kann sie schaben und kratzen hören. Sie lauern in der Dunkelheit und warten nur auf dich. Ich habe gesehen, wie sie getötet haben.
	AI_Output(self,other,"VLK_583_Glen_INFO_Info_02_05");	//Gnadenlos und schnell. Wenn du am Leben hängst, solltest du dich nicht hier unten aufhalten. Geh lieber, bevor dir noch was passiert.
};


instance VLK_583_Glen_LOCKPICK(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_LOCKPICK_Condition;
	information = VLK_583_Glen_LOCKPICK_Info;
	important = 0;
	permanent = 0;
	description = "Bei dir gibts Dietriche?";
};


func int VLK_583_Glen_LOCKPICK_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GLEN))
	{
		return 1;
	};
};

func void VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output(other,self,"VLK_583_Glen_LOCKPICK_15_01");	//Ich hab' gehört, bei dir kann ich Dietriche kaufen.
	AI_Output(self,other,"VLK_583_Glen_LOCKPICK_02_02");	//Nun, wenn du schlau genug warst, das herauszufinden, dann kannst du welche haben. 10 Erz das Stück.
};


var int glen_trade;

instance VLK_583_Glen_BUY(C_Info)
{
	npc = VLK_583_Glen;
	condition = VLK_583_Glen_BUY_Condition;
	information = VLK_583_Glen_BUY_Info;
	important = 0;
	permanent = 1;
	description = "(Dietriche kaufen)";
	trade = 1;
};


func int VLK_583_Glen_BUY_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_583_Glen_LOCKPICK))
	{
		return 1;
	};
};

func void VLK_583_Glen_BUY_Info()
{
	AI_Output(other,self,"VLK_583_Glen_BUY_Info_15_01");	//Ich will Dietriche kaufen.
	if(GLEN_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Glen, einer der Buddler der Alten Mine handelt mit Dietrichen.");
		GLEN_TRADE = TRUE;
	};
};


instance VLK_583_GLEN_GARRET(C_Info)
{
	npc = VLK_583_Glen;
	condition = vlk_583_glen_garret_condition;
	information = vlk_583_glen_garret_info;
	important = 0;
	permanent = 0;
	description = "Sagt dir der Name Garret was?";
};


func int vlk_583_glen_garret_condition()
{
	if(LOST_DIGGER == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_583_glen_garret_info()
{
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_01");	//Sagt dir der Name Garret was?
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_02");	//Garret? Klar, war einer der Buddler hier. War schon eine Ewigkeit in der Barriere.
	AI_Output(other,self,"VLK_583_Glen_GARRET_Info_15_03");	//Ich bin auf der Suche nach ihm. Ian sagt, er ist verschwunden.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_04");	//Garret ist verschwunden? Nun, gesehen hab' ich ihn nicht...
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_05");	//Aber ich kann dir versichern, dass er die Mine nicht verlassen hat. Soviel ist sicher.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_06");	//Ich seh' jeden der die Mine betritt und verlässt. Garret gehörte nicht dazu.
	AI_Output(self,other,"VLK_583_Glen_GARRET_Info_15_07");	//Er muss hier also noch irgendwo stecken.
	B_LogEntry(CH1_LOSTDIGGER,"Glen ist sich sicher, dass Garret noch irgendwo in der Mine steckt. Verlassen hat er diese nämlich nie.");
};

