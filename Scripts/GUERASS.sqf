_mrkrs = allMapMarkers select {markerColor _x == "Color4_FD_F"};
_mrkr = _mrkrs select 0;
_REPSCORE = parseNumber (markerText _mrkr) ;  
_Civl = _this select 0 ;

sleep 3 ;

	
				if (_REPSCORE > 10) then {
					
				NewGuerGroup = createGroup West; 

											_complMessage = selectRandom ["¡Claro, déjanos luchar contigo, Capitán!","Apreciamos sus esfuerzos por nuestra patria, ¡los ayudaremos!","¡Ey, muchachos, equípense, vamos a trabajar!"];
											["Militia", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];

					{ {
							_x enableAI 'ANIM';
							_x enableAI 'PATH';
							_x switchMove '';
							[_x, ''] remoteExec ['playMove', _x];		
							_x setBehaviour 'AWARE';
							[_x] join NewGuerGroup; 
							_x removeAllEventHandlers "Killed";
							removeAllActions _x;
					} foreach (allUnits select {side _x == independent && captive _x == false && (getPos _x) distance (position player) < 200}); 
					} remoteExec ["call", 0];	


				} else {


												
											_complMessage = selectRandom ["¡No hablamos con extraños!","No sé mucho sobre esta región.","Lo siento, pero no confío en los forasteros.","Tal vez ese hombre de allí pueda ayudarte, estuvo en el ejército hace años."


];
											["Militia", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];


				};

sleep 3 ;


			private _headlessClients = entities "HeadlessClient_F";
			private _humanPlayers = allPlayers - _headlessClients;
			hcRemoveAllGroups player;  
			 {player hcRemoveGroup _x ;} forEach (allGroups select {side _x == west}); 
			 _GRPs = (allGroups select {(side _x == (side player)) && !(((units _x) select 0) in switchableUnits)}); 
			if (count _humanPlayers == 1 ) then {
			{player hcSetGroup [_x];} forEach _GRPs;
			}else{
			{TheCommander hcSetGroup [_x];} forEach _GRPs;
			};
