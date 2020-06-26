
instance INFO_VLK_576_SCHUTZGELD(C_Info)
{
	npc = VLK_576_Buddler;
	nr = 5;
	condition = info_vlk_560_schutzgeld_condition;
	information = info_vlk_560_schutzgeld_info;
	permanent = 1;
	description = "Wie sieht's mit deinem Schutzgeld aus?";
};


func int info_vlk_576_schutzgeld_condition()
{
	if(Npc_KnowsInfo(hero,grd_255_fletcher_musstun) && (self.aivar[AIV_DEALDAY] <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void info_vlk_576_schutzgeld_info()
{
	AI_Output(other,self,"Info_Vlk_2_Schutzgeld_15_00");	//Hast du dein Schutzgeld schon bezahlt?
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_01");	//Ist ja schon gut, hier sind meine 10 Erz.
	AI_Output(self,other,"Info_Vlk_2_Schutzgeld_07_02");	//Sorg du aber dafür, dass ich hier weiterhin meine Ruhe hab'.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	self.aivar[AIV_DEALDAY] = Wld_GetDay() + 5;
};

