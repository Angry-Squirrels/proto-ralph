package fr.radstar.engine;
import flash.display.BitmapData;
import fr.radstar.engine.weapon.Weapon;
import nape.constraint.Constraint;
import nape.geom.Geom;
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
		if (weapon != null) 
			weapon.use();
	}
	
	override public function update(delta : Float) {
		if (state != null)
			state(delta);
	}
	
	public function baseState(delta : Float) {
		
	}
	
	public function interractWith(ent : Entity) {
		var targetBody : Body = ent.body;
		
		var closestTargetPoint = Vec2.get();
		var closestPointOnMe = Vec2.get();
		
		var distance = Geom.distanceBody(body, targetBody, closestPointOnMe, closestTargetPoint);
		
		lookAt(closestTargetPoint);
		
		if (canAttack(ent)) {
			if(weapon.range >= distance)
				attack(ent);
			else {
				var inRangePos : Vec2 = body.position.sub(closestTargetPoint);
				inRangePos.length = weapon.range;
				inRangePos = closestTargetPoint.add(inRangePos);
				moveTo(inRangePos);
			}
		}
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
		
		lookAt(mTargetPos);
		
		if (dist <= body.velocity.length * delta + 5) {
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