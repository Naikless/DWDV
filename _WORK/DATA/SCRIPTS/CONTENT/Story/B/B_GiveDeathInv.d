func void B_GiveDeathInv ()
{
	//-------- Abfragen, ob die Trophy schon mal verteilt wurde --------
	if	(self.aivar[AIV_MM_DEATHINVGIVEN])
	{
		return;
	};

	//-------- Trophy ins Inventory packen --------
	if (Knows_GetTeeth == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_WOLF)				{	CreateInvItems(self,ItAt_Teeth_01,2);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLACKWOLF)  			{	CreateInvItems(self,ItAt_Teeth_01,2);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SNAPPER)     		{	CreateInvItems(self,ItAt_Teeth_01,4);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_ORCBITER)   			{	CreateInvItems(self,ItAt_Teeth_01,2);	};	
		if (self.aivar[AIV_MM_REAL_ID]==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_Teeth_01,4);	};	
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLOODHOUND)			{	CreateInvItems(self,ItAt_Teeth_01,4);	};
	};

	if (Knows_GetClaws == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_WARAN)				{	CreateInvItems(self,ItAt_Claws_01,4);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_Claws_01,4);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SNAPPER)   			{	CreateInvItems(self,ItAt_Claws_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_RAZOR)				{	CreateInvItems(self,ItAt_Claws_01,3);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_ORCBITER)    		{	CreateInvItems(self,ItAt_Claws_01,2);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_LURKER)				{	CreateInvItems(self,ItAt_Lurker_01,2);	};		
	};

	if (Knows_GetFur == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_WOLF)				{	CreateInvItems(self,ItAt_Wolf_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLACKWOLF)			{	CreateInvItems(self,ItAt_Wolf_02,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_Shadow_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_TROLL)				{	CreateInvItems(self,ItAt_Troll_01,1);	};
	};

	if (Knows_GetHide == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_LURKER)				{	CreateInvItems(self,ItAt_Lurker_02,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_SWAMPSHARK)			{	CreateInvItems(self,ItAt_Swampshark_01,1);	};
	};
	
	if (Knows_GetMCMandibles == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_MINECRAWLER)			{	CreateInvItems(self,ItAt_Crawler_01,1);	};
		if (self.aivar[AIV_MM_REAL_ID]==ID_MINECRAWLERWARRIOR)	{	CreateInvItems(self,ItAt_Crawler_01,1);	};
	};
	
	if (Knows_GetMCPlates == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_MINECRAWLERWARRIOR)	{	CreateInvItems(self,ItAt_Crawler_02,2);	};
	};
	
	if (Knows_GetBFSting == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_BLOODFLY)			{	CreateInvItems(self,ItAt_Bloodfly_02,1);};
	};
	
	if (Knows_GetUluMulu == TRUE)
	{
		if (self.aivar[AIV_MM_REAL_ID]==ID_FIREWARAN)			{	CreateInvItems(self,ItAt_Waran_01,		1);	};	//Zunge eines Feuerwarans
		if (self.aivar[AIV_MM_REAL_ID]==ID_SHADOWBEAST)			{	CreateInvItems(self,ItAt_Shadow_02,		1); };	//Horn eines Shadowbeasts
		if (self.aivar[AIV_MM_REAL_ID]==ID_SWAMPSHARK)			{	CreateInvItems(self,ItAt_Swampshark_02,	3); };	//Zähne eines Sumpfhais
		if (self.aivar[AIV_MM_REAL_ID]==ID_TROLL)				{	CreateInvItems(self,ItAt_Troll_02,		2);	};	//Hauer eines Trolls
	};
    
    // ------ Gobbo Inventory ------
 	Goblin_Randomizer = Hlp_Random (100);
    
    if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,7);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFoMutton,2);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 70)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 90)
	{
		CreateInvItems(self,ItAt_Meatbug_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,1);
	}
	else if (self.guild == GIL_GOBBO) && (Goblin_Randomizer <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};
    
    // ------ Orc Inventory -----
	Orc_Randomizer	= Hlp_Random (100);
    
    if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 10)
	{
		CreateInvItems(self,ItAt_Meatbug_01,2);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,4);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 20)
	{
		CreateInvItems(self,ItFoMuttonRaw,1);
		CreateInvItems(self,ItFo_Plants_Berrys_01,1);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 30)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMiNugget,9);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 40)
	{
		CreateInvItems(self,ItMi_Stuff_Barbknife_01,1);
		CreateInvItems(self,ItMiNugget,3);
		CreateInvItems(self,ItMi_Stuff_Pipe_01,1);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 50)
	{
		CreateInvItems(self,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,14);
		CreateInvItems(self,ItMi_Stuff_Cup_01,1);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 60)
	{
		CreateInvItems(self,ItMi_Alchemy_Moleratlubric_01,1);
		CreateInvItems(self,ItFo_Plants_mountainmoos_01,1);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 70)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(self,ItMiNugget,16);
		CreateInvItems(self,ItFo_Potion_Health_01,1);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 80)
	{
		CreateInvItems(self,ItFo_Plants_Nightshadow_01,2);
		CreateInvItems(self,ItFo_Plants_Berrys_01,2);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 90)
	{
		CreateInvItems(self,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(self,ItFo_Plants_mushroom_01,3);
		CreateInvItems(self,ItFo_Potion_Mana_01,1);
	}
	else if ((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR) || (self.guild == GIL_ORCSHAMAN)) && (Orc_Randomizer <= 100)
	{
		CreateInvItems(self,ItFoMuttonRaw,2);
		CreateInvItems(self,ItMi_Stuff_OldCoin_01,3);
	};

	//-------- Merken --------
	self.aivar[AIV_MM_DEATHINVGIVEN] = TRUE;
};










