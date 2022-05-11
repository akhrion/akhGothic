var int EVENT_Daily_LastDay;
func int EVENT_Daily_IsNewDay()
{
	if(Wld_GetDay() == EVENT_Daily_LastDay){return false;};
	EVENT_Daily_LastDay = Wld_GetDay();
	return true;
};
func void EVENT_Daily()
{
	if(!EVENT_Daily_IsNewDay()){return;};
};