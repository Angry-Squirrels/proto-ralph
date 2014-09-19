package fr.radstar.engine ;

import fr.radstar.engine.tools.IPoolable;
import fr.radstar.engine.tools.Pool;
import nape.geom.Geom;
import nape.geom.Vec2;
import nape.phys.Body;
import openfl.display.Sprite;
import openfl.events.Event;

/**
 * ...
 * @author TBaudon
 */
 
class Entity extends Sprite implements IPoolable
{
	
	public var hitPoints : Float;
	public var maxHitPoint : Float;
	
	public var body(get_body, set_body): Body;
	public var invulnerable : Bool;
	public var group : GroupName;
	
	public var pivotX : Float;
	public var pivotY : Float;
	
	public var friction : Float = 0.25;
	public var posZ : Float = 0;
	public var vitZ : Float = 0;
	
	public var canFree : Bool;
	
	// linked list of entity for performance
	public var next : Entity;
	public var prev : Entity;
	
	// private 
	
	var mBody : Body;
	var mFreeable : Bool;

	public function new() 
	{
		super();
		reset();
		
		hitPoints = 1;
		maxHitPoint = 1;
		
		addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
	}
	
	public function reset():Void 
	{
		pivotX = 0;
		pivotY = 0;
		posZ = 0;
		vitZ = 0;
		
		name = "Entity";
		
		next = null;
		prev = null;
		
		name = "";
		hitPoints = 0;
		maxHitPoint = 0;
		
		canFree = false;
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
		this.x = x - pivotX;
		this.y = y - pivotY;
		
		if (mBody != null) {
			mBody.position.set(Vec2.weak(x+pivotX, y+pivotY));
		}
	}
	
	public function updatePhysic(delta : Float) {
		
		vitZ -= 980 * delta;
		posZ += vitZ;
		
		if (posZ <= 0) {
			posZ = 0;
			vitZ = 0;
		}
		
		if (mBody != null) {
			x = mBody.position.x - pivotX;
			y = mBody.position.y - pivotY;
			
			rotation = mBody.rotation * 180 / Math.PI;
			
			if ((mBody.velocity.length > 0.0001 || mBody.angularVel > 0.001) && posZ == 0) {
				mBody.applyImpulse(mBody.velocity.mul( -1 * friction));
				mBody.angularVel *= friction;
			}
		}
	}
	
	public function update(delta : Float) {
		
	}
	
	@:final
	public function mainUpdate(delta : Float) {
		updatePhysic(delta);
		update(delta);
	}
	
	public function onHit(entity : Entity) {
		
	}
	
	public function takeDamage(damage : Float) {
		if (invulnerable) return;
		hitPoints -= damage;
		if (hitPoints <= 0) {
			hitPoints = 0;
			onDestroy();
		}
	}
	
	public function onDestroy() {
		kill();
	}
	
	public function set_body(body : Body) : Body {
		mBody = body;
		mBody.userData.entity = this;
		
		mBody.position.set(Vec2.weak(x+pivotX, y+pivotY));
		mBody.rotation = Math.PI/180 * rotation;
		
		if(stage != null)
			mBody.space = Engine.getInstance().getSpace();
			
		return mBody;
	}
	
	public function getClosestInGroup(group : Array<Entity>) : Entity {
		
		var minDist : Float = Math.POSITIVE_INFINITY;
		var closest : Entity = null;
		for (entity in group) {
			var dist = Geom.distanceBody(body, entity.body, Vec2.get(), Vec2.get());
			if (dist < minDist) {
				minDist = dist;
				closest = entity;
			}
		}
		
		return closest;
	}
	
	public function get_body() : Body {
		return mBody;
	}
	
	@:final
	public function free() {
		Pool.getInstance().freeItem(this);
	}
	
	public function kill() {
		Engine.getInstance().getCurrentScene().remove(this, true);
	}
}