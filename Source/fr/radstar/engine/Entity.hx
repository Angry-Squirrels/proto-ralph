package fr.radstar.engine ;

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
	
	public var body(get_body, set_body): Body;
	public var invulnerable : Bool;
	public var group : GroupName;
	
	// linked list of entity for performance
	public var next : Entity;
	public var prev : Entity;
	
	var mBody : Body;

	public function new() 
	{
		super();
	}
	
	public function update(delta : Float) {
		
	}
	
	public function onHit(entity : Entity) {
		
	}
	
	public function onDamaged(damage : UInt) {
		if (invulnerable) return;
		hitPoints -= damage;
		if (hitPoints <= 0) {
			hitPoints = 0;
			onDestroy();
		}
	}
	
	public function onDestroy() {
		
	}
	
	public function set_body(body : Body) : Body {
		mBody = body;
		mBody.userData.entity = this;
		return mBody;
	}
	
	public function get_body() : Body {
		return mBody;
	}
	
	public function dispose() {
		name = "";
		hitPoints = 0;
		maxHitPoint = 0;
		body = null;
	}
	
}