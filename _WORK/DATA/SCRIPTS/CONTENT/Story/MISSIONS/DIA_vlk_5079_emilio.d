
instance VLK_5079_ANNOUNCER_EXIT(C_Info)
{
	npc = vlk_5079_emilio;
	nr = 999;
	condition = vlk_5079_emilio_exit_condition;
	information = vlk_5079_emilio_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int vlk_5079_emilio_exit_condition()
{
	return 1;
};

func void vlk_5079_emilio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance VLK_5079_EMILIO_WELCOME(C_Info)
{
	npc = vlk_5079_emilio;
	condition = vlk_5079_emilio_welcome_condition;
	information = vlk_5079_emilio_welcome_info;
	important = 0;
	permanent = 0;
	description = "Hi! Wer bist du?";
};


func int vlk_5079_emilio_welcome_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void vlk_5079_emilio_welcome_info()
{
	AI_Output(other,self,"Info_Emilio_Welcome_11_01");	//Hi! Wer bist du?
	AI_Output(self,other,"Info_Emilio_Welcome_11_02");	//Ich bin Emilio. Bin mit der letzten Fuhre der Außenwelt, die vor einigen Tagen kam, hier angekommen.
	AI_Output(self,other,"Info_Emilio_Welcome_11_03");	//Seitdem sitz ich hier rum und werde wohl bald in der Mine arbeiten gehen.
	AI_Output(self,other,"Info_Emilio_Welcome_11_04");	//Bei den ganzen Gardisten hier, bleibt mir auch kaum eine andere Wahl als das.
};


instance VLK_5079_EMILIO_HAPPENED(C_Info)
{
	npc = vlk_5079_emilio;
	condition = vlk_5079_emilio_happened_condition;
	information = vlk_5079_emilio_happened_info;
	important = 0;
	permanent = 0;
	description = "Irgendwas interessantes passiert?";
};


func int vlk_5079_emilio_happened_condition()
{
	if(Npc_KnowsInfo(hero,vlk_5079_emilio_welcome))
	{
		return TRUE;
	};
};

func void vlk_5079_emilio_happened_info()
{
	AI_Output(other,self,"Info_Emilio_happened_11_01");	//Irgendwas interessantes passiert?
	AI_Output(self,other,"Info_Emilio_happened_11_02");	//Ich hab' gehört das es hier vor einiger Zeit einen Typen gab, der das Nest der Minecrawler ausgeräuchert hat.
	AI_Output(self,other,"Info_Emilio_happened_11_03");	//Seitdem, ist es in der Alten Mine wieder sicher und wir Buddler können uns weiterhin für Gomez' den Rücken krumm schuften.
	AI_Output(self,other,"Info_Emilio_happened_11_04");	//Ein wahrer Held... (Seufzt)
	B_GiveXP(XP_EMILIO);
};

