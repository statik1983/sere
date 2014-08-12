if (hasInterface || isServer || isDedicated) exitWith{};
private ["_numb","_element","_num","_firstRun"];

if(isNil {ReAccur}) then { ReAccur = ["M1"];};
if(isNil {MCarray3}) then { MCarray3 = [];};
if (count missionArray3 == 0) then
{
_element = ReAccur call BIS_fnc_selectRandom;
} else {
_numb = count missionArray3;
_num = floor (random _numb);
_element = missionArray3 select _num;
_Earray = [_element];
};
[] execVM format ["missions\hard\%1.sqf",_element];