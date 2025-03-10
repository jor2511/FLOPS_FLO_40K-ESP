sleep 16 ;


COMMSDIS = 1;
publicVariable "COMMSDIS";

["showNotification", ["Comunicaciones Saboteadas", "Comunicaciones Enemigas Suprimidas 1 Hora", "success"]] call FLO_fnc_intelSystem;

sleep 3600 ;

COMMSDIS = 0;
publicVariable "COMMSDIS";
