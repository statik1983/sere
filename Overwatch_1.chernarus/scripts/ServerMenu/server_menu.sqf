player removeAction s_player_servermenu;
s_player_servermenu1 = player addAction [("<t color=""#FFFFFF"">" + ("- Server Rules 1") +"</t>"),"scripts\ServerMenu\spawn_rules1.sqf","",-1,false,false,"", ""];
s_player_servermenu2 = player addAction [("<t color=""#FFFFFF"">" + ("- Server Rules 2") +"</t>"),"scripts\ServerMenu\spawn_rules2.sqf","",-1,false,false,"", ""];
s_player_servermenu3 = player addAction [("<t color=""#FFFFFF"">" + ("- Server Info 1") +"</t>"),"scripts\ServerMenu\spawn_info1.sqf","",-1,false,false,"", ""];
s_player_servermenu4 = player addAction [("<t color=""#FFFFFF"">" + ("- Server Info 2") +"</t>"),"scripts\ServerMenu\spawn_info2.sqf","",-1,false,false,"", ""];
s_player_servermenu5 = player addAction [("<t color=""#FFFFFF"">" + ("- Base Building Guide 1") +"</t>"),"scripts\ServerMenu\spawn_bb1.sqf","",-1,false,false,"", ""];
s_player_servermenu6 = player addAction [("<t color=""#FFFFFF"">" + ("- Base Building Guide 2") +"</t>"),"scripts\ServerMenu\spawn_bb2.sqf","",-1,false,false,"", ""];
s_player_servermenu7 = player addAction [("<t color=""#FFFFFF"">" + ("- Features Guide 1") +"</t>"),"scripts\ServerMenu\spawn_features1.sqf","",-1,false,false,"", ""];
s_player_servermenu8 = player addAction [("<t color=""#FFFFFF"">" + ("- Features Guide 2") +"</t>"),"scripts\ServerMenu\spawn_features2.sqf","",-1,false,false,"", ""];
s_player_servermenu9 = player addAction [("<t color=""#FFFFFF"">" + ("- Donations") +"</t>"),"scripts\ServerMenu\spawn_donations.sqf","",-1,false,false,"", ""];
s_player_servermenu10 = player addAction [("<t color=""#FFFFFF"">" + ("- Show Credits") +"</t>"),"scripts\ServerMenu\server_credits.sqf","",-1,false,false,"", ""];
s_player_servermenuCancel = player addAction ["Close","scripts\ServerMenu\server_menuClose.sqf","",-1,false,false,"", ""];