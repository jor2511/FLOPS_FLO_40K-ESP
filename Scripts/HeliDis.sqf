sleep 18;

["showNotification", ["APOYO DESHABILITADO", "Apoyo de Helicópteros Enemigos Desmantelado Durante la Próxima Hora", "success"]] call FLO_fnc_intelSystem;

HELIDIS = 1;
publicVariable "HELIDIS";

_Helis = nearestObjects [ player, East_Air_Heli, 40000];
{
_x setFuel 0;
_x setVehicleAmmo 0;
((crew _x) select 0) leaveVehicle _x;

} forEach _Helis;

sleep 3600 ;

HELIDIS = 0;
publicVariable "HELIDIS";
