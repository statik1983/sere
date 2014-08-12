// Displays server info

// WARNING!! If you want to change the amount of info rows in here, you have to know what you are doing.

_info6 = format["Teamspeak 3 Server"];
_info6sub = format["93.158.211.139"];
_info7 = format["Teamspeak 3 Password"];
_info7sub = format["seredayz"];
_info8 = format["Server Features"];
_info8sub = format["500+ vehicles, 200+ Base Buildings, 500+ Weapons, AI Patrols, AI Missions, AI Guards, Anti-Hack, Air Lifting, Auto Refuel, Suicide, Self Blood bag, Night Lights, Halo Spawn, Smelting, Anti-Zombie Emitter, Air Drops, Custom Default Loadout, Custom Debug Monitor, Remove Cloths, Remove Parts, All Weather, Donator Rewards, Custom Nameplates @ 50 Meters, GMT-0, Restart Every 3 Hours"];
_info9 = format["What is SERE?"];
_info9sub = format["Survival, Evasion, Resistance, and Escape (SERE) is a program, best known by its military acronym,that provides U.S. military personnel, U.S. Department of Defense civilians and private military contractors with training in evading capture, survival skills and the  military code of conduct. Established by the United  States Air Force at the end of the Korean War (1950– 53), it was extended during the Vietnam War (1959– 1975) to the U.S. Army, U.S. Navy and U.S. Marine Corps. Most higher level SERE students are military aircrew and special operations personnel considered to be at high risk of capture. The U.S. Air Force SERE  School is located at Fairchild AFB, Washington, while SERE Training for the U.S. Army is located at Fort Bragg, North Carolina and at Fort Rucker, Alabama. The Navy and Marine Corps SERE School has known locations at: the U.S. Navy Remote Training Site at Warner Springs, California the remote Marine Corps Mt. Warfare Training Center (Bridgeport CA) Portsmouth Naval Shipyard in  Kittery, Maine."];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t>", _info6, _info6sub, _info7, _info7sub, _info8, _info8sub, _info9, _info9sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn AH_fnc_dynamictext;