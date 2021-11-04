///////////////////////////////////////
//////////////////////CRASH BLOCK START
/*
func int CurMinute(var int m)
{
	if(Wld_IsTime(0,m,0,m+2))
	{
		return m;
	};
	return m + 1;
};
func int isCurMinute(var int m)
{
	if(Wld_IsTime(0,m,0,m+2))
	{
		return true;
	};
	return false;
};
var int ww;
func int getCurMinute_cb(var int i){
*/
	//I DON'T KNOW HOW IT WORK.. CAN SOME ONE EXPLAIN TO ME?? akhrion
	//if i run it into mainCycle
	//so i every time get 56 like correct return
	//it stop working on 56.. WHY????
	//even if i start from 0 as argument
	//i can't get 0 1 2 3 4.. and i get 56 like first return.. WHYYYYYYYYYYY?????
//BEGINING TEST1
/*
	if(i == 59)
	{
		Print("59");
		return 59;
	};
	if(i == 58)
	{
		Print("58");
		return 58;
	};	
	if(i == 56)
	{
		Print("56");
		return 56;
	};
*/
	//ALSO
	//this small block bellow. Return minutes from start of a day..
	//what i mean:
	//if game time equal 10:00, then block bellow will return 600
	//in 5:00 it will 300 = 5 hour * 60 minutes
	//WHY IT WORK LIKE THAT?
/*
	if(isCurMinute(i))
	{
		return i;
	} else {
		i = i + 1;
		return getCurMinute_cb(i);
	};
*/
//END TEST1
/*
	ww = CurMinute(i);
	if(
		ww != i &&
		ww < 60 &&
		ww >= 0
	)
	{
		return getCurMinute_cb(i);
	}
	else if (ww >= 60)
	{
		return 77;
	};
	return i;
};
var int isInWork;
func int getCurMinute()
{
	var int r;
	r = getCurMinute_cb(0);
	isInWork = false;
	return r;
};
*/
////////////////////////CRASH BLOCK END
///////////////////////////////////////
