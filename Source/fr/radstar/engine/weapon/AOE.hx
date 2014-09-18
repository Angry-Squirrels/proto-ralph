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
	
	var mDamages:Int;
	var mLifeSpan:Float;
	var mLifeCounter : Float;
	var mOverlapping : BodyList;
	
	public function new() 
	{
		super();
		
		body = new Body(BodyType.STATIC);
	}
	
	public function init(damages:Int, lifeSpan:Float, group:GroupName):Void
	{
		mDamages = damages;
		mLifeSpan = lifeSpan;
		
		this.group = group;
	}
	
	override public function reset():Void
	{
		super.reset();
		
		this.invulnerable = true;
		mLifeCounter = 0;
		mLifeSpan = 0;
	}
	
	override public function update(delta : Float) {
		super.update(delta);
		mLifeCounter += delta;
		
		if (mLifeCounter >= mLifeSpan) 
			kill();
		
		mOverlapping = mBody.interactingBodies(InteractionType.SENSOR);
	}
	
	public function fire():Void
	{
		
	}
}