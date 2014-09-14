package fr.radstar.engine.weapon_system;
import flash.geom.Point;
import fr.radstar.engine.Entity;
import fr.radstar.engine.tools.IPoolable;
import nape.callbacks.InteractionCallback;
import nape.phys.Body;

/**
 * ...
 * @author Ynk33
 */
class AOE extends Entity implements IPoolable
{
	var mEntitiesTouched:Array<Entity>;
	var mDamages:Int;
	var mLifeSpan:Int;
	
	public function new() 
	{
		super();
		this.reset();
	}
	
	public function init(damages:Int, lifeSpan:Int, body:Body, group:UInt):Void
	{
		mDamages = damages;
		mLifeSpan = lifeSpan;
		
		this.body = geom;
	}
	
	public function reset():Void
	{
		mEntitiesTouched = new Array<Entity>();
	}
	
	public function free():Void
	{
		this.reset();
	}
	
	public function fire():Void
	{
		
	}
	
	function entityTouched(params:InteractionCallback):Void
	{
		try
		{
			var entity:Entity = cast(params.int2.castBody, Entity);
			if (entity.group != this.group)
			{
				mEntitiesTouched.push(entity);
				entity.onDamaged(mDamages);
			}
		}
		catch (e:String)
		{
			
		}
	}
}