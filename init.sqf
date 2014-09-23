/*
@filename: init.sqf
Author:
	
	Quiksilver

Last modified:

	12/05/2014
	
Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/


call compile preprocessFile "scripts\=BTC=_revive\=BTC=_revive_init.sqf";		// revive

//************************************************** ****************************************

//--------------------- Who can access MCC leave "all" for everbody --------------------------------
//Should be MCC_allowedPlayers = ["12321","1321123"]; 
//Host or server admin will always have access
if (isnil "MCC_allowedPlayers") then {MCC_allowedPlayers = ["76561198046182063","76561197982242370","76561198067659479","76561198078451304"]};

//----------------------General settings---------------------------------------
//Default AI skill
if (isnil "MCC_AI_Skill") then {MCC_AI_Skill = 0.5}; 
if (isnil "MCC_AI_Aim") then {MCC_AI_Aim = 0.1}; 
if (isnil "MCC_AI_Spot") then {MCC_AI_Spot	= 0.3}; 
if (isnil "MCC_AI_Command") then {MCC_AI_Command = 0.5}; 

//---------------------Name Tags---------------------------------------------------
// Show friendly name tags and vhicles' crew info - default - off
if (isnil "MCC_nameTags") then {MCC_nameTags = false}; 

//-------------------- Save Gear --------------------------------------------------
if (isnil "MCC_saveGear") then {MCC_saveGear = false};

//--------------------Gain XP (in role selection)--------------------------------
if (isnil "CP_saveGear") then {CP_saveGear = true};

//-------------------- Group Markers (Role Selection) --------------------------------------------------
if (isnil "MCC_groupMarkers") then {MCC_groupMarkers = true};

//-----------------------Revive - --------------------------------------------
//disable this line if you don't want it in the mission version - will not work on the mod version by default
if (!MCC_isMode) then
{
if (!isDedicated) then 
{
TCB_AIS_PATH = "ais_injury\";
{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});	// execute for every playable unit
};
};

//----------------------IED settings---------------------------------------------
// IED types the first one is display name the second is the classname [displayName, ClassName]
MCC_ied_small = [["Plastic Crates","Land_CratesPlastic_F"],["Plastic Canister","Land_CanisterPlastic_F"],["Sack","Land_Sack_F"],["Road Cone","RoadCone"],["Tyre","Land_Tyre_F"],["Radio","Land_SurvivalRadio_F"],["Suitcase","Land_Suitcase_F"],["Grinder","Land_Grinder_F"],
["MultiMeter","Land_MultiMeter_F"],["Plastic Bottle","Land_BottlePlastic_V1_F"],["Fuel Canister","Land_CanisterFuel_F"],["FM Radio","Land_FMradio_F"],["Camera","Land_HandyCam_F"],["Laptop","Land_Laptop_F"],["Mobile Phone","Land_MobilePhone_old_F"]
,["Smart Phone","Land_MobilePhone_smart_F"],["Longrange Radio","Land_PortableLongRangeRadio_F"],["Satellite Phone","Land_SatellitePhone_F"],["Money","Land_Money_F"]];
MCC_ied_medium = [["Wheel Cart","Land_WheelCart_F"],["Metal Barrel","Land_MetalBarrel_F"],["Plastic Barrel","Land_BarrelSand_F"],["Pipes","Land_Pipes_small_F"],["Wooden Crates","Land_CratesShabby_F"],["Wooden Box","Land_WoodenBox_F"],["Cinder Blocks","Land_Ytong_F"],
["Sacks Heap","Land_Sacks_heap_F"], ["Water Barrel","Land_WaterBarrel_F"],["Water Tank","Land_WaterTank_F"]];
MCC_ied_wrecks = [["Car Wreck","Land_Wreck_Car3_F"],["BRDM Wreck","Land_Wreck_BRDM2_F"],["Offroad Wreck","Land_Wreck_Offroad_F"],["Truck Wreck","Land_Wreck_Truck_FWreck"]];
MCC_ied_mine = [["Mine Field AP - Visable","apv"], ["Mine Field AP - Hidden","ap"],["Mine Field AP Bounding - Visable","apbv"],["Mine Field AP Bounding- Hidden","apb"], ["Mine Field AT - Visable","atv"], ["Mine Field AT - Hidden","at"]];
MCC_ied_hidden = [["Dirt Small","IEDLandSmall_Remote_Ammo"],["Dirt Big","IEDLandBig_Remote_Ammo"],["Urban Small","IEDUrbanSmall_Remote_Ammo"],["Urban Big","IEDUrbanBig_Remote_Ammo"]];

//------------------------Convoy settings----------------------------------------
MCC_convoyHVT = [["None","0"],["B.Officer","B_officer_F"],["B. Pilot","B_Helipilot_F"],["O. Officer","O_officer_F"],["O. Pilot","O_helipilot_F"],["I.Commander","I_officer_F"],["Citizen","C_man_polo_1_F"],
["C.Pilot","C_man_pilot_F"],["Orestes","C_Orestes"],["Nikos","C_Nikos"],["Hunter","C_man_hunter_1_F"],["Kerry","I_G_Story_Protagonist_F"]];
MCC_convoyHVTcar = [["Hunter","B_Hunter_F"],["MRAP","I_MRAP_03_F"],["Quadbike","B_Quadbike_F"],["Ifrit","O_Ifrit_F"],["Offroad","C_Offroad_01_F"],["SUV","C_SUV_01_F"],["Hatchback","C_Hatchback_01_F"]];

//------------------------MCC Console--------------------------------------------
//AC-130 amo count by array [20mm,40mm,105mm]
if (isnil "MCC_ConsoleOnlyShowUnitsWithGPS") then {MCC_ConsoleACAmmo = [500,80,20]}; 

//Group markers 
if (isnil "MCC_ConsoleOnlyShowUnitsWithGPS") then {MCC_ConsoleOnlyShowUnitsWithGPS = true}; //Show only units were the group leader have a GPS or inside vehicle
if (isnil "MCC_ConsoleDrawWP") then {MCC_ConsoleDrawWP = true}; //Draw group's WP on the console	
if (isnil "MCC_ConsoleLiveFeedHelmetsOnly") then {MCC_ConsoleLiveFeedHelmetsOnly = false};	//Allow live feed to vehicles only and units wearing one of the specific helmets types defined in MCC_ConsoleLiveFeedHelmets 
if (isnil "MCC_ConsoleLiveFeedHelmets") then {MCC_ConsoleLiveFeedHelmets = ["H_HelmetB","H_HelmetB_paint","H_HelmetB_light","H _HelmetO_ocamo","H_HelmetLeaderO_ocamo","H_HelmetS pecO_ocamo","H_HelmetSpecO_blk"]};
if (isnil "MCC_ConsoleCanCommandAI") then {MCC_ConsoleCanCommandAI = true}; //If set to false the console can only command non-AI groups
if (isnil "MCC_ConsolePlayersCanSeeWPonMap") then {MCC_ConsolePlayersCanSeeWPonMap = true};	//If set to true players with GPS or UAVTerminal or MCC conosle can see WP assigned to them on the map

//string that must return true inorder to open the MCC Console - str "MCC_Console" + "in (assignedItems player)"; 
if (MCC_isMode) then 
{
MCC_consoleString = str "MCC_Console" + "in (assignedItems _this) && (vehicle _target == vehicle _this)"; 
}
else 
{
MCC_consoleString = str "B_UavTerminal" + "in (assignedItems _this) && (vehicle _target == vehicle _this)"; 
};
//------------------------Artillery---------------------------------------------------
MCC_artilleryTypeArray = [["DPICM","GrenadeHand",0,40],["HE 120mm","Sh_120mm_HE_Tracer_Red",1,30], ["HE 155mm","Sh_155mm_AMOS",1,120], ["Cluster AP","Mo_cluster_AP",3,32],["Mines 120mm","Mine_155mm_AMOS_range",3,120],
["HE Laser-guided","Bo_GBU12_LGB",3,50],["HE 82mm","Sh_82mm_AMOS",1,75], ["Incendiary 82mm","Fire_82mm_AMOS",1,35],
["Smoke White 120mm","Smoke_120mm_AMOS_White",1,20],["Smoke White 82mm","Smoke_82mm_AMOS_White",1,20],["Smoke Green 40mm","G_40mm_SmokeGreen",1,20], ["Smoke Red 40mm","G_40mm_SmokeRed",1,20],
["Flare White","F_40mm_White",2,20], ["Flare Green","F_40mm_Green",2,20], ["Flare Red","F_40mm_Red",2,20]];
MCC_artillerySpreadArray = [["On-target",0], ["Precise",100], ["Tight",200], ["Wide",400]]; //Name and spread in meters
MCC_artilleryNumberArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20 ,21,22,23,24,25,26,27,28,29,30];
MCC_artilleryEnabled	= false; //for artillery marker
MCC_spawnEnabled	= false; //for spawn marker
//-------------------------MCC Convoy presets---------------------------------------------
//The Type of units, drivers and escort in the HVT car
MCCConvoyWestEscort = "B_Soldier_F"; MCCConvoyWestDriver = "B_Soldier_SL_F";
MCCConvoyEastEscort = "O_Soldier_F"; MCCConvoyEastDriver = "O_Soldier_SL_F";
MCCConvoyGueEscort = "GUE_Soldier_1"; MCCConvoyGueDriver = "GUE_Soldier_CO";
MCCConvoyCivEscort = "C_man_1_1_F"; MCCConvoyCivDriver = "C_man_1_1_F";

//----------------------------Presets---------------------------------------------------------
mccPresets = [ 
['======= Artillery =======','']
,['Ambient Artillery - Cannon', '[0,_this] spawn MCC_fnc_amb_Art;']
,['Ambient Artillery - Rockets', '[1,_this] spawn MCC_fnc_amb_Art;']
,['Forward Observer Artillery', '[0,_this] execVM "'+MCC_path+'mcc\general_scripts\artillery\bon_art . sqf";']
,['Ambient AA - Cannon/Rockets', '[2,_this] spawn MCC_fnc_amb_Art;']
,['Ambient AA - Search Light', '[3,_this] spawn MCC_fnc_amb_Art;']
,['', '']
,['======= Units =======','']
,['Recruitable', '_this addAction [format ["Recruit %1", name _this], "'+MCC_path+'mcc\general_scripts\hostages\hostage. s qf",[2],6,false,true];']
,['Make Hostage', '_this execVM "'+MCC_path+'mcc\general_scripts\hostages\create_h o stage.sqf";']
,['Join player', '[_this] join (group player);']
,['Set Renegade', '_this addrating -2001;']
,['Stand Up', '_this setUnitPos "UP";']
,['Kneel', '_this setUnitPos "Middle";']
,['Prone', '_this setUnitPos "DOWN";']
,['Remove All Weapons', 'removeAllWeapons _this;']
,['Remove All Items', 'removeAllItems _this;']
,['Can be controled using MCC Console', '(group _this) setvariable ["MCC_canbecontrolled",true,true];']
,['', '']
,['======= Vehicles =======','']
,['Set Empty (Fuel)', '_this setfuel 0;']
,['Set Empty (Ammo)', '_this setvehicleammo 0;']
,['Set Empty (Cargo)', 'clearMagazineCargoGlobal _this; clearWeaponCargoGlobal _this; clearItemCargoGlobal _this;']
,['Set Locked', '_this setVehicleLock "LOCKED";']
,['Clear Cargo', 'clearMagazineCargo _this; clearWeaponCargo _this; clearItemCargo _this;']
,['Add Crew (UAV)','createVehicleCrew _this;group _this setvariable ["MCC_canbecontrolled",true,true];']
,['ECM - can jamm IED','if (isServer) then {_this setvariable ["MCC_ECM",true,true]};']
,['HQ Vehicle - create FOB','_this addAction ["<t color=""#99FF00"">Create FOB </t>", "'+MCC_path+'scripts\player\createFOB.sqf",[],6,false, false,"teamSwitch","(driver vehicle _target == _this) && (speed (vehicle _target) == 0)"];']
,['', '']
,['======= Objects =======','']
,['Pickable Object','_this call MCC_fnc_pickItem;']
,['Disable Simulation','_this enableSimulation false;']
,['Destroy Object', '_this setdamage 1;']
,['Flip Object', '[_this ,0, 90] call bis_fnc_setpitchbank;']
,['Virtual Ammobox System (VAS)', '_this addAction ["<t color=""#ff1111"">Virtual Ammobox </t>", "VAS\open.sqf"];']
,['Destroyable by satchels only', '_this addEventHandler ["handledamage", {if ((_this select 4) in ["SatchelCharge_Remote_Ammo","DemoCharge_Remote_Amm o"]) then {(_this select 0) setdamage 1;(_this select 3) addRating 1500} else {0}}];']
,['', '']
,['======= Effects =======','']
,['Sandstorm','[_this] call BIS_fnc_sandstorm;']
,['Flies','[getposatl _this] call BIS_fnc_flies;']
,['Smoke','if (isServer) then {_effect = "test_EmptyObjectForSmoke" createVehicle (getpos _this);_effect setpos (getpos _this)};']
,['Fire','if (isServer) then {_effect = "test_EmptyObjectForFireBig" createVehicle (getpos _this);_effect setpos (getpos _this)};']
,['', '']
,['======= Misc =======','']
,['Create Local Marker', '_this execVM "'+MCC_path+'mcc\general_scripts\create_local_mark e r.sqf";']
];

// Pregenerated frequencies by [STELS] Zealot
// Use from init.sqf:// Use from init.sqf:
// [] ExecVM "zlt_gen_freqs.sqf";// [] ExecVM "zlt_gen_freqs.sqf";
// Or ['a3ru'] execVM "zlt_gen_freqs.sqf"; for arma3.ru frequencies// Or ['a3ru'] execVM "zlt_gen_freqs.sqf"; for arma3.ru frequencies
/ */ *
Changelog:

