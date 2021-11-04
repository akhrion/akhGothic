//Тернарка.
//exp - expression, r1 - возвращает, если условие верно, r2 - если не верно.
func int tern(var int exp, var int r1, var int r2)
{
	if(exp)
	{
		return r1;
	};
	return r2;
};

//Возвращает положительное число.
func int abs(var int i)
{
	return tern(i < 0,i * -1,i);
};

func int expon_cb(var int i, var int e, var int sum)
{
	if(e>1)
	{return expon_cb(i,e-1,sum*i);};
	if(e == 0)
	{return 1;};
	return sum;
};
//Возведение в степень:
//i - int число возводимое в степень, e - exponent степень.
func int expon(var int i,var int e)
{
	return expon_cb(i,e,i);
};

//Возвращает результат* умножения целочисленного типа на тип с плавающей запятой:
//*результат округляется в нижнюю сторону
//integer - целое число; pseudoFloat - остаток от 100а считается долей целого числа.
//Пример: 20 * 50 = 10;   20 * 100 = 20; 20 * 155 = 31;
//Пример: 20 * 700 = 140; 20 * 10 = 2;   20 * 4 = 0,8 = 0;
func int MultiplicateIntOnFloat(var int integer, var int pseudoFloat){
	return integer * (pseudoFloat / 100) +
	(integer * (pseudoFloat / 10 % 10)) / 10 +
	(integer * (pseudoFloat % 10)) / 100;
};
//Округление в верхнюю сторону - в остальном: аналогична MultiplicateIntOnFloat функции.. отрабатывает дольше.. в теории - я не проверял.. ку-ку ;) мы так и будем мотать скроллбар в право? ..... мне это не сложно - я просто печатаю.. а он крутится...... а вот ты... ты поди это стрелочками делаешь и думаешь "эво как оно противно дрыгается.." да?..... да хорошь уже! ;p
func int MultiplicateIntOnFloatU(var int integer, var int pseudoFloat){
	return integer * (pseudoFloat / 100) +
	tern(
		pseudoFloat % 10,
		(integer * (pseudoFloat / 10 % 10)) / 10 +
		tern(
			integer * (pseudoFloat % 10) % 100,
			integer * (pseudoFloat % 10) / 100 + 1,
			integer * (pseudoFloat % 10) / 100
		),
		tern(
			(integer * (pseudoFloat / 10 % 10)) % 10,
			(integer * (pseudoFloat / 10 % 10)) / 10 + 1,
			(integer * (pseudoFloat / 10 % 10)) / 10
		)
	);
};

//integer - целое число; f1,f2,f3 - целая, десятая и сотая части плавающего водолаза.
func int MultiplicateIntOnFloat_a(var int integer, var int f1, var int f2, var int f3){
	return (integer * f1) + ((integer * f2) / 10) + ((integer * f3) / 100);
};

//Возвращает процент percent от числа integer
//Пример: 8 40 = 3,2 = 3; 24 100 = 24; 33 13 = 4,29 = 4;
func int getPercentFromInteger(var int integer, var int percent)
{
	return integer * percent / 100;
};

//////////////////////////////////////////
//Функции ниже, тестируются.//////////////
//AKH WORKING проверить полноценность условий.
//С 20210908 Ошибок не ловлю. Вероятно стабильна.
//Колбек. Родительской функцией является одноимённая без окончания _cb - используйте её.
func int isFlagsContainCategorie_cb(var int flags_, var int cat_, var int bndl_, var int lvl_)
{
	if((bndl_ - 1) == flags_)
	{
		return true;
	};
	if((bndl_ - 1) > flags_)
	{//ЛУЧШЕ НАВЕРНОЕ НЕ -+ ДЕЛАТЬ, А НАРАЩИВАТЬ инкримент lvl_ и на 31 делать ОДИН РАЗ МИНУС ?? ДА? потому-что:
		// (bndl_ - 1) / 2 - деление нечётного числа всегда.. как следствие округлить может вверх и чё тогда?
		//		тогда потенциально мы пропустим искомый элемент.. и вернём "его нету"
		bndl_ = (bndl_ - 1) / 2 + 1;	//Отнять единицу надо, что-бы сделать число положительным.. 
		if(bndl_ == cat_)		//оно становится отрицательным на 31 шифте, т.к. достигает границы типа int..
		{		//при этом операция умножения на отрицательную единицу не подойдёт на этапах до 31 шифта..
			return true;
		};
		flags_ = flags_ - bndl_;
		if(flags_ <= 0)
		{
			return false;
		};
		return isFlagsContainCategorie_cb(flags_, cat_, 1 << 1, 1);
	};
	return isFlagsContainCategorie_cb(flags_, cat_, bndl_ << 1, lvl_ + 1);
};

