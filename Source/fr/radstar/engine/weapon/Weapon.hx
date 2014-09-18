package fr.radstar.engine.weapon ;
import fr.radstar.engine.Actor;
import fr.radstar.engine.Entity;
import nape.geom.Vec2;
import openfl.display.Sprite;

/**
 * ...
 * @author Ynk33
 */
class Weapon extends Sprite
{
	
	public var range : Float;
	public var owner : Entity;
	
	public function new() 
	{
		range = 0;
		super();
	}
	
	public function use()
	{
		
	}
	
	public function inRange(pos : Vec2) {
		return pos.sub(owner.body.position).length <= range;
	}
}