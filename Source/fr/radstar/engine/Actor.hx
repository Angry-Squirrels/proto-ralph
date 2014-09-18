package fr.radstar.engine;
import flash.display.BitmapData;
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
	
	public var speed : Float = 250;
	public var moveStrenght : Float = 25;
	
	var mTargetPos : Vec2;
	var mDistMin : Float;
	
	var mIdleFriction : Float;
	var mMovingFriction : Float;
	
	public function new(grp : GroupName) 
	{
		super();
		
		body = new Body(BodyType.DYNAMIC);
		
		state = baseState;
		group = grp;
		
		mIdleFriction = friction;
		mMovingFriction = 0.2;
	}
	
	public function attack(ent : Entity) {
		if (weapon != null) {
			lookAt(ent.body.position);
			weapon.use();
		}
	}
	
	override public function update(delta : Float) {
		if (state != null)
			state(delta);
	}
	
	public function baseState(delta : Float) {
		
	}
	
	public function lookAt(pos : Vec2) {
		var diff = pos.sub(body.position);
		body.rotation = diff.angle;
	}
	
	public function moveTo(target : Vec2) {
		mTargetPos = target;
		var pos = body.position;
		var diff = target.sub(pos);
		lookAt(mTargetPos);
		mDistMin = diff.length;
		
		state = moveState;
		friction = mMovingFriction;
	}
	
	public function moveState(delta : Float) {
		
		var pos = body.position;
		var diff = mTargetPos.sub(pos);
		var dist = diff.length;
		
		if (dist < body.velocity.length * delta) {
			body.applyImpulse(body.velocity.mul( -1));
			state = baseState;
			friction = mIdleFriction;
		}
		else if (body.velocity.length < speed) {
			var impulse = diff.normalise().mul(moveStrenght);
			body.applyImpulse(impulse);
		}
			
	}
	
	public function canAttack(ent : Entity) : Bool{
		return ent.group != group && ent.group != GroupName.ENVIRONMENT;
	}
	
	public function equip(w: Weapon) {
		weapon = w;
		weapon.owner = this;
	}
	
}