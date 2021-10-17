/*
    Author: Karel Moricky

    Description:
    Show feedback message when illegal operation is attempted in curator interface

    Parameter(s):
        0: OBJECT - curator
        1: NUMBER or STRING - error ID or message to be displayed

    Returns:
    BOOL
*/

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

params ["_curator","_id","_time","_message"];
_curator = _this param [0,objnull,[objnull]];
_id = _this param [1,-1,[0,""]];

_time = missionnamespace getvariable ["bis_fnc_showcuratorfeedbackmessage_time",-1];
if (_time > time) exitwith {};
missionnamespace setvariable ["bis_fnc_showcuratorfeedbackmessage_time",time + 0.1];


disableserialization;
private ["_display","_ctrlMessage"];
_display = finddisplay IDD_RSCDISPLAYCURATOR;
_ctrlMessage = _display displayctrl IDC_RSCDISPLAYCURATOR_FEEDBACKMESSAGE;
_ctrlMessage ctrlSetBackgroundColor [0.5,0,0,1];
_ctrlMessage ctrlsettext _message;
_ctrlMessage ctrlsetfade 1;
_ctrlMessage ctrlcommit 0;
_ctrlMessage ctrlsetfade 0;
_ctrlMessage ctrlcommit 0.1;

if !(isnil "BIS_fnc_moduleCurator_feedbackMessage") then {terminate BIS_fnc_moduleCurator_feedbackMessage;};
BIS_fnc_moduleCurator_feedbackMessage = [_ctrlMessage] spawn {
    disableserialization;
    uisleep 3;
    _ctrlMessage = _this select 0;
    _ctrlMessage ctrlsetfade 1;
    _ctrlMessage ctrlcommit 0.5;
};
true