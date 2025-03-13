
if (((serverCommandAvailable "#kick")  &&  (serverCommandAvailable "#debug") && (isMultiplayer)) or ((backpack player == "B_RadioBag_01_wdl_F") or (backpack player == "B_RadioBag_01_mtp_F")) or !(isMultiplayer)) then {

closeDialog 0;

SatTrack = false ;

openMap [true, true]; 
hint "Seleccione Coordinador Satelital"; 
onMapSingleClick {
onMapSingleClick {}; 
TSAT setpos _pos;
hint 'Confirmada Coordinacion Satelital'; 
openMap [true, false];  
openMap [false, false]; 
createDialog "Enlace_Armada_Imperial";
HCAM_0 cameraEffect ["Internal", "Back", "HCAM_S"]; 
hint ""; 

};

} else { hint "Solo Personal Autorizado";};