1R
- Added support for Desert_E map

* /

#define SCRIPT_VERSION "1R"#define SCRIPT_VERSION "1R"

#define STR_HELP "Generation of radio frequencies by default (Author: Zealot) <br/> script writes during a briefing on the map proposed random frequency in the upper left corner of the map. <br/> Version:" + SCRIPT_VERSION#define STR_HELP "Generation of radio frequencies by default (Author: Zealot) <br/> script writes during a briefing on the map proposed random frequency in the upper left corner of the map. <br/> Version:" + SCRIPT_VERSION
#define STR_SCRIPTS_NAME "Scripts"#define STR_SCRIPTS_NAME "Scripts"
#define STR_SCRIPT_NAME "Generation of radio frequencies"#define STR_SCRIPT_NAME "Generation of radio frequencies"

#define STR_LR_STRING "DV% 1 MHz (Offset:% 2)"#define STR_LR_STRING "DV% 1 MHz (Offset:% 2)"
#define STR_MAP_HDR "Proposed frequency"#define STR_MAP_HDR "Proposed frequency"


// Private ["_radio_t"];// Private ["_radio_t"];

zlt_genfreq_radio_t = [_this, 0, "TF"] call bis_fnc_param;zlt_genfreq_radio_t  =  [ _this ,  0 ,  "TF" ] call bis_fnc_param ;
zlt_genfreq_radio_t = toUpper (zlt_genfreq_radio_t);zlt_genfreq_radio_t  = toUpper ( zlt_genfreq_radio_t );

