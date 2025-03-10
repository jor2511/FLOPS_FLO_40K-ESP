

_CRVEH = _this select 0;

titleText ["Colocando Cargas Krak . . .", "BLACK IN",9999];
sleep 2 ;
titleText ["Colocando Cargas Krak. . .", "BLACK IN",1];


["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 10</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 9</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 8</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 7</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 6</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 5</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 4</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 3</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>LIMPIO<br />Explotando en 2</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;

[_CRVEH, "Sh_82mm_AMOS", 0, 1, 1] spawn BIS_fnc_fireSupportVirtual;
sleep 1.5 ;
_CRVEH setdamage 1;

				[30, "TECHNOLOGY"] call FLO_fnc_notification ;

[30] call FLO_fnc_addReward;

 
 sleep 6 ;

 
