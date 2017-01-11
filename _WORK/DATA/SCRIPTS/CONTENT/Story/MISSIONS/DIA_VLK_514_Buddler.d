
instance INFO_VLK_514_SCHUTZGELD(C_Info)
{
	npc = VLK_514_Buddler;
	nr = 5;
	condition = info_vlk_514_schutzgeld_condition;
	information = info_vlk_514_schutzgeld_info;
	permanent = 1;
	description = "Wie sieht's mit deinem Schutzgeld aus?";
};


func int info_vlk_514_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_514_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_3_Schutzgeld_15_00");	//Dein Schutzgeld ist mal wieder fällig.
	AI_Output(self,other,"Info_Vlk_3_Schutzgeld_07_01");	//Hier hast du deine 10 Erz.
	AI_Output(self,other,"Info_Vlk_3_Schutzgeld_07_02");	//Ich hoffe das reicht erstmal wieder für ein paar Tage.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

