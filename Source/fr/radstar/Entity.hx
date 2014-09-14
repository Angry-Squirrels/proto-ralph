package fr.radstar;

import nape.phys.Body;
import openfl.display.Sprite;

/**
 * ...
 * @author TBaudon
 */
class Entity extends Sprite
{
	
	public var name : String;
	public var hitPoints : UInt;
	public var maxHitPoint : UInt;
	
	public var body : Body;

	public function new() 
	{
		super();
		
		
	}
	
}