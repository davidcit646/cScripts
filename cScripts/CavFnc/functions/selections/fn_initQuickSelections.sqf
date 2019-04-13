#include "..\script_component.hpp";
/*
 * Author: CPL.Brostrom.A
 * This function contain quick selection buttons and categorys.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Size Type <SIZE> ["none","alpha","bravo","charlie","ranger","medical","full"]
 * 2: Require correct company to select loadout. <BOOL> (default: true)
 *
 * Example:
 * [this] call cScripts_fnc_initQuickSelections;
 * [this,"full",true] call cScripts_fnc_initQuickSelections;
 */
params [
    ["_object", objNull, [objNull]],
    ["_companySelectorType", "none"],
    ["_allowOnlyForCompany", true]
];

// Set upper case
_companySelector = toUpper(_companySelectorType);

if (_companySelector == "" OR _companySelector == "NONE") exitWith {};

#ifdef DEBUG_MODE
    [format["Setting up %1 loadouts selecton list on %2...", _companySelector, _object]] call FUNC(logInfo);
#endif

// Define the icon to be used
private _icon = "cScripts\Data\Icon\icon_01.paa";

// Create the main selection menu
[_object,"cScriptQuickSelectionMenu","Quick Selection",_icon,["ACE_MainActions"]] call FUNC(addAceCategory);


// Create categories
private _officer = ["OFFICER"];
private _alpha = ["ALPHA"];
private _bravo = ["BRAVO", "VIKING", "APOLLO", "MUSTANG"];
private _charlie = ["CHARLIE", "BANDIT", "MISFIT"];

// Full selector handler
private _alwaysAvalible = if (_companySelector == 'FULL') then {true} else {false};

// Loadouts
//          O F F I C E R   L O A D O U T S
if (_companySelector in _officer or _alwaysAvalible) then {
    [_object,"cScriptQuickSelection_Officer", "Officers", _icon, ["ACE_MainActions","cScriptQuickSelectionMenu"]] call FUNC(addAceCategory);
    private _officerCoCat = ['ACE_MainActions', 'cScriptQuickSelectionMenu', 'cScriptQuickSelection_Officer'];
    
    [_object,"Air Controller", "Cav_B_A_AirController_F", "", _officerCoCat, "Officer", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Officer", "Cav_B_A_Officer_F", "", _officerCoCat, "Officer", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Joint Fires Observer", "Cav_B_A_JFO_F", "", _officerCoCat, "Officer", _allowOnlyForCompany] call FUNC(addQuickSelection);
};

