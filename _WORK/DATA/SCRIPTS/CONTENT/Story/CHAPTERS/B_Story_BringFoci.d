
func void B_Story_BringFoci()
{
	var C_Npc gorn;
	var C_Npc lester;
	var C_Npc Lestermonster;
	var C_Npc milten;
	var C_Npc diego;
	var C_Npc DiegoMonster;
	var C_Npc sld723;
	var C_Npc sld732;
	CreateInvItems(self,ItWrFocimap,2);
	B_GiveInvItems(self,hero,ItWrFocimap,2);
	Npc_RemoveInvItem(hero,ItWrFocimap);
	CreateInvItem(hero,ItArScrollTeleport2);
	gorn = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(gorn,"RuinWait");
	AI_ContinueRoutine(gorn);
	lester = Hlp_GetNpc(PC_Psionic);
	Npc_ExchangeRoutine(lester,"FORTRESSWAIT");
	AI_ContinueRoutine(lester);
	Lestermonster = Hlp_GetNpc(Bridgegolem);
	if(Npc_IsDead(Lestermonster))
	{
		Wld_InsertNpc(Bridgegolem,"PATH_TO_PLATEAU04_BRIDGE2");
	};
	milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine(milten,"SHWait");
	AI_ContinueRoutine(milten);
	diego = Hlp_GetNpc(PC_Thief);
	Npc_ExchangeRoutine(diego,"TROLLWAIT");
	AI_ContinueRoutine(diego);
	DiegoMonster = Hlp_GetNpc(Troll);
	if(Npc_IsDead(DiegoMonster))
	{
		Wld_InsertNpc(Troll,"LOCATION_12_14");
	};
	sld723 = Hlp_GetNpc(SLD_723_Soeldner);
	sld723.aivar[AIV_PASSGATE] = TRUE;
	sld732 = Hlp_GetNpc(SLD_732_Soeldner);
	sld732.aivar[AIV_PASSGATE] = TRUE;
	B_LogEntry(CH3_EscapePlanNC,"Ich habe Saturas meine Hilfe bei der Vollendung des Ausbruchsplans angeboten. Meine n�chste Aufgabe besteht darin, die vier nochfehlenden Fokus-Steinen zu finden.");
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_SUCCESS);
	Log_CreateTopic(CH3_BringFoci,LOG_MISSION);
	Log_SetTopicStatus(CH3_BringFoci,LOG_RUNNING);
	B_LogEntry(CH3_BringFoci,"Nachdem ich Fokus und Almanach aus dem Sumpflager an Saturas �bergeben habe, bat er mich, die restlichen vier Fokussteine, die sich nicht im Besitz der Wassermagier befinden, zu suchen.");
	B_LogEntry(CH3_BringFoci,"Saturas gab mir eine alte Karte, auf der die letzten bekannten Aufenthaltsorte der Fokussteine verzeichnet sind sowie eine Spruchrolle, die mich bei Benutzung direkt zu den Wassermagiern zur�ckteleportiert.");
	B_LogEntry(CH3_BringFoci,"Riordian, einer der Wassermagier, hat eine Reihe Tr�nke f�r meine Reise gebraut. Ich kann sie mir in seinem Alchemielabor auf der obersten Ebene des Neuen Lagers abholen.");
	Saturas_BringFoci = 1;
};

