
func void event_om_crawler_01()
{
	if(ASGHAN_GATE_WAS_OPENED != 1)
	{
		Wld_InsertNpc(minecrawler_omgate,"OM_061");
		Wld_InsertNpc(minecrawler_omgate,"OM_061");
		Wld_InsertNpc(minecrawler_omgate,"OM_062");
		Wld_InsertNpc(minecrawler_omgate,"OM_062");
		Wld_InsertNpc(minecrawler_omgate,"OM_062");
	};
	ASGHAN_GATE_WAS_OPENED = 1;
};

