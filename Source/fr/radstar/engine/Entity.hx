package fr.radstar.engine ;

import nape.geom.Vec2;
import nape.phys.Body;
import openfl.display.Sprite;
import openfl.events.Event;

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
		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}
	
	function onRemovedFromStage(e:Event):Void 
	{
		if (mBody != null)
			mBody.space = null;
	}
	
	function onAddedToStage(e:Event):Void 
	{
		if (mBody != null)
			body = mBody;
	}
	
	public function setPos(x : Float, y : Float) {
		this.x = x;
		this.y = y;
		
		if (mBody != null) {
			mBody.position.set(Vec2.weak(x, y));
		}
	}
	
	public function updatePhysic() {
		if (mBody != null) {
			x = mBody.position.x;
			y = mBody.position.y;
			rotation = mBody.rotation;
		}
	}
	
	public function update(delta : Float) {
		
	}
	
	@:final
	public function mainUpdate(delta : Float) {
		updatePhysic();
		update(delta);
	}
	
	public function onHit(entity : Entity) {
		
	}
	
	public function takeDamage(damage : UInt) {
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
		
		mBody.position.set(Vec2.weak(x, y));
		mBody.rotation = rotation;
		
		if(stage != null)
			mBody.space = Engine.getInstance().getSpace();
			
		return mBody;
	}
	
	public function get_body() : Body {
		return mBody;
	}
	
	public function dispose() {
		name = "";
		hitPoints = 0;
		maxHitPoint = 0;
		mBody = null;
	}
	
}