private["_players","_position","_unit"];
// Setting variables

	_unit = _this select 0;
	_players = [];
	while {alive _unit} do
	{
		_players = ((getPosATL _unit) nearEntities [["CAManBase","AllPlayers"], 10]);
		if ((_players select 0) distance _unit <= 10) then 
		{
			_unit setBehaviour "COMBAT";
		};
		sleep 0.1;
	};