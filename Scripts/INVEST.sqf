_mrkrs = allMapMarkers select {markerColor _x == "Color4_FD_F"};
_mrkr = _mrkrs select 0;
_REPSCORE = parseNumber (markerText _mrkr) ;  
_Civl = _this select 0 ;

_ChanceN = selectRandom [1, 2, 3]; 

		if ((_Civl getUnitTrait "engineer" == true) && (_ChanceN > 1)) then {	
_complMessage = selectRandom ["¡MUERTE A LOS FORASTEROS, MUERTE A LOS FORASTEROS!!!", "Lárguense, bastardos... ¡Solo traen caos y destrucción!", "¡Pagarán por lo que han hecho a nuestro país, no les diré una mierda!", "¡Que DIOS nos salve de sus malvadas cadenas, demonios! ¡Que DIOS los condene a todos!", "¡Sus hombres hicieron sufrir y morir a mis hermanos y hermanas inocentes, ¡QUE SE JODAN TODOS!!!"];
["Civilian", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];

		}else{
			
				if (_REPSCORE > 10) then {
					
											_Chance = selectRandom [3, 4, 5]; 

											if (_Chance > 3) then {
												
											_Cost = 5;
											_mrkrs = allMapMarkers select {markerColor _x == "Color2_FD_F"};
											_mrkr = _mrkrs select 0;
											_Money = parseNumber (markerText _mrkr) ;  
											if (_Money >= _Cost) then {
											_NewMoney = _Money - _Cost; 
											_mrkr setMarkerText str _NewMoney;


											execVM "Scripts\INTL_Civ.sqf";
											_complMessage = selectRandom ["¡Claro, déjame mostrarte el camino!", "Agradecemos tus esfuerzos por nuestra patria, ¡déjame ayudarte!", "¡Sí, ven, conozco algunos!"];
											["Civilian", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
											}else{hint "Not enough Resources"; };
											} else {
												
											_complMessage = selectRandom ["¡No hablamos con extraños!", "No sé mucho sobre esta región.", "Lo siento, pero no confío en ustedes forasteros.", "¡Tal vez ese hombre allá pueda ayudarte, estuvo en el ejército hace años!"];
											["Civilian", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
											};

				} else {
					
											_Chance = selectRandom [1, 2, 3]; 

											if (_Chance > 2) then {
												
											_Cost = 5;
											_mrkrs = allMapMarkers select {markerColor _x == "Color2_FD_F"};
											_mrkr = _mrkrs select 0;
											_Money = parseNumber (markerText _mrkr) ;  
											if (_Money >= _Cost) then {
											_NewMoney = _Money - _Cost; 
											_mrkr setMarkerText str _NewMoney;

												
											execVM "Scripts\INTL_Civ.sqf";
											_complMessage = selectRandom ["¡Claro, déjame mostrarte el camino!", "Agradecemos tus esfuerzos por nuestra patria, ¡déjame ayudarte!", "¡Sí, ven, conozco algunos!"];
											["Civilian", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
											}else{hint "Not enough Resources"; };
											} else {
												
											_complMessage = selectRandom ["¡No hablamos con extraños!", "No sé mucho sobre esta región.", "Lo siento, pero no confío en ustedes forasteros.", "¡Tal vez ese hombre allá pueda ayudarte, estuvo en el ejército hace años!"];
											["Civilian", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
											};

				};

};
