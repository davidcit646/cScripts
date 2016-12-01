/*
 * Author: CPL.Brostrom.A 
 * This functon create diary records to all players.
 *
 * Arguments:
 *
 * Example:
 * call cScripts_fnc_initDocuments;
 */

#include "..\script_component.hpp";

waitUntil {!isNull player && player == player};

// Add New Topic (7th Cavalry)
if(player diarySubjectExists "7Cav")exitwith{};
player createDiarySubject ["7Cav","7th Cavalry"];

// Load diary records (NOTE! The load order is reversed. So the top will be at the bottom after load.)

call FUNC(Doc_MissionControl);
call FUNC(Doc_Info);

// Add New Topic (Radio Reports)
if(player diarySubjectExists "radioReports")exitwith{};
player createDiarySubject ["radioReports","Radio Reports"];

// Load diary records (NOTE! The load order is reversed. So the top will be at the bottom after load.)

call FUNC(DocRadio_LACEACE);
call FUNC(DocRadio_MEDEVAC);
call FUNC(DocRadio_ROTARYPICKUP);
call FUNC(DocRadio_SPOTREP);