//          A L P H A   C O M P A N Y   L O A D O U T S
if (_companySelector in _alpha or _alwaysAvalible) then {
    [_object,"cScriptQuickSelection_Alpha", "Alpha", _icon, ["ACE_MainActions","cScriptQuickSelectionMenu"]] call FUNC(addAceCategory);
    private _alphaCoCat = ['ACE_MainActions', 'cScriptQuickSelectionMenu', 'cScriptQuickSelection_Alpha'];
    
    // Loadouts
    [_object,"Rotary Pilot", "Cav_B_A_Helicopter_Tra_Pilot_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rotary CoPilot", "Cav_B_A_Helicopter_Tra_coPilot_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rotary Crew Chief", "Cav_B_A_Helicopter_Tra_CrewChief_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Crew Chief M240", "Cav_B_A_Helicopter_Tra_CrewChiefM240_Local", "", _alphaCoCat, "Alpha", _addActionAllowedOnCompany] call FUNC(addQuickSelection);
    [_object,"Rotary Door Gunner", "Cav_B_A_Helicopter_Tra_DoorGunner_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);

    [_object,"Attack Rotary Pilot", "Cav_B_A_Helicopter_Tra_DoorGunner_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Attack Rotary CoPilot", "Cav_B_A_Helicopter_Att_coPilot_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);

    [_object,"Fighter Pilot", "Cav_B_A_Plane_Fighter_Pilot_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);

    [_object,"Fixed Wing Pilot", "Cav_B_A_Plane_Transport_Pilot_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Fixed Wing CoPilot", "Cav_B_A_Plane_Transport_coPilot_F", "", _alphaCoCat, "Alpha", _allowOnlyForCompany] call FUNC(addQuickSelection);
};

//          B R A V O   C O M P A N Y   L O A D O U T S
if (_companySelector in _bravo or _alwaysAvalible) then {
    [_object,"cScriptQuickSelection_Bravo","Bravo",_icon,["ACE_MainActions","cScriptQuickSelectionMenu"]] call FUNC(addAceCategory);
    private _bravoCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Bravo'];
    
    // Loadouts Viking
    [_object,"cScriptQuickSelection_Bravo_Viking","Viking",_icon,["ACE_MainActions","cScriptQuickSelectionMenu","cScriptQuickSelection_Bravo"]] call FUNC(addAceCategory);
    private _bravoVikingCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Bravo','cScriptQuickSelection_Bravo_Viking'];

    [_object,"Platoon Sergeant", "Cav_B_B_PlatoonSergeant_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Platoon Leader", "Cav_B_B_PlatoonLeader_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Platoon Medic", "Cav_B_B_PlatoonMedic_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);

    [_object,"Squad Leader", "Cav_B_B_SquadLeader_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Fire Team Leader", "Cav_B_B_Alpha_FireTeamLeader_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Automatic Rifleman", "Cav_B_B_Alpha_AutomaticRifleman_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Grenadier", "Cav_B_B_Alpha_Grenadier_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman", "Cav_B_B_Alpha_Rifleman_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman (AT)", "Cav_B_B_Alpha_RiflemanAT_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman (LAT)", "Cav_B_B_Alpha_RiflemanLAT_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Combat Life Saver", "Cav_B_B_Alpha_CombatLifeSaver_F", "", _bravoVikingCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);

    // Loadouts Mustang
    [_object,"cScriptQuickSelection_Bravo_Mustang","Mustang",_icon,["ACE_MainActions","cScriptQuickSelectionMenu","cScriptQuickSelection_Bravo"]] call FUNC(addAceCategory);
    private _bravoMustCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Bravo','cScriptQuickSelection_Bravo_Mustang'];
    
    [_object,"Team Leader", "Cav_B_B_TeamLeader_Mustang_F", "", _bravoMustCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Combat Medic", "Cav_B_B_Mustang_CombatMedic_F", "", _bravoMustCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);

    // Loadouts Apollo
    [_object,"cScriptQuickSelection_Bravo_Apollo","Apollo",_icon,["ACE_MainActions","cScriptQuickSelectionMenu","cScriptQuickSelection_Bravo"]] call FUNC(addAceCategory);
    private _bravoApoCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Bravo','cScriptQuickSelection_Bravo_Apollo'];

    [_object,"Ops Officer", "Cav_B_B_LogisticsOpsOfficer_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Ops NCO", "Cav_B_B_LogisticsOpsNCO_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Team Leader", "Cav_B_B_LogisticTeamLeader_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Team Member", "Cav_B_B_LogisticsTeamMember_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);

    // Loadouts Sabre
    [_object,"cScriptQuickSelection_Bravo_Saber","Saber",_icon,["ACE_MainActions","cScriptQuickSelectionMenu","cScriptQuickSelection_Bravo"]] call FUNC(addAceCategory);
    private _bravoApoCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Bravo','cScriptQuickSelection_Bravo_Saber'];

    [_object,"Commander", "Cav_B_B_Tank_Commander_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Driver", "Cav_B_B_Tank_Driver_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Gunner", "Cav_B_B_Tank_Gunner_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Loader", "Cav_B_B_Tank_Loader_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);

    // Loadouts Banshee
    [_object,"cScriptQuickSelection_Bravo_Banshee","Banshee",_icon,["ACE_MainActions","cScriptQuickSelectionMenu","cScriptQuickSelection_Bravo"]] call FUNC(addAceCategory);
    private _bravoApoCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Bravo','cScriptQuickSelection_Bravo_Banshee'];

    [_object,"Commander", "Cav_B_B_Ifv_Commander_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Driver", "Cav_B_B_Ifv_Driver_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Gunner", "Cav_B_B_Ifv_Gunner_F", "", _bravoApoCoCat, "Bravo", _allowOnlyForCompany] call FUNC(addQuickSelection);
};

//          C H A R L I E   C O M P A N Y   L O A D O U T S
if (_companySelector in _charlie or _alwaysAvalible) then {
    [_object,"cScriptQuickSelection_Charlie","Charlie",_icon,["ACE_MainActions","cScriptQuickSelectionMenu"]] call FUNC(addAceCategory);
    private _charlieCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Charlie'];

    // Loadouts Bandit & Misfit
    [_object,"cScriptQuickSelection_Charlie_Squad","Squad",_icon,["ACE_MainActions","cScriptQuickSelectionMenu","cScriptQuickSelection_Charlie"]] call FUNC(addAceCategory);
    private _charlieSquadCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Charlie','cScriptQuickSelection_Charlie_Squad'];

    [_object,"Platoon Sergeant", "Cav_B_C_PlatoonSergeant_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Platoon Leader", "Cav_B_C_PlatoonLeader_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Platoon Medic", "Cav_B_C_PlatoonMedic_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);

    [_object,"Squad Leader", "Cav_B_C_SquadLeader_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Fire Team Leader", "Cav_B_C_Alpha_FireTeamLeader_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Automatic Rifleman", "Cav_B_C_Alpha_AutomaticRifleman_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Grenadier", "Cav_B_C_Alpha_Grenadier_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman", "Cav_B_C_Alpha_Rifleman_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman (AT)", "Cav_B_C_Alpha_RiflemanAT_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman (LAT)", "Cav_B_C_Alpha_RiflemanLAT_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Combat Life Saver", "Cav_B_C_Alpha_CombatLifeSaver_F", "", _charlieSquadCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    
    // Loadouts Havoc
    [_object,"cScriptQuickSelection_Charlie_Havoc","Havoc",_icon,["ACE_MainActions","cScriptQuickSelectionMenu","cScriptQuickSelection_Charlie"]] call FUNC(addAceCategory);
    private _charlieHavocCoCat = ['ACE_MainActions','cScriptQuickSelectionMenu','cScriptQuickSelection_Charlie','cScriptQuickSelection_Charlie_Havoc'];

    [_object,"Squad Leader", "Cav_B_C_Weap_SquadLeader_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Fire Team Leader", "Cav_B_C_Weap_Alpha_FireTeamLeader_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Automatic Rifleman", "Cav_B_C_Weap_Alpha_AutomaticRifleman_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Grenadier", "Cav_B_C_Weap_Alpha_Grenadier_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman", "Cav_B_C_Weap_Alpha_Rifleman_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman (AT)", "Cav_B_C_Weap_Alpha_RiflemanAT_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Rifleman (LAT)", "Cav_B_C_Weap_Alpha_RiflemanLAT_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
    [_object,"Combat Life Saver", "Cav_B_C_Weap_Alpha_CombatLifeSaver_F", "", _charlieHavocCoCat, "Charlie", _allowOnlyForCompany] call FUNC(addQuickSelection);
};

#ifdef DEBUG_MODE
    [format["Setup of %1 loadouts selecton list on %2 is completed.", _companySelector, _object]] call FUNC(logInfo);
#endif