//AKH WORKING
//С 20210908 Ошибок не ловлю. Вероятно стабильна. Но возможно не полноценны условия.
//Возвращает true если во флагах flags_ содержится категория cat_
//flags_ - принимает коллекцию сумированных категорий. Данное поле без "_" имеется у различных instance
//cat_ - экземпляр одной из категорий. Посмотреть на них можно в файле _Intern\constants.d
func int isFlagsContainCategorie(var int flags_, var int cat_)
{
	if(flags_ > cat_)
	{
		return isFlagsContainCategorie_cb(flags_, cat_, 1 << 1, 1);
	} else if(flags_ == cat_)
	{
		return true;
	};
	return false;
};

func int getFlagsCount_cb(var int flags_, var int bndl_, var int counter_)
{
	if(flags_ == 0)
	{
		return counter_;
	};
	if(bndl_ < flags_)
	{
		if(bndl_ < 0)
		{
			bndl_ = -1 * (bndl_ / 2);
		}
		else
		{
		return getFlagsCount_cb(flags_, bndl_ << 1, counter_);
		};
	};
	if(bndl_ == flags_)
	{
		return counter_ + 1;
	};
	return getFlagsCount_cb(flags_ - (bndl_ / 2), 1 << 1, counter_ + 1);
};

//AKH WORKING
//С 20210908 Ошибок не ловлю. Вероятно стабильна. Но возможно не полноценны условия.
//Возвращает true если во флагах flags_ содержится категория cat_
//flags_ - принимает коллекцию сумированных категорий. Данное поле без "_" имеется у различных instance
//cat_ - экземпляр одной из категорий. Посмотреть на них можно в файле _Intern\constants.d
func int getFlagsCount(var int flags_)
{
	return getFlagsCount_cb(flags_, 1 << 1, 0);
};


//AKH WORKING
//Это не рабочая функция..
//Это должна быть безопасной версией функции isFlagsContainCategorie_cb
//Но пока она не работает.. я хз.. не вижу где.
//Постоянный оверфлоу
func int t_cb(var int flags_, var int cat_, var int bndl_, var int lvl_)
{
	PrintDebug(IntToString(flags_));
	if(bndl_ < 0)
	{
		bndl_ = ((bndl_ / 2) * -1);//20210913 добавил скобки (bndl_ / 2) не тестировал
		if(bndl_ == cat_)
		{
			return 1;//содержит
		} else {
			Print("overflow");
			return 2;//ошибка: переполнение типа - никогда не произойдёт.. в теории.
			//если произойдёт - значит был получен неверный тип:
			//не знаю насколько это возможно, но я отталкиваюсь от того, что возможно всё.
			//Насколько возможно, что небо станет землёй, а земля небом?
			//На столько-же на сколько и то, что при инкрементации положительного числа
			//мы в итоге получим отрицательное.. ой, а мыж его получаем кста..
		};
	};
	if(bndl_ == flags_){
		return 0;//не содержит
	};
	if((bndl_ - 1) == flags_)
	{
		return 1;//содержит
	};
	if(bndl_ < flags_)
	{
		return t_cb(flags_, cat_, bndl_ << 1, lvl_ + 1);
	};
	bndl_ = bndl_ / 2;
	if(bndl_ == cat_)
	{
		return 1;//содержит
	};
	flags_ = flags_ - bndl_;
	if(flags_ == 0)
	{
//		Print(IntToString(flags_));
		return 0;//не содержит
	};
	return t_cb(flags_, cat_, 1 << 1, 1);
};

//Это не рабочая функция.. она крашит игру..
func int t(var int flags_, var int cat_)
{
	if(flags_ > cat_)
	{
		var int ret;
		ret = t_cb(flags_, cat_, 1 << 1, 1);
		if(!ret)
		{
			//cat_ не найдена во flags_
			return 0;
		} else if(ret == 1)
		{
			//cat_ найдена
			return 1;
		};
		//не удалось установить наличие cat_ во flags_ - вероятно так будет очень редко.. а возможно никогда.
		return 2;
	} else if(flags_ == cat_)
	{
		//cat_ найдена
		return 1;
	};
	//cat_ не найдена
	return 0;
};

//Функции ниже, можно удалять
