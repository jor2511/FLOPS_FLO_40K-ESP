if ((typeOf player == F_Officer) || (typeOf player == "B_G_officer_F")) then {

_Cost = 200;
_mrkrs = allMapMarkers select {markerColor _x == "Color2_FD_F"};
_mrkr = _mrkrs select 0;
_Money = parseNumber (markerText _mrkr) ;  
if (_Money >= _Cost) then {
_NewMoney = _Money - _Cost; 
_mrkr setMarkerText str _NewMoney;

_mrkrs = allMapMarkers select {markerColor _x == "Color4_FD_F"};
_mrkr = _mrkrs select 0;
_NewScore = 15; 
_mrkr setMarkerText str _NewScore;

sleep 12;

["showNotification", ["Reputación", "Mejorada + + + (Soborno Efectivo)", "success"]] call FLO_fnc_intelSystem;

}else{hint "Sin Recursos"; };
}else{  hint "Sin Autorización, Policia Militar Avisada!"; };

