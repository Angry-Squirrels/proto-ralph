package fr.radstar.engine.tools;

/**
 * ...
 * @author Ynk33
 */
interface IPoolable
{
	function reset():Void;
	function free():Void;
}