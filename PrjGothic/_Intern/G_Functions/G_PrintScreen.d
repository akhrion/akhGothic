
func void G_PrintScreen(var string strMessage)
{
	PrintScreen(strMessage,-1,10,_STR_FONT_ONSCREEN,3);
};

func void testmsg(var string testmessage)
{
	PrintScreen(testmessage,-1,10,"font_old_10_white.tga",1);
};

