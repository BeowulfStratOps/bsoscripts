//
// null = [this, true] execVM "bso_autocombat.sqf";
//


// Selects the group leader.
_murker = _this select 0;
_case = _this select 1;


switch (_case) do {


case true: 
	{ 	
		{
			_x disableAI "AUTOCOMBAT";
			_x disableAI "TARGET";
			_x disableAI "AUTOTARGET";
			_x disableAI "COVER";
			_x disableAI "SUPPRESSION";
			_x disableAI "FSM";
			_x enableAttack false;
		} forEach units group _murker;	

	(group _murker) setVariable ["Vcm_Disable",true];		
	}; 	
	  
case false: 
	{ 	
		{
			_x enableAI "AUTOCOMBAT";
			_x enableAI "TARGET";
			_x enableAI "AUTOTARGET";
			_x enableAI "COVER";
			_x enableAI "SUPPRESSION";
			_x enableAI "FSM";
			_x enableAttack true;
		} forEach units group _murker;	

	(group _murker) setVariable ["Vcm_Disable",false];		
	}; 	 	  
	
};
	
	