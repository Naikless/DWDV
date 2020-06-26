
func void B_CheckDeadMissionNPCs()
{
	if(Hlp_GetInstanceID(Org_844_Lefty) == Hlp_GetInstanceID(self))
	{
		if(Lefty_Mission == LOG_RUNNING)
		{
			B_LogEntry(CH1_CarryWater,"Die Sache mit dem Wasser hat sich mit Leftys Tod wohl erledigt. Ich konnte den Typen sowieso nicht leiden.");
			Log_SetTopicStatus(CH1_CarryWater,LOG_SUCCESS);
			LeftyDead = TRUE;
		};
	};
	if(Hlp_GetInstanceID(ORG_826_Mordrag) == Hlp_GetInstanceID(self))
	{
		if(Thorus_MordragKo == LOG_RUNNING)
		{
			B_LogEntry(CH1_MordragKO,"Jetzt wo Mordrag tot ist, hat sich das Problem von Thorus wohl erledigt und ich habe meine Aufgabe erfüllt.");
		};
	};
};

