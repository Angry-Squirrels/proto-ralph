package fr.radstar.engine.weapon ;
import fr.radstar.engine.Entity;
import fr.radstar.engine.GroupName;
import fr.radstar.engine.tools.IPoolable;
import nape.callbacks.CbEvent;
import nape.callbacks.InteractionCallback;
import nape.callbacks.InteractionListener;
import nape.callbacks.InteractionType;
import nape.phys.Body;
import nape.phys.BodyList;
import nape.phys.BodyType;

/**
 * ...
 * @author Ynk33
 */
class AOE extends Entity implements IPoolable
{
	
	var mDamages:Float;
	
	var mLifeSpan:Float;
	var mLifeCounter : Float;
	
	var mFrequency : Float;
	
	var mOverlapping : BodyList;
	
	var mHitEntities : Map<Entity, Float>;
	
	public function new() 
	{
		super();
		
		body = new Body(BodyType.STATIC);
	}
	
	public function init(damages:Float, lifeSpan:Float, group:GroupName, freq : Float):Void
	{
		mDamages = damages;
		mLifeSpan = lifeSpan;
		mFrequency = freq;
		
		this.group = group;
	}
	
	override public function reset():Void
	{
		super.reset();
		
		mHitEntities = new Map<Entity, Float>();
		
		this.invulnerable = true;
		mLifeCounter = 0;
		mLifeSpan = 0;
		mFrequency = 0;
	}
	
	override public function update(delta : Float) {
		super.update(delta);
		mLifeCounter += delta;
		
		if (mLifeCounter >= mLifeSpan) 
			kill();
		
		mOverlapping = mBody.interactingBodies(InteractionType.SENSOR);
		for (i in 0 ... mOverlapping.length) {
			var current : Body = mOverlapping.at(i);
			var entity : Entity = current.userData.entity;
			if (entity != null) 
				if (entity.group != group)
					applyDamage(entity, delta);
		}
	}
	
	function applyDamage(ent : Entity, time : Float) {
		if (mHitEntities[ent] == null)
			mHitEntities[ent] = mFrequency;
			
		if(mHitEntities[ent] >= mFrequency){
			ent.takeDamage(mDamages);
			mHitEntities[ent] = 0;
			onEntityDamaged(ent);
		}
		
		mHitEntities[ent] += time;
	}
	
	function onEntityDamaged(ent : Entity) {
		
	}
}