package fr.radstar.engine ;

/**
 * ...
 * @author TBaudon
 */

 @:enum
 abstract GroupName(Int) {
	var PLAYER = 0;
	var ENEMY = 1;
	var ENVIRONMENT = 2;
	var DESTRUCTIBLE = 3;
 }