
func void G_CanNotCast(var int bIsPlayer,var int nCircleNeeded,var int nCirclePossessed)
{
	var int nDifference;
	var string strDifference;
	var string strMessage;
	if((nCircleNeeded == 7) && bIsPlayer)
	{
		strMessage = "������ ������, � �� ���� ������������ ��� � ���.";
		G_PrintScreen(strMessage);
		return;
	};
	if((nCircleNeeded == 8) && bIsPlayer)
	{
		strMessage = "������ ������ ����� �����, ��� ������������ ���� �������.";
		G_PrintScreen(strMessage);
		return;
	};
	strMessage = _STR_ATTRIBUTE_MAGIC_CIRCLE;
	strMessage = ConcatStrings(strMessage,IntToString(nCircleNeeded));
	strMessage = ConcatStrings(strMessage," ");
	strMessage = ConcatStrings(strMessage,_STR_CANNOTUSE_LEVELS);
	strMessage = ConcatStrings(strMessage,_STR_CANNOTUSE_POST);
	if(bIsPlayer)
	{
		G_PrintScreen(strMessage);
	};
};

