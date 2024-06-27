private ["_tech_matrix"];


_tech_matrix = 
[
	//CTI_UPGRADE_BARRACKS
	[
		//NATO
		[
			//VAN
			[true,true,true,true,true,true,true]
		],
		//CSAT
		[
			//VAN
			[true,true,true,true,true,true,true]
		],
		//AAF
		[
			//VAN
			[true,true,true,true,true,true,true]
		],
		//LDF
		[
			//VAN
			[true,true,true,true,true,true,true]
		]
	],
	//CTI_UPGRADE_LIGHT
	[
		//NATO
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//CSAT
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//AAF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//LDF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		]
	],
	//CTI_UPGRADE_HEAVY
	[
		//NATO
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//CSAT
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//AAF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//LDF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		]
	],
	//CTI_UPGRADE_AIR
	[
		//NATO
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//CSAT
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//AAF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//LDF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		]
	],
	//CTI_UPGRADE_NAVAL
	[
		//NATO
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//CSAT
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//AAF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		],
		//LDF
		[
			//VAN
			[true,true,true,true,true,true,true,true,true]
		]
	],
	[],[],[],[],[],[],[],
	//CTI_UPGRADE_GEAR
	[
		//NATO
		[
			//VAN
			[true,true,true,true,true,true,true]
		],
		//CSAT
		[
			//VAN
			[true,true,true,true,true,true,true]
		],
		//AAF
		[
			//VAN
			[true,true,true,true,true,true,true]
		],
		//LDF
		[
			//VAN
			[true,true,true,true,true,true,true]
		]
	]
];

missionNamespace setVariable ["CTI_TECHMATRIX", _tech_matrix];
if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Common\Config\Units\Techmatrx.sqf", format ["Techmatrix are defined <%1|%2|%3>", count (_tech_matrix select 0), count (_tech_matrix select 0 select 0), count (_tech_matrix select 0 select 0 select 0)]] call CTI_CO_FNC_Log };