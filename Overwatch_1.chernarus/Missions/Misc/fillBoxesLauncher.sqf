//AI Missions Supply Box

_crateLauncher = _this select 0;

clearWeaponCargoGlobal _crateLauncher;
clearMagazineCargoGlobal _crateLauncher;

_crateLauncher addWeaponCargoGlobal ["M136", 3];
_crateLauncher addMagazineCargoGlobal ["M136", 20]; 
_crateLauncher addMagazineCargoGlobal ["PipeBomb", 8];