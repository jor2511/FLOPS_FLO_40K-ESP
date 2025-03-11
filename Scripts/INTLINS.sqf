sleep 2;
_Chance = selectRandom [0, 1, 2, 3, 4, 5]; 

if (_Chance == 5) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["El Intel sugiere que un convoy de apoyo enemigo será enviado hacia el frente. Podemos interceptarlo y desmantelar sus refuerzos y operación de apoyo. (Misión Opcional: Destruir Convoy Enemigo)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;


						if (_result) then {
							
						_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf" && markerType _x != "o_Ordnance" && markerType _x != "o_maint" && markerShape _x != "RECTANGLE" && markerShape _x != "ELLIPSE"};
						_x = [_INTL,  player] call BIS_fnc_nearestPosition;
						_x setMarkerAlpha 1;

								sleep 1;
								["showNotification", ["+ NUEVA INTEL", "Inteligencia Militar Recibida", "intel"]] call FLO_fnc_intelSystem;
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"], "Presencia enemiga confirmada en: " + _attackingAtGrid] remoteExec ["sideChat", 0];

						} ;

						if (!_result) then {
						_Enemy_Convoy = execVM "Scripts\Mission_Convoy.sqf";

						  };
		};

} ;



if (_Chance == 3) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = [" INTEL sobre el lugar de un accidente aéreo aliado, podemos rastrearlo, rescatar al piloto y destruir los restos. (Misión Opcional: Rescatar al Piloto Capturado)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
							
						_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf" && markerType _x != "o_Ordnance" && markerType _x != "o_maint" && markerShape _x != "RECTANGLE" && markerShape _x != "ELLIPSE"};
						_x = [_INTL,  player] call BIS_fnc_nearestPosition;
						_x setMarkerAlpha 1;

								sleep 1;
								["showNotification", ["+ NUEVA INTEL", "Inteligencia Militar Recibida", "intel"]] call FLO_fnc_intelSystem;
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"], "Presencia enemiga confirmada en: " + _attackingAtGrid] remoteExec ["sideChat", 0];
						} ;

						if (!_result) then {
							_allMarks = allMapMarkers select {(markerType _x == "b_installation") or (markerType _x == "o_installation") or (markerType _x == "n_installation") or (markerType _x == "o_support") or (markerType _x == "n_support") or  (markerType _x == "loc_Power") or  (markerType _x == "loc_Ruin") };  
							_NOSHs = [] ;
							{
							_NOSH = nearestObjects [getMarkerPos _x , ["HOUSE"], 400] ; 
							_NOSHs append _NOSH ;	
							} forEach _allMarks ;

							_ALLSHs = nearestObjects [player , ["HOUSE"], 7000] select {count (_x buildingPos -1) > 2};
							_NearSHs = nearestObjects [player , ["HOUSE"], 500] select {count (_x buildingPos -1) > 2};
							_SHs = _ALLSHs - _NearSHs ; 
							_SH = _SHs - _NOSHs ;


							_HQB = _SH select 0 ;
							
								_markerName = "InvesMark" + (str (getPos _HQB));   
								_mrkr = createMarker [_markerName, (getPos _HQB)];   
								_mrkr setMarkerType "mil_unknown";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								_trgA = createTrigger ["EmptyDetector", (getPos _HQB)];
								_trgA setTriggerArea [2000, 2000, 0, false, 60];
								_trgA setTriggerTimeout [7, 7, 7, true];
								_trgA setTriggerActivation ["WEST", "PRESENT", false];
								_trgA setTriggerStatements [
								"this","

								[thisTrigger] execVM 'Scripts\Mission_Pilot.sqf';


								", ""];
								
								sleep 1;
								["showNotification", ["+ NUEVA INTEL", "Inteligencia Militar Recibida", "intel"]] call FLO_fnc_intelSystem;
									_attackingAtGrid = mapGridPosition getMarkerPos _mrkr;
								[[west,"HQ"], "Presencia enemiga confirmada en: " + _attackingAtGrid] remoteExec ["sideChat", 0];
						  };
		};

} ;




if (_Chance == 4) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel sugiere el paradero del escuadrón aliado con el que perdimos contacto anteriormente. Podemos rastrearlos y rescatarlos. (Misión Opcional: Rescatar Escuadrón Desaparecido)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
							
						_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf" && markerType _x != "o_Ordnance" && markerType _x != "o_maint" && markerShape _x != "RECTANGLE" && markerShape _x != "ELLIPSE"};
						_x = [_INTL,  player] call BIS_fnc_nearestPosition;
						_x setMarkerAlpha 1;

								sleep 1;
								["showNotification", ["+ NUEVA INTEL", "Inteligencia Militar Recibida", "intel"]] call FLO_fnc_intelSystem;
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"], "Presencia enemiga confirmada en: " + _attackingAtGrid] remoteExec ["sideChat", 0];
						} ;

						if (!_result) then {
							_allMarks = allMapMarkers select {(markerType _x == "b_installation") or (markerType _x == "o_installation") or (markerType _x == "n_installation") or (markerType _x == "o_support") or (markerType _x == "n_support") or  (markerType _x == "loc_Power") or  (markerType _x == "loc_Ruin")};  
							_NOSHs = [] ;
							{
							_NOSH = nearestObjects [getMarkerPos _x , ["HOUSE"], 400] ; 
							_NOSHs append _NOSH ;	
							} forEach _allMarks ;

							_ALLSHs = nearestObjects [player , ["HOUSE"], 7000] select {count (_x buildingPos -1) > 2};
							_NearSHs = nearestObjects [player , ["HOUSE"], 500] select {count (_x buildingPos -1) > 2};
							_SHs = _ALLSHs - _NearSHs ; 
							_SH = _SHs - _NOSHs ;


							_HQB = _SH select 0 ;
							
								_markerName = "InvesMark" + (str (getPos _HQB));   
								_mrkr = createMarker [_markerName, (getPos _HQB)];   
								_mrkr setMarkerType "mil_unknown";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								_trgA = createTrigger ["EmptyDetector", (getPos _HQB)];
								_trgA setTriggerArea [2000, 2000, 0, false, 60];
								_trgA setTriggerTimeout [7, 7, 7, true];
								_trgA setTriggerActivation ["WEST", "PRESENT", false];
								_trgA setTriggerStatements [
								"this","

								[thisTrigger] execVM 'Scripts\Mission_Squad.sqf';


								", ""];
						
								sleep 1;
								["showNotification", ["+ NUEVA INTEL", "Inteligencia Militar Recibida", "intel"]] call FLO_fnc_intelSystem;
									_attackingAtGrid = mapGridPosition getMarkerPos _mrkr;
								[[west,"HQ"], "Presencia enemiga confirmada en: " + _attackingAtGrid] remoteExec ["sideChat", 0];
						  };
		};

} ;



if (_Chance < 3) then {
_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf" && markerType _x != "o_Ordnance" && markerType _x != "o_maint" && markerShape _x != "RECTANGLE" && markerShape _x != "ELLIPSE"};
_x = [_INTL,  player] call BIS_fnc_nearestPosition;
_x setMarkerAlpha 1;

								sleep 1;
								["showNotification", ["+ NUEVA INTEL", "Inteligencia Militar Recibida", "intel"]] call FLO_fnc_intelSystem;
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"],  "Presencia enemiga confirmada en: " + _attackingAtGrid] remoteExec ["sideChat", 0];
};


