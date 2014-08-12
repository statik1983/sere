if (hasInterface || isServer || isDedicated) exitWith{};
private ["_numb","_element","_num","_firstRun"];

if(isNil {ReAccur}) then { ReAccur = ["M1","M2","M3","M4","M5"];};
if(isNil {MCarray}) then { MCarray = [];};
if (count missionArray1 == 0) then
{
_element = ReAccur call BIS_fnc_selectRandom;
} else {
_numb = count missionArray1;
_num = floor (random _numb);
_element = missionArray1 select _num;
_Earray = [_element];
};
[] execVM format ["missions\easy\%1.sqf",_element];