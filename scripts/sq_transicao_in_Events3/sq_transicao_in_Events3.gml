// Auto-generated stubs for each available event.

function sq_transicao_in_Moment()
{
	global.transicao = true;
	if(room_next(room) != - 1)
	{
	room_goto_next();
	}
	else
	{
	//caso contrário, eu começo do inicio do jogo
	room_goto(rm_tutorial01);	
	}
}