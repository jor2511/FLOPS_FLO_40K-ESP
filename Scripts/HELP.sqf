_Civl = _this select 0 ;

_ChanceN = selectRandom [1, 2, 3]; 

if ((_Civl getUnitTrait "engineer" == true) && (_ChanceN > 1)) then {	
_complMessage = selectRandom ["No necesitamos tu ayuda forastero, aléjate, ¡Dios maldiga a todos ustedes!", "¿Quieres ayudar? Haz vivo a mi hermanito que mataste, vete a la mierda, ¡Dios los matará a todos!", "Pagarán por lo que le hicieron a nuestro país, ¡No te voy a decir nada!", "¡No necesitamos tu ayuda, SOLO LÁRGATE!", "Tus hombres hicieron que mis hermanos y hermanas inocentes sufrieran y murieran, ¡Jódete, JÓDETE A TI Y A TODOS USTEDES!"];
["Civilian", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];

		}else{

				_Chance = selectRandom [1, 2, 3, 4]; 

				if (_Chance == 1) then {
					
							execVM "Scripts\CIVM_1.sqf";
							["Civilian", "He oído que algunos de ustedes son ingenieros. Uno de los locales ha tenido problemas con su vehículo en algún lugar de la carretera. ¿Creen que pueden ayudar?"] remoteExec ["BIS_fnc_showSubtitle", 0];
							};				

				if (_Chance == 2) then {
					
							execVM "Scripts\CIVM_2.sqf";
							["Civilian", "Este vecindario se queda sin suministros y la IDAP no acepta el riesgo. ¿Pueden ayudar a la gente de aquí?"] remoteExec ["BIS_fnc_showSubtitle", 0];
							};

				if (_Chance == 3) then {
					
							execVM "Scripts\CIVM_3.sqf";
							["Civilian", "Nuestros vecinos encontraron un campo minado de la manera más difícil cerca de esta zona. ¿Pueden sus ingenieros echar un vistazo?"] remoteExec ["BIS_fnc_showSubtitle", 0];
							};


				if (_Chance == 4) then {
								
							[_Civl] execVM "Scripts\CIVM_4.sqf";
							["Civilian", "Sabemos que estaban buscando insurgentes, se les ha visto por estos caminos algunas noches. ¿Pueden crear puestos de control?"] remoteExec ["BIS_fnc_showSubtitle", 0];
							};

};