_radio = [-2,2,32,64,100,400];=  [- 2 , 2 , 32 , 64 , 100 , 400 ];


if (zlt_genfreq_radio_t == "A3RU") then {if  (  zlt_genfreq_radio_t  ==  "A3RU"  )  then  {
	_radio = [-2,2,5,18,100,400];=  [- 2 , 2 , 5 , 18 , 100 , 400 ];
};};

if (zlt_genfreq_radio_t == "TF") then {if  (  zlt_genfreq_radio_t  ==  "TF"  )  then  {
	if (not isClass (configFile >> "CfgPatches" >> "task_force_radio_items")) exitwith {zlt_genfreq_radio_t = ""; };if  ( not isclass ( configFile >>  "CfgPatches"  >>  "task_force_radio_items" )) exitWith {  zlt_genfreq_radio_t  =  "" ;  };

	tf_same_sw_frequencies_for_side = false;=  false ;
	tf_same_lr_frequencies_for_side = true;	=  True ;	
};};

zlt_prc_freq_updmarkers = {=  {

	_zlt_genfreq_xmap = 0;=  0 ;
	_zlt_genfreq_ymap = 8000;=  8000 ;
	_zlt_genfreq_deltamap = 250;	=  250 ;	

	switch (worldName) do {Switch  ( worldName )  do  {
		case ("Altis"): {Case  ( "Altis" )  :  {
			_zlt_genfreq_xmap = 1000;=  1000 ;
			_zlt_genfreq_ymap = 30000;=  30000 ;
			_zlt_genfreq_deltamap = 500;	=  500 ;	
		};	};	
		case ("Stratis"): {Case  ( "Stratis" )  :  {
			_zlt_genfreq_xmap = 0;=  0 ;
			_zlt_genfreq_ymap = 8000;=  8000 ;
			_zlt_genfreq_deltamap = 250;=  250 ;
		};};
		case ("Chernarus"): {Case  ( "Chernarus" )  :  {
			_zlt_genfreq_xmap = 0;=  0 ;
			_zlt_genfreq_ymap = 15000;=  15,000 ;
			_zlt_genfreq_deltamap = 250;	=  250 ;	
		};};
		case ("Takistan"): {Case  ( "Takistan" )  :  {
			_zlt_genfreq_xmap = 0;=  0 ;
			_zlt_genfreq_ymap = 14000;=  14000 ;
			_zlt_genfreq_deltamap = 250;	=  250 ;	
		};		};		
		case ("Zargabad"): {Case  ( "Zargabad" )  :  {
			_zlt_genfreq_xmap = 0, =  0 ;
			_zlt_genfreq_ymap =  8000 ;
			_zlt_genfreq_deltamap =  100 ;	
		};
		Case ( "plr_mana" ): {
			_zlt_genfreq_xmap =  0 ;
			_zlt_genfreq_ymap =  5000 ;
			_zlt_genfreq_deltamap =  100 ;	
		};
		Case ( "Desert_E" ): {
			_zlt_genfreq_xmap =  0 ;
			_zlt_genfreq_ymap =  2000 ;
			_zlt_genfreq_deltamap =  25 ;	
		};		
	};

	_zlt_spawnSetLrChannel =  {
		if  ( Leader Group Player == Player )  then  {
			_this Spawn {					
					waituntil { sleep 0.1 ; Player TFAR_fnc_haveLRRadio call ;};
					sleep 0.5 ;
					_val = str ( _this );					
					[( call TFAR_fnc_activeLrRadio )  select  0 ,  ( call TFAR_fnc_activeLrRadio )  select  1 , _val ] call TFAR_fnc_setLrFrequency ;
					if  ( dialog )  then  {
						call TFAR_fnc_updateLRDialogToChannel ;
					};
					
			};
		};
	};
	
	_zlt_fnc_printfrq =  {
	
		_str = _this ;
		_txt =  "" ;
		_mcolor =  "" ;
		
		Switch  (  typename  ( _str select  0 ))  do  {
			case  (  typename east )  :  { _txt = format [ STR_LR_STRING , _str select  1 , _str select  2 ]; _mcolor =  ([  ( _str select  0 )  ,  true ] call bis_fnc_sidecolor );  };
			Case  (  typename grpnull )  :  { _txt = Format [ "% 1:% 2 MHz" , GroupID ( _str select  0 ) + "(" + name Leader ( _str select  0 )  + ")" , _str select  1 ]; _mcolor =  [ Side ( _str select  0 )  ,  True ] call bis_fnc_sidecolor ;  };
			Default  { _txt = STR_MAP_HDR ; _mcolor =  [ playerside ,  True ] call bis_fnc_sidecolor ;  };
		};
		
		_mname = Format [ "mrk_freq_% 1" , _zlt_genfreq_ymap ];
		createMarkerLocal [ _mname ,  [ _zlt_genfreq_xmap , _zlt_genfreq_ymap ]];
		_mname setMarkerTypeLocal "mil_dot" ;
		_mname setMarkerTextLocal _txt ;
		_mname setMarkerColorLocal _mcolor ;
		_mname setmarkerposlocal [ _zlt_genfreq_xmap , _zlt_genfreq_ymap ];

		_zlt_genfreq_ymap = _zlt_genfreq_ymap - _zlt_genfreq_deltamap ;
	};


	_friends =  ([ Side Player ] call BIS_fnc_friendlySides )  -  [ Civilian ];
	_friendsids =  [];
	_playersideid =  [ playerside ] call BIS_fnc_sideID ;
	[ "" ] call _zlt_fnc_printfrq ;

	( zlt_pub_gen_frequencies select _playersideid ) call _zlt_fnc_printfrq ;

	{
		// If (typename (_x select 0) == typename grpNull and {side (_x select 0) in _friends} and {leader (_x select 0) in playableunits}) then {		
		if  (  typename  ( _x select  0 )  ==  typename grpNull and  { side ( _x select  0 )  in _friends }  and  { leader ( _x select  0 )  in allUnits }  )  then  {		
			_x call _zlt_fnc_printfrq ;
		};
	}  foreach zlt_pub_gen_frequencies ;

	if  ( zlt_genfreq_radio_t  ==  "TF"  )  then  {
		(( zlt_pub_gen_frequencies select _playersideid )  select  1 ) call _zlt_spawnSetLrChannel ;
	};

};


if  ( hasInterface )  then  {
	[] Spawn {			
		waitUntil { Player == Player };
		Player createDiarySubject [ STR_SCRIPTS_NAME , STR_SCRIPTS_NAME ];
		Player createDiaryRecord [ STR_SCRIPTS_NAME , [ STR_SCRIPT_NAME , STR_HELP ]];				

		waitUntil {! isNil "zlt_pub_gen_frequencies" };
		
		if  ( playerside == Civilian ) exitWith {};
	
		[] call zlt_prc_freq_updmarkers ;
	};
};


if  ( isServer or isDedicated )  then  {
	_fnc_genfreq =  {
		Private  [ "_state" , "_num" , "_isinbl" , "_l1" , "_l2" ];
		_state = _this select  0 ; 
		if  ( isNil "zlt_freqblacklist" )  then  {
			zlt_freqblacklist =  [ 0 ];
		};

		_num =  0 ;
		_l1 = _radio select  0 ;
		_l2 = _radio select  1 ;
		_isinbl =  True ;
		if  ( _state ==  0 )  then  {
			_l1 = _radio select  2 ; _l2 = _radio select  3 ;
		};
		if  ( _state ==  1 )  then  {
			_l1 = _radio select  4 ; _l2 = _radio select  5 ;
		};

		while  { _isinbl }  do  {
			_num = Round (([ _l1 , _l2 ] call bis_fnc_randomnum )  *  10 )  /  10  ;
			if  not  ( _num in zlt_freqblacklist )  then  {
				 zlt_freqblacklist set  [ Count zlt_freqblacklist , _num ];
				_isinbl =  false ;
			};
		};
		_num ;
	};

	_zlt_pub_gen_frequencies =  [];

	{
		_num =  0 ;
		_sdv =  0 ;
		Switch  True  do  {
			Case  ( _x == resistance and  ([ west , resistance ] call BIS_fnc_areFriendly )  )  :  {
				_num =  ( _zlt_pub_gen_frequencies select  1 )  select  1 ;
				_sdv =  ( _zlt_pub_gen_frequencies select  1 )  select  2 ;
			};
			Case  ( _x == resistance and  ([ east , resistance ] call BIS_fnc_areFriendly )  )  :  {
				_num =  ( _zlt_pub_gen_frequencies select  0 )  select  1 ;
				_sdv =  ( _zlt_pub_gen_frequencies select  0 )  select  2 ;
			};
			Default  {
				_num =  [ 0 ] call _fnc_genfreq ;
				_sdv =  [ 2 ] call _fnc_genfreq ;
			};	
		};
		_data =  [ _x , _num , _sdv ]; 
		
		_zlt_pub_gen_frequencies set  [ Count _zlt_pub_gen_frequencies ,   _data ];
	}  foreach  [ east , west , resistance ];
	
	call TFAR_fnc_processGroupFrequencySettings ;
	{
		_num =  [ 1 ] call _fnc_genfreq ;
		_zlt_pub_gen_frequencies set  [ Count _zlt_pub_gen_frequencies ,  [ _x , _num ]  ];				
		if  ( zlt_genfreq_radio_t  ==  "TF" )  then  {
			_vl3 = _x getvariable "tf_sw_frequency" ; 			
			( _vl3 select  2 )  set  [ 0 , str ( _num )];
			_x SetVariable [ "tf_sw_frequency" , _vl3 ,  True ];
		};
	}  foreach allgroups ;
	
	zlt_pub_gen_frequencies = _zlt_pub_gen_frequencies ;
	publicVariable "zlt_pub_gen_frequencies" ;
	
};