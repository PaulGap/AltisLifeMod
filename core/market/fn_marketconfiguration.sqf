/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods

*/

////////////MAIN CONFIG

life_market_resources = [

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	//["gold", 1500, 450, 2300, 8, 5],
	
	["oilp", 5000, 4000, 7000, 4, 2,
		[
			["diamondc",1],
			["iron_r",1],
			["copper_r",1]
		]
	],
	
	["iron_r", 3500, 2200, 5000, 4, 4,  
		[ 
			["diamondc",1], 
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["diamondc", 4500, 3000, 7000, 4, 2, 
		[ 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["glass",1]
		] 
	],
	
	["copper_r", 2300, 1600, 3700, 4, 4,
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1]
		] 
	],
	
	["salt_r", 3300, 2500, 4500, 4, 3,
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1]
		] 
	],
	
	["glass", 2350, 1150, 3450, 4, 3,
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1]
		] 
	],
	
	["cement", 3000, 2500, 4000, 4, 3,
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["glass",1]
		] 
	],
/////////////////////////
	
	["turtle", 30000, 15000, 45000, 4, 4,  
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1]
		] 
	],

	["marijuana", 5500, 4500, 8500, 4, 4,   
		[ 
			["turtle",1], 
			["cocainep",1],
			["heroinp",1]
		] 
	],
	
	["cocainep", 7600, 6500, 12000, 4, 4,   
		[ 
			["marijuana",1], 
			["turtle",1],
			["heroinp",1]
		] 
	],

	["heroinp", 5200, 4200, 10000, 4, 4,   
		[ 
			["marijuana",1], 
			["turtle",1],
			["cocainep",1]
		] 
	]
];
publicVariable "life_market_resources";

////////////GENERATED CONFIG
//life_market_changes = []; //[SHORTNAME,SELL,BUY]
life_market_shortnames = []; //shortnames if in market
//life_market_clampprices = []; //[SHORTNAME,MIN,MAX]

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
	//life_market_clampprices set [count life_market_clampprices, [_x select 0, _x select 2, _x select 3] ];
	//life_market_changes set [count life_market_changes, [_x select 0, _x select 4, _x select 5] ];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";
//publicVariable "life_market_clampprices";

//SYNC PRICES WITH SERVER IF EMPTY
if(isNil("life_market_prices")) then
{
	life_market_prices = []; //[SHORTNAME,CURRENTPRICE,DIRECTIONGLOBAL,DIRECTIONLOCAL]
	{
	
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
	}
	foreach life_market_resources;
	
	publicVariable "life_market_prices";
	
	systemChat "Marktpreise generiert!";
};