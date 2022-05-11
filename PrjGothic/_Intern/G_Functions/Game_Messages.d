func void Game_Msg_GoldGiven(var int amount)
{
	PrintDebugNpc(PD_ZS_FRAME,"Game_Msg_GoldGiven");
	PrintScreen(getConcatSI(_STR_MESSAGE_GoldGiven,amount),-1,_YPOS_MESSAGE_GIVEN,FONT_SCREEN,_TIME_MESSAGE_GIVEN);
};
func void Game_Msg_GoldLost(var int amount)
{
	PrintDebugNpc(PD_ZS_FRAME,"Game_Msg_GoldLost");
	PrintScreen(getConcatSI(_STR_MESSAGE_GoldLost,amount),-1,_YPOS_MESSAGE_GIVEN,FONT_SCREEN,_TIME_MESSAGE_GIVEN);
};
func void Game_Msg_GoldReceived(var int amount)
{
	PrintDebugNpc(PD_ZS_FRAME,"Game_Msg_GoldReceived");
	PrintScreen(getConcatSI(_STR_MESSAGE_GoldReceived,amount),-1,_YPOS_MESSAGE_TAKEN,FONT_SCREEN,_TIME_MESSAGE_TAKEN);
};
func void Game_Msg_GoldFound(var int amount)
{
	PrintDebugNpc(PD_ZS_FRAME,"Game_Msg_GoldFound");
	PrintScreen(getConcatSI(_STR_MESSAGE_GoldFound,amount),-1,_YPOS_MESSAGE_TAKEN,FONT_SCREEN,_TIME_MESSAGE_TAKEN);
};