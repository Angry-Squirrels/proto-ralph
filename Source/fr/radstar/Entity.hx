package fr.radstar;

import nape.phys.Body;
import openfl.display.Sprite;

/**
 * ...
 * @author TBaudon
 */
class Entity extends Sprite
{
	
	public var hitPoints : UInt;
	public var maxHitPoint : UInt;
	
	public var body : Body;

	public function new() 
	{
		super();
	}
	
	public function update(delta : Float) {
		
	}
	
	public function onHit(entity : Entity) {
		
	}
	
	public function onDamaged(damage : UInt) {
		hitPoints -= damage;
		if (hitPoints <= 0) {
			hitPoints = 0;
			onDestroy();
		}
	}
	
	public function onDestroy() {
		
	}
	
	public function dispose() {
		name = "";
		hitPoints = 0;
		maxHitPoint = 0;
		body = null;
	}
	
}