
instance DIA_Shrat_Exit(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 999;
	condition = DIA_Shrat_Exit_Condition;
	information = DIA_Shrat_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Shrat_Exit_Condition()
{
	return 1;
};

func void DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Shrat_WhyHere(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_WhyHere_Condition;
	information = DIA_Shrat_WhyHere_Info;
	permanent = 0;
	description = "Что ты здесь делаешь?";
};


func int DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

func void DIA_Shrat_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Shrat_WhyHere_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_01");	//Разве я позволил тебе обратиться ко мне?
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_02");	//Шучу! Я здесь, потому что эти недоумки действуют мне на нервы!
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_03");	//'Не смей обращаться ко мне! Моли Спящего о прощении! Это задание необычайной важности!'
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_04");	//Когда вокруг тебя столько психов, этого достаточно, чтобы свести человека с ума.
	AI_Output(self,other,"DIA_Shrat_WhyHere_02_05");	//Я Шрет, ученик первого ранга, им же и останусь!
};


instance DIA_Shrat_JoinPSI(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_JoinPSI_Condition;
	information = DIA_Shrat_JoinPSI_Info;
	permanent = 0;
	description = "Я хочу вступить в Братство. Ты можешь мне помочь?";
};


func int DIA_Shrat_JoinPSI_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

func void DIA_Shrat_JoinPSI_Info()
{
	AI_Output(other,self,"DIA_Shrat_JoinPSI_15_00");	//Я хочу вступить в Братство. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_01");	//Ты действительно присоединишься к этим типам? А я только и думаю о том, как убраться отсюда.
	AI_Output(self,other,"DIA_Shrat_JoinPSI_02_02");	//Мы могли бы вместе странствовать по колонии. Облегчим кошельки парочки толстосумов, поднакопим руды, что скажешь?
};


instance DIA_Shrat_ComeWithMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 1;
	condition = DIA_Shrat_ComeWithMe_Condition;
	information = DIA_Shrat_ComeWithMe_Info;
	permanent = 1;
	description = "Что ж, пойдем вместе. Идем!";
};


func int DIA_Shrat_ComeWithMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return 1;
	};
};

func void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_ComeWithMe_15_00");	//Что ж, пойдем вместе. Идем!
	AI_Output(self,other,"DIA_Shrat_ComeWithMe_02_01");	//То, что я хотел услышать! Вперед!
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_Shrat_LeaveMe(C_Info)
{
	npc = NOV_1356_Shrat;
	nr = 700;
	condition = DIA_Shrat_LeaveMe_Condition;
	information = DIA_Shrat_LeaveMe_Info;
	permanent = 1;
	description = "Здесь мы должны разделиться. Дальше я пойду один.";
};


func int DIA_Shrat_LeaveMe_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return 1;
	};
};

func void DIA_Shrat_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Shrat_LeaveMe_15_00");	//Здесь мы должны разделиться. Дальше я пойду один.
	AI_Output(self,other,"DIA_Shrat_LeaveMe_02_01");	//Ладно. А я вернусь в свое укрытие на болотах. Береги себя!
	Npc_ExchangeRoutine(self,"START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

//Только этот барьер.. они многое говорят нам о нем, но ты знаешь..
//я ни разу не видел, что-бы он кого-то убил, но и самому проверять мне.. ах-мм.. ну ты понимаешь..
//"И ты хочешь что-бы я проверил?"
//										"Понимаю"
//										"И что-ты предлагаешь?"
//А ты можешь?
//"Эмм.."
//			"Конечно, но не за бесплатно."
//(с сожалением) Эх, я так и думал..
//			О, и сколько ты хочешь? 13ти кусков будет достаточно?
//			"13? Это хорошая цена, за такую услугу. Я в деле!"
//						"Неет, 13 маловато."
//			Отлично! Вот твоя руда. Жду здесь, с новостями!
//			"Я вышел! И вернулся обратно!"
//			Правда?!
//			"После того, как я оказался за пределами барьера, я не захотел возвращаться, я был так рад, но чувство долга, за твою руду"
//			"заставило меня вернуться и рассказать все тебе."
//			О хвала Спящему! Я готов в него уверовать, я так долго этого ждал! Берта, я иду к тебе! (убегает к барьеру)
//						Но это вся руда, что у меня есть.. Я могу предложить тебе еще крылья шершня, их можно использовать как веер
//						Здесь на болотах ужасно душно и сыро, если ты заметил.
//						О, еще я знаю, что у одного из идолов хранится в сундуке..
//						"И как это ты это узнал, находясь здесь в одиночестве? Болотожоры рассказали?"
//						...
//						"Ладно, давай рассказывай"
//											"Меня это не интересует."
//						Сначала ты проверишь барьер, а потом я расскажу о вещице гуру.
//											Ну, как знаешь, если передумаешь - я здесь.
//Есть один послушник, он любит любоваться рассветом по утрам - так он говорит.
//Но на самом деле.. в общем он странный.. ну ты понимаешь..
//Нужно как-нибудь его.. хмм.. ну ты понимаешь..
//Ты хочешь толкнуть его за барьер и посмотреть, что из этого выйдет?
//Воот, я-же говорю: ты понимаешь (улыбается)
//Забудь об этом, ты совсем псих?!
//Окей, я тоже не прочь убраться отсюда, а раз ты говоришь, что он и сам непроч.. и его всего-то и надо что "подтолкнуть".. ну ты понимаешь..
//Я тебя отлично понимаю мой друг! (лыбится во всю лыбу)
//А как мы это сделаем? Ведь в Готике нет механики толкания..
//Что?
//Где?
//Не важно, забудем об этом. Мы могли-бы его напоить, а там глядишь он и сам..
//К солнцу любимому отправится шагать.
//Я думаю - дальше..
//Дальше?
//Даа, намнооого дальше.. ну ты понимаешь..
//Ааа, я тебя понимаю!
//Отлично, что мы друг-друга понимаем!
//Без понимания было-бы сложно провернуть такое дело.
//Стой а чья сейчас реплика?
//Твоя
//Ааа, а я это не Ты, а Я..
//Верно!
