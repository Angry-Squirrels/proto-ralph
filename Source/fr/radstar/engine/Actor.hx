package fr.radstar.engine;
import fr.radstar.engine.weapon.Weapon;
import nape.constraint.Constraint;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;

/**
 * ...
 * @author TBaudon
 */
class Actor extends Entity
{

	public var weapon : Weapon;
	public var state : Float -> Void;
	
	public var speed : Float = 10000;
	public var acceleration : Float = 100;
	
	var mTargetX : Float;
	var mTargetY : Float;
	
	public function new(grp : GroupName) 
	{
		super();
		
		body = new Body(BodyType.DYNAMIC);
		
		state = baseState;
		group = grp;
	}
	
	public function attack() {
		if (weapon != null) {
			weapon.use(this);
		}
	}
	
	override public function update(delta : Float) {
		if (state != null)
			state(delta);
	}
	
	public function baseState(delta : Float) {
		
	}
	
	public function moveTo(x : Float, y : Float) {
		mTargetX = x;
		mTargetY = y;
		
		state = moveState;
	}
	
	public function moveState(delta : Float) {
		
		var target = Vec2.get(mTargetX, mTargetY);
		var pos = body.position;
		var diff = target.sub(pos);
		var dist = diff.length;
		
		if (dist < body.velocity.length)
			state = baseState;
		else if (body.velocity.length < speed) {
			var impulse = diff.normalise().mul(acceleration);
			body.applyImpulse(impulse);
		}
			
	}
	
}